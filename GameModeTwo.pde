class GameModeTwo extends ScreenWithButton{

	// BUTTON INDEX
	int BACK_2_MENU = 0;
	int RESTART = 1;

	//Create Kinect variables will be used in this class. 
	Kinect kinect;
	ArrayList <SkeletonData> bodies;
	KinectSkeleton kinectSkeleton;
	
	// Create image, Start button, Start button's position variables.
	PImage stickManIMG;
	controlP5.Button btnStart;
	float btnStartX = 1000, btnStartY = 100;

	GameDrawingMeasurement gameDrawingMeasurement;
	InGameBackground gameBackground;
	InGameObject gameObject;
	InGameText gameText;

	GameModeTwo() {
		stickManIMG = loadImage("/data/kinect/stick-man-arms-up.png");

		gameDrawingMeasurement = new GameDrawingMeasurement();
		
		gameDrawingMeasurement.oneY = screenY / 16;
		gameDrawingMeasurement.oneX = screenX / 22;

		gameDrawingMeasurement.skyLine = gameDrawingMeasurement.oneY * 4;

		// size of walkside
		gameDrawingMeasurement.leftSideBot =  gameDrawingMeasurement.oneX * 3;
		gameDrawingMeasurement.leftSideTop = gameDrawingMeasurement.oneX * 4.5;

		gameDrawingMeasurement.rightSideBot = screenX - gameDrawingMeasurement.leftSideBot;
		gameDrawingMeasurement.rightSideTop = screenX - gameDrawingMeasurement.leftSideTop;

		gameDrawingMeasurement.deltaX = gameDrawingMeasurement.leftSideTop - gameDrawingMeasurement.leftSideBot;

		gameDrawingMeasurement.midLandLeft = gameDrawingMeasurement.leftSideTop + (halfX - gameDrawingMeasurement.leftSideTop) / 2;
		gameDrawingMeasurement.midLandRight = halfX+ (gameDrawingMeasurement.rightSideTop - halfX) / 2;
		
		gameBackground = new InGameBackground(gameDrawingMeasurement);
		gameObject = new InGameObject(gameDrawingMeasurement);
		gameText = new InGameText(gameDrawingMeasurement);

		gameText.setTextColor();
		this.setupButton();

		kinectSkeleton =  new KinectSkeleton();
	}

	void show(Kinect kinect, ArrayList <SkeletonData> bodies) {
		this.kinect = kinect;
		this.bodies = bodies;

		if (gameScreen == GAMEMODE_2_PLAYING) {
			gameBackground.draw();
			gameBGM.play();

			kinectSkeleton.draw(true, kinect, bodies);

			// Update character's position by tracking the position of player's SPINE
			//character.update(kinectSkeleton.getPosition()); 
			
			// Draw skeleton from player input image.
			//character.draw();

			if (!gameObject.drawAllAndCheck()) 
			  this.onGameOver();
			else 
				gameText.draw();
			
		} else if (gameScreen == GAMEMODE_2_READY) { // Draw READY screen helps player standing at the right position before starting the game
			this.drawReadySceen();
		} else {
			// gameOverAndStop
		}
	}

	 // Draw READY screen helps player standing at the right position before starting the game
	void drawReadySceen(){
		background(255);

		imageMode(CENTER);

		 // Draw player image from kinect input
		image(kinect.GetMask(), width/2, height/2, width, height); 

		// Draw stick man image at the center of the sceen
		image(stickManIMG,width/2, height/2, stickManIMG.width*1.5, stickManIMG.height*1.5);
		imageMode(CORNER);

		// Display GAME START button. If player move his hand to this button, the game will start
		btnStart.show();

		// tracking RIGHT_HAND as the mouse
		this.trackingHand();
	}

	// tracking RIGHT_HAND as the mouse
	void trackingHand(){
		if (bodies != null && bodies.size() > 0){
            //Searching for the bodies RIGHT_HAND position
            for (int i=0; i<bodies.size (); i++) 
            { if(bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].x > 0){
                float xHand = bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].x*width;
				float yHand = bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].y*height;
                
				// draw a circle at the player's hand position
				stroke(255);          
				fill(255,0,0,63);
				ellipse(xHand, yHand, 80, 80);

				// Checking if player's RIGHT_HAND is overlap the GAME START button
				if (xHand >btnStartX && xHand < btnStartX +100 && yHand > btnStartY && yHand < btnStartY + 100)
					onOverlapBtnStart();
            }
        }
		}
	}

	void startGame() {
		// Play gamestart sounds
	  	gamestart.play();
	  	gamestart.rewind();

		this.restartGame();
		gameBGM.play();
		gameBGM.loop();
		gameBGM.setGain(gameVolume - 60);
	}

	void restartGame() {
		// Play Gamestart and BGM Sounds
		gamestart.play();
		gamestart.rewind();
		increaseGameVolume(gameVolume);
		gameBGM.rewind();
		gameScore = 0;

		this.hideButton();

		this.onChangeGameEnvMode(0);
		gameObject.obstacles.create();

		gameScreen = GAMEMODE_2_PLAYING;
	}

	void onGameOver() {
	  	// Play Lose Sound And Lower Volume
	  	lose.play();
	  	lose.rewind();
	  	lowerGameVolume(gameVolume);
		
		// draw Content
		this.showButton();
		gameBackground.draw();
		gameObject.drawOnly();
		noStroke();
		fill(DEATH_BG);
		rect(screenX / 2, screenY / 2, screenX / 2, screenY / 2, 50);
		fill(gameText.TEXT_COLOR);
		textAlign(CENTER);
		textSize(50);
		text(GAMEMODE_1_OVER_MSG, halfX, halfY - 80);

		textSize(30);
		text("YOUR SCORE: " + gameScore, halfX, halfY - 15);
	}

	void setupButton() {
		numberOfBtn = 2;

		buttons = new controlP5.Button[numberOfBtn];

		int btnW = 200;
		int btnH = 50;
		int btnX = int(halfX) - int(btnW / 2);
		int btnY = int(halfY);
		int btnSpace = 70;

		PFont font = createFont("Georgia", 20);

		buttons[BACK_2_MENU] = CP5.addButton("backToMainMenuGM2")
		.setCaptionLabel(MAIN_MENU_STR) 
		.setValue(0)
		.setFont(font)
		.setPosition(btnX, btnY + btnSpace)
		.setSize(btnW, btnH)
		.hide();

		buttons[RESTART] = CP5.addButton("restartGameMode2")
		.setCaptionLabel(RESTART_STR) 
		.setValue(0)
		.setFont(font)
		.setPosition(btnX, btnY)
		.setSize(btnW, btnH)
		.hide();

		//13666843 Create GAME START button using CP5 library
		btnStart = CP5.addButton("onOverlapBtnStart")
		.setCaptionLabel("GAME START") 
		.setValue(0)
		.setPosition(btnStartX, btnStartY)
		.setSize(100, 100)
		.hide();
	}

	void onChangeGameEnvMode(int mode) {
		gameEnvMode = mode;
		gameObject.updateGameEnvMode(mode);
		gameText.setTextColor();
	}

	void calculateScore(int itemType, int score, float xScore, float yScore) {

		gameScore += score;

		gameText.addNewPlusScore("+" + score, xScore, yScore);

		if (gameScore % 1000 == 0) {
			gameObject.obstacles.welcomeToHell();
		}

		if (gameScore % 750 == 0) {
			gameObject.obstacles.speedUp();

			if (itemType == 1) {
				if (gameEnvMode == 0) {
					onChangeGameEnvMode(1);
				} else {
					onChangeGameEnvMode(0);	
				}
			}
		} else if (itemType == 1 && gameScore % 500 == 0) {
			gameObject.character.updateImageRandomly();
		}
	}
}



void backToMainMenuGM2() {
	if (frameCount > 0) {
		gameModeTwo.hideButton();
		gameScreen = MAIN_MENU_SCR;
		gameState = IN_MENU;
		gameMenu.showButtonOf(gameScreen);
	}
}

void restartGameMode2() {
	if (frameCount > 0) {
		gameModeTwo.restartGame();
	}
}

// Start the game and hid GAME START buton
void onOverlapBtnStart() {
	if (frameCount > 0) {
		gameModeTwo.btnStart.hide();
		gameModeTwo.startGame();
	}
}

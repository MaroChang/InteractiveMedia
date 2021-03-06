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

	PImage scoreboardBG = loadImage("/scoreboard/gameover_board.png");
	PImage readyBG = loadImage("/gameKinect_bg.png");
	PImage[] star = {loadImage("/scoreboard/Star_0.png"),loadImage("/scoreboard/Star_1.png"),loadImage("/scoreboard/Star_2.png"),loadImage("/scoreboard/Star_3.png")};
	PImage[] btn_restart = {loadImage("/button/btn_restart.png"),loadImage("/button/btn_restart_hover.png"),loadImage("/button/btn_restart_active.png")};
	PImage[] btn_main_menu = {loadImage("/button/btn_main_menu.png"),loadImage("/button/btn_main_menu_hover.png"),loadImage("/button/btn_main_menu_active.png")};
	PFont font = createFont("/font/Tondu_Beta.ttf", 32);

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

			kinectSkeleton.draw(false, kinect, bodies);

			// Update character's position by tracking the position of player's SPINE
			//character.update(kinectSkeleton.getPosition()); 
			
			// Draw skeleton from player input image.
			//character.draw();

			if (!gameObject.drawAllAndCheck(kinectSkeleton.getPosition())) 
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
		background(readyBG);

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

		gameBGM.play();
		gameBGM.loop();
		gameBGM.setGain(gameVolume - 60);
		this.restartGame();
	}

	void restartGame() {
		// Play Gamestart and BGM Sounds
		gamestart.play();
		gamestart.rewind();
		increaseGameVolume(gameVolume);
		gameBGM.rewind();
		gameScore = 0;
		speedIncrease = 1;

		this.hideButton();

		this.onChangeGameEnvMode(0);
		gameObject.obstacles.create();
		gameObject.character.setVisual(true);
		scoreBoots = 1;

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

		drawScoreboard();
	}

	void drawScoreboard(){
	//Draw GameBoard
		this.showButton();

		imageMode(CENTER);
		image(scoreboardBG, 683, 380, 550, 645);

		if (gameScore <= 300)
			image(star[0], 683, 260, 350, 155);
		else if (gameScore <= 600)
			image(star[1], 683, 260, 350, 155);
		else if (gameScore <= 1000)
			image(star[2], 683, 260, 350, 155);
		else 
			image(star[3], 683, 260, 350, 155);

		imageMode(CORNER);

		noStroke();
		fill(109,68,50);
		textAlign(CENTER);
		textSize(80);
		textFont(font);
		text("YOUR SCORE: " + gameScore, halfX -5, halfY + 15);
	}

	void setupButton() {
		numberOfBtn = 2;

		buttons = new controlP5.Button[numberOfBtn];

		int btnW = 200;
		int btnH = 50;
		int btnX = int(halfX) - int(btnW / 2);
		int btnY = int(halfY);

		PFont font = createFont("Georgia", 20);

		buttons[BACK_2_MENU] = CP5.addButton("backToMainMenuGM2")
		.setCaptionLabel(MAIN_MENU_STR) 
		.setValue(0)
		.setImages(btn_main_menu)
		.setPosition(halfX-150, halfY + 170)
		.setSize(300, 78)
		.hide();

		buttons[RESTART] = CP5.addButton("restartGameMode2")
		.setCaptionLabel(RESTART_STR) 
		.setValue(0)
		.setImages(btn_restart)
		.setPosition(halfX-150, halfY + 50)
		.setSize(300, 78)
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
		score = score * scoreBoots;
		gameScore += score;

		gameText.addNewPlusScore("+" + score, xScore, yScore);

		if (gameScore > 1000) {
			gameObject.obstacles.welcomeToHell();
		}

		if ((millis() /20000) > speedIncrease) {  //Increase speed every 20 seconds
			speedIncrease++;
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

	void specialItemCollected(int type) {
		switch (type) {
			case 1: 
			 	gameObject.character.setVisual(false);
			 	scoreBoots = 2;
			break;			
		}
	}
}



void backToMainMenuGM2() {
	if (frameCount > 0) {

		click.play();
	  	click.rewind();
		gameModeTwo.hideButton();
		gameScreen = MAIN_MENU_SCR;
		gameState = IN_MENU;
		gameMenu.showButtonOf(gameScreen);
		gameBGM.pause();
		gameBGM.rewind();
    	menuBGM.play();
		menuBGM.loop();
		menuBGM.rewind();
		increaseVolume1(gameVolume);
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

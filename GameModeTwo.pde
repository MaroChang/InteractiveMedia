class GameModeTwo extends ScreenWithButton{

	// BUTTON INDEX
	int BACK_2_MENU = 0;
	int RESTART = 1;

	float skyLine;

	float leftSideBot;
	float rightSideBot;

	float leftSideTop;
	float rightSideTop;

	//Create Kinect variables will be used in this class. 
	Kinect kinect;
	ArrayList <SkeletonData> bodies;
	AnimalKinect character;
	
	// Create image, Start button, Start button's position variables.
	PImage stickManIMG;
	controlP5.Button btnStart;
	float btnStartX = 1000, btnStartY = 100;

	Obstacle[] obstacbles;
	Item[] items;

	float oneY;
	float oneX;

	float deltaX;

	float midLandLeft;
	float midLandRight;

	IngameBackGround ingameBG;

	GameModeTwo() {
		stickManIMG = loadImage("/images/stick-man-arms-up.png");

		oneY = screenY / 16;
		oneX = screenX / 22;

		skyLine = oneY * 4;

		// size of walkside
		leftSideBot =  oneX * 3;
		leftSideTop = oneX * 4.5;

		rightSideBot = screenX - leftSideBot;
		rightSideTop = screenX - leftSideTop;

		deltaX = leftSideTop - leftSideBot;

		midLandLeft = leftSideTop + (halfX - leftSideTop) / 2;
		midLandRight = halfX+ (rightSideTop - halfX) / 2;
		
		this.createCharacter();
		this.createObstacle();
		this.setupButton();
		this.createItem();

		ingameBG = new IngameBackGround(oneX, oneY, deltaX);
	}

	void show(Kinect kinect, ArrayList <SkeletonData> bodies) {
		this.kinect = kinect;
		this.bodies = bodies;

		if (gameScreen == GAMEMODE_2_PLAYING) {
			ingameBG.drawMap();
			ingameBG.drawSideRoad();
			gameBGM.play();

			character.update(true); 

			// Draw skeleton from player input image.
			character.draw(kinect, bodies);

			this.drawObstacleAndCheckCollision();
			this.drawItemAndCheckCollision();
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

	void createObstacle() {

		if (false) {
			obstacbles = new Obstacle[1];

			obstacbles[0] = new Obstacle(
				midLandRight, 
				skyLine, 
				skyLine,
				oneX * 1.5, 
				oneY * 0.5, 
				oneY * 1.5,
				1, 
				deltaX,
				midLandLeft,
				midLandRight,
				leftSideBot,
				rightSideBot
			);
			obstacbles[0].setCharacterImage("snake");
		} else {

			obstacbles = new Obstacle[3];

			obstacbles[0] = new Obstacle(
				midLandRight, 
				skyLine, 
				skyLine,
				oneX * 1.5, 
				oneY * 0.5, 
				oneY * 1.5,
				9, 
				deltaX,
				midLandLeft,
				midLandRight,
				leftSideBot,
				rightSideBot
			);

			obstacbles[1] = new Obstacle(
				midLandLeft, 
				skyLine, 
				skyLine, //screenY - 100,
				oneX * 1.5, 
				oneY * 0.5, 
				oneY * 1.5,
				5, 
				deltaX,
				midLandLeft,
				midLandRight,
				leftSideBot,
				rightSideBot
			);

			obstacbles[2] = new Obstacle(
				midLandLeft - oneY, 
				skyLine, 
				skyLine, //skyLine + character.w + 30,
				oneX * 1.5, 
				oneY * 0.5, 
				oneY * 1.5,
				8, 
				deltaX,
				midLandLeft,
				midLandRight,
				leftSideBot,
				rightSideBot
			);

			// obstacbles[3] = new Obstacle(
			// 	midLandRight + oneY, 
			// 	skyLine, 
			// 	skyLine, //skyLine + character.w + 100,
			// 	oneX * 1.5, 
			// 	oneY * 0.5, 
			// 	oneY * 1.5,
			// 	5, 
			// 	deltaX,
			// 	midLandLeft,
			// 	midLandRight,
			// 	leftSideBot,
			// 	rightSideBot
			// );

			// obstacbles[4] = new Obstacle(
			// 	midLandRight + oneY, 
			// 	skyLine, 
			// 	skyLine, //screenY - 200,
			// 	oneX * 1.5, 
			// 	oneY * 0.5, 
			// 	oneY * 1.5,
			// 	4, 
			// 	deltaX,
			// 	midLandLeft,
			// 	midLandRight,
			// 	leftSideBot,
			// 	rightSideBot
			// );

			// obstacbles[5] = new Obstacle(
			// 	midLandRight + oneY, 
			// 	skyLine, 
			// 	skyLine, //screenY - 500,
			// 	oneX * 1.5, 
			// 	oneY * 0.5, 
			// 	oneY * 1.5,
			// 	7, 
			// 	deltaX,
			// 	midLandLeft,
			// 	midLandRight,
			// 	leftSideBot,
			// 	rightSideBot
			// );

			for (int i = 0; i<3; i++){
				obstacbles[i].setCharacterImage("snake");
			}
		}
	}

	void createCharacter() {

		// size of main character
		float size = oneX * 1;

		character = new AnimalKinect(
			halfX, // x 
			screenY - size/2 - 25, // y
			size, // w
			size,  // h
			"chicken" // image name
		);
		
		character.setLimit(leftSideBot, rightSideBot);
	}

	void createItem() {
		items = new Item[2];

		items[0] = new Item(
			0,
			midLandRight, 
			skyLine, 
			skyLine,
			oneX * 1, 
			oneY * 0.5, 
			oneY * 1,
			5, 
			deltaX,
			midLandLeft,
			midLandRight,
			leftSideBot,
			rightSideBot
		);

		items[1] = new Item(
			1,
			midLandRight, 
			skyLine, 
			skyLine + character.w + 100,
			oneX * 1, 
			oneY * 0.5, 
			oneY * 1,
			5, 
			deltaX,
			midLandLeft,
			midLandRight,
			leftSideBot,
			rightSideBot
		);

		items[0].setCharacterImage("chick");
		items[1].setCharacterImage("chick");
	}

	void drawObstacleAndCheckCollision() {
		for (int i = 0; i < obstacbles.length; i++) {
			obstacbles[i].draw();
			obstacbles[i].update();

			if (box_box(
				character.topLeftX,
				character.topLeftY,
				character.bottomRightX,
				character.bottomRightY, 
				obstacbles[i].topLeftX, 
				obstacbles[i].topLeftY, 
				obstacbles[i].bottomRightX, 
				obstacbles[i].bottomRightY)) {

				gameScreen = GAMEMODE_1_OVER;
				this.onGameOver();
			}
		}
	}

	void drawItemAndCheckCollision() {
		for (int i = 0; i < items.length; i++) {
			items[i].draw();
			items[i].update();

			if (box_box(
				character.topLeftX,
				character.topLeftY,
				character.bottomRightX,
				character.bottomRightY, 
				items[i].topLeftX, 
				items[i].topLeftY, 
				items[i].bottomRightX, 
				items[i].bottomRightY)) {

				items[i].isCollected();
			}
		}
	}

	void startGame() {
		println("gamestart event (gamemode1)");
		// Play gamestart sounds
		gamestart.play();
		gamestart.rewind();
		this.restartGame();
		gameBGM.play();
		gameBGM.loop();
		gameBGM.setGain(gameVolume - 60);
	}

	void restartGame() {
		println("gamestart event (gamemode1)");
		// Play Gamestart and BGM Sounds
		gamestart.play();
		gamestart.rewind();
		increaseGameVolume(gameVolume);
		gameBGM.rewind();
		
		gameScore = 0;
		this.hideButton();
		this.createObstacle();

		gameScreen = GAMEMODE_2_PLAYING;
	}

	void onGameOver() {
		// play death sound
		println("gameover event");
		// Play Lose Sound And Lower Volume
		lose.play();
		lose.rewind();
		lowerGameVolume(gameVolume);

		// draw Content

		this.showButton();
		ingameBG.drawMap();

		//character.draw();

		for (int i = 0; i < obstacbles.length; i++) {
			obstacbles[i].draw();
		}

		for (int i = 0; i < items.length; i++) {
			items[i].draw();
		}

		for (int i = 0; i < obstacbles.length; i++) {
			obstacbles[i].draw();
		}

		ingameBG.onGameOver();

		fill(BLUE);

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
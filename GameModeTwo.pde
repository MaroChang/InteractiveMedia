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

	PImage cloud;
	PImage cloud1;
	PImage cloud2;

	PImage castle;

	SideObject[] leftSideObject;
	SideObject[] rightSideObject;

	int numberOfSideObject;

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
		this.createSideRoad();
		this.createObstacle();
		this.setupButton();
		this.createItem();
		this.setupButton();

		cloud = loadImage("env/cloud.png");
		cloud1 = loadImage("env/cloud1.png");
		cloud2 = loadImage("env/cloud2.png");
		castle = loadImage("env/castle.png");
	}

	void show(Kinect kinect, ArrayList <SkeletonData> bodies) {
		this.kinect = kinect;
		this.bodies = bodies;

		if (gameScreen == GAMEMODE_2_PLAYING) {
			this.drawMap();
			this.drawSideRoad();
			gameBGM.play();

			character.update(true); 

			//13666843 Draw skeleton from player input image.
			character.draw(kinect, bodies);

			this.drawObstacleAndCheckCollision();
			this.drawItemAndCheckCollision();
		} else if (gameScreen == GAMEMODE_2_READY) { //13666843 Draw READY screen helps player standing at the right position before starting the game
			this.drawReadySceen();
		}
	}

	 //13666843 Draw READY screen helps player standing at the right position before starting the game
	void drawReadySceen(){
		background(255);

		imageMode(CENTER);

		 //13666843 Draw player image from kinect input
		image(kinect.GetMask(), width/2, height/2, width, height); 

		//13666843 Draw stick man image at the center of the sceen
		image(stickManIMG,width/2, height/2, stickManIMG.width*1.5, stickManIMG.height*1.5);
		imageMode(CORNER);

		//13666843 Display GAME START button. If player move his hand to this button, the game will start
		btnStart.show();

		//13666843 tracking RIGHT_HAND as the mouse
		this.trackingHand();
	}

	//13666843 tracking RIGHT_HAND as the mouse
	void trackingHand(){
		if (bodies != null && bodies.size() > 0){
            //Searching for the bodies RIGHT_HAND position
            for (int i=0; i<bodies.size (); i++) 
            { if(bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].x > 0){
                float xHand = bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].x*width;
				float yHand = bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].y*height;
                
				//13666843 draw a circle at the player's hand position
				stroke(255);          
				fill(255,0,0,63);
				ellipse(xHand, yHand, 80, 80);

				//13666843 Checking if player's RIGHT_HAND is overlap the GAME START button
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


			obstacbles[0].setCharacterImage("snake");
			obstacbles[1].setCharacterImage("snake");
			obstacbles[2].setCharacterImage("snake");
			// obstacbles[3].setCharacterImage("snake");
			// obstacbles[4].setCharacterImage("snake");
			// obstacbles[5].setCharacterImage("snake");
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

	// create object in left side of the main lane
	void createSideRoad() {
		numberOfSideObject = 14;

		leftSideObject = new SideObject[numberOfSideObject];

		float maxY = oneY * 20;

		leftSideObject[0] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			20
		);

		leftSideObject[1] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			60
		);

		leftSideObject[2] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			100
		);

		leftSideObject[3] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			140
		);
	
		leftSideObject[4] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			180
		);

		leftSideObject[5] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			220
		);

		leftSideObject[6] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			260
		);


		leftSideObject[7] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			20
		);

		leftSideObject[8] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			60
		);

		leftSideObject[9] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			100
		);

		leftSideObject[10] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			140
		);
	
		leftSideObject[11] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			180
		);

		leftSideObject[12] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			220
		);

		leftSideObject[13] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			260
		);

		createSideRoad2();
	}

	// create object in right side of the main lane
	void createSideRoad2() {

		rightSideObject = new SideObject[numberOfSideObject];

		float maxY = oneY * 20;

		rightSideObject[0] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			20
		);

		rightSideObject[1] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			60
		);

		rightSideObject[2] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			100
		);

		rightSideObject[3] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			140
		);
	
		rightSideObject[4] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			180
		);

		rightSideObject[5] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			220
		);

		rightSideObject[6] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			260
		);

		rightSideObject[7] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			20
		);

		rightSideObject[8] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			60
		);

		rightSideObject[9] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			100
		);

		rightSideObject[10] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			140
		);
	
		rightSideObject[11] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			180
		);

		rightSideObject[12] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			220
		);

		rightSideObject[13] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			260
		);
	}

	void drawSideRoad() {
		for (int i = 0; i < numberOfSideObject; i++) {
			leftSideObject[i].draw();
			leftSideObject[i].update();

			rightSideObject[i].draw();
			rightSideObject[i].update();
		}
	}

	void drawMap() {
		drawBackground();

		image(cloud, oneX, oneY, 228, 124);
		image(cloud1, oneX*10, oneY, 228, 124);
		image(cloud2, oneX*5, oneY, 228, 124);
		image(castle, oneX*14, oneY * 0.2, 204, 182);

		fill(BLUE);
		textSize(30);
		textAlign(CENTER);
		text("SCORE: " + gameScore, halfX, oneY * 2);

		line(0, skyLine, screenX, skyLine);
		line(leftSideBot, screenY, leftSideTop, skyLine);
		line(rightSideBot, screenY, rightSideTop, skyLine);

		//stroke(RED);

		//line(midLandLeft, skyLine, leftSideBot + (halfX - leftSideBot) / 2, screenY);
		//line(midLandRight, skyLine, halfX + (rightSideBot - halfX) / 2, screenY);

		//ellipse(leftSideBot, screenY, 5, 5);
		//ellipse(rightSideBot, screenY, 5, 5);
		stroke(0);

		line(halfX, skyLine, halfX, screenY);
	}

	void drawBackground() {
		background(ROAD_COLOR);
		fill(BLUE_SKY);
		rect(halfX, skyLine / 2, screenX, skyLine);

		fill(GROUND_COLOR);
		beginShape();
			vertex(0, skyLine);
			vertex(leftSideTop, skyLine);
			vertex(leftSideBot, screenY);
			vertex(0, screenY);
		endShape();

		beginShape();
			vertex(rightSideTop, skyLine);
			vertex(screenX, skyLine);
			vertex(screenX, screenY);
			vertex(rightSideBot, screenY);
		endShape();
	};

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

		this.drawMap();

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

		for (int i = 0; i < numberOfSideObject; i++) {
			leftSideObject[i].draw();
			rightSideObject[i].draw();
		}

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

//13666843 Start the game and hid GAME START buton
void onOverlapBtnStart() {
	if (frameCount > 0) {
		gameModeTwo.btnStart.hide();
		gameModeTwo.startGame();
	}
}
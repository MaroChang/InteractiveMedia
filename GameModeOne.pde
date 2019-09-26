class GameModeOne extends ScreenWithButton {

	// BUTTON INDEX
	int BACK_2_MENU = 0;
	int RESTART = 1;

	float skyLine;

	float leftSideBot;
	float rightSideBot;

	float leftSideTop;
	float rightSideTop;

	Animal character;

	Obstacle[] obstacbles;

	float oneY;
	float oneX;

	float deltaX;

	float midLandLeft;
	float midLandRight;

	PImage cloud;
	PImage cloud1;
	PImage cloud2;

	PImage castle;

	Sampler soundEffDie;

	SideObject[] leftSideObject;
	SideObject[] rightSideObject;

	int numberOfSideObject;

	GameModeOne() {
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

		cloud = loadImage("env/cloud.png");
		cloud1 = loadImage("env/cloud1.png");
		cloud2 = loadImage("env/cloud2.png");
		castle = loadImage("env/castle.png");

		soundEffDie = new Sampler( "audio/death.wav", 12, MN);
		soundEffDie.patch(audioOutput);
	}

	void show() {
		if (gameScreen == GAMEMODE_1_PLAYING) {
			this.drawMap();
			this.drawSideRoad();

			// play by mouse
			character.update(true); 

			character.draw();
			this.drawObstacleAndCheckCollision();
		} else {
			// this.gameOverAndStop();
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

		obstacbles = new Obstacle[6];

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
			screenY - 100,
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
			skyLine + character.w + 30,
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

		obstacbles[3] = new Obstacle(
			midLandRight + oneY, 
			skyLine, 
			skyLine + character.w + 100,
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

		obstacbles[4] = new Obstacle(
			midLandRight + oneY, 
			skyLine, 
			screenY - 200,
			oneX * 1.5, 
			oneY * 0.5, 
			oneY * 1.5,
			4, 
			deltaX,
			midLandLeft,
			midLandRight,
			leftSideBot,
			rightSideBot
		);

		obstacbles[5] = new Obstacle(
			midLandRight + oneY, 
			skyLine, 
			screenY - 500,
			oneX * 1.5, 
			oneY * 0.5, 
			oneY * 1.5,
			7, 
			deltaX,
			midLandLeft,
			midLandRight,
			leftSideBot,
			rightSideBot
		);


		obstacbles[0].setCharacterImage("snake");
		obstacbles[1].setCharacterImage("gorilla");
		obstacbles[2].setCharacterImage("snake");
		obstacbles[3].setCharacterImage("snake");
		obstacbles[4].setCharacterImage("pig");
		obstacbles[5].setCharacterImage("snake");
	}
	}

	void createSideRoad() {
		numberOfSideObject = 7;

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

		createSideRoad2();
	}

	void createSideRoad2() {
		numberOfSideObject = 7;

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
	}

	void drawSideRoad() {
		for (int i = 0; i < numberOfSideObject; i++) {
			leftSideObject[i].draw();
			leftSideObject[i].update();

			rightSideObject[i].draw();
			rightSideObject[i].update();
		}
	}

	void createCharacter() {
		gameScore = 0;

		// size of main character
		float size = oneX * 1;

		character = new Animal(
			halfX, // x 
			screenY - size/2 - 5, // y
			size, // w
			size,  // h
			"chicken" // image name
		);
		
		character.setLimit(leftSideBot, rightSideBot);
	}

	void startGame() {
		this.restartGame();
	}

	void restartGame() {
		this.hideButton();
		this.createObstacle();
		this.createCharacter();

		gameScreen = GAMEMODE_1_PLAYING;
	}

	void onGameOver() {
		// play death sound

		// draw Content

		soundEffDie.trigger();

		this.showButton();

		this.drawMap();

		character.draw();

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

		buttons[BACK_2_MENU] = CP5.addButton("backToMainMenuGM1")
		.setCaptionLabel(MAIN_MENU_STR) 
		.setValue(0)
		.setFont(font)
		.setPosition(btnX, btnY + btnSpace)
		.setSize(btnW, btnH)
		.hide();

		buttons[RESTART] = CP5.addButton("restartGameMode1")
		.setCaptionLabel(RESTART_STR) 
		.setValue(0)
		.setFont(font)
		.setPosition(btnX, btnY)
		.setSize(btnW, btnH)
		.hide();
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
}

void backToMainMenuGM1() {
	if (frameCount > 0) {
		soundEfMenuClick.trigger();
		gameModeOne.hideButton();
		gameScreen = MAIN_MENU_SCR;
		gameState = IN_MENU;
		gameMenu.showButtonOf(gameScreen);
	}
}

void restartGameMode1() {
	if (frameCount > 0) {
		soundEfMenuClick.trigger();
		gameModeOne.restartGame();
	}
}

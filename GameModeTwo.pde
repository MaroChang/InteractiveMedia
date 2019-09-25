class GameModeTwo extends ScreenWithButton{

	// BUTTON INDEX
	int BACK_2_MENU = 0;
	int RESTART = 1;

	float skyLine;

	float leftSideBot;
	float rightSideBot;

	float leftSideTop;
	float rightSideTop;

	AnimalKinect character;

	Obstacle[] obstacbles;

	float oneY;
	float oneX;

	float deltaX;

	float midLandLeft;
	float midLandRight;

	GameModeTwo() {
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
	}

	void show(Kinect kinect, ArrayList <SkeletonData> bodies) {
		if (gameScreen == GAMEMODE_2_PLAYING) {
			this.drawMap();

			// play by kinect
			character.update(true); 

			character.draw(kinect, bodies);
			this.drawObstacleAndCheckCollision();
		} else {
			// this.gameOverAndStop();
		}
	}

	void createObstacle() {

		obstacbles = new Obstacle[3];

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

		obstacbles[1] = new Obstacle(
			midLandLeft, 
			skyLine, 
			screenY - 100,
			oneX * 2, 
			oneY * 0.5, 
			oneY * 1.5,
			1, 
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
			oneY * 2,
			1, 
			deltaX,
			midLandLeft,
			midLandRight,
			leftSideBot,
			rightSideBot
		);

		// obstacbles[3] = new Obstacle(
		// 	midLandRight + oneY, 
		// 	skyLine, 
		// 	skyLine + character.w + 100,
		// 	oneX * 1.5, 
		// 	oneY * 0.5, 
		// 	oneY * 2,
		// 	1, 
		// 	deltaX,
		// 	midLandLeft,
		// 	midLandRight,
		// 	leftSideBot,
		// 	rightSideBot
		// );

		// obstacbles[4] = new Obstacle(
		// 	midLandRight + oneY, 
		// 	skyLine, 
		// 	screenY - 200,
		// 	oneX * 1.5, 
		// 	oneY * 0.5, 
		// 	oneY * 2,
		// 	1, 
		// 	deltaX,
		// 	midLandLeft,
		// 	midLandRight,
		// 	leftSideBot,
		// 	rightSideBot
		// );

		// obstacbles[5] = new Obstacle(
		// 	midLandRight + oneY, 
		// 	skyLine, 
		// 	screenY - 500,
		// 	oneX * 1.5, 
		// 	oneY * 0.5, 
		// 	oneY * 2,
		// 	1, 
		// 	deltaX,
		// 	midLandLeft,
		// 	midLandRight,
		// 	leftSideBot,
		// 	rightSideBot
		// );
	}

	void createCharacter() {
		gameScore = 0;

		// size of main character
		float size = oneX * 1;

		character = new AnimalKinect(
			halfX, // x 
			screenY - size/2 - 5, // y
			size, // w
			size  // h
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

		gameScreen = GAMEMODE_2_PLAYING;
	}

	void onGameOver() {
		// play death sound

		// draw Content

		this.showButton();

		this.drawMap();

		//character.draw();

		for (int i = 0; i < obstacbles.length; i++) {
			obstacbles[i].draw();
		}

		textAlign(CENTER);
		textSize(50);
		text(GAMEMODE_2_OVER_MSG, halfX, halfY - 80);

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
	}

	void drawMap() {
		background(BEAUTY_COLOR);

		textSize(30);
		textAlign(CENTER);
		text("SCORE: " + gameScore, halfX, oneY * 2);

		stroke(0);
		line(0, skyLine, screenX, skyLine);
		line(leftSideBot, screenY, leftSideTop, skyLine);
		line(rightSideBot, screenY, rightSideTop, skyLine);

		stroke(RED);

		line(midLandLeft, skyLine, leftSideBot + (halfX - leftSideBot) / 2, screenY);
		line(midLandRight, skyLine, halfX + (rightSideBot - halfX) / 2, screenY);

		ellipse(leftSideBot, screenY, 5, 5);
		ellipse(rightSideBot, screenY, 5, 5);
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

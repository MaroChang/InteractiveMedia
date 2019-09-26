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

	GameModeOne() {
		oneY = screenY / 16;
		oneX = screenX / 22;

		skyLine = oneY * 4;

		// Size of walkside
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

	void show() {
		if (gameScreen == GAMEMODE_1_PLAYING) {
			this.drawMap();

			// Play by mouse
			character.update(true); 

			character.draw();
			this.drawObstacleAndCheckCollision();
		} else {
			// this.gameOverAndStop();
		}
	}

	void createObstacle() {

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
			oneX * 2, 
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
			oneY * 2,
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
			oneY * 2,
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
			oneY * 2,
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
			oneY * 2,
			7, 
			deltaX,
			midLandLeft,
			midLandRight,
			leftSideBot,
			rightSideBot
		);
	}

	void createCharacter() {
		gameScore = 0;

		// Size of main character
		float size = oneX * 1;

		character = new Animal(
			halfX, // x 
			screenY - size/2 - 5, // y
			size, // w
			size  // h
		);
		
		character.setLimit(leftSideBot, rightSideBot);
	}

	void startGame() {
    println("gamestart event (gamemode1)");
    // Play gamestart sound
    gamestart.play();
    gamestart.rewind();
    
		this.restartGame();
	}

	void restartGame() {
    println("gamestart event (gamemode1)");
    // Play gamestart sound
    gamestart.play();
    gamestart.rewind();
    
		this.hideButton();
		this.createObstacle();
		this.createCharacter();
  
		gameScreen = GAMEMODE_1_PLAYING;
	}

	void onGameOver() {
    println("gameover event");
    // Play lose sound
    lose.play();
    lose.rewind();
    
		// Draw content
		this.showButton();

		this.drawMap();

		character.draw();

		for (int i = 0; i < obstacbles.length; i++) {
			obstacbles[i].draw();
		}

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
		background(BEAUTY_COLOR);

		textSize(30);
		textAlign(CENTER);
		text("SCORE: " + gameScore, halfX, oneY * 2);

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

void backToMainMenuGM1() {
	if (frameCount > 0) {
    println("back to menu event");
    // Play click sound
    click.play();
    click.rewind();
    
		gameModeOne.hideButton();
		gameScreen = MAIN_MENU_SCR;
		gameState = IN_MENU;
		gameMenu.showButtonOf(gameScreen);
	}
}

void restartGameMode1() {
	if (frameCount > 0) {  
    println("restart gamemode1 event");
    // Play click sound
    click.play();
    click.rewind();
		gameModeOne.restartGame();
	}
}

// GameModeOne controll all object in game mode one screen
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
	Item[] items;

	float oneY;
	float oneX;

	float deltaX;

	float midLandLeft;
	float midLandRight;

	IngameBackGround ingameBG;

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
		this.createObstacle();
		this.createItem();
		this.setupButton();
		ingameBG = new IngameBackGround(oneX, oneY, deltaX);
	}

	void show() {
		if (gameScreen == GAMEMODE_1_PLAYING) {
			ingameBG.drawMap();
			ingameBG.drawSideRoad();
			gameBGM.play();
			// play by mouse
			character.update(true); 

			character.draw();
			this.drawObstacleAndCheckCollision();
			this.drawItemAndCheckCollision();
		} else {
			// this.gameOverAndStop();
		}
	}

	void createCharacter() {

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

			obstacbles[3] = new Obstacle(
				midLandRight + oneY, 
				skyLine, 
				skyLine, //skyLine + character.w + 100,
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
				skyLine, //screenY - 200,
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
				skyLine, //screenY - 500,
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
			obstacbles[1].setCharacterImage("snake");
			obstacbles[2].setCharacterImage("snake");
			obstacbles[3].setCharacterImage("snake");
			obstacbles[4].setCharacterImage("snake");
			obstacbles[5].setCharacterImage("snake");
		}
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
		//this.createCharacter();

		gameScreen = GAMEMODE_1_PLAYING;
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

		character.draw();

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
}

void backToMainMenuGM1() {
	if (frameCount > 0) {
		 // Play click sound
	    click.play();
	    click.rewind();

		gameModeOne.hideButton();
		gameScreen = MAIN_MENU_SCR;
		gameState = IN_MENU;

		// Resume Main Menu Music 
		gameBGM.pause();
		gameBGM.rewind();
    	menuBGM.play();
		menuBGM.loop();
		menuBGM.rewind();

		increaseVolume1(gameVolume);
		gameMenu.showButtonOf(gameScreen);
	}
}

void restartGameMode1() {
	if (frameCount > 0) {
		click.play();
    	click.rewind();
		gameModeOne.restartGame();
	}
}

// LowerVolume Function For BGM Fade Transition
public void lowerGameVolume(float num) {
    num = num - 60;
    for (int i = 0; i < 10; i++) {
    num = num - 1;
    gameBGM.setGain(num);
    println(num);
  }
}

// IncreaseVolume Function For BGM Fade Transition
public void increaseGameVolume(float num) {
    num = num - 70;
    for (int i = 0; i < 10; i++) {
    num = num + 1;
    gameBGM.setGain(num);
    println(num);
  }
}

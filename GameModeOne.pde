
// GameModeOne controll all object in game mode one screen
class GameModeOne extends ScreenWithButton {

	// BUTTON INDEX
	int BACK_2_MENU = 0;
	int RESTART = 1;

	GameDrawingMeasurement gameDrawingMeasurement;

	InGameBackground gameBackground;
	InGameObject gameObject;
	InGameText gameText;

	int randomScore;

	GameModeOne() {
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

		this.setupButton();

		gameText.setTextColor();
	}

	void show() {
		if (gameScreen == GAMEMODE_1_PLAYING) {
			gameBackground.draw();

			gameBGM.play();

			if (!gameObject.drawAllAndCheck()) {
				this.onGameOver();
			} else {
				gameText.draw();
			}

		} else {
			// this.gameOverAndStop();
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

		gameScreen = GAMEMODE_1_PLAYING;
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

	void onChangeGameEnvMode(int mode) {
		gameEnvMode = mode;
		gameObject.updateGameEnvMode(mode);
		gameText.setTextColor();
	}

	void calculateScore(int itemType, float xScore, float yScore) {
		randomScore = int(random(2));

		randomScore = randomScore == 0 ? 25 : 50;

		gameScore += randomScore;

		gameText.addNewPlusScore("+" + randomScore, xScore, yScore);

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

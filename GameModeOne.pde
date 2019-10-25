// GameModeOne controll all object in game mode one screen
class GameModeOne extends ScreenWithButton {

	// BUTTON INDEX
	int BACK_2_MENU = 0;
	int RESTART = 1;

	GameDrawingMeasurement gameDrawingMeasurement;
	InGameBackground gameBackground;
	InGameObject gameObject;
	InGameText gameText;

	PImage scoreboardBG = loadImage("/scoreboard/gameover_board.png");
	PImage[] star = {loadImage("/scoreboard/Star_0.png"),loadImage("/scoreboard/Star_1.png"),loadImage("/scoreboard/Star_2.png"),loadImage("/scoreboard/Star_3.png")};
	PImage[] btn_restart = {loadImage("/button/btn_restart.png"),loadImage("/button/btn_restart_hover.png"),loadImage("/button/btn_restart_active.png")};
	PImage[] btn_main_menu = {loadImage("/button/btn_main_menu.png"),loadImage("/button/btn_main_menu_hover.png"),loadImage("/button/btn_main_menu_active.png")};
	PFont font = createFont("/font/Tondu_Beta.ttf", 32);

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

		gameText.setTextColor();
		this.setupButton();
	}

	void show() {
		if (gameScreen == GAMEMODE_1_PLAYING) {
			gameBackground.draw();
			gameBGM.play();

			if (!gameObject.drawAllAndCheck(mouseX)) {
			  this.onGameOver();
			} else {
			gameText.draw();
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

		gameScreen = GAMEMODE_1_PLAYING;
	}

	void onGameOver() { 
	  	// Play Lose Sound And Lower Volume
	  	lose.play();
	  	lose.rewind();
	  	lowerGameVolume(gameVolume);
		
		// draw Content
		
		gameBackground.draw();
		gameObject.drawOnly();

		drawScoreboard();
	}

	void drawScoreboard(){
	//Draw GameBoard
		this.showButton();

		imageMode(CENTER);
		image(scoreboardBG, 683, 380, 550, 645);

		if (gameScore <= 100)
			image(star[0], 683, 260, 350, 155);
		else if (gameScore <= 300)
			image(star[1], 683, 260, 350, 155);
		else if (gameScore <= 500)
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

		buttons[BACK_2_MENU] = CP5.addButton("backToMainMenuGM1")
		.setCaptionLabel(MAIN_MENU_STR) 
		.setValue(0)
		.setImages(btn_main_menu)
		.setPosition(halfX-150, halfY + 170)
		.setSize(300, 78)
		.hide();

		buttons[RESTART] = CP5.addButton("restartGameMode1")
		.setCaptionLabel(RESTART_STR) 
		.setValue(0)
		.setImages(btn_restart)
		.setPosition(halfX-150, halfY + 50)
		.setSize(300, 78)
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

		if (gameScore % 500 == 0) {
			gameObject.obstacles.welcomeToHell();
		}

		if (gameScore % 500 == 0) {
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

// GameModeOne Controls All Object In Game Mode One Screen
/* 
  Individual Work Within This Page
  Tasks:
    -Implementing Sound Effect When Player Loses
    -Implementing Click Effect On Buttons In The Menu Screens, Mouse Whens Been Clicked
    -Implementing Background Music For Welcome, Menu Screens And Within Gameplay
    -Adjust Sound Volumes Gradually And Pauses While Transitioning Between Screens
*/
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

		// Size Of Walkside
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
       gameBGM.play();
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
			8, 
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
			8, 
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
			9, 
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
			9, 
			deltaX,
			midLandLeft,
			midLandRight,
			leftSideBot,
			rightSideBot
		);
	}

	void createCharacter() {
		gameScore = 0;

		// Size Of Main Character
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
    // Play gamestart sounds
    gameStartSounds();
    
	this.restartGame();

	  gameStartSounds();
	}

	void restartGame() {
    println("gamestart event (gamemode1)");
    // Play Gamestart and BGM Sounds
    gamestart.play();
    gamestart.rewind();
	  increaseGameVolume(gameVolume);
	  gameBGM.rewind();
    
		this.hideButton();
		this.createObstacle();
		this.createCharacter();
  
		gameScreen = GAMEMODE_1_PLAYING;
	}

	// Function for when the player loses
	void onGameOver() {
    println("gameover event");
    // Play Lose Sound And Lower Volume
    lose.play();
    lose.rewind();
    lowerGameVolume(gameVolume);
    
		// Draw Content
		this.showButton();
		
		this.drawMap();

		character.draw();
		
		// Drawing Obstacles
		for (int i = 0; i < obstacbles.length; i++) {
			obstacbles[i].draw();
		}

		rectMode(CORNER);
		fill(205, 205, 205, 200);
		rect(0, 0, 1366, 768);
		textAlign(CENTER);
		textSize(50);
		fill(UGLY_COLOR);
		text(GAMEMODE_1_OVER_MSG, halfX, halfY - 80);

		textSize(30);
		text("YOUR SCORE: " + gameScore, halfX, halfY - 15);
	}

	// Sets up the functionality and the side of buttons on game mode selection screen
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

	// Draw the game space in preparation for the game
	void drawMap() {
		background(OCEAN);
		//imageMode(CORNER);
		//image(bg4, 0, 0, 1366, 768);
		textSize(30);
		textAlign(CENTER);
		fill(UGLY_COLOR);
		text("SCORE: " + gameScore, halfX, oneY * 2);

		stroke(BLACK);
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

	// Obstacle collision for in-game obstacles with the character
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

// Function for back to main menu button
void backToMainMenuGM1() {
	if (frameCount > 0) {
    println("back to menu event");
    // Play click sound
    clickSound();
    
		gameModeOne.hideButton();

		gameScreen = MAIN_MENU_SCR;
		gameState = IN_MENU;

    // Resume Main Menu Music 
		gameBGM.pause();
		gameBGM.rewind();
    menuBGM.play();
		menuBGM.loop();
		menuBGM.rewind();

		increaseMenuVolume(gameVolume);
		
		gameMenu.showButtonOf(gameScreen);
	}
}

// Function for restart game button
void restartGameMode1() {
	if (frameCount > 0) {  
    println("restart gamemode1 event");

    // Play Click Sound
    clickSound();
	  gameModeOne.restartGame();
	}
}

// Function For Game BGM and Game Start
public void gameStartSounds(){
  gamestart.play();
  gamestart.rewind();
  gameBGM.setGain(gameVolume - 60);
  gameBGM.loop();
}

// LowerVolume Function For Game BGM Fade Transition
public void lowerGameVolume(float num) {
    num = num - 60;
    for (int i = 0; i < 10; i++) {
    num = num - 1;
    gameBGM.setGain(num);
    println(num);
  }
}

// IncreaseVolume Function For Game BGM Fade Transition
public void increaseGameVolume(float num) {
    num = num - 70;
    for (int i = 0; i < 10; i++) {
    num = num + 1;
    gameBGM.setGain(num);
    println(num);
  }
}

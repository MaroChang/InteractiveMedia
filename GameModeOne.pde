class GameModeOne extends ScreenWithButton {
  
  //background images
  PImage bg;
  PImage bg1;
  PImage bg2;
  PImage bg3;
  
  //Table Implementation
  Table table;
  int j=0;
  
  /*
  int numFrames=17;
  int currentFrame=0;
  int framerate=2;
  PImage[] bg10 = new PImage[numFrames];
  */
  
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

		// size of walkside
		leftSideBot =  oneX * 3;
		leftSideTop = oneX * 4.5;

		rightSideBot = screenX - leftSideBot;
		rightSideTop = screenX - leftSideTop;

		deltaX = leftSideTop - leftSideBot;

		midLandLeft = leftSideTop + (halfX - leftSideTop) / 2;
		midLandRight = halfX+ (rightSideTop - halfX) / 2;

    //audio
    gamesong.play();
    gamesong.loop();

    table = loadTable("Air2.csv","header");

    bg= loadImage("image_8.jpg");
    bg.resize(1280,720);
    bg1 = loadImage("image_11.jpg");
    bg1.resize(1280,720);
    bg2 = loadImage("image_13.jpg");
    bg2.resize(1280,720);
    bg3 = loadImage("image_6.jpg");
    bg3.resize(1280,720);
   
    /*
   frameRate(framerate);
   bg10[0] = loadImage("frame_00_delay-0.2s.gif");
   bg10[1] = loadImage("frame_01_delay-0.2s.gif");
   bg10[2] = loadImage("frame_02_delay-0.2s.gif");
   bg10[3] = loadImage("frame_03_delay-0.2s.gif");
   bg10[4] = loadImage("frame_04_delay-0.2s.gif");
   bg10[5] = loadImage("frame_05_delay-0.2s.gif");
   bg10[6] = loadImage("frame_06_delay-0.2s.gif");
   bg10[7] = loadImage("frame_07_delay-0.2s.gif");
   bg10[8] = loadImage("frame_08_delay-0.2s.gif");
   bg10[9] = loadImage("frame_09_delay-0.2s.gif");
   bg10[10] = loadImage("frame_10_delay-0.2s.gif");
   bg10[11] = loadImage("frame_11_delay-0.2s.gif");
   bg10[12] = loadImage("frame_12_delay-0.2s.gif");
   bg10[13] = loadImage("frame_13_delay-0.2s.gif");
   bg10[14] = loadImage("frame_14_delay-0.2s.gif");
   bg10[15] = loadImage("frame_15_delay-0.2s.gif");
   bg10[16] = loadImage("frame_16_delay-0.2s.gif");
   */
   	
		this.createCharacter();
		this.createObstacle();
		this.setupButton();
	}

	void show() {
		if (gameScreen == GAMEMODE_1_PLAYING) {
      //background(bg);
      float[] w = new float[1532];
    
      w[j]=table.getFloat(j,"temp");
      
      if(w[j]>=1 && w[j]<=10.99)
      {
        background(bg);
      }
      else if(w[j]>=11 && w[j]<=20.99)
      {
        //currentFrame = (currentFrame+1)%numFrames;
        //image(bg10[(currentFrame)%numFrames],0,0);
        background(bg1);
      }
      else if(w[j]>=21 && w[j]<=30.99)
      {
        background(bg2);
      }
      else if(w[j]>=31 && w[j]<=40.99)
      {
        background(bg3);
      }
      else
      {
        background(17, 223, 250);
      }
      
      j++;
      if(j>1529) j=0;
      
      
			this.drawMap();
      
			// play by mouse
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

		// size of main character
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

    PImage[] imgs = {loadImage("button_15.png"),loadImage("button_16.png"),loadImage("button_15.png")};
		buttons[BACK_2_MENU] = CP5.addButton("backToMainMenuGM1")
		.setCaptionLabel(MAIN_MENU_STR) 
    .setImages(imgs)
		.setValue(0)
		.setFont(font)
		.setPosition(btnX, btnY + btnSpace)
		.setSize(btnW, btnH)
		.hide();

    PImage[] imgs1 = {loadImage("button_13.png"),loadImage("button_14.png"),loadImage("button_13.png")};
		buttons[RESTART] = CP5.addButton("restartGameMode1")
    .setImages(imgs1)
		.setCaptionLabel(RESTART_STR) 
		.setValue(0)
		.setFont(font)
		.setPosition(btnX, btnY)
		.setSize(btnW, btnH)
		.hide();
	}

	void drawMap() {
		//background(BEAUTY_COLOR);

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
    click.play();
    click.rewind();
		gameModeOne.restartGame();
	}
}

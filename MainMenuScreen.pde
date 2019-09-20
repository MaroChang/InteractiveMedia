class MainMenuScreen extends ScreenWithButton {

	// BUTTON INDEX
	int START_GAME = 0;
	int SETTING = 1;
	int QUIT = 2;

        //background image
        int numFrames=30;
        int currentFrame=0;
        int framerate=12;
        PImage[] background = new PImage[numFrames];
        

	MainMenuScreen() {
	       this.setupButton();

               frameRate(framerate);
               
               background[0] = loadImage("frame_00_delay-0.1s.gif");
               background[1] = loadImage("frame_01_delay-0.1s.gif");
               background[2] = loadImage("frame_02_delay-0.1s.gif");
               background[3] = loadImage("frame_03_delay-0.1s.gif");
               background[4] = loadImage("frame_04_delay-0.1s.gif");  
               background[5] = loadImage("frame_05_delay-0.1s.gif");
               background[6] = loadImage("frame_06_delay-0.1s.gif");
               background[7] = loadImage("frame_07_delay-0.1s.gif");
               background[8] = loadImage("frame_08_delay-0.1s.gif");
               background[9] = loadImage("frame_09_delay-0.1s.gif");
               background[10] = loadImage("frame_10_delay-0.1s.gif");
               background[11] = loadImage("frame_11_delay-0.1s.gif");
               background[12] = loadImage("frame_12_delay-0.1s.gif");
               background[13] = loadImage("frame_13_delay-0.1s.gif");
               background[14] = loadImage("frame_14_delay-0.1s.gif");
               background[15] = loadImage("frame_15_delay-0.1s.gif");
               background[16] = loadImage("frame_16_delay-0.1s.gif");
               background[17] = loadImage("frame_17_delay-0.1s.gif");
               background[18] = loadImage("frame_18_delay-0.1s.gif");
               background[19] = loadImage("frame_19_delay-0.1s.gif");
               background[20] = loadImage("frame_20_delay-0.1s.gif");
               background[21] = loadImage("frame_21_delay-0.1s.gif");
               background[22] = loadImage("frame_22_delay-0.1s.gif");
               background[23] = loadImage("frame_23_delay-0.1s.gif");
               background[24] = loadImage("frame_24_delay-0.1s.gif");
               background[25] = loadImage("frame_25_delay-0.1s.gif");
               background[26] = loadImage("frame_26_delay-0.1s.gif");
               background[27] = loadImage("frame_27_delay-0.1s.gif");
               background[28] = loadImage("frame_28_delay-0.1s.gif");
               background[29] = loadImage("frame_29_delay-0.1s.gif");
	}

	void show() {
  
                currentFrame = (currentFrame+1)%numFrames;
                image(background[(currentFrame)%numFrames],0,0);
		//background(WHITE);
		fill(255,51,0);
		
    textAlign(CENTER);

    float titlePos = halfY - 100;
    textSize(70);
    text(GAME_NAME, halfX, titlePos);
    textSize(80);
    text(GAME_SUB_NAME, halfX, titlePos + 70);
    
    
	}


  void setupButton() {
  	numberOfBtn = 3;

	  buttons = new controlP5.Button[numberOfBtn];

	  int btnW = 200;
	  int btnH = 50;
	  int btnX = int(halfX) - int(btnW / 2);
	  int btnY = int(halfY) + 50;
	  int btnSpace = 70;

	  PFont font = createFont("Georgia", 20);

	  buttons[START_GAME] = CP5.addButton("startGame")
	  	.setCaptionLabel(NEW_GAME_STR) 
	  	.setValue(0)
	  	.setFont(font)
	    .setPosition(btnX, btnY)
     	.setSize(btnW, btnH)
	    .hide();

	  buttons[SETTING] = CP5.addButton("openSetting")
	  	.setCaptionLabel(SETTING_STR) 
			.setValue(0)
			.setFont(font)
			.setPosition(btnX, btnY + btnSpace)
			.setSize(btnW, btnH)
			.hide();

		buttons[QUIT] = CP5.addButton("quitGame")
	  	.setCaptionLabel(QUIT_GAME_STR) 
			.setValue(0)
			.setFont(font)
			.setPosition(btnX, btnY + btnSpace * 2)
			.setSize(btnW, btnH)
			.hide();	

		allowQuit = true;	
	}
}

//void draw(){
  
  //currentFrame = (currentFrame+1)%numFrames;
  //image(background[(currentFrame)%numFrames],0,0);

//}

public void startGame() {
	if (frameCount > 0) {
	  changeScreenTo(GAME_SELECT_SCR, MAIN_MENU_SCR);
	}
}

public void openSetting() {
	if (frameCount > 0) {
    background(255);
  	changeScreenTo(SETTING_SCR, MAIN_MENU_SCR);
	}
}

public void quitGame() {
	if (frameCount > 0) {
		exit();
	}
}

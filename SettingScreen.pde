class SettingScreen extends ScreenWithButton {

	// BUTTON INDEX
	int BACK_2_MENU = 0;
	int VOLUMN = 1;
	

	controlP5.Toggle[] toggles;
	int numberOfToggle = 1;
	int USE_KEYBOARD = 1;
	int USE_KINECT = 0;

	controlP5.Slider volume;

	SettingScreen() {
		this.setupButton();
		this.setupToggle();
	}

	void show() {
		background(TEST_COLOR);
    fill(UGLY_COLOR);

    textAlign(CENTER);

    float titlePos = halfY - 200;
    textSize(70);
    text(SETTING_STR, halfX, titlePos);

    textSize(30);
    text("MUSIC", halfX - 190, halfY);

    text("INPUT DEVICE", halfX - 190, halfY + 120);

    textSize(20);
    int btnW = 100;
	  int btnH = 25;
	  int btnX = int(halfX) + 100;
	  int btnY = int(halfY)+ 150;

	  if (gameInKinect) { 
	  	fill(GREEN);
    	text(" : ON", btnX + 30, btnY);
  	} else {
  		fill(RED);
    	text(" : OFF", btnX + 30, btnY);
  	}

    fill(WHITE);
		text("KEYBOARD", btnX - 49, btnY + 50);

		if (gameInKeyboard) { 
	  	fill(GREEN);
    	text(" : ON", btnX + 30, btnY + 50);
  	} else {
  		fill(RED);
    	text(" : OFF", btnX + 30, btnY + 50);
  	}   
	}

  void setupButton() {
  	numberOfBtn = 1;

	  buttons = new controlP5.Button[numberOfBtn];

	  int btnW = 250;
	  int btnH = 50;
	  int btnX = 25;
	  int btnY = 25;
	  int btnSpace = 70;

	  PFont font = createFont("Georgia", 20);

	  buttons[BACK_2_MENU] = CP5.addButton("back2Menu")
	  	.setCaptionLabel(BACK_2_MENU_STR) 
	  	.setValue(0)
	  	.setFont(font)
	    .setPosition(btnX, btnY)
   	  .setSize(btnW, btnH)
	    .hide();	
	}

	void setupToggle() {

	  toggles = new controlP5.Toggle[numberOfToggle];

	  int btnW = 100;
	  int btnH = 25;
	  int btnX = int(halfX);
	  int btnY = int(halfY) + 100;
	  int btnSpace = 70;

	  PFont font = createFont("Georgia", 20);
	  fill(0, 102, 153);
	  toggles[USE_KINECT] = CP5.addToggle("useKinect")
	  	.setValue(gameInKinect)
	  	.setCaptionLabel(USE_KINECT_STR) 
	  	.setFont(font)
	    .setPosition(btnX, btnY)
   	  .setSize(btnW, btnH)
   	  .setMode(CP5.SWITCH)
   	  .setColorActive(GREEN) 
	    .hide();



	  volume = CP5.addSlider("changeVolume")
     .setPosition(halfX, halfY - 20)
     .setSize(200,20)
     .setRange(0,100)
     .setValue(gameVolume)
     .setLabelVisible(false) 
     .hide();  
	}


	void hideButton() {
		super.hideButton();

		for (int i = 0; i < numberOfToggle; i++) {
			toggles[i].hide();
		}

		volume.hide();
	}

	void showButton() {
		super.showButton();

		for (int i = 0; i < numberOfToggle; i++) {
			toggles[i].show();
		}

		volume.show();
	}
}


public void back2Menu() {
	if (frameCount > 0) {
    changeScreenTo(MAIN_MENU_SCR, SETTING_SCR);
	}
}

public void useKinect(boolean theFlag) {
	if (frameCount > 0) {
		// println("useKinect: "+theFlag);
		if(theFlag == true) {
    	gameMenu.settingScreen.toggles[0].setColorActive(GREEN);
    	gameInKinect = true;
    	gameInKeyboard = false;
	  } else {
	    gameMenu.settingScreen.toggles[0].setColorActive(RED);
	    gameInKinect = false;
    	gameInKeyboard = true;
	  }
	}
}


void changeVolume(float value) {
	if (frameCount > 0)
  	gameVolume = value;
}
class MainMenuScreen extends ScreenWithButton {

	// BUTTON INDEX
	int START_GAME = 0;
	int SETTING = 1;
	int QUIT = 2;

	MainMenuScreen() {
		this.setupButton();
	}

	void show() {
		background(WHITE);
    textAlign(CENTER);

    float titlePos = halfY - 100;
    textSize(70);
    text(GAME_NAME, halfX, titlePos);
    textSize(80);
    text(GAME_SUB_NAME, halfX, titlePos + 70);

    this.showButton();
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


public void startGame() {
	if (gameMenu != null) {
		gameMenu.hideButtonOf(MAIN_MENU_SCR);
	}
  changeScreenTo(WELCOME_SCR);
}

public void openSetting() {
	if (gameMenu != null) {
		gameMenu.hideButtonOf(MAIN_MENU_SCR);
	}
  changeScreenTo(WELCOME_SCR);
}

public void quitGame() {
	if (allowQuit) {
		exit();
	}
}

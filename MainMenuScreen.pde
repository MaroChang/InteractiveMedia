
// MainMenuScreen controll 3 buttons:
// 1. start new game
// 2. open setting
// 3. quit application
class MainMenuScreen extends ScreenWithButton {

	// BUTTON INDEX
	int START_GAME = 0;
	int CREDITS = 1;
	int QUIT = 2;

	PImage menuBackground;
	PImage title;
	PImage[] btn_newgame = {loadImage("/button/btn_newgame.png"),loadImage("/button/btn_newgame_hover.png"),loadImage("/button/btn_newgame_active.png")};
	PImage[] btn_credit = {loadImage("/button/btn_credit.png"),loadImage("/button/btn_credit_hover.png"),loadImage("/button/btn_credit_active.png")};
	PImage[] btn_exit = {loadImage("/button/btn_exit.png"),loadImage("/button/btn_exit_hover.png"),loadImage("/button/btn_exit_active.png")};

	MainMenuScreen() {
		this.setupButton();

		menuBackground = loadImage("menu_bg.png");
    	menuBackground.resize(screenX, screenY); 
		title = loadImage("game_title.png");
	}

	void show() {
		background(menuBackground);
		fill(WHITE);
		
		textAlign(CENTER);
		float titlePos = halfY - 100;

		imageMode(CENTER);
		image(title, 683, 250, 800, 188);
		imageMode(CORNER);
	}


	void setupButton() {
		numberOfBtn = 3;

		buttons = new controlP5.Button[numberOfBtn];

		int btnW = 200;
		int btnH = 50;
		int btnX = int(halfX) - int(btnW / 2);
		int btnY = int(halfY) + 50;
		int btnSpace = 70;

		buttons[START_GAME] = CP5.addButton("startGame")
		.setCaptionLabel(NEW_GAME_STR) 
		.setValue(0)
		.setImages(btn_newgame)
		.setPosition(485, 380)
		.setSize(396, 93)
		.hide();

		buttons[CREDITS] = CP5.addButton("openCredits")
		.setCaptionLabel(CREDITS_STR) 
		.setValue(0)
		.setImages(btn_credit)
		.setPosition(485, 380 + 120)
		.setSize(400, 92)
		.hide();

		buttons[QUIT] = CP5.addButton("quitGame")
		.setCaptionLabel(QUIT_GAME_STR) 
		.setValue(0)
		.setImages(btn_exit)
		.setPosition(495, 380 + 240)
		.setSize(385, 105)
		.hide();	
	}
}

public void startGame() {
	if (!SKIP_GAMEMODE_SELECTION) {  
		if (frameCount > 0) {
			lowerVolume(gameVolume);
			changeScreenTo(GAME_SELECT_SCR, MAIN_MENU_SCR);
		}
	} else {
		if (frameCount > 0) {
			 // Play click sound
		    clickSound();
		    lowerVolume(gameVolume);

		    gameMenu.hideButtonOf(MAIN_MENU_SCR);
		    gameModeOne.startGame();
		    gameState = IN_GAMEMODE_1;
		    gameScreen = GAMEMODE_1_PLAYING;
		}
	}
}

public void openCredits() {
	if (frameCount > 0) {
	    println("credits event");
	    // Play click sound
	    clickSound();
	    lowerVolume(gameVolume);
		changeScreenTo(CREDITS_SCR, MAIN_MENU_SCR);
	}
}

public void quitGame() {
	if (frameCount > 0) {
	    println("exit game event");
	    // Play click sound
	    clickSound();
		exit();
	}
}

// LowerVolume Function For BGM Fade Transition
public void lowerMenuVolume(float num) {
    num = num - 60;
    for (int i = 0; i < 10; i++) {
    num = num - 1;
    menuBGM.setGain(num);
    //println(num);
  }
}

// IncreaseVolume Function For BGM Fade Transition
public void increaseMenuVolume(float num) {
    num = num - 70;
    for (int i = 0; i < 10; i++) {
    num = num + 1;
    menuBGM.setGain(num);
    //println(num);
  }
}
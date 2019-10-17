/* 
  Individual Work Within This Page
  Tasks:
    -Implementing Click Effect On Buttons In The Menu Screens, Mouse Whens Been Clicked
    -Implementing Background Music For Welcome, Menu Screens And Within Gameplay
    -Adjust Sound Volumes Gradually And Pauses While Transitioning Between Screens
*/
class MainMenuScreen extends ScreenWithButton {

	// BUTTON INDEX
	int START_GAME = 0;
	int SETTING = 1;
	int QUIT = 2;

	MainMenuScreen() {
		this.setupButton();
	}

	void show() {
		// background(WHITE);
		imageMode(CORNER);
		fill(UGLY_COLOR);
		image(bg3, 0, 0, 1366, 768);
		textAlign(CENTER);
		float titlePos = halfY - 100;
		textSize(70);
		text(GAME_NAME, halfX, titlePos);
		textSize(80);
		text(GAME_SUB_NAME, halfX, titlePos + 70);
	}

	// Sets up the functionality and the side of buttons on game mode selection screen
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
	}
}


public void startGame() {
	if (frameCount > 0) {
    println("start game event");
    // Play click sound
    clickSound();
    lowerMenuVolume(gameVolume);

	changeScreenTo(GAME_SELECT_SCR, MAIN_MENU_SCR);
	}
}

public void openSetting() {
	if (frameCount > 0) {
    println("settings event");
    // Play click sound
    clickSound();
    lowerMenuVolume(gameVolume);

		changeScreenTo(SETTING_SCR, MAIN_MENU_SCR);
	}
}

public void quitGame() {
	if (frameCount > 0) {
    println("exit game event");
    // Play click sound
    clickSound();
    //changeScreenTo(CONFIRM_SCR, MAIN_MENU_SCR);
	  
    exit();
	}
}
// Click Sound Function
public void clickSound(){
  click.play();
  click.rewind();
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

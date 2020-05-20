// control setting screen

class SettingScreen extends ScreenWithButton {

	// BUTTON INDEX
	int BACK_2_MENU = 0;
	//int VOLUMN = 1;
	
	controlP5.Toggle[] toggles;
	int numberOfToggle = 0;

	PImage settingBackground;
	PImage[] btn_back = {loadImage("button/btn_back.png"),loadImage("button/btn_back_hover.png"),loadImage("button/btn_back_active.png")};

	PFont font = createFont("font/Aloha.ttf", 20);

	SettingScreen() {
		settingBackground = loadImage("img/bg/bg_4.jpg");
		settingBackground.resize(screenX, screenY); 
		this.setupButton();
		this.setupToggle();
	}

	void show() {
		background(settingBackground);
		fill(WHITE);

		textAlign(CENTER);

		float titlePos = halfY - 200;
		textSize(70);
		text(CREDITS_STR, halfX, titlePos);

		textSize(30);
		text("TEAM MEMBERS:", halfX, halfY / 1.3);
		text("FELIX (Hoang Ho Hai Dang)", halfX, halfY / 1.3 + 40);
		text("TIM (Fung Cheuk Yin Timothy)", halfX, halfY / 1.3 + 80);
		text("MARO (Quynh Trang Dang)", halfX, halfY / 1.3 + 120);
		text("DP (Dhruvil Patel)", halfX, halfY / 1.3 + 160);


		text("TUTOR:", halfX, halfY * 1.7);
		text("NAT SUNDARA", halfX, halfY * 1.7 + 40);

		textSize(20);
		int btnW = 100;
		int btnH = 25;
		int btnX = int(halfX) + 100;
		int btnY = int(halfY)+ 150;
	}

	void setupButton() {
		numberOfBtn = 1;

		buttons = new controlP5.Button[numberOfBtn];

		int btnW = 250;
		int btnH = 50;
		int btnX = 25;
		int btnY = 25;
		int btnSpace = 70;

		buttons[BACK_2_MENU] = CP5.addButton("back2Menu")
		.setCaptionLabel(BACK_2_MENU_STR) 
		.setValue(0)
		.setImages(btn_back)
		.setFont(font)
		.setPosition(btnX, btnY)
		.setSize(150, 84)
		.hide();	
	}

	void setupToggle() {

		int btnW = 100;
		int btnH = 25;
		int btnX = int(halfX);
		int btnY = int(halfY) + 100;
		int btnSpace = 70;

		fill(0, 102, 153);
	}
}


public void back2Menu() {
	if (frameCount > 0) {
		clickSound();
	  	increaseVolume(gameVolume);
		changeScreenTo(MAIN_MENU_SCR, CREDITS_SCR);
	}
}

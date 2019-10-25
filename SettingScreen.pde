// control setting screen

class SettingScreen extends ScreenWithButton {

	// BUTTON INDEX
	int BACK_2_MENU = 0;
	//int VOLUMN = 1;
	
	controlP5.Toggle[] toggles;
	int numberOfToggle = 0;
	//int USE_KEYBOARD = 1;
	//nt USE_KINECT = 0;

	PImage settingBackground;
	PImage[] btn_back = {loadImage("/button/btn_back.png"),loadImage("/button/btn_back_hover.png"),loadImage("/button/btn_back_active.png")};

	PFont font = createFont("/font/Aloha.ttf", 20);

	//controlP5.Slider volume;

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


		//text("CONTROLLER", halfX - 190, halfY + 120);

		textSize(20);
		int btnW = 100;
		int btnH = 25;
		int btnX = int(halfX) + 100;
		int btnY = int(halfY)+ 150;

		// if (gameInKinect) { 
		// 	fill(GREEN);
		// 	text(" : ON", btnX + 30, btnY);
		// } else {
		// 	fill(RED);
		// 	text(" : OFF", btnX + 30, btnY);
		// }

		// fill(WHITE);
		// text("KEYBOARD", btnX - 49, btnY + 50);

		// if (gameInKeyboard) { 
		// 	fill(GREEN);
		// 	text(" : ON", btnX + 30, btnY + 50);
		// } else {
		// 	fill(RED);
		// 	text(" : OFF", btnX + 30, btnY + 50);
		// }   
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

		//toggles = new controlP5.Toggle[numberOfToggle];

		int btnW = 100;
		int btnH = 25;
		int btnX = int(halfX);
		int btnY = int(halfY) + 100;
		int btnSpace = 70;

		fill(0, 102, 153);

		// toggles[USE_KINECT] = CP5.addToggle("useKinect")
		// .setValue(gameInKinect)
		// .setCaptionLabel(USE_KINECT_STR) 
		// .setFont(font)
		// .setPosition(btnX, btnY)
		// .setSize(btnW, btnH)
		// .setMode(CP5.SWITCH)
		// .setColorActive(GREEN) 
		// // .hide();

		// volume = CP5.addSlider("changeVolume")
		// .setPosition(halfX, halfY - 20)
		// .setSize(200,20)
		// .setRange(0,100)
		// .setValue(gameVolume)
		// .setLabelVisible(false) 
		// .hide();  
	}

	// override for hide other controllers
	// void hideButton() {
	// 	super.hideButton();

	// 	for (int i = 0; i < numberOfToggle; i++) {
	// 		toggles[i].hide();
	// 	}

	// 	volume.hide();
	// }

	// override for show other controllers
// 	void showButton() {
// 		super.showButton();

// 		for (int i = 0; i < numberOfToggle; i++) {
// 			toggles[i].show();
// 		}

// 		volume.show();
// 	}
}


public void back2Menu() {
	if (frameCount > 0) {
		clickSound();
	  	increaseVolume(gameVolume);
		changeScreenTo(MAIN_MENU_SCR, CREDITS_SCR);
	}
}

// public void useKinect(boolean theFlag) {
// 	if (frameCount > 0) {
// 		// println("useKinect: "+theFlag);
// 		if(theFlag == true) {
// 			gameMenu.settingScreen.toggles[0].setColorActive(GREEN);
// 			gameInKinect = true;
// 			gameInKeyboard = false;
// 		} else {
// 			gameMenu.settingScreen.toggles[0].setColorActive(RED);
// 			gameInKinect = false;
// 			gameInKeyboard = true;
// 		}
// 	}
// }

// void changeVolume(float value) {
// 	if (frameCount > 0)
// 		gameVolume = value;
// }

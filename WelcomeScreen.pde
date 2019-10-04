class WelcomeScreen {

  PImage menuBackground;

  WelcomeScreen() {
    menuBackground = loadImage("menu_bg.jpg");
    menuBackground.resize(screenX, screenY); 
  }

	void show() {
    background(menuBackground);
    textAlign(CENTER);
    fill(UGLY_COLOR);

    textSize(80);
    text(GAME_NAME, halfX, halfY);
    textSize(80);
    text(GAME_SUB_NAME, halfX, halfY + 70);
    textSize(15); 
    text(CLICK_2_START, halfX, height - 30);
  }
}

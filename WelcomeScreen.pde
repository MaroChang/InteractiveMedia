class WelcomeScreen {

  WelcomeScreen() {
    // do not thing
  }

	void show() {
    background(BEAUTY_COLOR);
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
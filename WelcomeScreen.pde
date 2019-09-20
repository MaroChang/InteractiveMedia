class WelcomeScreen {

  WelcomeScreen() {
    // Do nothing
  }

	void show() {
    background(BEAUTY_COLOR);
    textAlign(CENTER);
    //fill(UGLY_COLOR);

    textSize(80);
    text(GAME_NAME, halfX, halfY);
    textSize(80);
    text(GAME_SUB_NAME, halfX, halfY + 70);
    textSize(20); 
    text(CLICK_2_START, halfX, height - 30);
  }
}

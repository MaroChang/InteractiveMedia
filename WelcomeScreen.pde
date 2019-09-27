class WelcomeScreen {

  WelcomeScreen() {
    menuBGM.play();
    menuBGM.setGain(gameVolume - 60);
    menuBGM.loop();
  }

	void show() {
    // background(BEAUTY_COLOR);
    image(bg1, 0, 0, 1366, 768);
    textAlign(CENTER);
    fill(WHITE);

    textSize(80);
    text(GAME_NAME, halfX, halfY);
    textSize(80);
    text(GAME_SUB_NAME, halfX, halfY + 70);
    textSize(15); 
    text(CLICK_2_START, halfX, height - 30);
  }
}

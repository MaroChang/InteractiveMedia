class WelcomeScreen {

  WelcomeScreen() {
    //audio
    gamesong.play();
    gamesong.setGain(-10);
    gamesong.loop();
  }

	void show() {
    background(BEAUTY_COLOR);
    textAlign(CENTER);
    fill(252, 68, 68);
    

    textSize(80);
    text(GAME_NAME, halfX, halfY);
    textSize(80);
    text(GAME_SUB_NAME, halfX, halfY + 70);
    fill(UGLY_COLOR);
    textSize(15); 
    text(CLICK_2_START, halfX, height - 30);
  }
}

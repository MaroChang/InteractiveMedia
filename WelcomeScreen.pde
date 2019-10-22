class WelcomeScreen {

  PImage menuBackground;
  PFont font = createFont("Aloha.ttf", 20);
  
  WelcomeScreen() {
    menuBackground = loadImage("menu_bg.png");
    menuBackground.resize(screenX, screenY); 
    initialBGMStartup();
  }

	void show() {
    background(menuBackground);
    textAlign(CENTER);
    fill(WHITE);
    textFont(font);
    printTitleName();
    animatedText();
  }

void initialBGMStartup() {
    menuBGM.play();
    menuBGM.setGain(gameVolume - 60);
    menuBGM.loop();
  }

void printTitleName() {
    textSize(80);
    text(GAME_NAME, halfX, halfY);
    textSize(80);
    text(GAME_SUB_NAME, halfX, halfY + 70);
  }

void animatedText() {
    textSize(30); 
    text(CLICK_2_START, halfX, height - 30);
  }
}

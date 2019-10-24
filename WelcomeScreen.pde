class WelcomeScreen {

  PImage menuBackground;
  PImage title;
  PFont font = createFont("Aloha.ttf", 20);
  
  WelcomeScreen() {
    menuBackground = loadImage("menu_bg.png");
    menuBackground.resize(screenX, screenY); 

    title = loadImage("game_title.png");
    initialBGMStartup();
  }

	void show() {
    background(menuBackground);
    textAlign(CENTER);
    fill(WHITE);
    textFont(font);
    animatedText();
    imageMode(CENTER);
    //printTitleName();
    image(title, 683, 250, 800, 188);
    imageMode(CORNER);
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

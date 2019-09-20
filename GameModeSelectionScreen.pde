class GameModeSelectionScreen extends ScreenWithButton {
 
   // BUTTON INDEX
  int BACK_2_MENU = 0;
  int GAMEMODE_1 = 1;
  int GAMEMODE_2 = 2;
  
  //background image
        int numFrames=10;
        int currentFrame=0;
        int framerate=3;
        PImage[] background2 = new PImage[numFrames];
  
  GameModeSelectionScreen() {
    this.setupButton();
    
    frameRate(framerate);
               
               background2[0] = loadImage("frame_00_delay-0.2s.gif");
               background2[1] = loadImage("frame_01_delay-0.2s.gif");
               background2[2] = loadImage("frame_02_delay-0.2s.gif");
               background2[3] = loadImage("frame_03_delay-0.2s.gif");
               background2[4] = loadImage("frame_04_delay-0.2s.gif");  
               background2[5] = loadImage("frame_05_delay-0.2s.gif");
               background2[6] = loadImage("frame_06_delay-0.2s.gif");
               background2[7] = loadImage("frame_07_delay-0.2s.gif");
               background2[8] = loadImage("frame_08_delay-0.2s.gif");
               background2[9] = loadImage("frame_09_delay-0.2s.gif");
               
  }

  void show() {
      currentFrame = (currentFrame+1)%numFrames;
                image(background2[(currentFrame)%numFrames],0,0);
    //background(WHITE);
    fill(UGLY_COLOR);
  }
  
   void setupButton() {
    numberOfBtn = 3;

    buttons = new controlP5.Button[numberOfBtn];

    //int btnW = 462;
    //int btnH = 550;
    //int btnX = int(halfX) - int(btnW / 2);
    //int btnY = int(halfY) -200;
    int btnSpace = 70;

    PFont font = createFont("Georgia", 20);

    buttons[GAMEMODE_1] = CP5.addButton("gamemode1")
      .setCaptionLabel(GAMEMODE1STR) 
      .setValue(0)
      .setFont(font)
      //.setPosition(btnX - btnSpace * 3.5, btnY)
      .setPosition(100,612)
       //.setSize(btnW, btnH)
       .setSize(200,100)
      .hide();

    buttons[GAMEMODE_2] = CP5.addButton("gamemode2")
      .setCaptionLabel(GAMEMODE2STR) 
      .setValue(0)
      .setFont(font)
      //.setPosition(btnX + btnSpace * 3.5, btnY)
      .setPosition(712,612)
      //.setSize(btnW, btnH)
      .setSize(200,100)
      .hide();  
      
      
      buttons[BACK_2_MENU] = CP5.addButton("backtoMenu")
      .setCaptionLabel(BACK_2_MENU_STR) 
      .setValue(0)
      .setFont(font)
      .setPosition(25, 25)
       .setSize(250, 50)
      .hide();
  }
}

public void gamemode1() {
  if (frameCount > 0) {
    changeScreenTo(MAIN_MENU_SCR, GAME_SELECT_SCR);
  }
}

public void gamemode2() {
  if (frameCount > 0) {
    changeScreenTo(MAIN_MENU_SCR, GAME_SELECT_SCR);
  }
}

public void backtoMenu() {
  if (frameCount > 0) {
    changeScreenTo(MAIN_MENU_SCR, GAME_SELECT_SCR);
  }
}

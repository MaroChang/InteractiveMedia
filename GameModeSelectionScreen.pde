class GameModeSelectionScreen extends ScreenWithButton {
 
   // BUTTON INDEX
  int BACK_2_MENU = 0;
  int GAMEMODE_1 = 1;
  int GAMEMODE_2 = 2;
  
  //backgroung image
  PImage bg;
  
  GameModeSelectionScreen() {
    gamesong.play();
    gamesong.loop();
    bg = loadImage("image_4.jpg");
    bg.resize(1280,720);
    this.setupButton();
  }

  void show() {
    //background(WHITE);
    background(bg);
    fill(UGLY_COLOR);
  }
  
   void setupButton() {
    numberOfBtn = 3;

    buttons = new controlP5.Button[numberOfBtn];

    int btnW = 462;
    int btnH = 550;
    int btnX = int(halfX) - int(btnW / 2);
    int btnY = int(halfY) -200;
    int btnSpace = 70;

    PFont font = createFont("Georgia", 20);

    PImage[] imgs = {loadImage("button_9.png"),loadImage("button_10.png"),loadImage("button_9.png")};
    buttons[GAMEMODE_1] = CP5.addButton("gamemode1")
      .setImages(imgs)
      .setCaptionLabel(GAMEMODE1STR) 
      .setValue(0)
      .setFont(font)
      //.setPosition(btnX - btnSpace * 3.5, btnY)
      .setPosition(200,580)
      //.setSize(btnW, btnH)
      .setSize(200,100)
      .hide();

    PImage[] imgs1 = {loadImage("button_11.png"),loadImage("button_12.png"),loadImage("button_11.png")};
    buttons[GAMEMODE_2] = CP5.addButton("gamemode2")
      .setImages(imgs1)
      .setCaptionLabel(GAMEMODE2STR) 
      .setValue(0)
      .setFont(font)
      //.setPosition(btnX + btnSpace * 3.5, btnY)
      .setPosition(880,580)
      //.setSize(btnW, btnH)
      .setSize(200,100)
      .hide();  
      
    PImage[] imgs2 = {loadImage("button_7.png"),loadImage("button_8.png"),loadImage("button_7.png")};    
    buttons[BACK_2_MENU] = CP5.addButton("backtoMenu")
      .setImages(imgs2)
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
    //audio
    click.play();
    click.rewind();
    
    gameMenu.hideButtonOf(GAME_SELECT_SCR);
    gameModeOne.startGame();
    gameState = IN_GAMEMODE_1;
    gameScreen = GAMEMODE_1_PLAYING;
  }
}

public void gamemode2() {
  if (frameCount > 0) {
    //audio
    click.play();
    click.rewind();
    
    changeScreenTo(MAIN_MENU_SCR, GAME_SELECT_SCR);
  }
}

public void backtoMenu() {
  if (frameCount > 0) {
    //audio
    click.play();
    click.rewind();
    
    changeScreenTo(MAIN_MENU_SCR, GAME_SELECT_SCR);
  }
}

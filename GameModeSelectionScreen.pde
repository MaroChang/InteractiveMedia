class GameModeSelectionScreen extends ScreenWithButton {
 
   // BUTTON INDEX
  int BACK_2_MENU = 0;
  int GAMEMODE_1 = 1;
  int GAMEMODE_2 = 2;

  PFont font = createFont("font/Aloha.ttf", 20);

  //backgroung image
  PImage bg;
  PImage[] btn_back = {loadImage("button/btn_back.png"),loadImage("button/btn_back_hover.png"),loadImage("button/btn_back_active.png")};
  PImage[] btn_mouse = {loadImage("button/btn_mouse.png"),loadImage("button/btn_mouse_hover.png"),loadImage("button/btn_mouse_active.png")};
  PImage[] btn_kinect = {loadImage("button/btn_kinect.png"),loadImage("button/btn_kinect_hover.png"),loadImage("button/btn_kinect_active.png")};


  GameModeSelectionScreen() {
    bg = loadImage("gameSelection_bg.png");
    this.setupButton();
  }

  void show() {
    background(bg);
    // fill(UGLY_COLOR);
    noStroke();
    fill(INSTRUCTIONS);
    rect(screenX / 2, screenY / 2.3, screenX / 1.5, screenY / 1.5, 50);
    textSize(30); 
    fill(54,90,102);
    text("Instructions:", screenX / 4 - 10, screenY / 4.8 );
    textSize(20);
    text("Character:", screenX / 4 - 50, screenY / 3.9);
    image(players, screenX / 4 - 100, screenY / 3.6, 200, 300);
    text("This is You", screenX / 4 , screenY / 1.4);

    text("Monsters:", screenX / 2 - 50, screenY / 3.9);
    image(monsters, screenX / 2 - 100, screenY / 4.6, 200, 300);
    text("Avoid These", screenX / 2 , screenY / 1.4);

    text("Items:", screenX / 2 + screenX / 4 - 50, screenY / 3.9);
    image(items,screenX / 2 + screenX / 4 - 100, screenY / 3.6, 200, 300);
    text("Collect These", screenX / 2 + screenX / 4, screenY / 1.4);
  }
  
  // Sets up the functionality and the side of buttons on game mode selection screen
   void setupButton() {
    numberOfBtn = 3;

    buttons = new controlP5.Button[numberOfBtn];

    int btnW = 200;
    int btnH = 100;
    int btnX = int(halfX) - int(btnW / 2);
    int btnY = int(halfY) -200;
    int btnSpace = 70;

    buttons[GAMEMODE_1] = CP5.addButton("gamemode1")
      .setCaptionLabel(GAMEMODE1STR) 
      .setValue(0)
      .setFont(font)
      .setImages(btn_mouse)
      //.setPosition(btnX - btnSpace * 3.5, btnY)
      .setPosition(166,605)
      .setSize(400, 92)

      .hide();

    buttons[GAMEMODE_2] = CP5.addButton("gamemode2")
      .setCaptionLabel(GAMEMODE2STR) 
      .setValue(0)
      .setFont(font)
      .setImages(btn_kinect)
      //.setPosition(btnX + btnSpace * 3.5, btnY)
      .setPosition(800,600)
      .setSize(400, 92)
      .hide();  

    buttons[BACK_2_MENU] = CP5.addButton("backToMenu")
      .setCaptionLabel(BACK_2_MENU_STR) 
      .setValue(0)
      .setImages(btn_back)
      .setPosition(25, 25)
      .setSize(150, 84)
      .hide();
  }
}

// Function for the gamemode 1 button
public void gamemode1() {
  if (frameCount > 0) {
    println("gamemode1 event");
    // Play click sound
    clickSound();
    
    menuBGM.pause();
    
    gameMenu.hideButtonOf(GAME_SELECT_SCR);
    gameModeOne.startGame();
    gameState = IN_GAMEMODE_1;
    gameScreen = GAMEMODE_1_PLAYING;
  }
}

// Function for the gamemode 2 button
public void gamemode2() {
  if (frameCount > 0) {
    gameMenu.hideButtonOf(GAME_SELECT_SCR);
    gameModeTwo.startGame();
    gameState = IN_GAMEMODE_2;
    gameScreen = GAMEMODE_2_READY;

    click.play();
    click.rewind();
    //menuBGM.setGain(gameVolume - 60);
    menuBGM.pause();

    //changeScreenTo(MAIN_MENU_SCR, GAME_SELECT_SCR);
  }
}

// Function for the back to menu button 
public void backToMenu() {
if (frameCount > 0) {
    println("back to menu event");
    // Play click sound
    clickSound();
    increaseMenuVolume(gameVolume);
      
    changeScreenTo(MAIN_MENU_SCR, GAME_SELECT_SCR);
  }
}

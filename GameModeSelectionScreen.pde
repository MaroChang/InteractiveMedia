class GameModeSelectionScreen extends ScreenWithButton {
 
   // BUTTON INDEX
  int BACK_2_MENU = 0;
  int GAMEMODE_1 = 0;
  int GAMEMODE_2 = 1;
  
  GameModeSelectionScreen() {
    this.setupButton();
  }

  void show() {
    background(WHITE);
    fill(UGLY_COLOR);
  }
  
   void setupButton() {
    numberOfBtn = 2;

    buttons = new controlP5.Button[numberOfBtn];

    int btnW = 462;
    int btnH = 550;
    int btnX = int(halfX) - int(btnW / 2);
    int btnY = int(halfY) -200;
    int btnSpace = 70;

    PFont font = createFont("Georgia", 20);

    buttons[GAMEMODE_1] = CP5.addButton("gamemode1")
      .setCaptionLabel(GAMEMODE1STR) 
      .setValue(0)
      .setFont(font)
      .setPosition(btnX - btnSpace * 3.5, btnY)
       .setSize(btnW, btnH)
      .hide();

    buttons[GAMEMODE_2] = CP5.addButton("gamemode2")
      .setCaptionLabel(GAMEMODE2STR) 
      .setValue(0)
      .setFont(font)
      .setPosition(btnX + btnSpace * 3.5, btnY)
      .setSize(btnW, btnH)
      .hide();  
  }
}

public void gamemode1() {
  if (frameCount > 0) {
    gameMenu.hideButtonOf(GAME_SELECT_SCR);
    gameModeOne.startGame();
    gameState = IN_GAMEMODE_1;
    gameScreen = GAMEMODE_1_PLAYING;
  }
}

public void gamemode2() {
  if (frameCount > 0) {
    gameMenu.hideButtonOf(GAME_SELECT_SCR);
    gameModeTwo.startGame();
    gameState = IN_GAMEMODE_2;
    gameScreen = GAMEMODE_2_PLAYING;
  }
}

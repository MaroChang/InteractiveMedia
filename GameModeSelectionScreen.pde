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
    numberOfBtn = 3;

    buttons = new controlP5.Button[numberOfBtn];

    int btnW = 200;
    int btnH = 200;
    int btnX = int(halfX) - int(btnW / 2);
    int btnY = int(halfY) + 50;
    int btnSpace = 70;

    PFont font = createFont("Georgia", 20);

    buttons[GAMEMODE_1] = CP5.addButton("gamemode1")
      .setCaptionLabel(GAMEMODE1STR) 
      .setValue(0)
      .setFont(font)
      .setPosition(btnX - btnSpace * 2, btnY)
       .setSize(btnW, btnH)
      .hide();

    buttons[GAMEMODE_2] = CP5.addButton("gamemode2")
      .setCaptionLabel(GAMEMODE2STR) 
      .setValue(0)
      .setFont(font)
      .setPosition(btnX + btnSpace * 2, btnY)
      .setSize(btnW, btnH)
      .hide();  
  }
}

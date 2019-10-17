class GameModeSelectionScreen extends ScreenWithButton {
 
   // BUTTON INDEX
  int BACK_2_MENU = 0;
  int GAMEMODE_1 = 1;
  int GAMEMODE_2 = 2;
  
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

    buttons[BACK_2_MENU] = CP5.addButton("backToMenu")
      .setCaptionLabel(BACK_2_MENU_STR) 
      .setValue(0)
      .setFont(font)
      .setPosition(25, 25)
       .setSize(btnW + 50, btnH -50)
      .hide();   
  }
}

public void gamemode1() {
  if (frameCount > 0) {
    click.play();
    click.rewind();
    
    menuBGM.pause();

    gameMenu.hideButtonOf(GAME_SELECT_SCR);
    gameModeOne.startGame();
    gameState = IN_GAMEMODE_1;
    gameScreen = GAMEMODE_1_PLAYING;
  }
}

public void gamemode2() {
  if (frameCount > 0) {

    click.play();
    click.rewind();
    menuBGM.setGain(gameVolume - 60);


    changeScreenTo(MAIN_MENU_SCR, GAME_SELECT_SCR);
  }
}

// Function for the back to menu button 
public void backToMenu() {
if (frameCount > 0) {
    println("back to menu event");
    // Play click sound
    click.play();
    click.rewind();
    increaseVolume(gameVolume);
      
    changeScreenTo(MAIN_MENU_SCR, GAME_SELECT_SCR);
  }
}

// // LowerVolume Function For BGM Fade Transition
// public void lowerVolume(float num) {
//     num = num - 60;
//     for (int i = 0; i < 10; i++) {
//     num = num - 1;
//     menuBGM.setGain(num);
//     println(num);
//   }
// }



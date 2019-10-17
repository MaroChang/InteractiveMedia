/* 
  Individual Work Within This Page
  Tasks:
    -Implementing Click Effect On Buttons In The Menu Screens, Mouse Whens Been Clicked
    -Implementing Background Music For Welcome, Menu Screens And Within Gameplay
    -Adjust Sound Volumes Gradually And Pauses While Transitioning Between Screens
*/
class GameModeSelectionScreen extends ScreenWithButton {
 
   // BUTTON INDEX
  int BACK_2_MENU = 0;
  int GAMEMODE_1 = 1;
  int GAMEMODE_2 = 2;
  
  GameModeSelectionScreen() {
    this.setupButton();
  }

  void show() {
    // background(WHITE);
    // fill(UGLY_COLOR);
    image(bg2, 0, 0, 1366, 768);
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

    PFont font = createFont("Georgia", 20);

    buttons[GAMEMODE_1] = CP5.addButton("gamemode1")
      .setCaptionLabel(GAMEMODE1STR) 
      .setValue(0)
      .setFont(font)
      //.setPosition(btnX - btnSpace * 3.5, btnY)
      .setPosition(100,580)
      .setSize(btnW, btnH)
      .hide();

    buttons[GAMEMODE_2] = CP5.addButton("gamemode2")
      .setCaptionLabel(GAMEMODE2STR) 
      .setValue(0)
      .setFont(font)
      //.setPosition(btnX + btnSpace * 3.5, btnY)
      .setPosition(980,580)
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
    println("gamemode2 event");
    // Play click sound
    clickSound();
    menuBGM.setGain(gameVolume - 60);
    
    changeScreenTo(MAIN_MENU_SCR, GAME_SELECT_SCR);
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

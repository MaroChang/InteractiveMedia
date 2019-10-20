class GameModeSelectionScreen extends ScreenWithButton {
 
   // BUTTON INDEX
  int BACK_2_MENU = 0;
  int GAMEMODE_1 = 1;
  int GAMEMODE_2 = 2;

  //backgroung image
  PImage bg;
  
  GameModeSelectionScreen() {
    bg = loadImage("image_4.jpg");
    bg.resize(1366,768);
    this.setupButton();
  }

  void show() {
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

    buttons[GAMEMODE_1] = CP5.addButton("gamemode1")
      .setCaptionLabel(GAMEMODE1STR) 
      .setValue(0)
      .setFont(font)
      .setPosition(200,580)
      .setSize(200,100)
      .hide();

    buttons[GAMEMODE_2] = CP5.addButton("gamemode2")
      .setCaptionLabel(GAMEMODE2STR) 
      .setValue(0)
      .setFont(font)
      .setPosition(880,580)
      .setSize(200,100)
      .hide(); 

    buttons[BACK_2_MENU] = CP5.addButton("backToMenu")
      .setCaptionLabel(BACK_2_MENU_STR) 
      .setValue(0)
      .setFont(font)
      .setPosition(25, 25)
      .setSize(250, 75)
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
    click.play();
    click.rewind();
    increaseVolume(gameVolume);
      
    changeScreenTo(MAIN_MENU_SCR, GAME_SELECT_SCR);
  }
}

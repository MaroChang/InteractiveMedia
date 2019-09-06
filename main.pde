// IMPORT LIBRARIES
import controlP5.*; //GUI

// LIBRARY OBJECTS
ControlP5 CP5;

// GLOBAL VARIABLES ________________
// Leave an explanation if the variable's meaning is ambiguous
int screenX = 1024;
int screenY = 768;
float halfX = screenX / 2;
float halfY = screenY / 2;

int gameState;
int gameScreen;
boolean gameInKinect = true;
boolean gameInKeyboard = false;
float gameVolume = 50;

// For bypassing onclick event of quit button
boolean allowQuit = false;

// Game Object
Menu gameMenu;
GameModeOne gameModeOne;

// Configuration ________________
void setup(){
  size(1024, 768);

  CP5 = new ControlP5(this);
  
  gameState = IN_MENU;
  gameScreen = WELCOME_SCR;
  // gameScreen = SETTING_SCR;

  gameMenu = new Menu();
  fill(UGLY_COLOR);
  smooth();
}

// Drawing ________________
void draw(){
  switch (gameState) {
    case IN_MENU:
      gameMenu.show();
    break;
    case IN_GAMEMODE_1:
      gameModeOne.run();
    break;
  }
}

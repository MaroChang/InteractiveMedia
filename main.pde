// IMPORT LIBRARIES
import controlP5.*; //GUI

// LIBRARY OBJECTS
ControlP5 CP5;

<<<<<<< HEAD
// GLOBAL VARIABLES ________________
// Leave an explanation if the variable's meaning is ambiguous
int screenX = 1024;
=======
// global variables ________________
// leave an explanation if the variable's meaning is ambiguous
// 16:9 ratio
int screenX = 1366;
>>>>>>> add gameModeOne outline
int screenY = 768;
float halfX = screenX / 2;
float halfY = screenY / 2;

int gameState;
int gameScreen;
int gameScore = 0;

// game setting
boolean gameInKinect = true;
boolean gameInKeyboard = false;
float gameVolume = 50;

<<<<<<< HEAD
// For bypassing onclick event of quit button
boolean allowQuit = false;
=======
// character move speed
float moveValue = 5;
>>>>>>> add gameModeOne outline

// Game Object
Menu gameMenu;
GameModeOne gameModeOne;

// Configuration ________________
void setup(){
<<<<<<< HEAD
  size(1024, 768);

=======
  size(screenX, screenY);
>>>>>>> add gameModeOne outline
  CP5 = new ControlP5(this);
  
  //gameState = IN_MENU;
  gameState = IN_GAMEMODE_1;

  //gameScreen = WELCOME_SCR;
  gameScreen = GAMEMODE_1_PLAYING;

  gameMenu = new Menu();
  gameModeOne = new GameModeOne();

  fill(UGLY_COLOR);

  rectMode(CENTER);
  smooth();
}

// Drawing ________________
void draw(){
  switch (gameState) {
    case IN_MENU:
      gameMenu.show();
    break;
    case IN_GAMEMODE_1:
      gameModeOne.show();
    break;

    case IN_GAMEMODE_2:
      // watting
    break;
  }
}

// IMPORT LIBRARIES
import controlP5.*; //GUI

// LIBRARY OBJECTS
ControlP5 CP5;

// global variables ________________
// leave an explanation if the variable's meaning is ambiguous
// 16:9 ratio
int screenX = 1280;
int screenY = 720;
float halfX = screenX / 2;
float halfY = screenY / 2;

int gameState;
int gameScreen;
int gameScore = 0;

// game setting
boolean gameInKinect = true;
boolean gameInKeyboard = false;
float gameVolume = 50;

// character move speed
float moveValue = 5;

// Game Object
Menu gameMenu;
GameModeOne gameModeOne;

// Configuration ________________
void setup(){
  size(1280, 720);
  
  CP5 = new ControlP5(this);
  
  gameState = IN_MENU;
  //gameState = IN_GAMEMODE_1;

  gameScreen = WELCOME_SCR;
  //gameScreen = GAMEMODE_1_PLAYING;

  gameMenu = new Menu();
  gameModeOne = new GameModeOne();
  
  //weather data
  //Table table = loadTable("Air.csv");

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

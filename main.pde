// IMPORT LIBRARIES
import controlP5.*; // GUI
import ddf.minim.*; // Minim

// LIBRARY OBJECTS
ControlP5 CP5;
Minim minim;
AudioPlayer tombstone, click, gamestart, lose, point;

// global variables ________________
// leave an explanation if the variable's meaning is ambiguous
// 16:9 ratio
int screenX = 1366;
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

// character move speed
float moveValue = 5;

// Game Object
Menu gameMenu;
GameModeOne gameModeOne;

// Configuration ________________
void setup(){
  size(1366, 768);
  
  CP5 = new ControlP5(this);
  
  minim = new Minim(this);
  
  // Sound Effects
  // Menu Sound Effects
  click = minim.loadFile("click.mp3");
  
  // Game Sound Effects
  gamestart = minim.loadFile("gamestart.mp3");
  point = minim.loadFile("point.mp3");
  lose = minim.loadFile("lose.mp3"); // + Ding Ding Ding in the beginning of the file
  pickUp = minim.loadFile("pickup.mp3"); 
  
  // Game Character Effects
  tombstone = minim.loadFile("tombstone.mp3");
  // walk = minim.loadFile("walk.mp3");
  // jump = minim.loadFile("jump.mp3");
  
  // Game Obstacle Effects
  // spawn = minim.loadFile("spawn.mp3");

  // Game Monster Effects
  // water_boss = minim.loadFile("water_boss.mp3");
  // bird_boss = minim.loadFile("bird_boss.mp3");
  
  // Background Music + Effects
  // menuBGM = minim.loadFile("menu.mp3");
  // gameBGM = minim.loadFile("game.mp3");
  // storm = minim.loadFile("storm.mp3");
  // thunder = minim.loadFile("thunder.mp3");
  // rain = minim.loadFile("rain.mp3");
  // fire = minim.loadFile("fire.mp3");
  // birds = minim.loadFile("birds.mp3");

  gameState = IN_MENU;
  //gameState = IN_GAMEMODE_1;

  gameScreen = WELCOME_SCR;
  //gameScreen = GAMEMODE_1_PLAYING;

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
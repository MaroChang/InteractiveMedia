// IMPORT LIBRARIES
import controlP5.*; // GUI
import ddf.minim.*; // Minim

// LIBRARY OBJECTS
ControlP5 CP5;
Minim minim;
AudioPlayer click, gamestart, point, lose, pickUp, tombstone, walk, jump, spawn, water_boss, bird_boss, menuBGM, gameBGM, storm, thunder, rain, fire, birds;

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

PImage garbagePile, manta;

// Configuration ________________
void setup(){
  size(1366, 768);
  
  CP5 = new ControlP5(this);
  
  minim = new Minim(this);
  
  // Images
  garbagePile = loadImage("img/garbagePile.png");
  manta = loadImage("img/character/manta2_3.gif");

  // Sound Effects
  // Menu Sound Effects
  click = minim.loadFile("game_effects/interface/click.mp3");
  
  // Game Sound Effects
  gamestart = minim.loadFile("game_effects/interface/gamestart.mp3");
  point = minim.loadFile("game_effects/interface/point.mp3");
  lose = minim.loadFile("game_effects/interface/lose.mp3"); // + Ding Ding Ding in the beginning of the file
  pickUp = minim.loadFile("game_effects/character/pickup.mp3"); 
  
  // Game Character Effects
  tombstone = minim.loadFile("game_effects/character/tombstone.mp3");
  // walk = minim.loadFile("game_effects/character/walk.mp3");
  // jump = minim.loadFile("game_effects/character/jump.mp3");
  
  // Game Obstacle Effects
  // spawn = minim.loadFile("game_effects/monster/spawn.mp3");

  // Game Monster Effects
  // water_boss = minim.loadFile("game_effects/monster/water_boss.mp3");
  // bird_boss = minim.loadFile("game_effects/monster/bird_boss.mp3");
  
  // Background Music + Effects
  menuBGM = minim.loadFile("bgm/menuBGM.mp3");
  gameBGM = minim.loadFile("bgm/gameBGM.mp3");
  // storm = minim.loadFile("game_effects/weather/storm.mp3");
  // thunder = minim.loadFile("game_effects/weather/thunder.mp3");
  // rain = minim.loadFile("game_effects/weather/rain.mp3");
  // fire = minim.loadFile("game_effects/weather/fire.mp3");

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

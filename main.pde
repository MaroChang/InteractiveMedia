/*
  FUNG CHEUK YIN TIMOTHY
  Student ID: 12723161
  Tutorial 2 Interactive Media - Nat Sundara
  Processing Version: 3.5.3
  Project Description: 
    Our projet idea is to design an interactive game that educates the general public and bring awareness to Global Warming. 
    We would like to incorporate fun gameplay, colours and promote good habits that allow the player to learn processes that may help.
    The game allows the player to navigate through obstacles and collect items that will minimise the desctructions of man-kind. 
    As the character, you must collect your child for points whilst avoiding incoming human waste or other dangers such 
    as other animals whom have taken a more aggressive approach.
  Task lists:
    -Sourcing Apppropriate Effect Sounds For Assignment 3
    -Sourcing Appropriate Background Music
    -Implementing Sound Effect When Player Loses
    -Implementing Click Effect On Buttons In The Menu Screens, Mouse Whens Been Clicked
    -Implementing Background Music For Welcome, Menu Screens And Within Gameplay
    -Adjust Sound Volumnes And Pauses While Transitioning Between Screens
    -Adjust Sound Volumne On Settings Page*
    -Start On Character Design
  
    
    Things to Do 
    Sound Fades
    Manipulate Sound for whole game 
    Pixelate Backgrounds
    Torch the manta ray to make the game darker
    
*/
  
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

PImage bg1, bg2, bg3, bg4, garbagePile, manta;

// Configuration ________________
void setup(){
  size(1366, 768);
  

  // Initialization of all data files
  CP5 = new ControlP5(this);
  minim = new Minim(this);
  
  // Images
    // Character + Game Elements
    garbagePile = loadImage("img/garbagePile.png");
    manta = loadImage("img/character/manta2_3.gif");
    
    // Background
    bg1 = loadImage("img/bg/bg_1.png");
    bg2 = loadImage("img/bg/bg_2.jpg");
    bg3 = loadImage("img/bg/bg_3.jpg");
    bg4 = loadImage("img/bg/bg_4.jpg");

  // Sound Effects
  
  // Commented Sounds Are For Future Function Implementation
  
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
  
  // Set Current Game State
  gameState = IN_MENU;
  //gameState = IN_GAMEMODE_1;

  gameScreen = WELCOME_SCR;
  //gameScreen = GAMEMODE_1_PLAYING;

  gameMenu = new Menu();
  gameModeOne = new GameModeOne();
  
  fill(UGLY_COLOR);
  smooth();
}

// Drawing ________________
// Switch to determine which page to draw
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

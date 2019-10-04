/*Name: Dhruvil Patel;
  Student ID: 13501135
  tutorial no.: 02 , tutor name: Nat
  
  Group Name: Hasta La Vista Baby

Project Description:
    Our projet idea is to design an interactive game that educates the general public and bring awareness to Global Warming. We would like to incorporate fun gameplay, colours and promote good habits that allow the player to learn processes that may help.
    The game allows the player to navigate through obstacles and collect items that will minimise the desctructions of man-kind. As the character, you must collect your child for points whilst avoiding incoming human waste or other dangers such 
    as other animals whom have taken a more aggressive approach.
    
    
 My task was to implement background.
 - added some images and changed them according to the temperature data in csv from building 11
 - added two sound to the game 
     1. background sound
     2. click sound
 
 - currently working on changing the shape of button and transition between two weather images
*/



// IMPORT LIBRARIES
import controlP5.*; //GUI
import ddf.minim.*; // Minim

// LIBRARY OBJECTS
ControlP5 CP5;
Minim minim;
AudioPlayer click, gamesong;


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
  
  minim = new Minim(this);
  
  click = minim.loadFile("fireball.mp3");
  gamesong = minim.loadFile("game_song.mp3");
  
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

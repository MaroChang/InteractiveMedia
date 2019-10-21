
// IMPORT LIBRARIES
import controlP5.*; //GUI
import ddf.minim.*;
import ddf.minim.ugens.*;

// LIBRARY OBJECTS
ControlP5 CP5;
Minim MN;

// global variables ________________
AudioOutput audioOutput;

// 16:9 ratio
int screenX = 1366;
int screenY = 768;
float halfX = screenX / 2;
float halfY = screenY / 2;

// identify the current stage of the application
int gameState;
// identify the current screen of a state
int gameScreen;
// current score of player
int gameScore = 0;

// game setting
boolean gameInKinect = true;
boolean gameInKeyboard = false;
float gameVolume = 50;
int gameEnvMode = 0;

// character move speed
float moveValue = 5;

// Game Object
Menu gameMenu;
GameModeOne gameModeOne;

// Configuration ________________
void setup(){
    size(screenX, screenY);

    CP5 = new ControlP5(this);

    //audio set up
    MN = new Minim(this);
    audioOutput = MN.getLineOut();

    // looks for all game constants and codes in "constant.pde"
    gameState = IN_MENU;
    //gameState = IN_GAMEMODE_1;

    gameScreen = WELCOME_SCR;
    //gameScreen = GAMEMODE_1_PLAYING;

    loadGameResource();

    // create game instance
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

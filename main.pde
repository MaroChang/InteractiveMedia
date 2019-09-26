// IMPORT LIBRARIES
import controlP5.*; //GUI
import ddf.minim.*;
import ddf.minim.ugens.*;

// LIBRARY OBJECTS
ControlP5 CP5;
Minim MN;
AudioOutput audioOutput;
Sampler sample;

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

Sampler soundEfMenuClick;

// Configuration ________________
void setup(){
    size(screenX, screenY);

    CP5 = new ControlP5(this);

    //audio set up
    MN = new Minim(this);
    audioOutput = MN.getLineOut();

    //gameState = IN_MENU;
    gameState = IN_GAMEMODE_1;

    //gameScreen = WELCOME_SCR;
    gameScreen = GAMEMODE_1_PLAYING;

    gameMenu = new Menu();
    gameModeOne = new GameModeOne();

    soundEfMenuClick = new Sampler( "audio/menu_click.wav", 12, MN);
    soundEfMenuClick.patch(audioOutput);

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

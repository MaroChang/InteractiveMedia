/*
    HO HAI DANG HOANG
    13383512
    Tutorial 2 Interactive Media - Nat Sundara
    Project description: Our projet idea is to design an interactive game that educates the general public and bring awareness to Global Warming. We would like to incorporate fun gameplay, colours and promote good habits that allow the player to learn processes that may help.
    The game allows the player to navigate through obstacles and collect items that will minimise the desctructions of man-kind. As the character, you must collect your child for points whilst avoiding incoming human waste or other dangers such 
    as other animals whom have taken a more aggressive approach.
    
    My task is mainly about game mode one movement and create code base structure.

    Task lists:
        1. Code base structure
            - Define application work flow, objects and general logic for each screen 
            - Switch screen logic (between each menu and game mode)
            - Define file structures

        2. Game mode one
            - Draw the map outline
            - Create obstacle and it's movement
            - Create character and it's movement
            - Create collectable item and it's movement
            - Checking collision between obstacle and character
            - Add simple audio for collision
            - Load simple image for each object
            - Simple score counting system

*/


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

    // looks for all game constants and codes in "constant.pde"
    gameState = IN_MENU;
    //gameState = IN_GAMEMODE_1;

    gameScreen = WELCOME_SCR;
    //gameScreen = GAMEMODE_1_PLAYING;

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

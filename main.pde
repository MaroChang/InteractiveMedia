// IMPORT LIBRARIES
import controlP5.*; //GUI
import ddf.minim.*;
import ddf.minim.ugens.*;

// IMPORT Kinect4WinSDK libraries
import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

// LIBRARY OBJECTS
ControlP5 CP5;
Minim MN;

// Kinect Library objects
Kinect kinect;
ArrayList <SkeletonData> bodies;


// global variables ________________
AudioOutput audioOutput;

// 16:9 ratio
static int screenX = 1366;
static int screenY = 768;
float halfX = screenX / 2;
float halfY = screenY / 2;

// identify the current stage of the application
int gameState;
// identify the current screen of a state
int gameScreen;
// current score of player
int gameScore = 0;
int scoreBoots = 1;

// game setting
boolean gameInKinect = true;
boolean gameInKeyboard = false;
float gameVolume = 50;
int gameEnvMode = 1;

// character move speed
float moveValue = 5;

// Game Object
Menu gameMenu;
GameModeOne gameModeOne;
GameModeTwo gameModeTwo;

// Configuration ________________
void setup(){

    size(1366, 768);
    background(255);
    CP5 = new ControlP5(this);
    
    gameState = IN_MENU;
    //gameState = IN_GAMEMODE_1;

    //audio set up
    MN = new Minim(this);
    audioOutput = MN.getLineOut();

    gameScreen = WELCOME_SCR;
    //gameScreen = GAMEMODE_1_PLAYING;
    
    loadGameResource();
    rectMode(CENTER);

    smooth();

    //Initialize Kinect variables
    kinect = new Kinect(this);
    bodies = new ArrayList<SkeletonData>();

    // create game instance
    gameMenu = new Menu();
    gameModeOne = new GameModeOne();
    gameModeTwo = new GameModeTwo();

    fill(UGLY_COLOR);
    rectMode(CENTER);
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
      gameModeTwo.show(kinect, bodies);
    break;
  }
}

// Using Kinect to tracking player's apparent, add new tracking into bodies array
void appearEvent(SkeletonData _s) 
    {
    if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
    {
        return;
    }
    synchronized(bodies) {
        bodies.add(_s);
    }
    }

// Using Kinect to tracking player's apparent. If player move out of the Kinect range, remove that player in bodies array
void disappearEvent(SkeletonData _s) {
    synchronized(bodies) {
        for (int i=bodies.size ()-1; i>=0; i--) 
        {
        if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
        {
            bodies.remove(i);
        }
        }
    }
}

// Using Kinect to tracking player's movement. 
void moveEvent(SkeletonData _b, SkeletonData _a) {
    if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
    {
        return;
    }
    synchronized(bodies) {
        for (int i=bodies.size ()-1; i>=0; i--) 
        {
        if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
        {
            bodies.get(i).copy(_a);
            break;
        }
        }
    }
}

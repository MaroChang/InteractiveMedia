// IMPORT LIBRARIES
import controlP5.*; //GUI

import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

// LIBRARY OBJECTS
ControlP5 CP5;

//Kinect Library objects
Kinect kinect;
ArrayList <SkeletonData> bodies;

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
GameModeTwo gameModeTwo;

// Configuration ________________
void setup(){
  size(1366, 768);
  background(255);
  CP5 = new ControlP5(this);
  
  gameState = IN_MENU;
  //gameState = IN_GAMEMODE_1;

  gameScreen = WELCOME_SCR;
  //gameScreen = GAMEMODE_1_PLAYING;

  gameMenu = new Menu();
  gameModeOne = new GameModeOne();
  gameModeTwo = new GameModeTwo();

  fill(UGLY_COLOR);

  rectMode(CENTER);

  kinect = new Kinect(this);
  smooth();
  bodies = new ArrayList<SkeletonData>();
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

//Kinect
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

    void disappearEvent(SkeletonData _s) 
    {
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

    void moveEvent(SkeletonData _b, SkeletonData _a) 
    {
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

/*
Student Name: Quynh Trang Dang
Student Number: 13666843
UG02 Interactive Media - Nat Sundara

Our project idea is to create an interactive game called “Global Warming: Escape”. Our project idea is to design an interactive game that educates the general public and bring awareness to Global Warming. 
We would like to incorporate fun gameplay, colours and promote good habits that allow the player to learn processes that may help.
The game allows the player to navigate through obstacles and collect items that will minimise the desctructions of man-kind. 
As the character, you must collect your child for points whilst avoiding incoming human waste or other dangers such 
as other animals whom have taken a more aggressive approach.
The game contain two game modes. The first mode is similar to that Crossy Road, where an animal will be crossing the road and avoiding the obstacles coming towards it. 
To controlling the animal, our game using Keyboard or Kinect for input. We use Kinect to tracking player body, then use player movement to interact with the character in the game. 

My task for this project is on "Kinect Interaction". This involves:

- Initialize Kinect. (main.pde)

- Using Kinect to tracking player's movement (GameModeTwo.pde)

- Reflect player's movement in the game by drawing Mask Image / Skeleton (GameModeTwo.pde, AnimalKinect.pde)

- Use the player's movement to click button, control main character (GameModeTwo.pde, AnimalKinect.pde)

I have commented my code using formart //STUDENT_ID Comment  
For example: //13666843 IMPORT KINECT4WinSDK libraries
*/

// IMPORT LIBRARIES
import controlP5.*; //GUI

//13666843 IMPORT Kinect4WinSDK libraries
import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

// LIBRARY OBJECTS
ControlP5 CP5;

//13666843 Kinect Library objects
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

//13666843 Initialize Kinect variables
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

//13666843 Using Kinect to tracking player's apparent, add new tracking into bodies array
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

//13666843 Using Kinect to tracking player's apparent. If player move out of the Kinect range, remove that player in bodies array
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

//13666843 Using Kinect to tracking player's movement. 
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

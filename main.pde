// IMPORT LIBRARIES
import controlP5.*; //GUI
import ddf.minim.*;
import ddf.minim.ugens.*;

//13666843 IMPORT Kinect4WinSDK libraries
import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

// LIBRARY OBJECTS
ControlP5 CP5;
Minim MN;
AudioOutput audioOutput;

AudioPlayer click, gamestart, point, lose, pickUp, tombstone, walk, jump, spawn, water_boss, bird_boss, menuBGM, gameBGM, storm, thunder, rain, fire, birds;
PImage iTree0, iTree1, iTree2, iTree3, iTree4, iTree5;

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


  rectMode(CENTER);

//13666843 Initialize Kinect variables
  kinect = new Kinect(this);
  smooth();
  bodies = new ArrayList<SkeletonData>();

    loadAudio();
    loadTree();

    gameMenu = new Menu();
    gameModeOne = new GameModeOne();
    gameModeTwo = new GameModeTwo();
    
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
      gameModeTwo.show(kinect, bodies);
    break;
  }

 
}

// Load Audio
void loadAudio() {
    // Sound Effects
  
    // Commented Sounds Are For Future Function Implementation
  
    // Menu Sound Effects
    click = MN.loadFile("data/game_effects/interface/click.mp3");
    
    // Game Sound Effects
    gamestart = MN.loadFile("game_effects/interface/gamestart.mp3");
    point = MN.loadFile("game_effects/interface/point.mp3");
    lose = MN.loadFile("game_effects/interface/lose.mp3"); // + Ding Ding Ding in the beginning of the file
    pickUp = MN.loadFile("game_effects/character/pickup.mp3"); 
    
    // Game Character Effects
    tombstone = MN.loadFile("game_effects/character/tombstone.mp3");
    // walk = MN.loadFile("game_effects/character/walk.mp3");
    // jump = MN.loadFile("game_effects/character/jump.mp3");
    
    // Game Obstacle Effects
    // spawn = MN.loadFile("game_effects/monster/spawn.mp3");

    // Game Monster Effects
    // water_boss = MN.loadFile("game_effects/monster/water_boss.mp3");
    // bird_boss = MN.loadFile("game_effects/monster/bird_boss.mp3");
    
    // Background Music + Effects
    menuBGM = MN.loadFile("bgm/menuBGM.mp3");
    gameBGM = MN.loadFile("bgm/gameBGM.mp3");
    // storm = MN.loadFile("game_effects/weather/storm.mp3");
    // thunder = MN.loadFile("game_effects/weather/thunder.mp3");
    // rain = MN.loadFile("game_effects/weather/rain.mp3");
    // fire = MN.loadFile("game_effects/weather/fire.mp3");
}

void loadTree() {
    iTree0 = loadImage("env/tree/tree" + 0 + ".png");
    iTree1 = loadImage("env/tree/tree" + 1 + ".png");
    iTree2 = loadImage("env/tree/tree" + 2 + ".png");
    iTree3 = loadImage("env/tree/tree" + 3 + ".png");
    iTree4 = loadImage("env/tree/tree" + 4 + ".png");
    iTree5 = loadImage("env/tree/tree" + 5 + ".png");


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

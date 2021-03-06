// all audio variable
AudioPlayer click, gamestart, point, lose, pickUp, tombstone, walk, jump, spawn, water_boss, bird_boss, menuBGM, gameBGM, storm, thunder, rain, fire, birds;

// all graphic varible
PImage[] sideObjLImage, sideObjOImage;
PImage[] characterLImage, characterOImage;
PImage[] characterLLImage, characterOLImage;
PImage characterAngleImage;

PImage[][] obsLImage, obsOImage;
PImage[][] itemLImage, itemOImage;
PImage[] itemSpecial;

PImage monsters, players, items;
PImage[] cloud;
PImage castle, reef;

void loadGameResource() {
	loadAllAudio();
    loadAllImage();
}

// Load Audio
void loadAllAudio() {
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

void loadAllImage() {
	loadObjectImage();
	loadBackGroundImage();
}

void loadObjectImage() {
	sideObjLImage = new PImage[6];
	for (int i = 0; i < 6; i++) {
		sideObjLImage[i] = loadImage("env/tree/tree" + i + ".png");		
	}

	sideObjOImage = new PImage[3];
	for (int i = 0; i < 3; i++) {
		sideObjOImage[i] = loadImage("env/rock/coral" + i + ".png");		
	}

	characterLImage = new PImage[4];
	for (int i = 0; i < 4; i++) {
		characterLImage[i] = loadImage("mainChar/g" + i + ".png");		
	}

	characterOImage = new PImage[3];
	for (int i = 0; i < 3; i++) {
		characterOImage[i] = loadImage("mainChar/o" + i + ".png");		
	}

	characterLLImage = new PImage[4];
	for (int i = 0; i < 4; i++) {
		characterLLImage[i] = loadImage("mainChar/g" + i + "d.png");		
	}

	characterOLImage = new PImage[3];
	for (int i = 0; i < 3; i++) {
		characterOLImage[i] = loadImage("mainChar/o" + i + "d.png");		
	}

	characterAngleImage = loadImage("mainChar/angle_mode.png");


	obsLImage = new PImage[3][2];
	for (int i = 0; i < 3; i++) {
		obsLImage[i][0] = loadImage("mainObs/l"+ i +"0.png");
		obsLImage[i][1] = loadImage("mainObs/l"+ i +"1.png");
	}

	obsOImage = new PImage[2][2];
	for (int i = 0; i < 2; i++) {
		obsOImage[i][0] = loadImage("mainObs/o"+ i +"0.png");
		obsOImage[i][1] = loadImage("mainObs/o"+ i +"1.png");
	}

	itemLImage = new PImage[4][3];
	for (int i = 0; i < 4; i++) {
		itemLImage[i][0] = loadImage("mainItem/l"+ i +"0.png");
		itemLImage[i][1] = loadImage("mainItem/l"+ i +"1.png");
		itemLImage[i][2] = loadImage("mainItem/l"+ i +"2.png");
	}

    itemOImage = new PImage[3][3];
    for (int i = 0; i < 3; i++) {
		itemOImage[i][0] = loadImage("mainItem/o"+ i +"0.png");
		itemOImage[i][1] = loadImage("mainItem/o"+ i +"1.png");
		itemOImage[i][2] = loadImage("mainItem/o"+ i +"2.png");
	}

	itemSpecial = new PImage[3];
    for (int i = 0; i < 3; i++) {
		itemSpecial[i] = loadImage("mainItem/s0"+ i +".png");
	}
}

void loadBackGroundImage() {
	cloud = new PImage[3];

	cloud[0] = loadImage("env/cloud.png");
	cloud[1] = loadImage("env/cloud1.png");
	cloud[2] = loadImage("env/cloud2.png");
	castle = loadImage("env/castle.png");

	reef = loadImage("env/reef.png");

	monsters = loadImage("instructions/monsters.png");
	players = loadImage("instructions/players.png");
	items = loadImage("instructions/items.png");
}

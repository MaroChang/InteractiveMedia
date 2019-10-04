class MainMenuScreen extends ScreenWithButton {

  
	// BUTTON INDEX
	int START_GAME = 0;
	int SETTING = 1;
	int QUIT = 2;

  //Table Implementation
  Table table;
  int i=0;

  //backgroung image
  PImage bg;
  PImage bg1;
  PImage bg2;
  PImage bg3;

	MainMenuScreen() {
		this.setupButton();
    
    //audio
    gamesong.play();
    gamesong.loop();

    table = loadTable("Air.csv","header");
    
    bg = loadImage("image_1.jpg");
    bg.resize(1280,720);
    bg1 = loadImage("image_2.jpg");
    bg1.resize(1280,720);
    bg2 = loadImage("image_3.jpg");
    bg2.resize(1280,720);
    bg3 = loadImage("image_5.jpg");
    bg3.resize(1280,720);
	}

	void show() {
    //background(bg);
		//background(WHITE);
   
		fill(252, 68, 68);
    float[] w = new float[1532];
      
      w[i]=table.getFloat(i,"temp");
      //image changing
      if(w[i]>=16 && w[i]<=21)
      {
        background(bg);
      }
      else if(w[i]>=22 && w[i]<=26)
      {
        background(bg1);
      }
      else if(w[i]>=27 && w[i]<=31)
      {
        background(bg2);
      }
      else if(w[i]>=32 && w[i]<=36)
      {
        background(bg3);
      }
      
      i++;
      if(i>1529) i=0;
		
		textAlign(CENTER);
		float titlePos = halfY - 100;
		textSize(70);
		text(GAME_NAME, halfX, titlePos);
		textSize(80);
		text(GAME_SUB_NAME, halfX, titlePos + 70);
	}


	void setupButton() {
		numberOfBtn = 3;

		buttons = new controlP5.Button[numberOfBtn];

		int btnW = 200;
		int btnH = 50;
		int btnX = int(halfX) - int(btnW / 2);
		int btnY = int(halfY) + 50;
		int btnSpace = 70;

		PFont font = createFont("Georgia", 20);

		buttons[START_GAME] = CP5.addButton("startGame")
		.setCaptionLabel(NEW_GAME_STR) 
		.setValue(0)
		.setFont(font)
		.setPosition(btnX, btnY)
		.setSize(btnW, btnH)
		.hide();

		buttons[SETTING] = CP5.addButton("openSetting")
		.setCaptionLabel(SETTING_STR) 
		.setValue(0)
		.setFont(font)
		.setPosition(btnX, btnY + btnSpace)
		.setSize(btnW, btnH)
		.hide();

		buttons[QUIT] = CP5.addButton("quitGame")
		.setCaptionLabel(QUIT_GAME_STR) 
		.setValue(0)
		.setFont(font)
		.setPosition(btnX, btnY + btnSpace * 2)
		.setSize(btnW, btnH)
		.hide();	
	}
}


public void startGame() {
	if (frameCount > 0) {
    click.play();
    click.rewind();
	  changeScreenTo(GAME_SELECT_SCR, MAIN_MENU_SCR);
	}
}

public void openSetting() {
	if (frameCount > 0) {
    click.play();
    click.rewind();
    background(255);
		changeScreenTo(SETTING_SCR, MAIN_MENU_SCR);
	}
}

public void quitGame() {
	if (frameCount > 0) {
    click.play();
    click.rewind();
		exit();
	}
}

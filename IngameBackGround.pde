class IngameBackGround {
    float skyLine;
    float leftSideBot;
	float rightSideBot;

    float midLandLeft;
	float midLandRight;

    float oneY;
	float oneX;

	float deltaX;

	float leftSideTop;
	float rightSideTop;

    PImage cloud;
	PImage cloud1;
	PImage cloud2;

	PImage castle;

    SideObject[] leftSideObject;
	SideObject[] rightSideObject;

	int numberOfSideObject;

    IngameBackGround(float oneX, float oneY, float deltaX){
        this.oneX = oneX;
        this.oneY = oneY;
        this.deltaX = deltaX;
        skyLine = oneY * 4;

        // size of walkside
		leftSideBot =  oneX * 3;
		leftSideTop = oneX * 4.5;

		rightSideBot = screenX - leftSideBot;
		rightSideTop = screenX - leftSideTop;

		deltaX = leftSideTop - leftSideBot;

		midLandLeft = leftSideTop + (halfX - leftSideTop) / 2;
		midLandRight = halfX+ (rightSideTop - halfX) / 2;
        
        cloud = loadImage("env/cloud.png");
		cloud1 = loadImage("env/cloud1.png");
		cloud2 = loadImage("env/cloud2.png");
		castle = loadImage("env/castle.png");

        this.createSideRoad();
    }

    void draw(){
        this.drawSideRoad();
    }

    // create object in left side of the main lane
	void createSideRoad() {
		numberOfSideObject = 14;

		leftSideObject = new SideObject[numberOfSideObject];

		float maxY = oneY * 20;

		leftSideObject[0] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			20
		);

		leftSideObject[1] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			60
		);

		leftSideObject[2] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			100
		);

		leftSideObject[3] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			140
		);
	
		leftSideObject[4] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			180
		);

		leftSideObject[5] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			220
		);

		leftSideObject[6] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX,
			leftSideTop - oneX * 3,
			skyLine,
			maxY,
			260
		);


		leftSideObject[7] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			20
		);

		leftSideObject[8] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			60
		);

		leftSideObject[9] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			100
		);

		leftSideObject[10] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			140
		);
	
		leftSideObject[11] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			180
		);

		leftSideObject[12] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			220
		);

		leftSideObject[13] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			leftSideTop - oneX * 3,
			leftSideTop - oneX * 5,
			skyLine,
			maxY,
			260
		);

		createSideRoad2();
	}

	// create object in right side of the main lane
	void createSideRoad2() {

		rightSideObject = new SideObject[numberOfSideObject];

		float maxY = oneY * 20;

		rightSideObject[0] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			20
		);

		rightSideObject[1] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			60
		);

		rightSideObject[2] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			100
		);

		rightSideObject[3] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			140
		);
	
		rightSideObject[4] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			180
		);

		rightSideObject[5] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			220
		);

		rightSideObject[6] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX,
			rightSideTop + oneX * 3,
			skyLine,
			maxY,
			260
		);

		rightSideObject[7] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			20
		);

		rightSideObject[8] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			60
		);

		rightSideObject[9] = new SideObject(
			leftSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			100
		);

		rightSideObject[10] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			140
		);
	
		rightSideObject[11] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			180
		);

		rightSideObject[12] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			220
		);

		rightSideObject[13] = new SideObject(
			rightSideTop - oneX, 
			skyLine,
			oneX,
			oneY * 2,
			rightSideTop + oneX * 3,
			rightSideTop + oneX * 5,
			skyLine,
			maxY,
			260
		);
	}

	void drawSideRoad() {
		for (int i = 0; i < numberOfSideObject; i++) {
			leftSideObject[i].draw();
			leftSideObject[i].update();

			rightSideObject[i].draw();
			rightSideObject[i].update();
		}
	}

	void drawMap() {
		drawBackground();

		image(cloud, oneX, oneY, 228, 124);
		image(cloud1, oneX*10, oneY, 228, 124);
		image(cloud2, oneX*5, oneY, 228, 124);
		image(castle, oneX*14, oneY * 0.2, 204, 182);

		fill(BLUE);
		textSize(30);
		textAlign(CENTER);
		text("SCORE: " + gameScore, halfX, oneY * 2);

		line(0, skyLine, screenX, skyLine);
		line(leftSideBot, screenY, leftSideTop, skyLine);
		line(rightSideBot, screenY, rightSideTop, skyLine);

		//stroke(RED);

		//line(midLandLeft, skyLine, leftSideBot + (halfX - leftSideBot) / 2, screenY);
		//line(midLandRight, skyLine, halfX + (rightSideBot - halfX) / 2, screenY);

		//ellipse(leftSideBot, screenY, 5, 5);
		//ellipse(rightSideBot, screenY, 5, 5);
		stroke(0);

		line(halfX, skyLine, halfX, screenY);
	}

	void drawBackground() {
		background(ROAD_COLOR);
		fill(BLUE_SKY);
		rect(halfX, skyLine / 2, screenX, skyLine);

		fill(GROUND_COLOR);
		beginShape();
			vertex(0, skyLine);
			vertex(leftSideTop, skyLine);
			vertex(leftSideBot, screenY);
			vertex(0, screenY);
		endShape();

		beginShape();
			vertex(rightSideTop, skyLine);
			vertex(screenX, skyLine);
			vertex(screenX, screenY);
			vertex(rightSideBot, screenY);
		endShape();
	};

    void onGameOver(){
        for (int i = 0; i < numberOfSideObject; i++) {
			leftSideObject[i].draw();
			rightSideObject[i].draw();
		}
    }
}
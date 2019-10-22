class InGameSideRoad {
	GameDrawingMeasurement gdm;

	SideObject[] leftSideObject;
	SideObject[] rightSideObject;

	int numberOfSideObject;

	InGameSideRoad(GameDrawingMeasurement _gdm) {
		gdm = _gdm;

		this.createSideRoadLeft();
		this.createSideRoadRight();
	}

	// create object in left side of the main lane
	void createSideRoadLeft() {
		numberOfSideObject = 14;

		leftSideObject = new SideObject[numberOfSideObject];

		float skyLine = gdm.skyLine;
		float oneY = gdm.oneY;
		float oneX = gdm.oneX;

		float maxY = oneY * 20;
		float oneYx2 = oneY * 2;
		float leftSideTop_oneX = gdm.leftSideTop - oneX;
		float xPosition1 = gdm.leftSideTop - oneX * 3;
		float[] yPositions = { 20, 60, 100, 140, 180, 220, 260};

		for (int i = 0; i < 7; i++) {
			leftSideObject[i] = new SideObject(
				leftSideTop_oneX, 
				skyLine,
				oneX,
				oneYx2,
				leftSideTop_oneX,
				xPosition1,
				skyLine,
				maxY,
				yPositions[i]
			);
		}

		float xPosition2 = gdm.leftSideTop - oneX * 5;
		
		for (int i = 7; i < 14; i++) {
			leftSideObject[i] = new SideObject(
				leftSideTop_oneX, 
				skyLine,
				oneX,
				oneYx2,
				xPosition1,
				xPosition2,
				skyLine,
				maxY,
				yPositions[i%7]
			);
		}
	}

	// create object in right side of the main lane
	void createSideRoadRight() {

		rightSideObject = new SideObject[numberOfSideObject];

		float skyLine = gdm.skyLine;
		float oneY = gdm.oneY;
		float oneX = gdm.oneX;

		float maxY = oneY * 20;
		float oneYx2 = oneY * 2;
		float rightSideTop_oneX = gdm.rightSideTop + oneX;
		float xPosition1 = gdm.rightSideTop + oneX * 3;
		float[] yPositions = { 20, 60, 100, 140, 180, 220, 260};

		for (int i = 0; i < 7; i++) {
			rightSideObject[i] = new SideObject(
				rightSideTop_oneX, 
				skyLine,
				oneX,
				oneYx2,
				rightSideTop_oneX,
				xPosition1,
				skyLine,
				maxY,
				yPositions[i]
			);
		}

		float xPosition2 = gdm.rightSideTop + oneX * 5;
		
		for (int i = 7; i < 14; i++) {
			rightSideObject[i] = new SideObject(
				rightSideTop_oneX, 
				skyLine,
				oneX,
				oneYx2,
				xPosition1,
				xPosition2,
				skyLine,
				maxY,
				yPositions[i%7]
			);
		}
	}

	void draw() {
		for (int i = 0; i < numberOfSideObject; i++) {
			leftSideObject[i].draw();
			leftSideObject[i].update();

			rightSideObject[i].draw();
			rightSideObject[i].update();
		}
	}

	void drawOnly() {
		for (int i = 0; i < numberOfSideObject; i++) {
			leftSideObject[i].draw();
			rightSideObject[i].draw();
		}
	}

	void updateEnvMode(int mode) {
		for (int i = 0; i < numberOfSideObject; i++) {
			leftSideObject[i].updateEnvMode(mode);
			rightSideObject[i].updateEnvMode(mode);
		}
	}
}
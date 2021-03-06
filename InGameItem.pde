class InGameItem {
	GameDrawingMeasurement gdm;

	Item[] items;

	int numberOfItem = 4;

	InGameItem(GameDrawingMeasurement _gdm) {
		gdm = _gdm;

		this.create();
	}

	void create() {
		items = new Item[numberOfItem];

		float skyLine = gdm.skyLine;
		float oneX = gdm.oneX;
		float oneY = gdm.oneY;
		float deltaX = gdm.deltaX;
		float midLandLeft = gdm.midLandLeft;
		float midLandRight = gdm.midLandRight;
		float leftSideBot = gdm.leftSideBot;
		float rightSideBot = gdm.rightSideBot;

		int[] initalSpeed = {5, 5};

		float oneX15 = oneX * 1.5;
		float oneY05 = oneY * 0.5;
		float oneY15 = oneY * 1.5;

		for (int i = 0; i < numberOfItem - 2; i++) {
			items[i] = new Item(
				0,
				midLandRight, 
				skyLine, 
				skyLine,
				oneX, 
				oneY05, 
				oneY,
				5, 
				deltaX,
				midLandLeft,
				midLandRight,
				leftSideBot,
				rightSideBot
			);
		}

		items[numberOfItem - 2] = new Item(
			1,
			midLandRight, 
			skyLine, 
			skyLine,
			oneX, 
			oneY05, 
			oneY,
			5, 
			deltaX,
			midLandLeft,
			midLandRight,
			leftSideBot,
			rightSideBot
		);

		items[numberOfItem - 1] = new Item(
			1,
			midLandRight, 
			skyLine, 
			skyLine,
			oneX, 
			oneY05, 
			oneY,
			5, 
			deltaX,
			midLandLeft,
			midLandRight,
			leftSideBot,
			rightSideBot
		);

		items[numberOfItem - 1].deactivate();
		items[numberOfItem - 1].setSpecial(true);	

		for (int i = 0; i < numberOfItem; i++) {
			items[i].forcedUpdate();
		}
	}

	void updateDrawCheck(float topLeftX, float topLeftY, float bottomRightX, float bottomRightY) {

		for (int i = 0; i < numberOfItem; i++) {
			if (items[i].active) {
				items[i].draw();
				items[i].update();

				if (box_box(
					topLeftX,
					topLeftY,
					bottomRightX,
					bottomRightY,
					items[i].topLeftX, 
					items[i].topLeftY, 
					items[i].bottomRightX, 
					items[i].bottomRightY)) {

					items[i].isCollected();
				}
			}
		}
	}

	void drawOnly() {
		for (int i = 0; i < numberOfItem; i++) {
			if(items[i].active) {
				items[i].draw();
			}
		}
	}

	void updateEnvMode(int mode) {
		for (int i = 0; i < numberOfItem; i++) {
			items[i].updateEnvMode(mode);
		}
	}

	void showThePotion() {

		int potionIndex = numberOfItem  - 1;

		items[potionIndex].forcedUpdate();
		items[potionIndex].activate();	
	}
}
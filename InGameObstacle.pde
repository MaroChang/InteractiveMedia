class InGameObstacle {
	GameDrawingMeasurement gdm;

	Obstacle[] obstacbles;

	int numberOfObs = 9;

	InGameObstacle(GameDrawingMeasurement _gdm) {
		gdm = _gdm;

		this.create();
	}

	void create() {

		if (false) {
			obstacbles = new Obstacle[1];

			obstacbles[0] = new Obstacle(
				true,
				gdm.midLandRight, 
				gdm.skyLine, 
				gdm.skyLine,
				gdm.oneX * 1.5, 
				gdm.oneY * 0.5, 
				gdm.oneY * 1.5,
				1, 
				gdm.deltaX,
				gdm.midLandLeft,
				gdm.midLandRight,
				gdm.leftSideBot,
				gdm.rightSideBot
			);
		} else {

			obstacbles = new Obstacle[numberOfObs];

			float skyLine = gdm.skyLine;
			float oneX = gdm.oneX;
			float oneY = gdm.oneY;
			float deltaX = gdm.deltaX;
			float midLandLeft = gdm.midLandLeft;
			float midLandRight = gdm.midLandRight;
			float leftSideBot = gdm.leftSideBot;
			float rightSideBot = gdm.rightSideBot;

			//int[] initalSpeed = {9, 5, 8, 5, 4, 7};
			//int[] initalSpeed = {15, 14, 13, 12, 11, 10};
			float[] initalSpeed = {3.5, 4, 3, 2, 1.5, 1, 4.5, 4.3, 2.2};

			float oneX15 = oneX * 1.5;
			float oneY05 = oneY * 0.5;
			float oneY15 = oneY * 1.5;

			for (int i = 0; i < numberOfObs; i++) {
				obstacbles[i] = new Obstacle(
					i < 4,
					midLandRight, 
					skyLine, 
					skyLine,
					oneX15, 
					oneY05, 
					oneY15,
					initalSpeed[i], 
					deltaX,
					midLandLeft,
					midLandRight,
					leftSideBot,
					rightSideBot
				);

				obstacbles[i].forcedUpdate();
			}
		}
	}

	boolean updateDrawCheck(float topLeftX, float topLeftY, float bottomRightX, float bottomRightY) {

		for (int i = 0; i < numberOfObs; i++) {
			if (obstacbles[i].active) {
				obstacbles[i].draw();
				obstacbles[i].update();

				if (box_box(
					topLeftX,
					topLeftY,
					bottomRightX,
					bottomRightY, 
					obstacbles[i].topLeftX, 
					obstacbles[i].topLeftY, 
					obstacbles[i].bottomRightX, 
					obstacbles[i].bottomRightY)) {

					gameScreen = GAMEMODE_1_OVER;
					// this.onGameOver();
					return false;
				}
			}
		}

		return true;
	}

	void drawOnly() {
		for (int i = 0; i < numberOfObs; i++) {
			obstacbles[i].draw();
		}
	}

	void updateEnvMode(int mode) {
		for (int i = 0; i < numberOfObs; i++) {
			obstacbles[i].updateEnvMode(mode);
		}
	}

	void speedUp() {
		for (int i = 0; i < numberOfObs; i++) {
			obstacbles[i].speedUp();
		}
	}

	void welcomeToHell() {
		for (int i = 0; i < numberOfObs; i++) {
			if (!obstacbles[i].active) {
				obstacbles[i].active = true;
				break;
			}
		}
	}
}
class InGameBackground {

	GameDrawingMeasurement gdm;

	float[] cloudX;
	float castleX;

	InGameBackground(GameDrawingMeasurement _gdm) {
		gdm = _gdm;

		cloudX = new float[3];
		cloudX[0] = gdm.oneX;
		cloudX[1] = gdm.oneX * 10;
		cloudX[2] = gdm.oneX * 5;

		castleX = gdm.oneX * 14;
	}

	void draw() {

		float oneY = gdm.oneY;
		float skyLine = gdm.skyLine;

		// draw color
		drawBackground(skyLine);

		// draw detail
		if (gameEnvMode == 0) {
			image(cloud[0], cloudX[0], oneY, 228, 124);
			image(cloud[1], cloudX[1], oneY, 228, 124);
			image(cloud[2], cloudX[2], oneY, 228, 124);
			image(castle, castleX, oneY * 0.2, 204, 182);
		} else {
			image(reef, castleX, oneY * 0.2, 204, 182);
			image(reef, cloudX[0], oneY, 228, 124);
		}

		//line(0, skyLine, screenX, skyLine);
		//line(gdm.leftSideBot, screenY, gdm.leftSideTop, skyLine);
		//line(gdm.rightSideBot, screenY, gdm.rightSideTop, skyLine);

		//stroke(0);

		//line(halfX, skyLine, halfX, screenY);
	}

	void drawBackground(float skyLine) {
		noStroke();
		if (gameEnvMode == 0) {
			background(ROAD_COLOR);
			fill(BLUE_SKY);
			rect(halfX, skyLine / 2, screenX, skyLine);

			fill(GROUND_COLOR);
			beginShape();
				vertex(0, skyLine);
				vertex(gdm.leftSideTop, skyLine);
				vertex(gdm.leftSideBot, screenY);
				vertex(0, screenY);
			endShape();

			beginShape();
				vertex(gdm.rightSideTop, skyLine);
				vertex(screenX, skyLine);
				vertex(screenX, screenY);
				vertex(gdm.rightSideBot, screenY);
			endShape();
		} else {
			background(DARK_BLUE_2);
			fill(DARK_BLUE);
			rect(halfX, skyLine / 2, screenX, skyLine);

			fill(DARK_BLUE_3);
			beginShape();
				vertex(0, skyLine);
				vertex(gdm.leftSideTop, skyLine);
				vertex(gdm.leftSideBot, screenY);
				vertex(0, screenY);
			endShape();

			beginShape();
				vertex(gdm.rightSideTop, skyLine);
				vertex(screenX, skyLine);
				vertex(screenX, screenY);
				vertex(gdm.rightSideBot, screenY);
			endShape();
		}
	};
}
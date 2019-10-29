class InGameCharacter {
	GameDrawingMeasurement gdm;

	Animal character;

	boolean visual = true;

	int endInvisibleTime;

	InGameCharacter(GameDrawingMeasurement _gdm) {
		gdm = _gdm;

		this.create();
	}

	void create() {

		// size of main character
		float size = gdm.oneX * 1;

		character = new Animal(
			halfX, // x 
			screenY - size/2 - 5, // y
			size, // w
			size  // h
		);
		
		character.setLimit(gdm.leftSideBot, gdm.rightSideBot);
	}

	void updateAndDraw(int xPosition) {
		character.update(xPosition); 
		if (visual) {
			character.draw();
		} else {
			if (millis() > endInvisibleTime) {
				visual = true;
				scoreBoots = 1;
				character.draw();
			}
		}
	}

	void updateEnvMode(int mode) {
		character.updateEnvMode(mode);
	}

	void updateImageRandomly() {
		character.randomUpdateImage();
	}

	void setVisual(boolean _visual) {
		visual = _visual;


		if (visual == false) {
			endInvisibleTime = millis() + 10000;
		}
	}
}
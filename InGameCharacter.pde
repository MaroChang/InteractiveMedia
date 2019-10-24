class InGameCharacter {
	GameDrawingMeasurement gdm;

	Animal character;

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

	void updateAndDraw() {
		character.update(mouseX); 
		character.draw();
	}

	void updateEnvMode(int mode) {
		character.updateEnvMode(mode);
	}

	void updateImageRandomly() {
		character.randomUpdateImage();
	}
}
class InGameObject {

	GameDrawingMeasurement gdm;

	InGameCharacter character;
	InGameSideRoad sideRoad;
	InGameObstacle obstacles;
	InGameItem items;

	InGameObject(GameDrawingMeasurement _gdm) {
		gdm = _gdm;

		character = new InGameCharacter(gdm);
		sideRoad = new InGameSideRoad(gdm);
		obstacles = new InGameObstacle(gdm);
		items = new InGameItem(gdm);
	}

	boolean drawAllAndCheck(int xPosition) {
		boolean allGood;
		sideRoad.draw();

		character.updateAndDraw(xPosition);

		allGood = this.drawObstacleAndCheckCollision();
		this.drawItemAndCheckCollision();

		return allGood;
	}

	boolean drawObstacleAndCheckCollision() {
		return obstacles.updateDrawCheck(
			character.character.topLeftX,
			character.character.topLeftY,
			character.character.bottomRightX,
			character.character.bottomRightY
		);
	}

	void drawItemAndCheckCollision() {
		items.updateDrawCheck(
			character.character.topLeftX,
			character.character.topLeftY,
			character.character.bottomRightX,
			character.character.bottomRightY
		);
	}

	void drawOnly() {
		character.character.drawDeath();
		sideRoad.drawOnly();
		obstacles.drawOnly();
		items.drawOnly();
	}

	void updateGameEnvMode(int mode) {
		character.updateEnvMode(mode);
		sideRoad.updateEnvMode(mode);
		items.updateEnvMode(mode);
		obstacles.updateEnvMode(mode);
	} 
}
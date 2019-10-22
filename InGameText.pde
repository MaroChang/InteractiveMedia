class InGameText {

	GameDrawingMeasurement gdm;

	float[] cloudX;
	float castleX;

	float scoreYPos;

	LimitedText[] plusScoreText;
	int numberOfPlusScore = 4;

	color TEXT_COLOR;

	InGameText(GameDrawingMeasurement _gdm) {
		gdm = _gdm;

		scoreYPos = gdm.oneY * 2;

		this.createPlusScoreText();
	}

	void draw() {
		this.displayScore();

		for (int i = 0; i < numberOfPlusScore; i++) {
			if (plusScoreText[i].active) {
				plusScoreText[i].draw();
			}
		}
	}

	void displayScore() {
		fill(TEXT_COLOR);
        textSize(30);
        textAlign(CENTER);
        text("SCORE: " + gameScore, halfX, scoreYPos);
	}

	void createPlusScoreText() {
		plusScoreText = new LimitedText[numberOfPlusScore];

		for (int i = 0; i < numberOfPlusScore; i++) {
			plusScoreText[i] = new LimitedText(false);
		}
	}

	void addNewPlusScore(String content, float x, float y) {
		for (int i = 0; i < numberOfPlusScore - 1; i++) {
			if (!plusScoreText[i].active && !plusScoreText[i+1].active) {
				plusScoreText[i+1].setAndActive(content, x, y);
			}
		}
	}

	void setTextColor() {
		if (gameEnvMode == 0) {
			TEXT_COLOR = BLUE;
		} else {
			TEXT_COLOR = WHITE;
		}
	}
}


class LimitedText {
	boolean active;
	String content;
	float x;
	float y;

	int internalCounter = 0;

	LimitedText(boolean _active) {
		active = _active;
	}

	void draw() {
		if (active) {
			internalCounter++;

			text(content, x, y);

			if (internalCounter > 20) {
				active = false;
				internalCounter = 0;
			}
		}
	}

	void setAndActive(String _content, float _x, float _y) {
		content = _content;
		x = _x;
		y = _y;
		active = true;
	}
}
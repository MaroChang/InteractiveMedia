class Animal {
	float x;
	float y;

	float w;
	float h;
	float halfW;
	float halfH;

	float leftLm;
	float rightLm;

	float topLeftX;
	float topLeftY;
	float bottomRightX;
	float bottomRightY;

	PImage imageM;

	Animal(float _x, float _y, float _w, float _h, String _imgName) {
		x = _x;
		y = _y;
		w = _w;
		h = _h;

		halfW = w / 2;
		halfH = h / 2;

		bottomRightX = x + halfW;
		bottomRightY = y + halfH;
		topLeftX = x - halfW;
		topLeftY = y - halfH;

		imageM = loadImage("char/" + _imgName + ".png");
		imageM.resize(int(w), int(h));
	}
  
  // Draw the hitbox and the image of the player character
	void draw() {
		// fill(RED);
		// rect(x, y, w, h);
		image(imageM, x - halfW, y - halfH, w, h);
		// beginShape();
		// texture(imageM);
		// vertex(x - halfW, y - halfH);
		// vertex(x + halfW, y - halfH);
		// vertex(x + halfW, y + halfH);
		// vertex(x - halfW, y + halfH);
		// endShape(CLOSE);

		// 	fill(RED);
		// 	ellipse(x, y, 5, 5);
		// 	ellipse(topLeftX, topLeftY, 5, 5);
		// 	ellipse(bottomRightX, bottomRightY, 5, 5);
		// 	fill(0);
	}

	void drawDeath() {
		pushMatrix();
		rotate(radians(90));
		image(imageM, x - halfW, y - halfH, w, h);
		popMatrix();
	}
  
  // Set the limit of the character's movement relative to left and right
	void setLimit(float leftLimit, float rightLimit) {
		leftLm = leftLimit + w/2;
		rightLm = rightLimit - w/2;
	}

	void update(float newX) {
		float nx = x + newX;
		if (nx >= leftLm && nx <= rightLm) {
			x = nx;
		}

		bottomRightX = x + halfW;
		//bottomRightY = y + halfH;
		topLeftX = x - halfW;
		//topLeftY = y - halfH;
	}

	void update(float newX, float newY) {
		x += newX;
		y += newY;
	}

	void update(boolean useMouse) {
		float nx = mouseX;
		if (nx >= leftLm && nx <= rightLm) {
			x = nx;
		}

		bottomRightX = x + halfW;
		//bottomRightY = y + halfH;
		topLeftX = x - halfW;
		//topLeftY = y - halfH;
	}

}

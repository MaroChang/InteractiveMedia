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

	int envMode = 0;
	int imageIndex = 0;

	Animal(float _x, float _y, float _w, float _h) {
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

		
		this.randomUpdateImage();
	}

	void draw() {
		
		image(imageM, x - halfW, y - halfH, w, h);

		// fill(RED);
		// rect(x, y, w, h);
		// 	fill(RED);
		// 	ellipse(x, y, 5, 5);
		// 	ellipse(topLeftX, topLeftY, 5, 5);
		// 	ellipse(bottomRightX, bottomRightY, 5, 5);
		// 	fill(0);
	}

	void drawDeath() {
		// todo animation when dying
	}

	void setLimit(float leftLimit, float rightLimit) {
		leftLm = leftLimit + w/2;
		rightLm = rightLimit - w/2;
	}

	void update(boolean useMouse) {
		float nx = mouseX;

		// keep the animal inside the road
		if (nx >= leftLm && nx <= rightLm) {
			x = nx;
		}

		bottomRightX = x + halfW;
		//bottomRightY = y + halfH;
		topLeftX = x - halfW;
		//topLeftY = y - halfH;
	}

	void updateEnvMode(int mode) {
		this.envMode = mode;

		this.randomUpdateImage();
	}

	void randomUpdateImage() {

		// land
		if (this.envMode == 0) {
			imageIndex = int(random(4));
			imageM = characterLImage[imageIndex];
		}
		// ocean 
		else {
			imageIndex = int(random(3));
			imageM = characterOImage[imageIndex];
		}

		imageM.resize(int(w), int(h));
	}

}
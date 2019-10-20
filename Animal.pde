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

		//imageM = loadImage("char/" + _imgName + ".png");
		imageM = charGImage0;
		imageM.resize(int(w), int(h));
	}

	void setImage(String _imgName) {
		imageM = loadImage("char/" + _imgName + ".png");
		imageM.resize(int(w), int(h));
	}

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

		this.randomUpdateAnimal();
	}

	void randomUpdateAnimal() {
		int i;

		// ground
		if (this.envMode == 0) {
			i = int(random(4));
			switch (i) {
				case 0: imageM = charGImage0; break;
				case 1: imageM = charGImage1; break;
				case 2: imageM = charGImage2; break;
				case 3: imageM = charGImage3; break;
			}
		}
		// ocean 
		else {
			i = int(random(3));
			switch (i) {
				case 0: imageM = charOImage0; break;
				case 1: imageM = charOImage1; break;
				case 2: imageM = charOImage2; break;
			}
		}

		imageM.resize(int(w), int(h));
	}

}
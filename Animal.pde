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
	PImage imageL;

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
	}

	void drawDeath() {
		image(imageL, x - halfW, y - halfH, w, h);
	}

	void setLimit(float leftLimit, float rightLimit) {
		leftLm = leftLimit + w/2;
		rightLm = rightLimit - w/2;
	}

	void update(float nx) {  //get main character's position on x axis

        //the position will not change if character reach the left-right limit
        // keep the animal inside the road
        if (nx >= leftLm && nx <= rightLm) {
            x = nx;
        }

        bottomRightX = x + halfW;
        topLeftX = x - halfW;
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
			imageL = characterLLImage[imageIndex];
		}
		// ocean 
		else {
			imageIndex = int(random(3));
			imageM = characterOImage[imageIndex];
			imageL = characterOLImage[imageIndex];
		}

		imageM.resize(int(w), int(h));
	}

}
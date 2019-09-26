class SideObject {

	float orgX;
	float orgY;

	float x;
	float y;

	float w;
	float h;
	float halfW;
	float halfH;

	float beginY;
	float endY;

	float beginX;
	float endX;

	float curP;
	float maxP;

	float deltaX;
	boolean needChangeX = true;

	float maxHeight;
	float minHeight;
	float maxWidth;
	float minWidth;

	float speed;

	float topLeftX;
	float topLeftY;
	float bottomRightX;
	float bottomRightY;

	float midLandLeft;
	float midLandRight;

	float leftSideBot;
	float rightSideBot;

	PImage imageM;

	SideObject(float _x, float _y, float _w, float _h, float _beginX, float _endX, float _beginY, float _endY, float _initalP) {
		
		// beginY = _y - minHeight;
		// endY = screenY;

		// minHeight = _minHeight;
		// maxHeight = _maxHeight;

		// maxWidth = _w;
		// minWidth = minHeight / maxHeight * maxWidth;

		// // get height from current y
		// h = map(_initalY, beginY, endY, minHeight, maxHeight);
		// w = map(_initalY, beginY, endY, minWidth, maxWidth);
		curP = _initalP;

		h = _h;
		w = _w;

		beginX = _beginX;
		beginY = _beginY;

		endX = _endX;
		endY = _endY;

		maxP = 300;

		x = map(curP, 0, maxP, beginX, endX);
		y = map(curP, 0, maxP, beginY, endY);

		// deltaX = _deltaX;

		// midLandLeft = _midLandLeft; // + halfW;
		// midLandRight = _midLandRight; // - halfW;

		// this.shouldXChangeWhenMoving();

		// halfW = w/2;
		// halfH = h/2;

		// speed = _speed;

		// bottomRightX = x + halfW;
		// bottomRightY = y + halfH;
		// topLeftX = x - halfW;
		// topLeftY = y - halfH;

		// rightSideBot = _rightSideBot - maxWidth;
		// leftSideBot = _leftSideBot + maxWidth;
		imageM = loadImage("env/tree/" + "tree0" + ".png");

	}

	void setCharacterImage(String _imgName) {
		imageM = loadImage("env/tree/" + _imgName + ".png");
		//imageM.resize(int(w), int(h));
	}

	void shouldXChangeWhenMoving() {
		orgX = x;
		orgY = y;

		needChangeX = true;
		beginX = x;
		endX = beginX - deltaX;
		halfW = maxWidth/2;

		if (x + halfW > midLandRight) {
			endX = beginX + deltaX;
		} else if (x - halfW >= midLandLeft && x + halfW <= midLandRight) {
			endX = beginX;
			needChangeX = false;
		}
	}

	void update() {
		curP += 1;

		if (curP > maxP) {
			curP = 0;

			int i = int(random(5));

			if (gameScore % 200 == 0) {
				i = int(random(3));
				imageM = loadImage("hero/" + i + ".png");
			} else {
				imageM = loadImage("env/tree/tree" + i + ".png");
			}
		}

		x = map(curP, 0, maxP, beginX, endX);
		y = map(curP, 0, maxP, beginY, endY);
		

	}

	void draw() {
		//fill(BLUE);
		//rect(x, y, w, h);

		//imageM.resize(int(w), int(h));
		image(imageM, x - (w/2), y - (h/2), w, h);
		
		// #DEBUG
		// fill(RED);
		// ellipse(x, y, 5, 5);
		// ellipse(topLeftX, topLeftY, 5, 5);
		// ellipse(bottomRightX, bottomRightY, 5, 5);
		// fill(0);
	}

}
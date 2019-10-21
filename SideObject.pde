
// object on side of running lane
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
	int envMode = 0;

	SideObject(float _x, float _y, float _w, float _h, float _beginX, float _endX, float _beginY, float _endY, float _initalP) {
		
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

		this.updateImage();

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
		}

		x = map(curP, 0, maxP, beginX, endX);
		y = map(curP, 0, maxP, beginY, endY);
	}

	void updateEnvMode(int mode) {
		this.envMode = mode;

		this.updateImage();
	}

	void updateImage() {
		int i;

		// ground
		if (this.envMode == 0) {
			i = int(random(6));
			imageM = sideObjLImage[i];
		}
		// ocean 
		else {
			i = int(random(3));
			imageM = sideObjOImage[i];
		}
	}

	void draw() {

		image(imageM, x - (w/2), y - (h/2), w, h);
		
		// #DEBUG
		//fill(BLUE);
		//rect(x, y, w, h);
		// fill(RED);
		// ellipse(x, y, 5, 5);
		// ellipse(topLeftX, topLeftY, 5, 5);
		// ellipse(bottomRightX, bottomRightY, 5, 5);
		// fill(0);
	}

}
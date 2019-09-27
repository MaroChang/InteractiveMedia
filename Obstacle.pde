// Obstacle class controll an obstacle movement and display
class Obstacle {

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

	Obstacle(float _x, float _y, float _initalY ,float _w, float _minHeight, float _maxHeight, float _speed, float _deltaX, float _midLandLeft, float _midLandRight, float _leftSideBot, float _rightSideBot) {
		
		beginY = _y - minHeight;
		endY = screenY;

		minHeight = _minHeight;
		maxHeight = _maxHeight;

		maxWidth = _w;
		minWidth = minHeight / maxHeight * maxWidth;

		// get height from current y
		h = map(_initalY, beginY, endY, minHeight, maxHeight);
		w = map(_initalY, beginY, endY, minWidth, maxWidth);

		x = _x;
		y = _initalY; //_y - minHeight;

		deltaX = _deltaX;

		midLandLeft = _midLandLeft; // + halfW;
		midLandRight = _midLandRight; // - halfW;

		this.shouldXChangeWhenMoving();

		halfW = w/2;
		halfH = h/2;

		speed = _speed;

		bottomRightX = x + halfW;
		bottomRightY = y + halfH;
		topLeftX = x - halfW;
		topLeftY = y - halfH;

		rightSideBot = _rightSideBot - maxWidth;
		leftSideBot = _leftSideBot + maxWidth;
	}

	void setCharacterImage(String _imgName) {
		imageM = loadImage("char/" + _imgName + ".png");
		// imageM.resize(int(maxWidth), int(maxHeight));
	}

	// determine whenever the obstacble change only y coordinates or both x and y coordiante when moving
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

	// update new position
	void update() {
		y += speed;

		if (topLeftY > endY) {
			x = random(leftSideBot, rightSideBot);
			
			y = beginY - minHeight;
			this.shouldXChangeWhenMoving();

			gameScore++;
		}

		if (needChangeX) {
			x = map(y, beginY, endY, beginX, endX);
		}

		bottomRightX = x + w/2;
		bottomRightY = y + h/2;
		topLeftX = x - w/2;
		topLeftY = y - h/2;
		
		// get height by current y
		h = map(y, beginY, endY, minHeight, maxHeight);
		w = map(y, beginY, endY, minWidth, maxWidth);
	}

	void draw() {
		// fill(BLUE);
		// rect(x, y, w, h);

		//imageM.resize(int(w), int(h));
		image(imageM, x - (w/2), y - (h/2), w, h);


		
		// #DEBUG
		// fill(RED);
		// ellipse(x, y, 5, 5);
		// ellipse(x - (w/2), y - (h/2), 5, 5);
		// ellipse(topLeftX, topLeftY, 5, 5);
		// ellipse(bottomRightX, bottomRightY, 5, 5);
		// fill(0);
	}

}

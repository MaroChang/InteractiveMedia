class Ball {
	int rad = 80;        // Width of the shape
	float xpos, ypos;    // Starting position of shape    

	float xspeed = 2.5;  // Speed of the shape
	float yspeed = 2.9;  // Speed of the shape

	int xdirection = 1;  // Left or Right
	int ydirection = 1;  // Top to Bottom

	Ball(int xd, int yd) {
		xpos = width/2;
	  	ypos = height/2;

	  	xdirection = xd;
	  	ydirection = yd;
	}


	void draw() {
	  
	  // Update the position of the shape
	  xpos = xpos + ( xspeed * xdirection);
	  ypos = ypos + ( yspeed * ydirection);
	  
	  // Test to see if the shape exceeds the boundaries of the screen
	  // If it does, reverse its direction by multiplying by -1
	  if (xpos > width-rad || xpos < rad) {
	    xdirection *= -1;
	  }
	  if (ypos > height-rad || ypos < rad) {
	    ydirection *= -1;
	  }

	  // Draw the shape
	  ellipse(xpos, ypos, rad, rad);
	}

	void resetPos() {
		xpos = width/2;
	  	ypos = height/2;
	}
}
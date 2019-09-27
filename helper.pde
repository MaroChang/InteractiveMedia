// Put common function here

void changeScreenTo(int newScreen, int oldScreen) {
  //soundEfMenuClick.trigger();

	gameScreen = newScreen;

	// Show buttons of new screen
	gameMenu.showButtonOf(newScreen);

	// Hide buttons of previous screen
	gameMenu.hideButtonOf(oldScreen);
}

/**
 * Determine whether two boxes intersect.
 * The boxes are represented by the top-left and bottom-right corner coordinates. 
 * 
 * [ax0, ay0]/[ax1, ay1] top-left and bottom-right corners of rectangle A
 * [bx0, by0]/[bx1, by1] top-left and bottom-right corners of rectangle B
 */
boolean box_box(float ax0, float ay0, float ax1, float ay1, float bx0, float by0, float bx1, float by1) {
  float topA = min(ay0, ay1);
  float botA = max(ay0, ay1);
  float leftA = min(ax0, ax1);
  float rightA = max(ax0, ax1);
  float topB = min(by0, by1);
  float botB = max(by0, by1);
  float leftB = min(bx0, bx1);
  float rightB = max(bx0, bx1);
 
  return !(botA <= topB  || botB <= topA || rightA <= leftB || rightB <= leftA);
}

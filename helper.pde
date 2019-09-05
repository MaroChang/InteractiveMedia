// use a meaningful name for function

void changeScreenTo(int newScreen, int oldScreen) {
	gameScreen = newScreen;

	// show buttons of new screen
	gameMenu.showButtonOf(newScreen);

	// hide buttons of previous screen
	gameMenu.hideButtonOf(oldScreen);
}
// Use a meaningful name for function

void changeScreenTo(int newScreen, int oldScreen) {
	gameScreen = newScreen;

	// Show buttons of new screen
	gameMenu.showButtonOf(newScreen);

	// Hide buttons of previous screen
	gameMenu.hideButtonOf(oldScreen);
}

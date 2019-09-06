class ScreenWithButton {
	int numberOfBtn = 0;
	controlP5.Button[] buttons;

	// Show all button of the screen
	void showButton() {
		for (int i = 0; i < numberOfBtn; i++) {
      buttons[i].show();
    }
	}

	// Hide all button of the screen
	void hideButton() {
		for (int i = 0; i < numberOfBtn; i++) {
      buttons[i].hide();
    }
	}
}

class ScreenWithButton {
	int numberOfBtn = 0;
	controlP5.Button[] buttons;

	// show all button of the screen
	void showButton() {
		for (int i = 0; i < numberOfBtn; i++) {
      buttons[i].show();
    }
	}

	// hide all button of the screen
	void hideButton() {
		for (int i = 0; i < numberOfBtn; i++) {
      buttons[i].hide();
    }
	}
}
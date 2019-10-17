// Handles mousePressed events
public void mousePressed() {
	if (gameState == IN_MENU) {
		switch (gameScreen) {
			case WELCOME_SCR: 
        clickSound();
				changeScreenTo(MAIN_MENU_SCR, WELCOME_SCR);
			break;
		}
	}
}

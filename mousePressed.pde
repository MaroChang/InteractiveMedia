public void mousePressed() {
	if (gameState == IN_MENU) {
		switch (gameScreen) {
			case WELCOME_SCR: 
				changeScreenTo(MAIN_MENU_SCR, WELCOME_SCR);
			break;
		}
	}
}

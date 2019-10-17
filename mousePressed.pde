// only handle mousePressed event

public void mousePressed() {
	if (gameState == IN_MENU) {
		switch (gameScreen) {
			case WELCOME_SCR: 
				click.play();
        		click.rewind();
        		
				changeScreenTo(MAIN_MENU_SCR, WELCOME_SCR);
			break;
		}
	}
}
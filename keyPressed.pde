// Handles keyPressed events
public void keyPressed() {

 	// println("key: "+key);

	if (key == CODED) {
		println("keyCode: "+keyCode);
    if (keyCode == RIGHT) {
      	gameModeOne.character.update(moveValue);
    } else if (keyCode == LEFT) {
    	gameModeOne.character.update(-moveValue);
    }	
	}
  
  // Disables ESC key to exit function
  if (keyCode == 27) {
    // leave game
    // transition to menu
    key = 0;
    quitGame();
  }
  else
    println (key);
}

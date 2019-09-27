/* 
  Individual Work Within This Page
  Tasks:
    -Implementing Click Effect On Buttons In The Menu Screens, Mouse Whens Been Clicked
    -Implementing Background Music For Welcome, Menu Screens And Within Gameplay
    -Adjust Sound Volumes And Pauses While Transitioning Between Screens
    -Adjust Sound Volumne On Settings Page*
*/
class WelcomeScreen {

  WelcomeScreen() {
    // Play music for the Main Menus
    menuBGM.play();
    menuBGM.setGain(gameVolume - 60);
    menuBGM.loop();
  }

   // Show function for all screen items
	void show() {
    // background(BEAUTY_COLOR);
    image(bg1, 0, 0, 1366, 768);
    textAlign(CENTER);
    fill(WHITE);

    // Draw text
    textSize(80);
    text(GAME_NAME, halfX, halfY);
    textSize(80);
    text(GAME_SUB_NAME, halfX, halfY + 70);
    textSize(15); 
    text(CLICK_2_START, halfX, height - 30);
  }
  
}

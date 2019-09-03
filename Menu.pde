class Menu {

  MainMenuScreen mainMenuScreen;
  WelcomeScreen welcomeScreen;

  Menu() {
    mainMenuScreen = new MainMenuScreen();
    welcomeScreen = new WelcomeScreen();
  }

  void show() {
    switch (gameScreen) {
      case WELCOME_SCR: 
        welcomeScreen.show();
      break;

      case MAIN_MENU_SCR:
        mainMenuScreen.show();
      break;
    }
  }

  // hide all button of a screen
  void hideButtonOf(int screenName) {
    switch (screenName) {
      case MAIN_MENU_SCR:
        mainMenuScreen.hideButton();
      break;
    }
  }
}

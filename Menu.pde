class Menu {

  MainMenuScreen mainMenuScreen;
  WelcomeScreen welcomeScreen;
  SettingScreen settingScreen;
  GameModeSelectionScreen gameModeSelectionScreen;

  Menu() {
    mainMenuScreen = new MainMenuScreen();
    welcomeScreen = new WelcomeScreen();
    settingScreen = new SettingScreen();
    gameModeSelectionScreen =  new GameModeSelectionScreen();    
  }

  void show() {
    switch (gameScreen) {
      case WELCOME_SCR: 
        welcomeScreen.show();
      break;

      case MAIN_MENU_SCR:
        mainMenuScreen.show();
      break;

      case GAME_SELECT_SCR:
        gameModeSelectionScreen.show();  
      break;
      case SETTING_SCR:
        settingScreen.show();
      break;      
    }
  }

  // Hide all button of a screen
  void hideButtonOf(int screenName) {
    switch (screenName) {      
      case MAIN_MENU_SCR:
        mainMenuScreen.hideButton();
      break;
      
      case GAME_SELECT_SCR:
        gameModeSelectionScreen.hideButton();
      break;
      
      case SETTING_SCR:
        settingScreen.hideButton();
      break;     
    }
  }

  // show all button of a screen
  void showButtonOf(int screenName) {
    switch (screenName) {      
      case MAIN_MENU_SCR:
        mainMenuScreen.showButton();
      break;
      
      case GAME_SELECT_SCR:
        gameModeSelectionScreen.showButton();
      break;
      
      case SETTING_SCR:
        settingScreen.showButton();
      break;      
    }
  }
}

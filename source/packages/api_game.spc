CREATE OR REPLACE PACKAGE api_game IS
  --
  -- API-Package for CrappyBird Game
  --

  --
  -- Render CrappyBird Game in Region with DIV/Canvas/JS - htp.p output
  -- #param i_crappy_home_path
  -- #param i_highscore_item_name
  -- #param i_game_start_daymode
  -- #param i_game_bird_color
  -- #param i_game_treetop_color
  -- #param i_game_treetrunk_color
  -- #param i_game_bottom_color
  -- #param i_game_grass_color
  -- #param i_game_bar_color
  PROCEDURE render_crappybird(i_crappy_home_path     IN VARCHAR2,
                              i_highscore_item_name  IN VARCHAR2,
                              i_game_start_daymode   IN usr_prefs.game_daymode%TYPE,
                              i_game_bird_color      IN usr_prefs.game_bird_color%TYPE,
                              i_game_treetop_color   IN usr_prefs.game_treetop_color%TYPE,
                              i_game_treetrunk_color IN usr_prefs.game_treetrunk_color%TYPE,
                              i_game_bottom_color    IN usr_prefs.game_bottom_color%TYPE,
                              i_game_grass_color     IN usr_prefs.game_grass_color%TYPE,
                              i_game_bar_color       IN usr_prefs.game_bar_color%TYPE);
  --
  -- Render CrappyBird Game for User with User prefs (customization)
  -- #param i_id_usr
  -- #param i_crappy_home_path
  -- #param i_highscore_item_name
  PROCEDURE render_crappybird_usr(i_id_usr              IN usr_prefs.id_usr%TYPE,
                                  i_crappy_home_path    IN VARCHAR2,
                                  i_highscore_item_name IN VARCHAR2);
  --
  -- Set highscore cookie for CrappyBird (for User)
  -- #param i_id_usr
  PROCEDURE set_highscore_cookie_usr(i_id_usr IN usr.id_usr%TYPE);
  --
  -- Set highscore cookie for CrappyBird (for Battle)
  -- #param i_id_usr
  -- #param i_id_usr_battle
  PROCEDURE set_highscore_cookie_battle(i_id_usr        IN NUMBER,
                                        i_id_usr_battle IN usr_battle.id_usr_battle%TYPE);
  --
END api_game;
/

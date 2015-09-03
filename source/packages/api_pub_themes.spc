CREATE OR REPLACE PACKAGE api_pub_themes IS
  --
  -- API-Package for table pub_themes
  --

  --
  -- Record for pub_themes
  --
  TYPE pub_rec_pub_themes_type IS RECORD(
    id_pub_themes        pub_themes.id_pub_themes%TYPE,
    id_usr               pub_themes.id_usr%TYPE,
    theme_name           pub_themes.theme_name%TYPE,
    preview_img          pub_themes.preview_img%TYPE,
    game_daymode         pub_themes.game_daymode%TYPE,
    game_bird_color      pub_themes.game_bird_color%TYPE,
    game_treetop_color   pub_themes.game_treetop_color%TYPE,
    game_treetrunk_color pub_themes.game_treetrunk_color%TYPE,
    game_bottom_color    pub_themes.game_bottom_color%TYPE,
    game_grass_color     pub_themes.game_grass_color%TYPE,
    game_bar_color       pub_themes.game_bar_color%TYPE);
  --
  -- Inserts dataset in pub_themes
  -- #param  i_rec_pub_themes Record-Type of table
  -- #return ID (PK of dataset)
  FUNCTION ins_pub_themes(i_rec_pub_themes IN pub_rec_pub_themes_type)
    RETURN pub_themes.id_pub_themes%TYPE;
  --
  --
  -- Updates datset of table pub_themes
  -- #param  i_rec_pub_themes  Record-Type of pub_themes
  -- #param  i_checksum Checksumme md5 before
  PROCEDURE upd_pub_themes(i_rec_pub_themes IN pub_rec_pub_themes_type,
                           i_checksum       IN VARCHAR2 := NULL);
  --
  --
  -- Deletes dataset of table pub_themes
  -- #param  i_id_pub_themes  PK-ID of pub_themes
  PROCEDURE del_pub_themes(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE);
  --
  --
  -- Get record of table pub_themes
  -- #param i_id_pub_themes ID aus pub_themes
  -- #return Record-Type for pub_themes
  FUNCTION get_rec_pub_themes(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_rec_pub_themes_type;
  --
  --
  -- Generates md5 checksum for pub_themes
  -- #param  i_rec_pub_themes Record-Type of table
  -- #return md5 Checksum in Varchar2
  FUNCTION get_md5_pub_themes(i_rec_pub_themes IN pub_rec_pub_themes_type)
    RETURN VARCHAR2;
  --
  --
  -- Compares (Before/After) md5 checksum for pub_themes
  -- #param  i_checksum checksum before
  -- #param  i_rec_pub_themes Record-Type of table
  -- #return Boolean value
  FUNCTION do_check_md5_pub_themes(i_checksum       IN VARCHAR2,
                                   i_rec_pub_themes IN pub_rec_pub_themes_type)
    RETURN BOOLEAN;
  --
  --
  -- Get id_pub_themes of pub_themes
  -- #param i_id_pub_themes Id der pub_themes
  -- #return id_pub_themes aus pub_themes
  FUNCTION get_id_pub_themes(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.id_pub_themes%TYPE;
  --

  --
  -- Get id_usr of pub_themes
  -- #param i_id_pub_themes Id der pub_themes
  -- #return id_usr aus pub_themes
  FUNCTION get_id_usr(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.id_usr%TYPE;
  --

  --
  -- Get theme_name of pub_themes
  -- #param i_id_pub_themes Id der pub_themes
  -- #return theme_name aus pub_themes
  FUNCTION get_theme_name(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.theme_name%TYPE;
  --

  --
  -- Get preview_img of pub_themes
  -- #param i_id_pub_themes Id der pub_themes
  -- #return preview_img aus pub_themes
  FUNCTION get_preview_img(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.preview_img%TYPE;
  --

  --
  -- Get game_daymode of pub_themes
  -- #param i_id_pub_themes Id der pub_themes
  -- #return game_daymode aus pub_themes
  FUNCTION get_game_daymode(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_daymode%TYPE;
  --

  --
  -- Get game_bird_color of pub_themes
  -- #param i_id_pub_themes Id der pub_themes
  -- #return game_bird_color aus pub_themes
  FUNCTION get_game_bird_color(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_bird_color%TYPE;
  --

  --
  -- Get game_treetop_color of pub_themes
  -- #param i_id_pub_themes Id der pub_themes
  -- #return game_treetop_color aus pub_themes
  FUNCTION get_game_treetop_color(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_treetop_color%TYPE;
  --

  --
  -- Get game_treetrunk_color of pub_themes
  -- #param i_id_pub_themes Id der pub_themes
  -- #return game_treetrunk_color aus pub_themes
  FUNCTION get_game_treetrunk_color(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_treetrunk_color%TYPE;
  --

  --
  -- Get game_bottom_color of pub_themes
  -- #param i_id_pub_themes Id der pub_themes
  -- #return game_bottom_color aus pub_themes
  FUNCTION get_game_bottom_color(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_bottom_color%TYPE;
  --

  --
  -- Get game_grass_color of pub_themes
  -- #param i_id_pub_themes Id der pub_themes
  -- #return game_grass_color aus pub_themes
  FUNCTION get_game_grass_color(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_grass_color%TYPE;
  --

  --
  -- Get game_bar_color of pub_themes
  -- #param i_id_pub_themes Id der pub_themes
  -- #return game_bar_color aus pub_themes
  FUNCTION get_game_bar_color(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_bar_color%TYPE;
  --
  -- Insert public theme from usr and return Goto URL
  -- #param i_id_usr
  -- #param i_theme_name
  -- #param i_preview_img
  -- #return URL as varchar2
  FUNCTION do_insert_pub_theme(i_id_usr      IN pub_themes.id_usr%TYPE,
                               i_theme_name  pub_themes.theme_name%TYPE,
                               i_preview_img pub_themes.preview_img%TYPE)
    RETURN VARCHAR2;
  --
  -- Set public theme as current usr theme
  -- #param i_id_usr
  -- #param i_id_pub_themes
  PROCEDURE set_pub_theme_current(i_id_usr        IN pub_themes.id_usr%TYPE,
                                  i_id_pub_themes IN pub_themes.id_pub_themes%TYPE);
  --

END api_pub_themes;
/

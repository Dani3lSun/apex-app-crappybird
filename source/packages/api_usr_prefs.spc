CREATE OR REPLACE PACKAGE api_usr_prefs IS
  --
  -- API-Package for table usr_prefs
  --

  --
  -- Record for usr_prefs
  --
  TYPE pub_rec_usr_prefs_type IS RECORD(
    id_usr_prefs         usr_prefs.id_usr_prefs%TYPE,
    id_usr               usr_prefs.id_usr%TYPE,
    game_daymode         usr_prefs.game_daymode%TYPE,
    game_bird_color      usr_prefs.game_bird_color%TYPE,
    game_treetop_color   usr_prefs.game_treetop_color%TYPE,
    game_treetrunk_color usr_prefs.game_treetrunk_color%TYPE,
    game_bottom_color    usr_prefs.game_bottom_color%TYPE,
    game_grass_color     usr_prefs.game_grass_color%TYPE,
    game_bar_color       usr_prefs.game_bar_color%TYPE);
  --
  -- Inserts dataset in usr_prefs
  -- #param  i_rec_usr_prefs Record-Type of table
  -- #return ID (PK of dataset)
  FUNCTION ins_usr_prefs(i_rec_usr_prefs IN pub_rec_usr_prefs_type)
    RETURN usr_prefs.id_usr_prefs%TYPE;
  --
  --
  -- Updates datset of table usr_prefs
  -- #param  i_rec_usr_prefs  Record-Type of usr_prefs
  -- #param  i_checksum Checksumme md5 before
  PROCEDURE upd_usr_prefs(i_rec_usr_prefs IN pub_rec_usr_prefs_type,
                          i_checksum      IN VARCHAR2 := NULL);
  --
  --
  -- Deletes dataset of table usr_prefs
  -- #param  i_id_usr_prefs  PK-ID of usr_prefs
  PROCEDURE del_usr_prefs(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE);
  --
  --
  -- Get record of table usr_prefs
  -- #param i_id_usr_prefs ID aus usr_prefs
  -- #return Record-Type for usr_prefs
  FUNCTION get_rec_usr_prefs(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN pub_rec_usr_prefs_type;
  --
  --
  -- Generates md5 checksum for usr_prefs
  -- #param  i_rec_usr_prefs Record-Type of table
  -- #return md5 Checksum in Varchar2
  FUNCTION get_md5_usr_prefs(i_rec_usr_prefs IN pub_rec_usr_prefs_type)
    RETURN VARCHAR2;
  --
  --
  -- Compares (Before/After) md5 checksum for usr_prefs
  -- #param  i_checksum checksum before
  -- #param  i_rec_usr_prefs Record-Type of table
  -- #return Boolean value
  FUNCTION do_check_md5_usr_prefs(i_checksum      IN VARCHAR2,
                                  i_rec_usr_prefs IN pub_rec_usr_prefs_type)
    RETURN BOOLEAN;
  --
  --
  -- Get id_usr_prefs of usr_prefs
  -- #param i_id_usr_prefs Id der usr_prefs
  -- #return id_usr_prefs aus usr_prefs
  FUNCTION get_id_usr_prefs(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.id_usr_prefs%TYPE;
  --
  -- Get usr_prefs.id_usr_prefs of usr_prefs from id_usr
  -- #param i_id_usr
  -- #return id_usr_prefs from usr_prefs
  FUNCTION get_id_usr_prefs(i_id_usr IN usr_prefs.id_usr%TYPE)
    RETURN usr_prefs.id_usr_prefs%TYPE;
  --
  -- Get id_usr of usr_prefs
  -- #param i_id_usr_prefs Id der usr_prefs
  -- #return id_usr aus usr_prefs
  FUNCTION get_id_usr(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.id_usr%TYPE;
  --

  --
  -- Get game_daymode of usr_prefs
  -- #param i_id_usr_prefs Id der usr_prefs
  -- #return game_daymode aus usr_prefs
  FUNCTION get_game_daymode(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_daymode%TYPE;
  --

  --
  -- Get game_bird_color of usr_prefs
  -- #param i_id_usr_prefs Id der usr_prefs
  -- #return game_bird_color aus usr_prefs
  FUNCTION get_game_bird_color(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_bird_color%TYPE;
  --

  --
  -- Get game_treetop_color of usr_prefs
  -- #param i_id_usr_prefs Id der usr_prefs
  -- #return game_treetop_color aus usr_prefs
  FUNCTION get_game_treetop_color(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_treetop_color%TYPE;
  --

  --
  -- Get game_treetrunk_color of usr_prefs
  -- #param i_id_usr_prefs Id der usr_prefs
  -- #return game_treetrunk_color aus usr_prefs
  FUNCTION get_game_treetrunk_color(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_treetrunk_color%TYPE;
  --

  --
  -- Get game_bottom_color of usr_prefs
  -- #param i_id_usr_prefs Id der usr_prefs
  -- #return game_bottom_color aus usr_prefs
  FUNCTION get_game_bottom_color(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_bottom_color%TYPE;
  --

  --
  -- Get game_grass_color of usr_prefs
  -- #param i_id_usr_prefs Id der usr_prefs
  -- #return game_grass_color aus usr_prefs
  FUNCTION get_game_grass_color(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_grass_color%TYPE;
  --

  --
  -- Get game_bar_color of usr_prefs
  -- #param i_id_usr_prefs Id der usr_prefs
  -- #return game_bar_color aus usr_prefs
  FUNCTION get_game_bar_color(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_bar_color%TYPE;
  --
  -- Fills page items on user prefs (customize) page
  -- #param i_id_usr
  -- #param o_id_usr_prefs
  -- #param o_game_daymode
  -- #param o_game_bird_color
  -- #param o_game_treetop_color
  -- #param o_game_treetrunk_color
  -- #param o_game_bottom_color
  -- #param o_game_grass_color
  -- #param o_game_bar_color
  PROCEDURE do_fill_usr_prefs(i_id_usr               IN usr_prefs.id_usr%TYPE,
                              o_id_usr_prefs         OUT usr_prefs.id_usr_prefs%TYPE,
                              o_game_daymode         OUT usr_prefs.game_daymode%TYPE,
                              o_game_bird_color      OUT usr_prefs.game_bird_color%TYPE,
                              o_game_treetop_color   OUT usr_prefs.game_treetop_color%TYPE,
                              o_game_treetrunk_color OUT usr_prefs.game_treetrunk_color%TYPE,
                              o_game_bottom_color    OUT usr_prefs.game_bottom_color%TYPE,
                              o_game_grass_color     OUT usr_prefs.game_grass_color%TYPE,
                              o_game_bar_color       OUT usr_prefs.game_bar_color%TYPE);
  --
  -- Merge Insert/Update Functions to save values
  -- #param i_id_usr
  -- #param i_id_usr_prefs
  -- #param i_game_daymode
  -- #param i_game_bird_color
  -- #param i_game_treetop_color
  -- #param i_game_treetrunk_color
  -- #param i_game_bottom_color
  -- #param i_game_grass_color
  -- #param i_game_bar_color
  PROCEDURE do_merge_usr_prefs(i_id_usr               IN usr_prefs.id_usr%TYPE,
                               i_id_usr_prefs         IN usr_prefs.id_usr_prefs%TYPE,
                               i_game_daymode         IN usr_prefs.game_daymode%TYPE,
                               i_game_bird_color      IN usr_prefs.game_bird_color%TYPE,
                               i_game_treetop_color   IN usr_prefs.game_treetop_color%TYPE,
                               i_game_treetrunk_color IN usr_prefs.game_treetrunk_color%TYPE,
                               i_game_bottom_color    IN usr_prefs.game_bottom_color%TYPE,
                               i_game_grass_color     IN usr_prefs.game_grass_color%TYPE,
                               i_game_bar_color       IN usr_prefs.game_bar_color%TYPE);
  --

END api_usr_prefs;
/

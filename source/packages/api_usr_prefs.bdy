CREATE OR REPLACE PACKAGE BODY api_usr_prefs IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_usr_prefs';
  --
  /*************************************************************************
  * Purpose:  INSERTS dataset into usr_prefs and returns PK
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  *************************************************************************/
  FUNCTION ins_usr_prefs(i_rec_usr_prefs IN pub_rec_usr_prefs_type)
    RETURN usr_prefs.id_usr_prefs%TYPE IS
    l_function CONSTANT VARCHAR2(30) := 'ins_usr_prefs';
    --
    l_id_usr_prefs usr_prefs.id_usr_prefs%TYPE;
  BEGIN
    --
    -- if id_usr_prefs not present,
    -- get next value of Sequence
    --
    IF i_rec_usr_prefs.id_usr_prefs IS NULL THEN
      l_id_usr_prefs := seq_pk.nextval;
    ELSE
      l_id_usr_prefs := i_rec_usr_prefs.id_usr_prefs;
    END IF;
    --
    INSERT INTO usr_prefs
      (usr_prefs.id_usr_prefs,
       usr_prefs.id_usr,
       usr_prefs.game_daymode,
       usr_prefs.game_bird_color,
       usr_prefs.game_treetop_color,
       usr_prefs.game_treetrunk_color,
       usr_prefs.game_bottom_color,
       usr_prefs.game_grass_color,
       usr_prefs.game_bar_color)
    VALUES
      (l_id_usr_prefs,
       i_rec_usr_prefs.id_usr,
       i_rec_usr_prefs.game_daymode,
       i_rec_usr_prefs.game_bird_color,
       i_rec_usr_prefs.game_treetop_color,
       i_rec_usr_prefs.game_treetrunk_color,
       i_rec_usr_prefs.game_bottom_color,
       i_rec_usr_prefs.game_grass_color,
       i_rec_usr_prefs.game_bar_color);
    --
    RETURN l_id_usr_prefs;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END ins_usr_prefs;
  --
  /*************************************************************************
  * Purpose:  UPDATES dataset of table usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE upd_usr_prefs(i_rec_usr_prefs IN pub_rec_usr_prefs_type,
                          i_checksum      IN VARCHAR2 := NULL) IS
    l_function CONSTANT VARCHAR2(30) := 'upd_usr_prefs';
    --
    l_md5_bool   BOOLEAN := TRUE;
    l_rec_before api_usr_prefs.pub_rec_usr_prefs_type;
  BEGIN
    --
    l_rec_before := api_usr_prefs.get_rec_usr_prefs(i_id_usr_prefs => i_rec_usr_prefs.id_usr_prefs);
    --
    IF i_checksum IS NOT NULL THEN
      l_md5_bool := do_check_md5_usr_prefs(i_checksum      => i_checksum,
                                           i_rec_usr_prefs => l_rec_before);
    END IF;
    --
    IF (i_checksum IS NULL) OR (l_md5_bool = TRUE) THEN
      UPDATE usr_prefs
         SET usr_prefs.id_usr               = i_rec_usr_prefs.id_usr,
             usr_prefs.game_daymode         = i_rec_usr_prefs.game_daymode,
             usr_prefs.game_bird_color      = i_rec_usr_prefs.game_bird_color,
             usr_prefs.game_treetop_color   = i_rec_usr_prefs.game_treetop_color,
             usr_prefs.game_treetrunk_color = i_rec_usr_prefs.game_treetrunk_color,
             usr_prefs.game_bottom_color    = i_rec_usr_prefs.game_bottom_color,
             usr_prefs.game_grass_color     = i_rec_usr_prefs.game_grass_color,
             usr_prefs.game_bar_color       = i_rec_usr_prefs.game_bar_color
       WHERE id_usr_prefs = i_rec_usr_prefs.id_usr_prefs;
    ELSE
      raise_application_error(-20001,
                              'Current data has changed. Please reload the page.');
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END upd_usr_prefs;
  --
  /*************************************************************************
  * Purpose:  DELETES dataset of table usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE del_usr_prefs(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'del_usr_prefs';
  BEGIN
    --
    DELETE FROM usr_prefs
     WHERE usr_prefs.id_usr_prefs = i_id_usr_prefs;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END del_usr_prefs;
  --
  /****************************************************************************
  * Purpose:  Get Record of table usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_rec_usr_prefs(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN pub_rec_usr_prefs_type IS
    l_function CONSTANT VARCHAR2(30) := 'get_rec_usr_prefs';
    --
    l_retval pub_rec_usr_prefs_type;
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.id_usr_prefs,
             usr_prefs.id_usr,
             usr_prefs.game_daymode,
             usr_prefs.game_bird_color,
             usr_prefs.game_treetop_color,
             usr_prefs.game_treetrunk_color,
             usr_prefs.game_bottom_color,
             usr_prefs.game_grass_color,
             usr_prefs.game_bar_color
        FROM usr_prefs
       WHERE usr_prefs.id_usr_prefs = i_id_usr_prefs;
    l_rec_cur l_cur_usr_prefs%ROWTYPE;
    --
  BEGIN
    --
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_rec_cur;
    IF l_cur_usr_prefs%FOUND THEN
      l_retval.id_usr_prefs         := l_rec_cur.id_usr_prefs;
      l_retval.id_usr               := l_rec_cur.id_usr;
      l_retval.game_daymode         := l_rec_cur.game_daymode;
      l_retval.game_bird_color      := l_rec_cur.game_bird_color;
      l_retval.game_treetop_color   := l_rec_cur.game_treetop_color;
      l_retval.game_treetrunk_color := l_rec_cur.game_treetrunk_color;
      l_retval.game_bottom_color    := l_rec_cur.game_bottom_color;
      l_retval.game_grass_color     := l_rec_cur.game_grass_color;
      l_retval.game_bar_color       := l_rec_cur.game_bar_color;
    END IF;
    CLOSE l_cur_usr_prefs;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_rec_usr_prefs;
  --
  /*************************************************************************
  * Purpose:  Generates md5 checksum for usr_prefs using Record-type
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  *************************************************************************/
  FUNCTION get_md5_usr_prefs(i_rec_usr_prefs IN pub_rec_usr_prefs_type)
    RETURN VARCHAR2 IS
    l_function CONSTANT VARCHAR2(30) := 'get_md5_usr_prefs';
    --
    l_md5_string VARCHAR2(32000);
    l_rec_string CLOB;
    l_seperator  VARCHAR2(10) := '|';
  BEGIN
    --
    l_rec_string := i_rec_usr_prefs.id_usr_prefs || l_seperator ||
                    i_rec_usr_prefs.id_usr || l_seperator ||
                    i_rec_usr_prefs.game_daymode || l_seperator ||
                    i_rec_usr_prefs.game_bird_color || l_seperator ||
                    i_rec_usr_prefs.game_treetop_color || l_seperator ||
                    i_rec_usr_prefs.game_treetrunk_color || l_seperator ||
                    i_rec_usr_prefs.game_bottom_color || l_seperator ||
                    i_rec_usr_prefs.game_grass_color || l_seperator ||
                    i_rec_usr_prefs.game_bar_color || l_seperator;
    --
    l_md5_string := sys.utl_raw.cast_to_raw(sys.dbms_obfuscation_toolkit.md5(input_string => l_rec_string));
    --
    RETURN l_md5_string;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_md5_usr_prefs;
  --
  /*************************************************************************
  * Purpose:  Compares (Before/After) md5 checksum of usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  *************************************************************************/
  FUNCTION do_check_md5_usr_prefs(i_checksum      IN VARCHAR2,
                                  i_rec_usr_prefs IN pub_rec_usr_prefs_type)
    RETURN BOOLEAN IS
    l_function CONSTANT VARCHAR2(30) := 'do_check_md5_usr_prefs';
    --
    l_md5_string VARCHAR2(32000);
    l_return     BOOLEAN;
  BEGIN
    --
    l_md5_string := get_md5_usr_prefs(i_rec_usr_prefs => i_rec_usr_prefs);
    --
    IF i_checksum = l_md5_string THEN
      l_return := TRUE;
    ELSE
      l_return := FALSE;
    END IF;
    --
    RETURN l_return;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_check_md5_usr_prefs;
  --
  /****************************************************************************
  * Purpose:  Get usr_prefs.id_usr_prefs of usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr_prefs(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.id_usr_prefs%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr_prefs';
    --
    l_retval usr_prefs.id_usr_prefs%TYPE;
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.id_usr_prefs
        FROM usr_prefs
       WHERE usr_prefs.id_usr_prefs = i_id_usr_prefs;
  BEGIN
    --
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_retval;
    CLOSE l_cur_usr_prefs;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_usr_prefs;
  --
  /****************************************************************************
  * Purpose:  Get usr_prefs.id_usr_prefs of usr_prefs from id_usr
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr_prefs(i_id_usr IN usr_prefs.id_usr%TYPE)
    RETURN usr_prefs.id_usr_prefs%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr_prefs';
    --
    l_retval usr_prefs.id_usr_prefs%TYPE;
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.id_usr_prefs
        FROM usr_prefs
       WHERE usr_prefs.id_usr = i_id_usr;
  BEGIN
    --
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_retval;
    CLOSE l_cur_usr_prefs;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_usr_prefs;
  --

  /****************************************************************************
  * Purpose:  Get usr_prefs.id_usr of usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.id_usr%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr';
    --
    l_retval usr_prefs.id_usr%TYPE;
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.id_usr
        FROM usr_prefs
       WHERE usr_prefs.id_usr_prefs = i_id_usr_prefs;
  BEGIN
    --
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_retval;
    CLOSE l_cur_usr_prefs;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_usr;
  --

  /****************************************************************************
  * Purpose:  Get usr_prefs.game_daymode of usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_daymode(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_daymode%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_daymode';
    --
    l_retval usr_prefs.game_daymode%TYPE;
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.game_daymode
        FROM usr_prefs
       WHERE usr_prefs.id_usr_prefs = i_id_usr_prefs;
  BEGIN
    --
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_retval;
    CLOSE l_cur_usr_prefs;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_game_daymode;
  --

  /****************************************************************************
  * Purpose:  Get usr_prefs.game_bird_color of usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_bird_color(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_bird_color%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_bird_color';
    --
    l_retval usr_prefs.game_bird_color%TYPE;
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.game_bird_color
        FROM usr_prefs
       WHERE usr_prefs.id_usr_prefs = i_id_usr_prefs;
  BEGIN
    --
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_retval;
    CLOSE l_cur_usr_prefs;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_game_bird_color;
  --

  /****************************************************************************
  * Purpose:  Get usr_prefs.game_treetop_color of usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_treetop_color(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_treetop_color%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_treetop_color';
    --
    l_retval usr_prefs.game_treetop_color%TYPE;
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.game_treetop_color
        FROM usr_prefs
       WHERE usr_prefs.id_usr_prefs = i_id_usr_prefs;
  BEGIN
    --
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_retval;
    CLOSE l_cur_usr_prefs;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_game_treetop_color;
  --

  /****************************************************************************
  * Purpose:  Get usr_prefs.game_treetrunk_color of usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_treetrunk_color(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_treetrunk_color%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_treetrunk_color';
    --
    l_retval usr_prefs.game_treetrunk_color%TYPE;
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.game_treetrunk_color
        FROM usr_prefs
       WHERE usr_prefs.id_usr_prefs = i_id_usr_prefs;
  BEGIN
    --
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_retval;
    CLOSE l_cur_usr_prefs;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_game_treetrunk_color;
  --

  /****************************************************************************
  * Purpose:  Get usr_prefs.game_bottom_color of usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_bottom_color(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_bottom_color%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_bottom_color';
    --
    l_retval usr_prefs.game_bottom_color%TYPE;
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.game_bottom_color
        FROM usr_prefs
       WHERE usr_prefs.id_usr_prefs = i_id_usr_prefs;
  BEGIN
    --
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_retval;
    CLOSE l_cur_usr_prefs;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_game_bottom_color;
  --

  /****************************************************************************
  * Purpose:  Get usr_prefs.game_grass_color of usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_grass_color(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_grass_color%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_grass_color';
    --
    l_retval usr_prefs.game_grass_color%TYPE;
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.game_grass_color
        FROM usr_prefs
       WHERE usr_prefs.id_usr_prefs = i_id_usr_prefs;
  BEGIN
    --
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_retval;
    CLOSE l_cur_usr_prefs;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_game_grass_color;
  --

  /****************************************************************************
  * Purpose:  Get usr_prefs.game_bar_color of usr_prefs
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_bar_color(i_id_usr_prefs IN usr_prefs.id_usr_prefs%TYPE)
    RETURN usr_prefs.game_bar_color%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_bar_color';
    --
    l_retval usr_prefs.game_bar_color%TYPE;
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.game_bar_color
        FROM usr_prefs
       WHERE usr_prefs.id_usr_prefs = i_id_usr_prefs;
  BEGIN
    --
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_retval;
    CLOSE l_cur_usr_prefs;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_game_bar_color;
  --
  /*************************************************************************
  * Purpose:  Fills page items on user prefs (customize) page
  * Author:   Daniel Hochleitner
  * Created:  19.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE do_fill_usr_prefs(i_id_usr               IN usr_prefs.id_usr%TYPE,
                              o_id_usr_prefs         OUT usr_prefs.id_usr_prefs%TYPE,
                              o_game_daymode         OUT usr_prefs.game_daymode%TYPE,
                              o_game_bird_color      OUT usr_prefs.game_bird_color%TYPE,
                              o_game_treetop_color   OUT usr_prefs.game_treetop_color%TYPE,
                              o_game_treetrunk_color OUT usr_prefs.game_treetrunk_color%TYPE,
                              o_game_bottom_color    OUT usr_prefs.game_bottom_color%TYPE,
                              o_game_grass_color     OUT usr_prefs.game_grass_color%TYPE,
                              o_game_bar_color       OUT usr_prefs.game_bar_color%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'do_fill_usr_prefs';
    --
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.id_usr_prefs,
             usr_prefs.game_daymode,
             usr_prefs.game_bird_color,
             usr_prefs.game_treetop_color,
             usr_prefs.game_treetrunk_color,
             usr_prefs.game_bottom_color,
             usr_prefs.game_grass_color,
             usr_prefs.game_bar_color
        FROM usr_prefs
       WHERE usr_prefs.id_usr = i_id_usr;
    l_rec_usr_prefs l_cur_usr_prefs%ROWTYPE;
    --
  BEGIN
    --
    -- open cursor adn fetch into record
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_rec_usr_prefs;
    CLOSE l_cur_usr_prefs;
    --
    -- set out parameter
    o_id_usr_prefs         := l_rec_usr_prefs.id_usr_prefs;
    o_game_daymode         := nvl(l_rec_usr_prefs.game_daymode,
                                  'day');
    o_game_bird_color      := nvl(l_rec_usr_prefs.game_bird_color,
                                  'yellow');
    o_game_treetop_color   := nvl(l_rec_usr_prefs.game_treetop_color,
                                  '#008000');
    o_game_treetrunk_color := nvl(l_rec_usr_prefs.game_treetrunk_color,
                                  '#A52A2A');
    o_game_bottom_color    := nvl(l_rec_usr_prefs.game_bottom_color,
                                  '#D2691E');
    o_game_grass_color     := nvl(l_rec_usr_prefs.game_grass_color,
                                  '#050');
    o_game_bar_color       := nvl(l_rec_usr_prefs.game_bar_color,
                                  '#8ED6FF');
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_fill_usr_prefs;
  --
  /*************************************************************************
  * Purpose:  Merge Insert/Update Functions to save values
  * Author:   Daniel Hochleitner
  * Created:  19.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE do_merge_usr_prefs(i_id_usr               IN usr_prefs.id_usr%TYPE,
                               i_id_usr_prefs         IN usr_prefs.id_usr_prefs%TYPE,
                               i_game_daymode         IN usr_prefs.game_daymode%TYPE,
                               i_game_bird_color      IN usr_prefs.game_bird_color%TYPE,
                               i_game_treetop_color   IN usr_prefs.game_treetop_color%TYPE,
                               i_game_treetrunk_color IN usr_prefs.game_treetrunk_color%TYPE,
                               i_game_bottom_color    IN usr_prefs.game_bottom_color%TYPE,
                               i_game_grass_color     IN usr_prefs.game_grass_color%TYPE,
                               i_game_bar_color       IN usr_prefs.game_bar_color%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'do_merge_usr_prefs';
    --
    l_rec_usr_prefs api_usr_prefs.pub_rec_usr_prefs_type;
    l_id_usr_prefs  usr_prefs.id_usr_prefs%TYPE;
    --
  BEGIN
    --
    -- if PK is null then insert else update
    IF i_id_usr_prefs IS NULL THEN
      l_rec_usr_prefs.id_usr_prefs         := i_id_usr_prefs;
      l_rec_usr_prefs.id_usr               := i_id_usr;
      l_rec_usr_prefs.game_daymode         := i_game_daymode;
      l_rec_usr_prefs.game_bird_color      := i_game_bird_color;
      l_rec_usr_prefs.game_treetop_color   := i_game_treetop_color;
      l_rec_usr_prefs.game_treetrunk_color := i_game_treetrunk_color;
      l_rec_usr_prefs.game_bottom_color    := i_game_bottom_color;
      l_rec_usr_prefs.game_grass_color     := i_game_grass_color;
      l_rec_usr_prefs.game_bar_color       := i_game_bar_color;
      --
      l_id_usr_prefs := api_usr_prefs.ins_usr_prefs(i_rec_usr_prefs => l_rec_usr_prefs);
    ELSE
      l_rec_usr_prefs := api_usr_prefs.get_rec_usr_prefs(i_id_usr_prefs => i_id_usr_prefs);
      --
      l_rec_usr_prefs.id_usr               := i_id_usr;
      l_rec_usr_prefs.game_daymode         := i_game_daymode;
      l_rec_usr_prefs.game_bird_color      := i_game_bird_color;
      l_rec_usr_prefs.game_treetop_color   := i_game_treetop_color;
      l_rec_usr_prefs.game_treetrunk_color := i_game_treetrunk_color;
      l_rec_usr_prefs.game_bottom_color    := i_game_bottom_color;
      l_rec_usr_prefs.game_grass_color     := i_game_grass_color;
      l_rec_usr_prefs.game_bar_color       := i_game_bar_color;
      --
      api_usr_prefs.upd_usr_prefs(i_rec_usr_prefs => l_rec_usr_prefs);
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_merge_usr_prefs;
  --
--
END api_usr_prefs;
/

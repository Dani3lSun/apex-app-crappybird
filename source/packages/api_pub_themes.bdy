CREATE OR REPLACE PACKAGE BODY api_pub_themes IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_pub_themes';
  --
  /*************************************************************************
  * Purpose:  INSERTS dataset into pub_themes and returns PK
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  *************************************************************************/
  FUNCTION ins_pub_themes(i_rec_pub_themes IN pub_rec_pub_themes_type)
    RETURN pub_themes.id_pub_themes%TYPE IS
    l_function CONSTANT VARCHAR2(30) := 'ins_pub_themes';
    --
    l_id_pub_themes pub_themes.id_pub_themes%TYPE;
  BEGIN
    --
    -- if id_pub_themes not present,
    -- get next value of Sequence
    --
    IF i_rec_pub_themes.id_pub_themes IS NULL THEN
      l_id_pub_themes := seq_pk.nextval;
    ELSE
      l_id_pub_themes := i_rec_pub_themes.id_pub_themes;
    END IF;
    --
    INSERT INTO pub_themes
      (pub_themes.id_pub_themes,
       pub_themes.id_usr,
       pub_themes.theme_name,
       pub_themes.preview_img,
       pub_themes.game_daymode,
       pub_themes.game_bird_color,
       pub_themes.game_treetop_color,
       pub_themes.game_treetrunk_color,
       pub_themes.game_bottom_color,
       pub_themes.game_grass_color,
       pub_themes.game_bar_color)
    VALUES
      (l_id_pub_themes,
       i_rec_pub_themes.id_usr,
       i_rec_pub_themes.theme_name,
       i_rec_pub_themes.preview_img,
       i_rec_pub_themes.game_daymode,
       i_rec_pub_themes.game_bird_color,
       i_rec_pub_themes.game_treetop_color,
       i_rec_pub_themes.game_treetrunk_color,
       i_rec_pub_themes.game_bottom_color,
       i_rec_pub_themes.game_grass_color,
       i_rec_pub_themes.game_bar_color);
    --
    RETURN l_id_pub_themes;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END ins_pub_themes;
  --
  /*************************************************************************
  * Purpose:  UPDATES dataset of table pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  *************************************************************************/
  PROCEDURE upd_pub_themes(i_rec_pub_themes IN pub_rec_pub_themes_type,
                           i_checksum       IN VARCHAR2 := NULL) IS
    l_function CONSTANT VARCHAR2(30) := 'upd_pub_themes';
    --
    l_md5_bool   BOOLEAN := TRUE;
    l_rec_before api_pub_themes.pub_rec_pub_themes_type;
  BEGIN
    --
    l_rec_before := api_pub_themes.get_rec_pub_themes(i_id_pub_themes => i_rec_pub_themes.id_pub_themes);
    --
    IF i_checksum IS NOT NULL THEN
      l_md5_bool := do_check_md5_pub_themes(i_checksum       => i_checksum,
                                            i_rec_pub_themes => l_rec_before);
    END IF;
    --
    IF (i_checksum IS NULL) OR (l_md5_bool = TRUE) THEN
      UPDATE pub_themes
         SET pub_themes.id_usr               = i_rec_pub_themes.id_usr,
             pub_themes.theme_name           = i_rec_pub_themes.theme_name,
             pub_themes.preview_img          = i_rec_pub_themes.preview_img,
             pub_themes.game_daymode         = i_rec_pub_themes.game_daymode,
             pub_themes.game_bird_color      = i_rec_pub_themes.game_bird_color,
             pub_themes.game_treetop_color   = i_rec_pub_themes.game_treetop_color,
             pub_themes.game_treetrunk_color = i_rec_pub_themes.game_treetrunk_color,
             pub_themes.game_bottom_color    = i_rec_pub_themes.game_bottom_color,
             pub_themes.game_grass_color     = i_rec_pub_themes.game_grass_color,
             pub_themes.game_bar_color       = i_rec_pub_themes.game_bar_color
       WHERE id_pub_themes = i_rec_pub_themes.id_pub_themes;
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
  END upd_pub_themes;
  --
  /*************************************************************************
  * Purpose:  DELETES dataset of table pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  *************************************************************************/
  PROCEDURE del_pub_themes(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'del_pub_themes';
  BEGIN
    --
    DELETE FROM pub_themes
     WHERE pub_themes.id_pub_themes = i_id_pub_themes;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END del_pub_themes;
  --
  /****************************************************************************
  * Purpose:  Get Record of table pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_rec_pub_themes(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_rec_pub_themes_type IS
    l_function CONSTANT VARCHAR2(30) := 'get_rec_pub_themes';
    --
    l_retval pub_rec_pub_themes_type;
    CURSOR l_cur_pub_themes IS
      SELECT pub_themes.id_pub_themes,
             pub_themes.id_usr,
             pub_themes.theme_name,
             pub_themes.preview_img,
             pub_themes.game_daymode,
             pub_themes.game_bird_color,
             pub_themes.game_treetop_color,
             pub_themes.game_treetrunk_color,
             pub_themes.game_bottom_color,
             pub_themes.game_grass_color,
             pub_themes.game_bar_color
        FROM pub_themes
       WHERE pub_themes.id_pub_themes = i_id_pub_themes;
    l_rec_cur l_cur_pub_themes%ROWTYPE;
    --
  BEGIN
    --
    OPEN l_cur_pub_themes;
    FETCH l_cur_pub_themes
      INTO l_rec_cur;
    IF l_cur_pub_themes%FOUND THEN
      l_retval.id_pub_themes        := l_rec_cur.id_pub_themes;
      l_retval.id_usr               := l_rec_cur.id_usr;
      l_retval.theme_name           := l_rec_cur.theme_name;
      l_retval.preview_img          := l_rec_cur.preview_img;
      l_retval.game_daymode         := l_rec_cur.game_daymode;
      l_retval.game_bird_color      := l_rec_cur.game_bird_color;
      l_retval.game_treetop_color   := l_rec_cur.game_treetop_color;
      l_retval.game_treetrunk_color := l_rec_cur.game_treetrunk_color;
      l_retval.game_bottom_color    := l_rec_cur.game_bottom_color;
      l_retval.game_grass_color     := l_rec_cur.game_grass_color;
      l_retval.game_bar_color       := l_rec_cur.game_bar_color;
    END IF;
    CLOSE l_cur_pub_themes;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_rec_pub_themes;
  --
  /*************************************************************************
  * Purpose:  Generates md5 checksum for pub_themes using Record-type
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  *************************************************************************/
  FUNCTION get_md5_pub_themes(i_rec_pub_themes IN pub_rec_pub_themes_type)
    RETURN VARCHAR2 IS
    l_function CONSTANT VARCHAR2(30) := 'get_md5_pub_themes';
    --
    l_md5_string VARCHAR2(32000);
    l_rec_string CLOB;
    l_seperator  VARCHAR2(10) := '|';
  BEGIN
    --
    l_rec_string := i_rec_pub_themes.id_pub_themes || l_seperator ||
                    i_rec_pub_themes.id_usr || l_seperator ||
                    i_rec_pub_themes.theme_name || l_seperator ||
                    i_rec_pub_themes.preview_img || l_seperator ||
                    i_rec_pub_themes.game_daymode || l_seperator ||
                    i_rec_pub_themes.game_bird_color || l_seperator ||
                    i_rec_pub_themes.game_treetop_color || l_seperator ||
                    i_rec_pub_themes.game_treetrunk_color || l_seperator ||
                    i_rec_pub_themes.game_bottom_color || l_seperator ||
                    i_rec_pub_themes.game_grass_color || l_seperator ||
                    i_rec_pub_themes.game_bar_color || l_seperator;
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
  END get_md5_pub_themes;
  --
  /*************************************************************************
  * Purpose:  Compares (Before/After) md5 checksum of pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  *************************************************************************/
  FUNCTION do_check_md5_pub_themes(i_checksum       IN VARCHAR2,
                                   i_rec_pub_themes IN pub_rec_pub_themes_type)
    RETURN BOOLEAN IS
    l_function CONSTANT VARCHAR2(30) := 'do_check_md5_pub_themes';
    --
    l_md5_string VARCHAR2(32000);
    l_return     BOOLEAN;
  BEGIN
    --
    l_md5_string := get_md5_pub_themes(i_rec_pub_themes => i_rec_pub_themes);
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
  END do_check_md5_pub_themes;
  --
  /****************************************************************************
  * Purpose:  Get pub_themes.id_pub_themes of pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_pub_themes(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.id_pub_themes%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_pub_themes';
    --
    l_retval pub_themes.id_pub_themes%TYPE;
    CURSOR l_cur_pub_themes IS
      SELECT pub_themes.id_pub_themes
        FROM pub_themes
       WHERE pub_themes.id_pub_themes = i_id_pub_themes;
  BEGIN
    --
    OPEN l_cur_pub_themes;
    FETCH l_cur_pub_themes
      INTO l_retval;
    CLOSE l_cur_pub_themes;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_pub_themes;
  --

  /****************************************************************************
  * Purpose:  Get pub_themes.id_usr of pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.id_usr%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr';
    --
    l_retval pub_themes.id_usr%TYPE;
    CURSOR l_cur_pub_themes IS
      SELECT pub_themes.id_usr
        FROM pub_themes
       WHERE pub_themes.id_pub_themes = i_id_pub_themes;
  BEGIN
    --
    OPEN l_cur_pub_themes;
    FETCH l_cur_pub_themes
      INTO l_retval;
    CLOSE l_cur_pub_themes;
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
  * Purpose:  Get pub_themes.theme_name of pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_theme_name(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.theme_name%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_theme_name';
    --
    l_retval pub_themes.theme_name%TYPE;
    CURSOR l_cur_pub_themes IS
      SELECT pub_themes.theme_name
        FROM pub_themes
       WHERE pub_themes.id_pub_themes = i_id_pub_themes;
  BEGIN
    --
    OPEN l_cur_pub_themes;
    FETCH l_cur_pub_themes
      INTO l_retval;
    CLOSE l_cur_pub_themes;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_theme_name;
  --

  /****************************************************************************
  * Purpose:  Get pub_themes.preview_img of pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_preview_img(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.preview_img%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_preview_img';
    --
    l_retval pub_themes.preview_img%TYPE;
    CURSOR l_cur_pub_themes IS
      SELECT pub_themes.preview_img
        FROM pub_themes
       WHERE pub_themes.id_pub_themes = i_id_pub_themes;
  BEGIN
    --
    OPEN l_cur_pub_themes;
    FETCH l_cur_pub_themes
      INTO l_retval;
    CLOSE l_cur_pub_themes;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_preview_img;
  --

  /****************************************************************************
  * Purpose:  Get pub_themes.game_daymode of pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_daymode(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_daymode%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_daymode';
    --
    l_retval pub_themes.game_daymode%TYPE;
    CURSOR l_cur_pub_themes IS
      SELECT pub_themes.game_daymode
        FROM pub_themes
       WHERE pub_themes.id_pub_themes = i_id_pub_themes;
  BEGIN
    --
    OPEN l_cur_pub_themes;
    FETCH l_cur_pub_themes
      INTO l_retval;
    CLOSE l_cur_pub_themes;
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
  * Purpose:  Get pub_themes.game_bird_color of pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_bird_color(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_bird_color%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_bird_color';
    --
    l_retval pub_themes.game_bird_color%TYPE;
    CURSOR l_cur_pub_themes IS
      SELECT pub_themes.game_bird_color
        FROM pub_themes
       WHERE pub_themes.id_pub_themes = i_id_pub_themes;
  BEGIN
    --
    OPEN l_cur_pub_themes;
    FETCH l_cur_pub_themes
      INTO l_retval;
    CLOSE l_cur_pub_themes;
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
  * Purpose:  Get pub_themes.game_treetop_color of pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_treetop_color(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_treetop_color%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_treetop_color';
    --
    l_retval pub_themes.game_treetop_color%TYPE;
    CURSOR l_cur_pub_themes IS
      SELECT pub_themes.game_treetop_color
        FROM pub_themes
       WHERE pub_themes.id_pub_themes = i_id_pub_themes;
  BEGIN
    --
    OPEN l_cur_pub_themes;
    FETCH l_cur_pub_themes
      INTO l_retval;
    CLOSE l_cur_pub_themes;
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
  * Purpose:  Get pub_themes.game_treetrunk_color of pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_treetrunk_color(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_treetrunk_color%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_treetrunk_color';
    --
    l_retval pub_themes.game_treetrunk_color%TYPE;
    CURSOR l_cur_pub_themes IS
      SELECT pub_themes.game_treetrunk_color
        FROM pub_themes
       WHERE pub_themes.id_pub_themes = i_id_pub_themes;
  BEGIN
    --
    OPEN l_cur_pub_themes;
    FETCH l_cur_pub_themes
      INTO l_retval;
    CLOSE l_cur_pub_themes;
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
  * Purpose:  Get pub_themes.game_bottom_color of pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_bottom_color(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_bottom_color%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_bottom_color';
    --
    l_retval pub_themes.game_bottom_color%TYPE;
    CURSOR l_cur_pub_themes IS
      SELECT pub_themes.game_bottom_color
        FROM pub_themes
       WHERE pub_themes.id_pub_themes = i_id_pub_themes;
  BEGIN
    --
    OPEN l_cur_pub_themes;
    FETCH l_cur_pub_themes
      INTO l_retval;
    CLOSE l_cur_pub_themes;
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
  * Purpose:  Get pub_themes.game_grass_color of pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_grass_color(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_grass_color%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_grass_color';
    --
    l_retval pub_themes.game_grass_color%TYPE;
    CURSOR l_cur_pub_themes IS
      SELECT pub_themes.game_grass_color
        FROM pub_themes
       WHERE pub_themes.id_pub_themes = i_id_pub_themes;
  BEGIN
    --
    OPEN l_cur_pub_themes;
    FETCH l_cur_pub_themes
      INTO l_retval;
    CLOSE l_cur_pub_themes;
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
  * Purpose:  Get pub_themes.game_bar_color of pub_themes
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_game_bar_color(i_id_pub_themes IN pub_themes.id_pub_themes%TYPE)
    RETURN pub_themes.game_bar_color%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_game_bar_color';
    --
    l_retval pub_themes.game_bar_color%TYPE;
    CURSOR l_cur_pub_themes IS
      SELECT pub_themes.game_bar_color
        FROM pub_themes
       WHERE pub_themes.id_pub_themes = i_id_pub_themes;
  BEGIN
    --
    OPEN l_cur_pub_themes;
    FETCH l_cur_pub_themes
      INTO l_retval;
    CLOSE l_cur_pub_themes;
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
  /****************************************************************************
  * Purpose:  Insert public theme from usr and return Goto URL
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION do_insert_pub_theme(i_id_usr      IN pub_themes.id_usr%TYPE,
                               i_theme_name  pub_themes.theme_name%TYPE,
                               i_preview_img pub_themes.preview_img%TYPE)
    RETURN VARCHAR2 IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_insert_pub_theme';
    --
    l_id_usr_prefs   usr_prefs.id_usr_prefs%TYPE;
    l_id_pub_themes  pub_themes.id_pub_themes%TYPE;
    l_rec_usr_prefs  api_usr_prefs.pub_rec_usr_prefs_type;
    l_rec_pub_themes api_pub_themes.pub_rec_pub_themes_type;
    l_url            VARCHAR2(500);
    --
  BEGIN
    -- get current usr_prefs
    l_id_usr_prefs  := api_usr_prefs.get_id_usr_prefs(i_id_usr => i_id_usr);
    l_rec_usr_prefs := api_usr_prefs.get_rec_usr_prefs(i_id_usr_prefs => l_id_usr_prefs);
    --
    -- insert into pub_themes
    l_rec_pub_themes.id_usr               := i_id_usr;
    l_rec_pub_themes.theme_name           := i_theme_name;
    l_rec_pub_themes.preview_img          := i_preview_img;
    l_rec_pub_themes.game_daymode         := l_rec_usr_prefs.game_daymode;
    l_rec_pub_themes.game_bird_color      := l_rec_usr_prefs.game_daymode;
    l_rec_pub_themes.game_bird_color      := l_rec_usr_prefs.game_bird_color;
    l_rec_pub_themes.game_treetop_color   := l_rec_usr_prefs.game_treetop_color;
    l_rec_pub_themes.game_treetrunk_color := l_rec_usr_prefs.game_treetrunk_color;
    l_rec_pub_themes.game_bottom_color    := l_rec_usr_prefs.game_bottom_color;
    l_rec_pub_themes.game_grass_color     := l_rec_usr_prefs.game_grass_color;
    l_rec_pub_themes.game_bar_color       := l_rec_usr_prefs.game_bar_color;
    --
    l_id_pub_themes := api_pub_themes.ins_pub_themes(i_rec_pub_themes => l_rec_pub_themes);
    --
    -- build return url to theme page
    l_url := apex_page.get_url(p_application => v('APP_ID'),
                               p_page        => 22,
                               p_clear_cache => 22,
                               p_items       => 'P22_ID_PUB_THEMES',
                               p_values      => l_id_pub_themes);
    --
    RETURN l_url;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_insert_pub_theme;
  --
  /****************************************************************************
  * Purpose:  Set public theme as current usr theme
  * Author:   Daniel Hochleitner
  * Created:  02.09.15
  * Changed:
  ****************************************************************************/
  PROCEDURE set_pub_theme_current(i_id_usr        IN pub_themes.id_usr%TYPE,
                                  i_id_pub_themes IN pub_themes.id_pub_themes%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'set_pub_theme_current';
    --
    l_id_usr_prefs   usr_prefs.id_usr_prefs%TYPE;
    l_rec_pub_themes api_pub_themes.pub_rec_pub_themes_type;
    --
  BEGIN
    -- get current usr_prefs
    l_rec_pub_themes := api_pub_themes.get_rec_pub_themes(i_id_pub_themes => i_id_pub_themes);
    --
    -- set theme as current usr theme
    l_id_usr_prefs := api_usr_prefs.get_id_usr_prefs(i_id_usr => i_id_usr);
    api_usr_prefs.do_merge_usr_prefs(i_id_usr               => i_id_usr,
                                     i_id_usr_prefs         => l_id_usr_prefs,
                                     i_game_daymode         => l_rec_pub_themes.game_daymode,
                                     i_game_bird_color      => l_rec_pub_themes.game_bird_color,
                                     i_game_treetop_color   => l_rec_pub_themes.game_treetop_color,
                                     i_game_treetrunk_color => l_rec_pub_themes.game_treetrunk_color,
                                     i_game_bottom_color    => l_rec_pub_themes.game_bottom_color,
                                     i_game_grass_color     => l_rec_pub_themes.game_grass_color,
                                     i_game_bar_color       => l_rec_pub_themes.game_bar_color);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END set_pub_theme_current;
  --

--
END api_pub_themes;
/

CREATE OR REPLACE PACKAGE BODY api_usr_battle IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_usr_battle';
  --
  /*************************************************************************
  * Purpose:  INSERTS dataset into usr_battle and returns PK
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  *************************************************************************/
  FUNCTION ins_usr_battle(i_rec_usr_battle IN pub_rec_usr_battle_type)
    RETURN usr_battle.id_usr_battle%TYPE IS
    l_function CONSTANT VARCHAR2(30) := 'ins_usr_battle';
    --
    l_id_usr_battle usr_battle.id_usr_battle%TYPE;
  BEGIN
    --
    -- if id_usr_battle not present,
    -- get next value of Sequence
    --
    IF i_rec_usr_battle.id_usr_battle IS NULL THEN
      l_id_usr_battle := seq_pk.nextval;
    ELSE
      l_id_usr_battle := i_rec_usr_battle.id_usr_battle;
    END IF;
    --
    INSERT INTO usr_battle
      (usr_battle.id_usr_battle,
       usr_battle.id_usr_challenger,
       usr_battle.id_usr_receiver,
       usr_battle.highscore_challenger,
       usr_battle.highscore_receiver)
    VALUES
      (l_id_usr_battle,
       i_rec_usr_battle.id_usr_challenger,
       i_rec_usr_battle.id_usr_receiver,
       i_rec_usr_battle.highscore_challenger,
       i_rec_usr_battle.highscore_receiver);
    --
    RETURN l_id_usr_battle;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END ins_usr_battle;
  --
  /*************************************************************************
  * Purpose:  UPDATES dataset of table usr_battle
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE upd_usr_battle(i_rec_usr_battle IN pub_rec_usr_battle_type,
                           i_checksum       IN VARCHAR2 := NULL) IS
    l_function CONSTANT VARCHAR2(30) := 'upd_usr_battle';
    --
    l_md5_bool   BOOLEAN := TRUE;
    l_rec_before api_usr_battle.pub_rec_usr_battle_type;
  BEGIN
    --
    l_rec_before := api_usr_battle.get_rec_usr_battle(i_id_usr_battle => i_rec_usr_battle.id_usr_battle);
    --
    IF i_checksum IS NOT NULL THEN
      l_md5_bool := do_check_md5_usr_battle(i_checksum       => i_checksum,
                                            i_rec_usr_battle => l_rec_before);
    END IF;
    --
    IF (i_checksum IS NULL) OR (l_md5_bool = TRUE) THEN
      UPDATE usr_battle
         SET usr_battle.id_usr_challenger    = i_rec_usr_battle.id_usr_challenger,
             usr_battle.id_usr_receiver      = i_rec_usr_battle.id_usr_receiver,
             usr_battle.highscore_challenger = i_rec_usr_battle.highscore_challenger,
             usr_battle.highscore_receiver   = i_rec_usr_battle.highscore_receiver
       WHERE id_usr_battle = i_rec_usr_battle.id_usr_battle;
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
  END upd_usr_battle;
  --
  /*************************************************************************
  * Purpose:  DELETES dataset of table usr_battle
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE del_usr_battle(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'del_usr_battle';
  BEGIN
    --
    DELETE FROM usr_battle
     WHERE usr_battle.id_usr_battle = i_id_usr_battle;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END del_usr_battle;
  --
  /****************************************************************************
  * Purpose:  Get Record of table usr_battle
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_rec_usr_battle(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN pub_rec_usr_battle_type IS
    l_function CONSTANT VARCHAR2(30) := 'get_rec_usr_battle';
    --
    l_retval pub_rec_usr_battle_type;
    CURSOR l_cur_usr_battle IS
      SELECT usr_battle.id_usr_battle,
             usr_battle.id_usr_challenger,
             usr_battle.id_usr_receiver,
             usr_battle.highscore_challenger,
             usr_battle.highscore_receiver
        FROM usr_battle
       WHERE usr_battle.id_usr_battle = i_id_usr_battle;
    l_rec_cur l_cur_usr_battle%ROWTYPE;
    --
  BEGIN
    --
    OPEN l_cur_usr_battle;
    FETCH l_cur_usr_battle
      INTO l_rec_cur;
    IF l_cur_usr_battle%FOUND THEN
      l_retval.id_usr_battle        := l_rec_cur.id_usr_battle;
      l_retval.id_usr_challenger    := l_rec_cur.id_usr_challenger;
      l_retval.id_usr_receiver      := l_rec_cur.id_usr_receiver;
      l_retval.highscore_challenger := l_rec_cur.highscore_challenger;
      l_retval.highscore_receiver   := l_rec_cur.highscore_receiver;
    END IF;
    CLOSE l_cur_usr_battle;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_rec_usr_battle;
  --
  /*************************************************************************
  * Purpose:  Generates md5 checksum for usr_battle using Record-type
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  *************************************************************************/
  FUNCTION get_md5_usr_battle(i_rec_usr_battle IN pub_rec_usr_battle_type)
    RETURN VARCHAR2 IS
    l_function CONSTANT VARCHAR2(30) := 'get_md5_usr_battle';
    --
    l_md5_string VARCHAR2(32000);
    l_rec_string CLOB;
    l_seperator  VARCHAR2(10) := '|';
  BEGIN
    --
    l_rec_string := i_rec_usr_battle.id_usr_battle || l_seperator ||
                    i_rec_usr_battle.id_usr_challenger || l_seperator ||
                    i_rec_usr_battle.id_usr_receiver || l_seperator ||
                    i_rec_usr_battle.highscore_challenger || l_seperator ||
                    i_rec_usr_battle.highscore_receiver || l_seperator;
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
  END get_md5_usr_battle;
  --
  /*************************************************************************
  * Purpose:  Compares (Before/After) md5 checksum of usr_battle
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  *************************************************************************/
  FUNCTION do_check_md5_usr_battle(i_checksum       IN VARCHAR2,
                                   i_rec_usr_battle IN pub_rec_usr_battle_type)
    RETURN BOOLEAN IS
    l_function CONSTANT VARCHAR2(30) := 'do_check_md5_usr_battle';
    --
    l_md5_string VARCHAR2(32000);
    l_return     BOOLEAN;
  BEGIN
    --
    l_md5_string := get_md5_usr_battle(i_rec_usr_battle => i_rec_usr_battle);
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
  END do_check_md5_usr_battle;
  --
  /****************************************************************************
  * Purpose:  Get usr_battle.id_usr_battle of usr_battle
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr_battle(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN usr_battle.id_usr_battle%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr_battle';
    --
    l_retval usr_battle.id_usr_battle%TYPE;
    CURSOR l_cur_usr_battle IS
      SELECT usr_battle.id_usr_battle
        FROM usr_battle
       WHERE usr_battle.id_usr_battle = i_id_usr_battle;
  BEGIN
    --
    OPEN l_cur_usr_battle;
    FETCH l_cur_usr_battle
      INTO l_retval;
    CLOSE l_cur_usr_battle;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_usr_battle;
  --

  /****************************************************************************
  * Purpose:  Get usr_battle.id_usr_challenger of usr_battle
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr_challenger(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN usr_battle.id_usr_challenger%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr_challenger';
    --
    l_retval usr_battle.id_usr_challenger%TYPE;
    CURSOR l_cur_usr_battle IS
      SELECT usr_battle.id_usr_challenger
        FROM usr_battle
       WHERE usr_battle.id_usr_battle = i_id_usr_battle;
  BEGIN
    --
    OPEN l_cur_usr_battle;
    FETCH l_cur_usr_battle
      INTO l_retval;
    CLOSE l_cur_usr_battle;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_usr_challenger;
  --

  /****************************************************************************
  * Purpose:  Get usr_battle.id_usr_receiver of usr_battle
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr_receiver(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN usr_battle.id_usr_receiver%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr_receiver';
    --
    l_retval usr_battle.id_usr_receiver%TYPE;
    CURSOR l_cur_usr_battle IS
      SELECT usr_battle.id_usr_receiver
        FROM usr_battle
       WHERE usr_battle.id_usr_battle = i_id_usr_battle;
  BEGIN
    --
    OPEN l_cur_usr_battle;
    FETCH l_cur_usr_battle
      INTO l_retval;
    CLOSE l_cur_usr_battle;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_usr_receiver;
  --

  /****************************************************************************
  * Purpose:  Get usr_battle.highscore_challenger of usr_battle
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_highscore_challenger(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN usr_battle.highscore_challenger%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_highscore_challenger';
    --
    l_retval usr_battle.highscore_challenger%TYPE;
    CURSOR l_cur_usr_battle IS
      SELECT usr_battle.highscore_challenger
        FROM usr_battle
       WHERE usr_battle.id_usr_battle = i_id_usr_battle;
  BEGIN
    --
    OPEN l_cur_usr_battle;
    FETCH l_cur_usr_battle
      INTO l_retval;
    CLOSE l_cur_usr_battle;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_highscore_challenger;
  --

  /****************************************************************************
  * Purpose:  Get usr_battle.highscore_receiver of usr_battle
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_highscore_receiver(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN usr_battle.highscore_receiver%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_highscore_receiver';
    --
    l_retval usr_battle.highscore_receiver%TYPE;
    CURSOR l_cur_usr_battle IS
      SELECT usr_battle.highscore_receiver
        FROM usr_battle
       WHERE usr_battle.id_usr_battle = i_id_usr_battle;
  BEGIN
    --
    OPEN l_cur_usr_battle;
    FETCH l_cur_usr_battle
      INTO l_retval;
    CLOSE l_cur_usr_battle;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_highscore_receiver;
  --
  /****************************************************************************
  * Purpose:  Get usr_battle.id_usr_battle from both id_usr
  * Author:   Daniel Hochleitner
  * Created:  22.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr_battle_users(i_id_usr_challenger IN usr_battle.id_usr_challenger%TYPE,
                                   i_id_usr_receiver   IN usr_battle.id_usr_receiver%TYPE)
    RETURN usr_battle.id_usr_battle%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr_battle_users';
    --
    l_retval usr_battle.id_usr_battle%TYPE;
    --
    CURSOR l_cur_usr_battle IS
      SELECT usr_battle.id_usr_battle
        FROM usr_battle
       WHERE usr_battle.id_usr_challenger = i_id_usr_challenger
         AND usr_battle.id_usr_receiver = i_id_usr_receiver;
    --
  BEGIN
    --
    OPEN l_cur_usr_battle;
    FETCH l_cur_usr_battle
      INTO l_retval;
    CLOSE l_cur_usr_battle;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_usr_battle_users;
  --
  /****************************************************************************
  * Purpose:  Insert User IDs when Battle not present (Battle Game Page)
  * Author:   Daniel Hochleitner
  * Created:  22.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION do_insert_usr_battle(i_id_usr_challenger IN usr_battle.id_usr_challenger%TYPE,
                                i_id_usr_receiver   IN usr_battle.id_usr_receiver%TYPE)
    RETURN usr_battle.id_usr_battle%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_insert_usr_battle';
    --
    l_id_usr_battle  usr_battle.id_usr_battle%TYPE;
    l_rec_usr_battle api_usr_battle.pub_rec_usr_battle_type;
    --
  BEGIN
    -- get ID if present
    l_id_usr_battle := api_usr_battle.get_id_usr_battle_users(i_id_usr_challenger => i_id_usr_challenger,
                                                              i_id_usr_receiver   => i_id_usr_receiver);
    --insert if id not found
    IF l_id_usr_battle IS NULL THEN
      l_rec_usr_battle.id_usr_challenger := i_id_usr_challenger;
      l_rec_usr_battle.id_usr_receiver   := i_id_usr_receiver;
      --
      l_id_usr_battle := api_usr_battle.ins_usr_battle(i_rec_usr_battle => l_rec_usr_battle);
    END IF;
    --
    RETURN l_id_usr_battle;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_insert_usr_battle;
  --
  /****************************************************************************
  * Purpose:  Check if ID_USR is challenger or receiver of battle
  * Author:   Daniel Hochleitner
  * Created:  22.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_challenger_receiver(i_id_usr        IN NUMBER,
                                     i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN VARCHAR2 IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_challenger_receiver';
    --
    l_retval VARCHAR2(10);
    --
    CURSOR l_cur_usr_battle IS
      SELECT usr_battle.id_usr_challenger,
             usr_battle.id_usr_receiver
        FROM usr_battle
       WHERE usr_battle.id_usr_battle = i_id_usr_battle;
    l_rec_usr_battle l_cur_usr_battle%ROWTYPE;
    --
  BEGIN
    --
    OPEN l_cur_usr_battle;
    FETCH l_cur_usr_battle
      INTO l_rec_usr_battle;
    CLOSE l_cur_usr_battle;
    -- Check which type has user
    IF i_id_usr = l_rec_usr_battle.id_usr_challenger THEN
      l_retval := 'C';
    ELSIF i_id_usr = l_rec_usr_battle.id_usr_receiver THEN
      l_retval := 'R';
    END IF;
    --
    RETURN l_retval;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END check_challenger_receiver;
  --
  /****************************************************************************
  * Purpose:  Check if Highscore if ID_USR is better than opposite
  * Author:   Daniel Hochleitner
  * Created:  24.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_better_highscore(i_id_usr        IN NUMBER,
                                  i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_better_highscore';
    --
    l_retval BOOLEAN;
    l_type   VARCHAR2(10);
    --
    CURSOR l_cur_usr_battle IS
      SELECT usr_battle.highscore_challenger,
             usr_battle.highscore_receiver
        FROM usr_battle
       WHERE usr_battle.id_usr_battle = i_id_usr_battle;
    l_rec_usr_battle l_cur_usr_battle%ROWTYPE;
    --
  BEGIN
    --
    -- get correct usr type
    l_type := api_usr_battle.check_challenger_receiver(i_id_usr        => i_id_usr,
                                                       i_id_usr_battle => i_id_usr_battle);
    --
    -- get user ids from corsor
    OPEN l_cur_usr_battle;
    FETCH l_cur_usr_battle
      INTO l_rec_usr_battle;
    CLOSE l_cur_usr_battle;
    -- when R check if highscore of receiver is better
    IF l_type = 'R' THEN
      IF nvl(l_rec_usr_battle.highscore_receiver,
             0) > nvl(l_rec_usr_battle.highscore_challenger,
                      0) THEN
        l_retval := TRUE;
      ELSE
        l_retval := FALSE;
      END IF;
      -- when C check if highscore of challenger is better
    ELSIF l_type = 'C' THEN
      IF nvl(l_rec_usr_battle.highscore_challenger,
             0) > nvl(l_rec_usr_battle.highscore_receiver,
                      0) THEN
        l_retval := TRUE;
      ELSE
        l_retval := FALSE;
      END IF;
    END IF;
    --
    RETURN l_retval;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END check_better_highscore;
  --
  /****************************************************************************
  * Purpose:  Check if open incoming Battles are present
  * Author:   Daniel Hochleitner
  * Created:  22.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_open_battle(i_id_usr IN NUMBER) RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_open_battle';
    --
    l_id_usr_battle usr_battle.id_usr_battle%TYPE;
    l_retval        BOOLEAN;
    --
    CURSOR l_cur_usr_battle IS
      SELECT usr_battle.id_usr_battle
        FROM usr_battle
       WHERE usr_battle.id_usr_receiver = i_id_usr
         AND usr_battle.highscore_challenger IS NOT NULL
         AND usr_battle.highscore_receiver IS NULL;
    --
  BEGIN
    --
    OPEN l_cur_usr_battle;
    FETCH l_cur_usr_battle
      INTO l_id_usr_battle;
    -- Check if open battles are present
    IF l_cur_usr_battle%FOUND THEN
      l_retval := TRUE;
    ELSE
      l_retval := FALSE;
    END IF;
    CLOSE l_cur_usr_battle;
    --
    RETURN l_retval;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END check_open_battle;
  --
  /****************************************************************************
  * Purpose:  Set Highscore of user battle per user
  * Author:   Daniel Hochleitner
  * Created:  22.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_set_usr_highscore(i_id_usr        IN NUMBER,
                                 i_id_usr_battle IN usr_battle.id_usr_battle%TYPE,
                                 i_highscore     IN NUMBER) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_set_usr_highscore';
    --
    l_type                 VARCHAR2(10);
    l_global_usr_highscore usr.usr_highscore%TYPE;
    l_rec_usr_battle       api_usr_battle.pub_rec_usr_battle_type;
    --
  BEGIN
    --
    -- get correct usr type
    l_type := api_usr_battle.check_challenger_receiver(i_id_usr        => i_id_usr,
                                                       i_id_usr_battle => i_id_usr_battle);
    --
    -- update usr_battle highscore
    -- get record
    l_rec_usr_battle := api_usr_battle.get_rec_usr_battle(i_id_usr_battle => i_id_usr_battle);
    -- challenger
    IF l_type = 'C' THEN
      l_rec_usr_battle.highscore_challenger := i_highscore;
      -- receiver
    ELSIF l_type = 'R' THEN
      l_rec_usr_battle.highscore_receiver := i_highscore;
    END IF;
    -- update
    api_usr_battle.upd_usr_battle(i_rec_usr_battle => l_rec_usr_battle);
    --
    -- GLOBAL usr highscore
    l_global_usr_highscore := nvl(api_usr.get_usr_highscore(i_id_usr => i_id_usr),
                                  0);
    -- update only if i_highscore is bigger
    IF i_highscore > l_global_usr_highscore THEN
      api_usr.do_set_usr_highscore(i_id_usr        => i_id_usr,
                                   i_usr_highscore => i_highscore);
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_set_usr_highscore;
  --
  /****************************************************************************
  * Purpose:  Fill items on battle details page
  * Author:   Daniel Hochleitner
  * Created:  23.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_fill_battle_details(i_id_usr_battle         IN usr_battle.id_usr_battle%TYPE,
                                   o_id_usr_challenger     OUT usr_battle.id_usr_challenger%TYPE,
                                   o_id_usr_receiver       OUT usr_battle.id_usr_receiver%TYPE,
                                   o_name_chall            OUT VARCHAR2,
                                   o_name_rec              OUT VARCHAR2,
                                   o_twitter_name_chall    OUT usr.twitter_name%TYPE,
                                   o_twitter_name_rec      OUT usr.twitter_name%TYPE,
                                   o_profile_pic_url_chall OUT usr.twitter_profile_pic_url%TYPE,
                                   o_profile_pic_url_rec   OUT usr.twitter_profile_pic_url%TYPE,
                                   o_highscore_challenger  OUT usr_battle.highscore_challenger%TYPE,
                                   o_highscore_receiver    OUT usr_battle.highscore_receiver%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_set_usr_highscore';
    --
    l_rec_usr_battle   api_usr_battle.pub_rec_usr_battle_type;
    l_rec_usr_chall    api_usr.pub_rec_usr_type;
    l_rec_usr_rec      api_usr.pub_rec_usr_type;
    l_crappy_home_path VARCHAR2(200);
    --
  BEGIN
    --
    -- get records
    l_rec_usr_battle := api_usr_battle.get_rec_usr_battle(i_id_usr_battle => i_id_usr_battle);
    l_rec_usr_chall  := api_usr.get_rec_usr(i_id_usr => l_rec_usr_battle.id_usr_challenger);
    l_rec_usr_rec    := api_usr.get_rec_usr(i_id_usr => l_rec_usr_battle.id_usr_receiver);
    --
    -- crappybird image path
    l_crappy_home_path := REPLACE(v('CRAPPY_HOME'),
                                  '#IMAGE_PREFIX#',
                                  v('IMAGE_PREFIX'));
    -- set out parameter
    -- challenger
    o_id_usr_challenger     := l_rec_usr_battle.id_usr_challenger;
    o_name_chall            := l_rec_usr_chall.usr_firstname || ' ' ||
                               l_rec_usr_chall.usr_lastname;
    o_twitter_name_chall    := l_rec_usr_chall.twitter_name;
    o_highscore_challenger  := nvl(l_rec_usr_battle.highscore_challenger,
                                   0);
    o_profile_pic_url_chall := nvl(l_rec_usr_chall.twitter_profile_pic_url,
                                   l_crappy_home_path ||
                                   'img/avatar-placeholder.png');
    -- receiver
    o_id_usr_receiver     := l_rec_usr_battle.id_usr_receiver;
    o_name_rec            := l_rec_usr_rec.usr_firstname || ' ' ||
                             l_rec_usr_rec.usr_lastname;
    o_twitter_name_rec    := l_rec_usr_rec.twitter_name;
    o_highscore_receiver  := nvl(l_rec_usr_battle.highscore_receiver,
                                 0);
    o_profile_pic_url_rec := nvl(l_rec_usr_rec.twitter_profile_pic_url,
                                 l_crappy_home_path ||
                                 'img/avatar-placeholder.png');
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_fill_battle_details;
  --
  /****************************************************************************
  * Purpose:  Send email when Challenger-User starts a new Battle with Receiver
  * Author:   Daniel Hochleitner
  * Created:  14.09.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_send_new_battle_mail(i_id_usr_challenger IN usr_battle.id_usr_challenger%TYPE,
                                    i_id_usr_receiver   IN usr_battle.id_usr_receiver%TYPE,
                                    i_software_url      IN VARCHAR2) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_send_new_battle_mail';
    --
    PRAGMA AUTONOMOUS_TRANSACTION;
    --
    l_name_challenger usr.usr_firstname%TYPE;
    l_email_receiver  usr.usr_email%TYPE;
    l_id_usr_battle   usr_battle.id_usr_battle%TYPE;
    --
    l_id_mail NUMBER;
    --
  BEGIN
    --
    -- get vars
    l_name_challenger := api_usr.get_usr_firstname(i_id_usr => i_id_usr_challenger) || ' ' ||
                         api_usr.get_usr_lastname(i_id_usr => i_id_usr_challenger);
    l_email_receiver  := api_usr.get_usr_email(i_id_usr => i_id_usr_receiver);
    l_id_usr_battle   := api_usr_battle.get_id_usr_battle_users(i_id_usr_challenger => i_id_usr_challenger,
                                                                i_id_usr_receiver   => i_id_usr_receiver);
    --
    -- send email to receiver (only if no battle before)
    IF l_id_usr_battle IS NULL THEN
      l_id_mail := api_mail.send_mail(i_from    => api_system.get_email_from(i_id_system => api_system.pubc_system_pk),
                                      i_to      => l_email_receiver,
                                      i_subject => 'New CrappyBird Battle',
                                      i_body    => 'User ' ||
                                                   l_name_challenger ||
                                                   ' has just started a new battle with you!' ||
                                                   chr(10) ||
                                                   'Fight back and click the Link ' ||
                                                   i_software_url ||
                                                   ' or open CrappyBird from your Homescreen!');
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_send_new_battle_mail;
  --
END api_usr_battle;
/

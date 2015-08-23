CREATE OR REPLACE PACKAGE BODY api_usr_tw_friends IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_usr_tw_friends';
  --
  /*************************************************************************
  * Purpose:  INSERTS dataset into usr_tw_friends and returns PK
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  *************************************************************************/
  FUNCTION ins_usr_tw_friends(i_rec_usr_tw_friends IN pub_rec_usr_tw_friends_type)
    RETURN usr_tw_friends.id_usr_tw_friends%TYPE IS
    l_function CONSTANT VARCHAR2(30) := 'ins_usr_tw_friends';
    --
    l_id_usr_tw_friends usr_tw_friends.id_usr_tw_friends%TYPE;
  BEGIN
    --
    -- if id_usr_tw_friends not present,
    -- get next value of Sequence
    --
    IF i_rec_usr_tw_friends.id_usr_tw_friends IS NULL THEN
      l_id_usr_tw_friends := seq_pk.nextval;
    ELSE
      l_id_usr_tw_friends := i_rec_usr_tw_friends.id_usr_tw_friends;
    END IF;
    --
    INSERT INTO usr_tw_friends
      (usr_tw_friends.id_usr_tw_friends,
       usr_tw_friends.id_usr,
       usr_tw_friends.id_usr_friend,
       usr_tw_friends.usr_friend_twitter_id)
    VALUES
      (l_id_usr_tw_friends,
       i_rec_usr_tw_friends.id_usr,
       i_rec_usr_tw_friends.id_usr_friend,
       i_rec_usr_tw_friends.usr_friend_twitter_id);
    --
    RETURN l_id_usr_tw_friends;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END ins_usr_tw_friends;
  --
  /*************************************************************************
  * Purpose:  UPDATES dataset of table usr_tw_friends
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE upd_usr_tw_friends(i_rec_usr_tw_friends IN pub_rec_usr_tw_friends_type,
                               i_checksum           IN VARCHAR2 := NULL) IS
    l_function CONSTANT VARCHAR2(30) := 'upd_usr_tw_friends';
    --
    l_md5_bool   BOOLEAN := TRUE;
    l_rec_before api_usr_tw_friends.pub_rec_usr_tw_friends_type;
  BEGIN
    --
    l_rec_before := api_usr_tw_friends.get_rec_usr_tw_friends(i_id_usr_tw_friends => i_rec_usr_tw_friends.id_usr_tw_friends);
    --
    IF i_checksum IS NOT NULL THEN
      l_md5_bool := do_check_md5_usr_tw_friends(i_checksum           => i_checksum,
                                                i_rec_usr_tw_friends => l_rec_before);
    END IF;
    --
    IF (i_checksum IS NULL) OR (l_md5_bool = TRUE) THEN
      UPDATE usr_tw_friends
         SET usr_tw_friends.id_usr                = i_rec_usr_tw_friends.id_usr,
             usr_tw_friends.id_usr_friend         = i_rec_usr_tw_friends.id_usr_friend,
             usr_tw_friends.usr_friend_twitter_id = i_rec_usr_tw_friends.usr_friend_twitter_id
       WHERE id_usr_tw_friends = i_rec_usr_tw_friends.id_usr_tw_friends;
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
  END upd_usr_tw_friends;
  --
  /*************************************************************************
  * Purpose:  DELETES dataset of table usr_tw_friends
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE del_usr_tw_friends(i_id_usr_tw_friends IN usr_tw_friends.id_usr_tw_friends%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'del_usr_tw_friends';
  BEGIN
    --
    DELETE FROM usr_tw_friends
     WHERE usr_tw_friends.id_usr_tw_friends = i_id_usr_tw_friends;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END del_usr_tw_friends;
  --
  /*************************************************************************
  * Purpose:  DELETES all rows from table usr_tw_friends per user
  * Author:   Daniel Hochleitner
  * Created:  18.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE del_usr_tw_friends_per_usr(i_id_usr IN usr_tw_friends.id_usr%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'del_usr_tw_friends_per_usr';
  BEGIN
    --
    DELETE FROM usr_tw_friends
     WHERE usr_tw_friends.id_usr = i_id_usr;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END del_usr_tw_friends_per_usr;
  --
  /****************************************************************************
  * Purpose:  Get Record of table usr_tw_friends
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_rec_usr_tw_friends(i_id_usr_tw_friends IN usr_tw_friends.id_usr_tw_friends%TYPE)
    RETURN pub_rec_usr_tw_friends_type IS
    l_function CONSTANT VARCHAR2(30) := 'get_rec_usr_tw_friends';
    --
    l_retval pub_rec_usr_tw_friends_type;
    CURSOR l_cur_usr_tw_friends IS
      SELECT usr_tw_friends.id_usr_tw_friends,
             usr_tw_friends.id_usr,
             usr_tw_friends.id_usr_friend,
             usr_tw_friends.usr_friend_twitter_id
        FROM usr_tw_friends
       WHERE usr_tw_friends.id_usr_tw_friends = i_id_usr_tw_friends;
    l_rec_cur l_cur_usr_tw_friends%ROWTYPE;
    --
  BEGIN
    --
    OPEN l_cur_usr_tw_friends;
    FETCH l_cur_usr_tw_friends
      INTO l_rec_cur;
    IF l_cur_usr_tw_friends%FOUND THEN
      l_retval.id_usr_tw_friends     := l_rec_cur.id_usr_tw_friends;
      l_retval.id_usr                := l_rec_cur.id_usr;
      l_retval.id_usr_friend         := l_rec_cur.id_usr_friend;
      l_retval.usr_friend_twitter_id := l_rec_cur.usr_friend_twitter_id;
    END IF;
    CLOSE l_cur_usr_tw_friends;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_rec_usr_tw_friends;
  --
  /*************************************************************************
  * Purpose:  Generates md5 checksum for usr_tw_friends using Record-type
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  *************************************************************************/
  FUNCTION get_md5_usr_tw_friends(i_rec_usr_tw_friends IN pub_rec_usr_tw_friends_type)
    RETURN VARCHAR2 IS
    l_function CONSTANT VARCHAR2(30) := 'get_md5_usr_tw_friends';
    --
    l_md5_string VARCHAR2(32000);
    l_rec_string CLOB;
    l_seperator  VARCHAR2(10) := '|';
  BEGIN
    --
    l_rec_string := i_rec_usr_tw_friends.id_usr_tw_friends || l_seperator ||
                    i_rec_usr_tw_friends.id_usr || l_seperator ||
                    i_rec_usr_tw_friends.id_usr_friend || l_seperator ||
                    i_rec_usr_tw_friends.usr_friend_twitter_id ||
                    l_seperator;
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
  END get_md5_usr_tw_friends;
  --
  /*************************************************************************
  * Purpose:  Compares (Before/After) md5 checksum of usr_tw_friends
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  *************************************************************************/
  FUNCTION do_check_md5_usr_tw_friends(i_checksum           IN VARCHAR2,
                                       i_rec_usr_tw_friends IN pub_rec_usr_tw_friends_type)
    RETURN BOOLEAN IS
    l_function CONSTANT VARCHAR2(30) := 'do_check_md5_usr_tw_friends';
    --
    l_md5_string VARCHAR2(32000);
    l_return     BOOLEAN;
  BEGIN
    --
    l_md5_string := get_md5_usr_tw_friends(i_rec_usr_tw_friends => i_rec_usr_tw_friends);
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
  END do_check_md5_usr_tw_friends;
  --
  /****************************************************************************
  * Purpose:  Get usr_tw_friends.id_usr_tw_friends of usr_tw_friends
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr_tw_friends(i_id_usr_tw_friends IN usr_tw_friends.id_usr_tw_friends%TYPE)
    RETURN usr_tw_friends.id_usr_tw_friends%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr_tw_friends';
    --
    l_retval usr_tw_friends.id_usr_tw_friends%TYPE;
    CURSOR l_cur_usr_tw_friends IS
      SELECT usr_tw_friends.id_usr_tw_friends
        FROM usr_tw_friends
       WHERE usr_tw_friends.id_usr_tw_friends = i_id_usr_tw_friends;
  BEGIN
    --
    OPEN l_cur_usr_tw_friends;
    FETCH l_cur_usr_tw_friends
      INTO l_retval;
    CLOSE l_cur_usr_tw_friends;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_usr_tw_friends;
  --

  /****************************************************************************
  * Purpose:  Get usr_tw_friends.id_usr of usr_tw_friends
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr(i_id_usr_tw_friends IN usr_tw_friends.id_usr_tw_friends%TYPE)
    RETURN usr_tw_friends.id_usr%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr';
    --
    l_retval usr_tw_friends.id_usr%TYPE;
    CURSOR l_cur_usr_tw_friends IS
      SELECT usr_tw_friends.id_usr
        FROM usr_tw_friends
       WHERE usr_tw_friends.id_usr_tw_friends = i_id_usr_tw_friends;
  BEGIN
    --
    OPEN l_cur_usr_tw_friends;
    FETCH l_cur_usr_tw_friends
      INTO l_retval;
    CLOSE l_cur_usr_tw_friends;
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
  * Purpose:  Get usr_tw_friends.id_usr_friend of usr_tw_friends
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr_friend(i_id_usr_tw_friends IN usr_tw_friends.id_usr_tw_friends%TYPE)
    RETURN usr_tw_friends.id_usr_friend%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr_friend';
    --
    l_retval usr_tw_friends.id_usr_friend%TYPE;
    CURSOR l_cur_usr_tw_friends IS
      SELECT usr_tw_friends.id_usr_friend
        FROM usr_tw_friends
       WHERE usr_tw_friends.id_usr_tw_friends = i_id_usr_tw_friends;
  BEGIN
    --
    OPEN l_cur_usr_tw_friends;
    FETCH l_cur_usr_tw_friends
      INTO l_retval;
    CLOSE l_cur_usr_tw_friends;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_usr_friend;
  --

  /****************************************************************************
  * Purpose:  Get usr_tw_friends.usr_friend_twitter_id of usr_tw_friends
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_usr_friend_twitter_id(i_id_usr_tw_friends IN usr_tw_friends.id_usr_tw_friends%TYPE)
    RETURN usr_tw_friends.usr_friend_twitter_id%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_usr_friend_twitter_id';
    --
    l_retval usr_tw_friends.usr_friend_twitter_id%TYPE;
    CURSOR l_cur_usr_tw_friends IS
      SELECT usr_tw_friends.usr_friend_twitter_id
        FROM usr_tw_friends
       WHERE usr_tw_friends.id_usr_tw_friends = i_id_usr_tw_friends;
  BEGIN
    --
    OPEN l_cur_usr_tw_friends;
    FETCH l_cur_usr_tw_friends
      INTO l_retval;
    CLOSE l_cur_usr_tw_friends;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_usr_friend_twitter_id;
  --

--
END api_usr_tw_friends;
/

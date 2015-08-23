CREATE OR REPLACE PACKAGE BODY api_usr_token IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_usr_token';
  --
  /*************************************************************************
  * Purpose:  INSERTS dataset into usr_token and returns PK
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  FUNCTION ins_usr_token(i_rec_usr_token IN pub_rec_usr_token_type)
    RETURN usr_token.id_usr_token%TYPE IS
    l_function CONSTANT VARCHAR2(30) := 'ins_usr_token';
    --
    l_id_usr_token usr_token.id_usr_token%TYPE;
  BEGIN
    --
    -- if id_usr_token not present,
    -- get next value of Sequence
    --
    IF i_rec_usr_token.id_usr_token IS NULL THEN
      l_id_usr_token := seq_pk.nextval;
    ELSE
      l_id_usr_token := i_rec_usr_token.id_usr_token;
    END IF;
    --
    INSERT INTO usr_token
      (usr_token.id_usr_token,
       usr_token.id_usr,
       usr_token.token,
       usr_token.token_date)
    VALUES
      (l_id_usr_token,
       i_rec_usr_token.id_usr,
       i_rec_usr_token.token,
       i_rec_usr_token.token_date);
    --
    RETURN l_id_usr_token;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END ins_usr_token;
  --
  /*************************************************************************
  * Purpose:  UPDATES dataset of table usr_token
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE upd_usr_token(i_rec_usr_token IN pub_rec_usr_token_type,
                          i_checksum      IN VARCHAR2 := NULL) IS
    l_function CONSTANT VARCHAR2(30) := 'upd_usr_token';
    --
    l_md5_bool   BOOLEAN := TRUE;
    l_rec_before api_usr_token.pub_rec_usr_token_type;
  BEGIN
    --
    l_rec_before := api_usr_token.get_rec_usr_token(i_id_usr_token => i_rec_usr_token.id_usr_token);
    --
    IF i_checksum IS NOT NULL THEN
      l_md5_bool := do_check_md5_usr_token(i_checksum      => i_checksum,
                                           i_rec_usr_token => l_rec_before);
    END IF;
    --
    IF (i_checksum IS NULL) OR (l_md5_bool = TRUE) THEN
      UPDATE usr_token
         SET usr_token.id_usr     = i_rec_usr_token.id_usr,
             usr_token.token      = i_rec_usr_token.token,
             usr_token.token_date = i_rec_usr_token.token_date
       WHERE id_usr_token = i_rec_usr_token.id_usr_token;
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
  END upd_usr_token;
  --
  /*************************************************************************
  * Purpose:  DELETES dataset of table usr_token
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE del_usr_token(i_id_usr_token IN usr_token.id_usr_token%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'del_usr_token';
  BEGIN
    --
    DELETE FROM usr_token
     WHERE usr_token.id_usr_token = i_id_usr_token;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END del_usr_token;
  --
  /****************************************************************************
  * Purpose:  Get Record of table usr_token
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_rec_usr_token(i_id_usr_token IN usr_token.id_usr_token%TYPE)
    RETURN pub_rec_usr_token_type IS
    l_function CONSTANT VARCHAR2(30) := 'get_rec_usr_token';
    --
    l_retval pub_rec_usr_token_type;
    CURSOR l_cur_usr_token IS
      SELECT usr_token.id_usr_token,
             usr_token.id_usr,
             usr_token.token,
             usr_token.token_date
        FROM usr_token
       WHERE usr_token.id_usr_token = i_id_usr_token;
    l_rec_cur l_cur_usr_token%ROWTYPE;
    --
  BEGIN
    --
    OPEN l_cur_usr_token;
    FETCH l_cur_usr_token
      INTO l_rec_cur;
    IF l_cur_usr_token%FOUND THEN
      l_retval.id_usr_token := l_rec_cur.id_usr_token;
      l_retval.id_usr       := l_rec_cur.id_usr;
      l_retval.token        := l_rec_cur.token;
      l_retval.token_date   := l_rec_cur.token_date;
    END IF;
    CLOSE l_cur_usr_token;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_rec_usr_token;
  --
  /*************************************************************************
  * Purpose:  Generates md5 checksum for usr_token using Record-type
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  FUNCTION get_md5_usr_token(i_rec_usr_token IN pub_rec_usr_token_type)
    RETURN VARCHAR2 IS
    l_function CONSTANT VARCHAR2(30) := 'get_md5_usr_token';
    --
    l_md5_string VARCHAR2(32000);
    l_rec_string CLOB;
    l_seperator  VARCHAR2(10) := '|';
  BEGIN
    --
    l_rec_string := i_rec_usr_token.id_usr_token || l_seperator ||
                    i_rec_usr_token.id_usr || l_seperator ||
                    i_rec_usr_token.token || l_seperator ||
                    i_rec_usr_token.token_date || l_seperator;
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
  END get_md5_usr_token;
  --
  /*************************************************************************
  * Purpose:  Compares (Before/After) md5 checksum of usr_token
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  FUNCTION do_check_md5_usr_token(i_checksum      IN VARCHAR2,
                                  i_rec_usr_token IN pub_rec_usr_token_type)
    RETURN BOOLEAN IS
    l_function CONSTANT VARCHAR2(30) := 'do_check_md5_usr_token';
    --
    l_md5_string VARCHAR2(32000);
    l_return     BOOLEAN;
  BEGIN
    --
    l_md5_string := get_md5_usr_token(i_rec_usr_token => i_rec_usr_token);
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
  END do_check_md5_usr_token;
  --
  /****************************************************************************
  * Purpose:  Get usr_token.id_usr_token of usr_token
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr_token(i_id_usr_token IN usr_token.id_usr_token%TYPE)
    RETURN usr_token.id_usr_token%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr_token';
    --
    l_retval usr_token.id_usr_token%TYPE;
    CURSOR l_cur_usr_token IS
      SELECT usr_token.id_usr_token
        FROM usr_token
       WHERE usr_token.id_usr_token = i_id_usr_token;
  BEGIN
    --
    OPEN l_cur_usr_token;
    FETCH l_cur_usr_token
      INTO l_retval;
    CLOSE l_cur_usr_token;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_usr_token;
  --

  /****************************************************************************
  * Purpose:  Get usr_token.id_usr of usr_token
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr(i_id_usr_token IN usr_token.id_usr_token%TYPE)
    RETURN usr_token.id_usr%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr';
    --
    l_retval usr_token.id_usr%TYPE;
    CURSOR l_cur_usr_token IS
      SELECT usr_token.id_usr
        FROM usr_token
       WHERE usr_token.id_usr_token = i_id_usr_token;
  BEGIN
    --
    OPEN l_cur_usr_token;
    FETCH l_cur_usr_token
      INTO l_retval;
    CLOSE l_cur_usr_token;
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
  * Purpose:  Get usr_token.token of usr_token
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_token(i_id_usr_token IN usr_token.id_usr_token%TYPE)
    RETURN usr_token.token%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_token';
    --
    l_retval usr_token.token%TYPE;
    CURSOR l_cur_usr_token IS
      SELECT usr_token.token
        FROM usr_token
       WHERE usr_token.id_usr_token = i_id_usr_token;
  BEGIN
    --
    OPEN l_cur_usr_token;
    FETCH l_cur_usr_token
      INTO l_retval;
    CLOSE l_cur_usr_token;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_token;
  --

  /****************************************************************************
  * Purpose:  Get usr_token.token_date of usr_token
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_token_date(i_id_usr_token IN usr_token.id_usr_token%TYPE)
    RETURN usr_token.token_date%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_token_date';
    --
    l_retval usr_token.token_date%TYPE;
    CURSOR l_cur_usr_token IS
      SELECT usr_token.token_date
        FROM usr_token
       WHERE usr_token.id_usr_token = i_id_usr_token;
  BEGIN
    --
    OPEN l_cur_usr_token;
    FETCH l_cur_usr_token
      INTO l_retval;
    CLOSE l_cur_usr_token;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_token_date;
  --
  /****************************************************************************
  * Purpose:  Ckeck if a User Token is Valid (Default Time: Sysdate - 60 minutes)
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_token_valid(i_id_usr      IN usr_token.id_usr%TYPE,
                             i_token       usr_token.token%TYPE,
                             i_default_min IN NUMBER := 60) RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_token_valid';
    --
    l_retval       BOOLEAN;
    l_id_usr_token usr_token.id_usr_token%TYPE;
    --
    CURSOR l_cur_usr_token IS
      SELECT usr_token.id_usr_token
        FROM usr_token
       WHERE usr_token.id_usr = i_id_usr
         AND usr_token.token = TRIM(i_token)
         AND usr_token.token_date BETWEEN
             (SYSDATE - (nvl(i_default_min,
                             60) / (24 * 60))) AND SYSDATE
       ORDER BY 1 DESC;
    --
  BEGIN
    --
    OPEN l_cur_usr_token;
    FETCH l_cur_usr_token
      INTO l_id_usr_token;
    --
    IF l_cur_usr_token%FOUND THEN
      l_retval := TRUE;
    ELSE
      l_retval := FALSE;
    END IF;
    CLOSE l_cur_usr_token;
    --
    RETURN l_retval;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END check_token_valid;
  --
  /*************************************************************************
  * Purpose:  DELETES all tokens from specified user
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE del_token_per_usr(i_id_usr IN usr_token.id_usr%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'del_token_per_usr';
  BEGIN
    --
    DELETE FROM usr_token
     WHERE usr_token.id_usr = i_id_usr;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END del_token_per_usr;
  --
END api_usr_token;
/

CREATE OR REPLACE PACKAGE BODY api_system IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_system';
  --

  --
  -- Functions for constants
  --
  FUNCTION getc_system_pk RETURN NUMBER IS
  BEGIN
    RETURN pubc_system_pk;
  END getc_system_pk;
  --
  /*************************************************************************
  * Purpose:  INSERTS dataset into system and returns PK
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  FUNCTION ins_system(i_rec_system IN pub_rec_system_type)
    RETURN system.id_system%TYPE IS
    l_function CONSTANT VARCHAR2(30) := 'ins_system';
    --
    l_id_system system.id_system%TYPE;
  BEGIN
    --
    -- if id_system not present,
    -- get next value of Sequence
    --
    IF i_rec_system.id_system IS NULL THEN
      l_id_system := seq_pk.nextval;
    ELSE
      l_id_system := i_rec_system.id_system;
    END IF;
    --
    INSERT INTO system
      (system.id_system,
       system.twitter_consumer_key,
       system.twitter_consumer_secret,
       system.twitter_api_bearer,
       system.twitter_ssl_wallet_path,
       system.twitter_ssl_wallet_pwd,
       system.email_from,
       system.email_register_subject,
       system.email_register_text,
       system.email_usrpwd_subject,
       system.email_usrpwd_text)
    VALUES
      (l_id_system,
       i_rec_system.twitter_consumer_key,
       i_rec_system.twitter_consumer_secret,
       i_rec_system.twitter_api_bearer,
       i_rec_system.twitter_ssl_wallet_path,
       i_rec_system.twitter_ssl_wallet_pwd,
       i_rec_system.email_from,
       i_rec_system.email_register_subject,
       i_rec_system.email_register_text,
       i_rec_system.email_usrpwd_subject,
       i_rec_system.email_usrpwd_text);
    --
    RETURN l_id_system;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END ins_system;
  --
  /*************************************************************************
  * Purpose:  UPDATES dataset of table system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE upd_system(i_rec_system IN pub_rec_system_type,
                       i_checksum   IN VARCHAR2 := NULL) IS
    l_function CONSTANT VARCHAR2(30) := 'upd_system';
    --
    l_md5_bool   BOOLEAN := TRUE;
    l_rec_before api_system.pub_rec_system_type;
  BEGIN
    --
    l_rec_before := api_system.get_rec_system(i_id_system => i_rec_system.id_system);
    --
    IF i_checksum IS NOT NULL THEN
      l_md5_bool := do_check_md5_system(i_checksum   => i_checksum,
                                        i_rec_system => l_rec_before);
    END IF;
    --
    IF (i_checksum IS NULL) OR (l_md5_bool = TRUE) THEN
      UPDATE system
         SET system.twitter_consumer_key    = i_rec_system.twitter_consumer_key,
             system.twitter_consumer_secret = i_rec_system.twitter_consumer_secret,
             system.twitter_api_bearer      = i_rec_system.twitter_api_bearer,
             system.twitter_ssl_wallet_path = i_rec_system.twitter_ssl_wallet_path,
             system.twitter_ssl_wallet_pwd  = i_rec_system.twitter_ssl_wallet_pwd,
             system.email_from              = i_rec_system.email_from,
             system.email_register_subject  = i_rec_system.email_register_subject,
             system.email_register_text     = i_rec_system.email_register_text,
             system.email_usrpwd_subject    = i_rec_system.email_usrpwd_subject,
             system.email_usrpwd_text       = i_rec_system.email_usrpwd_text
       WHERE id_system = i_rec_system.id_system;
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
  END upd_system;
  --
  /*************************************************************************
  * Purpose:  DELETES dataset of table system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE del_system(i_id_system IN system.id_system%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'del_system';
  BEGIN
    --
    DELETE FROM system
     WHERE system.id_system = i_id_system;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END del_system;
  --
  /****************************************************************************
  * Purpose:  Get Record of table system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_rec_system(i_id_system IN system.id_system%TYPE)
    RETURN pub_rec_system_type IS
    l_function CONSTANT VARCHAR2(30) := 'get_rec_system';
    --
    l_retval pub_rec_system_type;
    CURSOR l_cur_system IS
      SELECT system.id_system,
             system.twitter_consumer_key,
             system.twitter_consumer_secret,
             system.twitter_api_bearer,
             system.twitter_ssl_wallet_path,
             system.twitter_ssl_wallet_pwd,
             system.email_from,
             system.email_register_subject,
             system.email_register_text,
             system.email_usrpwd_subject,
             system.email_usrpwd_text
        FROM system
       WHERE system.id_system = i_id_system;
    l_rec_cur l_cur_system%ROWTYPE;
    --
  BEGIN
    --
    OPEN l_cur_system;
    FETCH l_cur_system
      INTO l_rec_cur;
    IF l_cur_system%FOUND THEN
      l_retval.id_system               := l_rec_cur.id_system;
      l_retval.twitter_consumer_key    := l_rec_cur.twitter_consumer_key;
      l_retval.twitter_consumer_secret := l_rec_cur.twitter_consumer_secret;
      l_retval.twitter_api_bearer      := l_rec_cur.twitter_api_bearer;
      l_retval.twitter_ssl_wallet_path := l_rec_cur.twitter_ssl_wallet_path;
      l_retval.twitter_ssl_wallet_pwd  := l_rec_cur.twitter_ssl_wallet_pwd;
      l_retval.email_from              := l_rec_cur.email_from;
      l_retval.email_register_subject  := l_rec_cur.email_register_subject;
      l_retval.email_register_text     := l_rec_cur.email_register_text;
      l_retval.email_usrpwd_subject    := l_rec_cur.email_usrpwd_subject;
      l_retval.email_usrpwd_text       := l_rec_cur.email_usrpwd_text;
    END IF;
    CLOSE l_cur_system;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_rec_system;
  --
  /*************************************************************************
  * Purpose:  Generates md5 checksum for system using Record-type
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  FUNCTION get_md5_system(i_rec_system IN pub_rec_system_type)
    RETURN VARCHAR2 IS
    l_function CONSTANT VARCHAR2(30) := 'get_md5_system';
    --
    l_md5_string VARCHAR2(32000);
    l_rec_string CLOB;
    l_seperator  VARCHAR2(10) := '|';
  BEGIN
    --
    l_rec_string := i_rec_system.id_system || l_seperator ||
                    i_rec_system.twitter_consumer_key || l_seperator ||
                    i_rec_system.twitter_consumer_secret || l_seperator ||
                    i_rec_system.twitter_api_bearer || l_seperator ||
                    i_rec_system.twitter_ssl_wallet_path || l_seperator ||
                    i_rec_system.twitter_ssl_wallet_pwd || l_seperator ||
                    i_rec_system.email_from || l_seperator ||
                    i_rec_system.email_register_subject || l_seperator ||
                    i_rec_system.email_register_text || l_seperator ||
                    i_rec_system.email_usrpwd_subject || l_seperator ||
                    i_rec_system.email_usrpwd_text || l_seperator;
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
  END get_md5_system;
  --
  /*************************************************************************
  * Purpose:  Compares (Before/After) md5 checksum of system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  FUNCTION do_check_md5_system(i_checksum   IN VARCHAR2,
                               i_rec_system IN pub_rec_system_type)
    RETURN BOOLEAN IS
    l_function CONSTANT VARCHAR2(30) := 'do_check_md5_system';
    --
    l_md5_string VARCHAR2(32000);
    l_return     BOOLEAN;
  BEGIN
    --
    l_md5_string := get_md5_system(i_rec_system => i_rec_system);
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
  END do_check_md5_system;
  --
  /****************************************************************************
  * Purpose:  Get system.id_system of system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_system(i_id_system IN system.id_system%TYPE)
    RETURN system.id_system%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_system';
    --
    l_retval system.id_system%TYPE;
    CURSOR l_cur_system IS
      SELECT system.id_system
        FROM system
       WHERE system.id_system = i_id_system;
  BEGIN
    --
    OPEN l_cur_system;
    FETCH l_cur_system
      INTO l_retval;
    CLOSE l_cur_system;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_system;
  --

  /****************************************************************************
  * Purpose:  Get system.twitter_consumer_key of system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_consumer_key(i_id_system IN system.id_system%TYPE)
    RETURN system.twitter_consumer_key%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_consumer_key';
    --
    l_retval system.twitter_consumer_key%TYPE;
    CURSOR l_cur_system IS
      SELECT system.twitter_consumer_key
        FROM system
       WHERE system.id_system = i_id_system;
  BEGIN
    --
    OPEN l_cur_system;
    FETCH l_cur_system
      INTO l_retval;
    CLOSE l_cur_system;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_consumer_key;
  --

  /****************************************************************************
  * Purpose:  Get system.twitter_consumer_secret of system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_consumer_secret(i_id_system IN system.id_system%TYPE)
    RETURN system.twitter_consumer_secret%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_consumer_secret';
    --
    l_retval system.twitter_consumer_secret%TYPE;
    CURSOR l_cur_system IS
      SELECT system.twitter_consumer_secret
        FROM system
       WHERE system.id_system = i_id_system;
  BEGIN
    --
    OPEN l_cur_system;
    FETCH l_cur_system
      INTO l_retval;
    CLOSE l_cur_system;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_consumer_secret;
  --

  /****************************************************************************
  * Purpose:  Get system.twitter_api_bearer of system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_api_bearer(i_id_system IN system.id_system%TYPE)
    RETURN system.twitter_api_bearer%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_api_bearer';
    --
    l_retval system.twitter_api_bearer%TYPE;
    CURSOR l_cur_system IS
      SELECT system.twitter_api_bearer
        FROM system
       WHERE system.id_system = i_id_system;
  BEGIN
    --
    OPEN l_cur_system;
    FETCH l_cur_system
      INTO l_retval;
    CLOSE l_cur_system;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_api_bearer;
  --

  /****************************************************************************
  * Purpose:  Get system.twitter_ssl_wallet_path of system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_ssl_wallet_path(i_id_system IN system.id_system%TYPE)
    RETURN system.twitter_ssl_wallet_path%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_ssl_wallet_path';
    --
    l_retval system.twitter_ssl_wallet_path%TYPE;
    CURSOR l_cur_system IS
      SELECT system.twitter_ssl_wallet_path
        FROM system
       WHERE system.id_system = i_id_system;
  BEGIN
    --
    OPEN l_cur_system;
    FETCH l_cur_system
      INTO l_retval;
    CLOSE l_cur_system;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_ssl_wallet_path;
  --
  /****************************************************************************
  * Purpose:  Get system.twitter_ssl_wallet_pwd of system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_ssl_wallet_pwd(i_id_system IN system.id_system%TYPE)
    RETURN system.twitter_ssl_wallet_pwd%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_ssl_wallet_pwd';
    --
    l_retval system.twitter_ssl_wallet_pwd%TYPE;
    CURSOR l_cur_system IS
      SELECT system.twitter_ssl_wallet_pwd
        FROM system
       WHERE system.id_system = i_id_system;
  BEGIN
    --
    OPEN l_cur_system;
    FETCH l_cur_system
      INTO l_retval;
    CLOSE l_cur_system;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_ssl_wallet_pwd;
  --
  /****************************************************************************
  * Purpose:  Get system.email_from of system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_email_from(i_id_system IN system.id_system%TYPE)
    RETURN system.email_from%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_email_from';
    --
    l_retval system.email_from%TYPE;
    CURSOR l_cur_system IS
      SELECT system.email_from
        FROM system
       WHERE system.id_system = i_id_system;
  BEGIN
    --
    OPEN l_cur_system;
    FETCH l_cur_system
      INTO l_retval;
    CLOSE l_cur_system;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_email_from;
  --

  /****************************************************************************
  * Purpose:  Get system.email_register_subject of system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_email_register_subject(i_id_system IN system.id_system%TYPE)
    RETURN system.email_register_subject%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_email_register_subject';
    --
    l_retval system.email_register_subject%TYPE;
    CURSOR l_cur_system IS
      SELECT system.email_register_subject
        FROM system
       WHERE system.id_system = i_id_system;
  BEGIN
    --
    OPEN l_cur_system;
    FETCH l_cur_system
      INTO l_retval;
    CLOSE l_cur_system;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_email_register_subject;
  --

  /****************************************************************************
  * Purpose:  Get system.email_register_text of system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_email_register_text(i_id_system IN system.id_system%TYPE)
    RETURN system.email_register_text%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_email_register_text';
    --
    l_retval system.email_register_text%TYPE;
    CURSOR l_cur_system IS
      SELECT system.email_register_text
        FROM system
       WHERE system.id_system = i_id_system;
  BEGIN
    --
    OPEN l_cur_system;
    FETCH l_cur_system
      INTO l_retval;
    CLOSE l_cur_system;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_email_register_text;
  --

  /****************************************************************************
  * Purpose:  Get system.email_usrpwd_subject of system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_email_usrpwd_subject(i_id_system IN system.id_system%TYPE)
    RETURN system.email_usrpwd_subject%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_email_usrpwd_subject';
    --
    l_retval system.email_usrpwd_subject%TYPE;
    CURSOR l_cur_system IS
      SELECT system.email_usrpwd_subject
        FROM system
       WHERE system.id_system = i_id_system;
  BEGIN
    --
    OPEN l_cur_system;
    FETCH l_cur_system
      INTO l_retval;
    CLOSE l_cur_system;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_email_usrpwd_subject;
  --

  /****************************************************************************
  * Purpose:  Get system.email_usrpwd_text of system
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_email_usrpwd_text(i_id_system IN system.id_system%TYPE)
    RETURN system.email_usrpwd_text%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_email_usrpwd_text';
    --
    l_retval system.email_usrpwd_text%TYPE;
    CURSOR l_cur_system IS
      SELECT system.email_usrpwd_text
        FROM system
       WHERE system.id_system = i_id_system;
  BEGIN
    --
    OPEN l_cur_system;
    FETCH l_cur_system
      INTO l_retval;
    CLOSE l_cur_system;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_email_usrpwd_text;
  --
  /****************************************************************************
  * Purpose:  Fills the items on system admin pages
  * Author:   Daniel Hochleitner
  * Created:  22.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_fill_system(o_twitter_consumer_key    OUT system.twitter_consumer_key%TYPE,
                           o_twitter_consumer_secret OUT system.twitter_consumer_secret%TYPE,
                           o_twitter_ssl_wallet_path OUT system.twitter_ssl_wallet_path%TYPE,
                           o_twitter_ssl_wallet_pwd  OUT system.twitter_ssl_wallet_pwd%TYPE,
                           o_email_from              OUT system.email_from%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_fill_system';
    --
    l_rec_system api_system.pub_rec_system_type;
    --
  BEGIN
    -- get record with default PK
    l_rec_system := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    -- set out parameters
    o_twitter_consumer_key    := l_rec_system.twitter_consumer_key;
    o_twitter_consumer_secret := l_rec_system.twitter_consumer_secret;
    o_twitter_ssl_wallet_path := l_rec_system.twitter_ssl_wallet_path;
    --
    IF l_rec_system.twitter_ssl_wallet_pwd IS NOT NULL THEN
      o_twitter_ssl_wallet_pwd := api_utils.do_decrypt(i_string => l_rec_system.twitter_ssl_wallet_pwd);
    END IF;
    --
    o_email_from := l_rec_system.email_from;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_fill_system;
  --
  /****************************************************************************
  * Purpose:  Updates SYSTEM Table from system edit page
  * Author:   Daniel Hochleitner
  * Created:  22.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_update_system(i_twitter_consumer_key    IN system.twitter_consumer_key%TYPE,
                             i_twitter_consumer_secret IN system.twitter_consumer_secret%TYPE,
                             i_twitter_ssl_wallet_path IN system.twitter_ssl_wallet_path%TYPE,
                             i_twitter_ssl_wallet_pwd  IN system.twitter_ssl_wallet_pwd%TYPE,
                             i_email_from              IN system.email_from%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_update_system';
    --
    l_rec_system api_system.pub_rec_system_type;
    --
  BEGIN
    -- get record with default PK
    l_rec_system := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    -- set values
    -- TWITTER BEARER TOKEN
    -- then saved and item value equal do nothing
    IF i_twitter_consumer_key = l_rec_system.twitter_consumer_key AND
       i_twitter_consumer_secret = l_rec_system.twitter_consumer_secret THEN
      GOTO ifend;
      -- then new values get twitter bearer token
    ELSE
      l_rec_system.twitter_api_bearer := api_twitter.get_twitter_bearer_token(i_twitter_consumer_key    => TRIM(i_twitter_consumer_key),
                                                                              i_twitter_consumer_secret => TRIM(i_twitter_consumer_secret));
    END IF;
    <<ifend>>
  --
    l_rec_system.twitter_consumer_key    := TRIM(i_twitter_consumer_key);
    l_rec_system.twitter_consumer_secret := TRIM(i_twitter_consumer_secret);
    l_rec_system.twitter_ssl_wallet_path := i_twitter_ssl_wallet_path;
    --
    IF i_twitter_ssl_wallet_pwd IS NOT NULL THEN
      l_rec_system.twitter_ssl_wallet_pwd := api_utils.do_encrypt(i_string => i_twitter_ssl_wallet_pwd);
    END IF;
    --
    l_rec_system.email_from := TRIM(i_email_from);
    --
    -- update
    api_system.upd_system(i_rec_system => l_rec_system);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_update_system;
  --
  /****************************************************************************
  * Purpose:  Insert System defaults in setup script
  * Author:   Daniel Hochleitner
  * Created:  23.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_insert_system_setup(i_twitter_consumer_key    IN system.twitter_consumer_key%TYPE,
                                   i_twitter_consumer_secret IN system.twitter_consumer_secret%TYPE,
                                   i_twitter_ssl_wallet_path IN system.twitter_ssl_wallet_path%TYPE,
                                   i_twitter_ssl_wallet_pwd  IN system.twitter_ssl_wallet_pwd%TYPE,
                                   i_email_from              IN system.email_from%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_insert_system_setup';
    --
    l_rec_system api_system.pub_rec_system_type;
    l_id_system  system.id_system%TYPE;
    --
  BEGIN
    -- set values
    l_rec_system.id_system               := api_system.pubc_system_pk;
    l_rec_system.twitter_consumer_key    := TRIM(i_twitter_consumer_key);
    l_rec_system.twitter_consumer_secret := TRIM(i_twitter_consumer_secret);
    l_rec_system.twitter_ssl_wallet_path := TRIM(i_twitter_ssl_wallet_path);
    l_rec_system.twitter_ssl_wallet_pwd  := api_utils.do_encrypt(i_string => TRIM(i_twitter_ssl_wallet_pwd));
    l_rec_system.email_from              := TRIM(lower(i_email_from));
    -- texts
    l_rec_system.email_register_subject := 'Registration CrappyBird';
    l_rec_system.email_register_text    := 'To complete registration click the following link:' ||
                                           chr(10);
    l_rec_system.email_usrpwd_subject   := 'New Password for CrappyBird';
    l_rec_system.email_usrpwd_text      := 'This email is sent to you because it seems you have forgotten your password to sign in.' ||
                                           chr(10) ||
                                           'Please click the following link to set a new password:' ||
                                           chr(10);
    -- insert
    l_id_system := api_system.ins_system(i_rec_system => l_rec_system);
    COMMIT;
    -- get twitter bearer
    l_rec_system                    := NULL;
    l_rec_system                    := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    l_rec_system.twitter_api_bearer := api_twitter.get_twitter_bearer_token;
    -- update
    api_system.upd_system(i_rec_system => l_rec_system);
    COMMIT;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_insert_system_setup;
  --
END api_system;
/

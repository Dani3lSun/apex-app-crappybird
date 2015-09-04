CREATE OR REPLACE PACKAGE BODY api_usr IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_usr';
  --
  -- Functions for constants
  --
  FUNCTION getc_admin_pk RETURN NUMBER IS
  BEGIN
    RETURN pubc_admin_pk;
  END getc_admin_pk;
  --
  /*************************************************************************
  * Purpose:  INSERTS dataset into usr and returns PK
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  FUNCTION ins_usr(i_rec_usr IN pub_rec_usr_type) RETURN usr.id_usr%TYPE IS
    l_function CONSTANT VARCHAR2(30) := 'ins_usr';
    --
    l_id_usr usr.id_usr%TYPE;
  BEGIN
    --
    -- if id_usr not present,
    -- get next value of Sequence
    --
    IF i_rec_usr.id_usr IS NULL THEN
      l_id_usr := seq_pk.nextval;
    ELSE
      l_id_usr := i_rec_usr.id_usr;
    END IF;
    --
    INSERT INTO usr
      (usr.id_usr,
       usr.usr_email,
       usr.usr_pwd,
       usr.usr_firstname,
       usr.usr_lastname,
       usr.twitter_name,
       usr.twitter_id,
       usr.twitter_profile_pic_url,
       usr.show_acc_public,
       usr.acc_active,
       usr.usr_highscore)
    VALUES
      (l_id_usr,
       i_rec_usr.usr_email,
       i_rec_usr.usr_pwd,
       i_rec_usr.usr_firstname,
       i_rec_usr.usr_lastname,
       i_rec_usr.twitter_name,
       i_rec_usr.twitter_id,
       i_rec_usr.twitter_profile_pic_url,
       nvl(i_rec_usr.show_acc_public,
           1),
       nvl(i_rec_usr.acc_active,
           0),
       i_rec_usr.usr_highscore);
    --
    RETURN l_id_usr;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END ins_usr;
  --
  /*************************************************************************
  * Purpose:  UPDATES dataset of table usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE upd_usr(i_rec_usr  IN pub_rec_usr_type,
                    i_checksum IN VARCHAR2 := NULL) IS
    l_function CONSTANT VARCHAR2(30) := 'upd_usr';
    --
    l_md5_bool   BOOLEAN := TRUE;
    l_rec_before api_usr.pub_rec_usr_type;
  BEGIN
    --
    l_rec_before := api_usr.get_rec_usr(i_id_usr => i_rec_usr.id_usr);
    --
    IF i_checksum IS NOT NULL THEN
      l_md5_bool := do_check_md5_usr(i_checksum => i_checksum,
                                     i_rec_usr  => l_rec_before);
    END IF;
    --
    IF (i_checksum IS NULL) OR (l_md5_bool = TRUE) THEN
      UPDATE usr
         SET usr.usr_email               = i_rec_usr.usr_email,
             usr.usr_pwd                 = i_rec_usr.usr_pwd,
             usr.usr_firstname           = i_rec_usr.usr_firstname,
             usr.usr_lastname            = i_rec_usr.usr_lastname,
             usr.twitter_name            = i_rec_usr.twitter_name,
             usr.twitter_id              = i_rec_usr.twitter_id,
             usr.twitter_profile_pic_url = i_rec_usr.twitter_profile_pic_url,
             usr.show_acc_public         = i_rec_usr.show_acc_public,
             usr.acc_active              = i_rec_usr.acc_active,
             usr.usr_highscore           = i_rec_usr.usr_highscore
       WHERE id_usr = i_rec_usr.id_usr;
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
  END upd_usr;
  --
  /*************************************************************************
  * Purpose:  DELETES dataset of table usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE del_usr(i_id_usr IN usr.id_usr%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'del_usr';
  BEGIN
    --
    DELETE FROM usr
     WHERE usr.id_usr = i_id_usr;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END del_usr;
  --
  /****************************************************************************
  * Purpose:  Get Record of table usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_rec_usr(i_id_usr IN usr.id_usr%TYPE) RETURN pub_rec_usr_type IS
    l_function CONSTANT VARCHAR2(30) := 'get_rec_usr';
    --
    l_retval pub_rec_usr_type;
    CURSOR l_cur_usr IS
      SELECT usr.id_usr,
             usr.usr_email,
             usr.usr_pwd,
             usr.usr_firstname,
             usr.usr_lastname,
             usr.twitter_name,
             usr.twitter_id,
             usr.twitter_profile_pic_url,
             usr.show_acc_public,
             usr.acc_active,
             usr.usr_highscore
        FROM usr
       WHERE usr.id_usr = i_id_usr;
    l_rec_cur l_cur_usr%ROWTYPE;
    --
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_rec_cur;
    IF l_cur_usr%FOUND THEN
      l_retval.id_usr                  := l_rec_cur.id_usr;
      l_retval.usr_email               := l_rec_cur.usr_email;
      l_retval.usr_pwd                 := l_rec_cur.usr_pwd;
      l_retval.usr_firstname           := l_rec_cur.usr_firstname;
      l_retval.usr_lastname            := l_rec_cur.usr_lastname;
      l_retval.twitter_name            := l_rec_cur.twitter_name;
      l_retval.twitter_id              := l_rec_cur.twitter_id;
      l_retval.twitter_profile_pic_url := l_rec_cur.twitter_profile_pic_url;
      l_retval.show_acc_public         := l_rec_cur.show_acc_public;
      l_retval.acc_active              := l_rec_cur.acc_active;
      l_retval.usr_highscore           := l_rec_cur.usr_highscore;
    END IF;
    CLOSE l_cur_usr;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_rec_usr;
  --
  /*************************************************************************
  * Purpose:  Generates md5 checksum for usr using Record-type
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  FUNCTION get_md5_usr(i_rec_usr IN pub_rec_usr_type) RETURN VARCHAR2 IS
    l_function CONSTANT VARCHAR2(30) := 'get_md5_usr';
    --
    l_md5_string VARCHAR2(32000);
    l_rec_string CLOB;
    l_seperator  VARCHAR2(10) := '|';
  BEGIN
    --
    l_rec_string := i_rec_usr.id_usr || l_seperator || i_rec_usr.usr_email ||
                    l_seperator || i_rec_usr.usr_pwd || l_seperator ||
                    i_rec_usr.usr_firstname || l_seperator ||
                    i_rec_usr.usr_lastname || l_seperator ||
                    i_rec_usr.twitter_name || l_seperator ||
                    i_rec_usr.twitter_id || l_seperator ||
                    i_rec_usr.twitter_profile_pic_url || l_seperator ||
                    nvl(i_rec_usr.show_acc_public,
                        1) || l_seperator ||
                    nvl(i_rec_usr.acc_active,
                        0) || l_seperator || i_rec_usr.usr_highscore ||
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
  END get_md5_usr;
  --
  /*************************************************************************
  * Purpose:  Compares (Before/After) md5 checksum of usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  *************************************************************************/
  FUNCTION do_check_md5_usr(i_checksum IN VARCHAR2,
                            i_rec_usr  IN pub_rec_usr_type) RETURN BOOLEAN IS
    l_function CONSTANT VARCHAR2(30) := 'do_check_md5_usr';
    --
    l_md5_string VARCHAR2(32000);
    l_return     BOOLEAN;
  BEGIN
    --
    l_md5_string := get_md5_usr(i_rec_usr => i_rec_usr);
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
  END do_check_md5_usr;
  --
  /****************************************************************************
  * Purpose:  Get usr.id_usr of usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr(i_id_usr IN usr.id_usr%TYPE) RETURN usr.id_usr%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr';
    --
    l_retval usr.id_usr%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.id_usr
        FROM usr
       WHERE usr.id_usr = i_id_usr;
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
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
  * Purpose:  Get usr.id_usr of usr from twitter_id
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr(i_twitter_id IN usr.twitter_id%TYPE)
    RETURN usr.id_usr%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr';
    --
    l_retval usr.id_usr%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.id_usr
        FROM usr
       WHERE usr.twitter_id = i_twitter_id;
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
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
  * Purpose:  Get usr.id_usr of usr from email address
  * Author:   Daniel Hochleitner
  * Created:  23.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr(i_usr_email IN usr.usr_email%TYPE)
    RETURN usr.id_usr%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr';
    --
    l_retval usr.id_usr%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.id_usr
        FROM usr
       WHERE upper(usr.usr_email) = TRIM(upper(i_usr_email));
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
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
  * Purpose:  Get usr.usr_email of usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_usr_email(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.usr_email%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_usr_email';
    --
    l_retval usr.usr_email%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.usr_email
        FROM usr
       WHERE usr.id_usr = i_id_usr;
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_usr_email;
  --

  /****************************************************************************
  * Purpose:  Get usr.usr_pwd of usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_usr_pwd(i_id_usr IN usr.id_usr%TYPE) RETURN usr.usr_pwd%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_usr_pwd';
    --
    l_retval usr.usr_pwd%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.usr_pwd
        FROM usr
       WHERE usr.id_usr = i_id_usr;
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_usr_pwd;
  --

  /****************************************************************************
  * Purpose:  Get usr.usr_firstname of usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_usr_firstname(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.usr_firstname%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_usr_firstname';
    --
    l_retval usr.usr_firstname%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.usr_firstname
        FROM usr
       WHERE usr.id_usr = i_id_usr;
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_usr_firstname;
  --

  /****************************************************************************
  * Purpose:  Get usr.usr_lastname of usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_usr_lastname(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.usr_lastname%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_usr_lastname';
    --
    l_retval usr.usr_lastname%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.usr_lastname
        FROM usr
       WHERE usr.id_usr = i_id_usr;
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_usr_lastname;
  --

  /****************************************************************************
  * Purpose:  Get usr.twitter_name of usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_name(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.twitter_name%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_name';
    --
    l_retval usr.twitter_name%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.twitter_name
        FROM usr
       WHERE usr.id_usr = i_id_usr;
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_name;
  --

  /****************************************************************************
  * Purpose:  Get usr.twitter_id of usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_id(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.twitter_id%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_id';
    --
    l_retval usr.twitter_id%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.twitter_id
        FROM usr
       WHERE usr.id_usr = i_id_usr;
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_id;
  --
  /****************************************************************************
  * Purpose:  Get usr.twitter_profile_pic_url of usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_profile_pic_url(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.twitter_profile_pic_url%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_profile_pic_url';
    --
    l_retval usr.twitter_profile_pic_url%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.twitter_profile_pic_url
        FROM usr
       WHERE usr.id_usr = i_id_usr;
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_profile_pic_url;
  --

  /****************************************************************************
  * Purpose:  Get usr.show_acc_public of usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_show_acc_public(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.show_acc_public%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_show_acc_public';
    --
    l_retval usr.show_acc_public%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.show_acc_public
        FROM usr
       WHERE usr.id_usr = i_id_usr;
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_show_acc_public;
  --

  /****************************************************************************
  * Purpose:  Get usr.acc_active of usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_acc_active(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.acc_active%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_acc_active';
    --
    l_retval usr.acc_active%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.acc_active
        FROM usr
       WHERE usr.id_usr = i_id_usr;
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_acc_active;
  --
  /****************************************************************************
  * Purpose:  Get usr.usr_highscore of usr
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_usr_highscore(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.usr_highscore%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_usr_highscore';
    --
    l_retval usr.usr_highscore%TYPE;
    CURSOR l_cur_usr IS
      SELECT usr.usr_highscore
        FROM usr
       WHERE usr.id_usr = i_id_usr;
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_retval;
    CLOSE l_cur_usr;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_usr_highscore;
  --
  /****************************************************************************
  * Purpose:  Register User with (generated pwd/active=0) + send email with link
  * Author:   Daniel Hochleitner
  * Created:  14.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_register_usr(i_usr_firstname IN usr.usr_firstname%TYPE,
                            i_usr_lastname  IN usr.usr_lastname%TYPE,
                            i_usr_email     IN usr.usr_email%TYPE,
                            i_software_url  IN VARCHAR2) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_register_usr';
    --
    l_rec_usr      api_usr.pub_rec_usr_type;
    l_id_usr       usr.id_usr%TYPE;
    l_pwd          usr.usr_pwd%TYPE;
    l_id_usr_crypt VARCHAR2(200);
    --
    l_rec_usr_token api_usr_token.pub_rec_usr_token_type;
    l_id_usr_token  usr_token.id_usr_token%TYPE;
    l_token         usr_token.token%TYPE;
    --
    l_id_mail NUMBER;
    --
  BEGIN
    --
    -- create user
    l_rec_usr.usr_email     := TRIM(i_usr_email);
    l_rec_usr.usr_firstname := i_usr_firstname;
    l_rec_usr.usr_lastname  := i_usr_lastname;
    l_rec_usr.acc_active    := 0; -- account inactive for now
    -- generate pwd and encrypt
    l_pwd             := api_utils.do_encrypt(i_string => api_utils.pwd_gen(i_template => api_utils.get_pwd_template));
    l_rec_usr.usr_pwd := l_pwd;
    -- insert
    l_id_usr := api_usr.ins_usr(i_rec_usr => l_rec_usr);
    --
    -- user token (default 60 mins valid)
    l_rec_usr_token.id_usr     := l_id_usr;
    l_rec_usr_token.token_date := SYSDATE;
    -- generate token
    l_token               := api_utils.pwd_gen(i_template => api_utils.get_token_template);
    l_rec_usr_token.token := l_token;
    -- insert
    l_id_usr_token := api_usr_token.ins_usr_token(i_rec_usr_token => l_rec_usr_token);
    --
    -- send email with link to end register page
    -- encrypt user-id for link
    l_id_usr_crypt := api_utils.do_encrypt(i_string => l_id_usr);
    --
    l_id_mail := api_mail.send_mail(i_from    => api_system.get_email_from(i_id_system => api_system.pubc_system_pk),
                                    i_to      => TRIM(i_usr_email),
                                    i_subject => api_system.get_email_register_subject(i_id_system => api_system.pubc_system_pk),
                                    i_body    => api_system.get_email_register_text(i_id_system => api_system.pubc_system_pk) ||
                                                 chr(10) || i_software_url ||
                                                 ':102:::NO:102:P102_ID_USR_CRYPT,P102_TOKEN:' ||
                                                 l_id_usr_crypt || ',' ||
                                                 l_token);
  
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_register_usr;
  --
  /****************************************************************************
  * Purpose:  Finishes registration of user (set account akctive + new pwd)
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_finish_register_usr(i_id_usr_crypt IN VARCHAR2,
                                   i_token        IN usr_token.token%TYPE,
                                   i_usr_pwd      IN usr.usr_pwd%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_finish_register_usr';
    --
    l_rec_usr     api_usr.pub_rec_usr_type;
    l_id_usr      usr.id_usr%TYPE;
    l_pwd         usr.usr_pwd%TYPE;
    l_check_token BOOLEAN;
    --
    --
  BEGIN
    -- decrypt id_usr
    l_id_usr := to_number(api_utils.do_decrypt(i_string => i_id_usr_crypt));
    --
    -- check if token valid
    l_check_token := api_usr_token.check_token_valid(i_id_usr => l_id_usr,
                                                     i_token  => TRIM(i_token));
    --
    -- only when true
    IF l_check_token THEN
      --
      -- update usr
      l_rec_usr := api_usr.get_rec_usr(i_id_usr => l_id_usr);
      l_pwd     := api_utils.do_encrypt(i_string => i_usr_pwd);
      --
      l_rec_usr.acc_active := 1;
      l_rec_usr.usr_pwd    := l_pwd;
      -- update
      api_usr.upd_usr(i_rec_usr => l_rec_usr);
      --
      -- remove all token from user
      api_usr_token.del_token_per_usr(i_id_usr => l_id_usr);
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_finish_register_usr;
  --
  /****************************************************************************
  * Purpose:  Send email when User lost his password with token-link
  * Author:   Daniel Hochleitner
  * Created:  23.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_send_pwd_lost_mail(i_usr_email    IN usr.usr_email%TYPE,
                                  i_software_url IN VARCHAR2) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_send_pwd_lost_mail';
    --
    l_id_usr       usr.id_usr%TYPE;
    l_id_usr_crypt VARCHAR2(200);
    --
    l_rec_usr_token api_usr_token.pub_rec_usr_token_type;
    l_id_usr_token  usr_token.id_usr_token%TYPE;
    l_token         usr_token.token%TYPE;
    --
    l_id_mail NUMBER;
    --
  BEGIN
    --
    -- get id_usr from email
    l_id_usr := api_usr.get_id_usr(i_usr_email => i_usr_email);
    --
    -- go on only if ID found
    IF l_id_usr IS NOT NULL THEN
      --
      -- user token (default 60 mins valid)
      l_rec_usr_token.id_usr     := l_id_usr;
      l_rec_usr_token.token_date := SYSDATE;
      -- generate token
      l_token               := api_utils.pwd_gen(i_template => api_utils.get_token_template);
      l_rec_usr_token.token := l_token;
      -- insert
      l_id_usr_token := api_usr_token.ins_usr_token(i_rec_usr_token => l_rec_usr_token);
      --
      -- send email with link to end new password page
      -- encrypt user-id for link
      l_id_usr_crypt := api_utils.do_encrypt(i_string => l_id_usr);
      --
      l_id_mail := api_mail.send_mail(i_from    => api_system.get_email_from(i_id_system => api_system.pubc_system_pk),
                                      i_to      => TRIM(i_usr_email),
                                      i_subject => api_system.get_email_usrpwd_subject(i_id_system => api_system.pubc_system_pk),
                                      i_body    => api_system.get_email_usrpwd_text(i_id_system => api_system.pubc_system_pk) ||
                                                   chr(10) || i_software_url ||
                                                   ':103:::NO:103:P103_ID_USR_CRYPT,P103_TOKEN:' ||
                                                   l_id_usr_crypt || ',' ||
                                                   l_token);
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_send_pwd_lost_mail;
  --
  /****************************************************************************
  * Purpose:  Finishes password lost function of user (set new pwd)
  * Author:   Daniel Hochleitner
  * Created:  23.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_finish_password_lost(i_id_usr_crypt IN VARCHAR2,
                                    i_token        IN usr_token.token%TYPE,
                                    i_usr_pwd      IN usr.usr_pwd%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_finish_password_lost';
    --
    l_rec_usr     api_usr.pub_rec_usr_type;
    l_id_usr      usr.id_usr%TYPE;
    l_pwd         usr.usr_pwd%TYPE;
    l_check_token BOOLEAN;
    --
    --
  BEGIN
    -- decrypt id_usr
    l_id_usr := to_number(api_utils.do_decrypt(i_string => i_id_usr_crypt));
    --
    -- check if token valid
    l_check_token := api_usr_token.check_token_valid(i_id_usr => l_id_usr,
                                                     i_token  => TRIM(i_token));
    --
    -- only when true
    IF l_check_token THEN
      --
      -- update usr
      l_rec_usr := api_usr.get_rec_usr(i_id_usr => l_id_usr);
      l_pwd     := api_utils.do_encrypt(i_string => i_usr_pwd);
      --
      l_rec_usr.usr_pwd := l_pwd;
      -- update
      api_usr.upd_usr(i_rec_usr => l_rec_usr);
      --
      -- remove all token from user
      api_usr_token.del_token_per_usr(i_id_usr => l_id_usr);
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_finish_password_lost;
  --
  /****************************************************************************
  * Purpose:  Generates new registration email
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_gen_new_reg_email(i_id_usr_crypt IN VARCHAR2,
                                 i_software_url IN VARCHAR2) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_gen_new_reg_email';
    --
    l_id_usr usr.id_usr%TYPE;
    --
    l_rec_usr_token api_usr_token.pub_rec_usr_token_type;
    l_id_usr_token  usr_token.id_usr_token%TYPE;
    l_token         usr_token.token%TYPE;
    --
    l_id_mail NUMBER;
    --
  BEGIN
    --
    -- decrypt id_usr
    l_id_usr := api_utils.do_decrypt(i_string => i_id_usr_crypt);
    --
    -- user token (default 60 mins valid)
    l_rec_usr_token.id_usr     := l_id_usr;
    l_rec_usr_token.token_date := SYSDATE;
    -- generate token
    l_token               := api_utils.pwd_gen(i_template => api_utils.get_token_template);
    l_rec_usr_token.token := l_token;
    -- insert
    l_id_usr_token := api_usr_token.ins_usr_token(i_rec_usr_token => l_rec_usr_token);
    --
    -- send email with link to end register page
    l_id_mail := api_mail.send_mail(i_from    => api_system.get_email_from(i_id_system => api_system.pubc_system_pk),
                                    i_to      => api_usr.get_usr_email(i_id_usr => l_id_usr),
                                    i_subject => api_system.get_email_register_subject(i_id_system => api_system.pubc_system_pk),
                                    i_body    => api_system.get_email_register_text(i_id_system => api_system.pubc_system_pk) ||
                                                 chr(10) || i_software_url ||
                                                 ':102:::NO:102:P102_ID_USR_CRYPT,P102_TOKEN:' ||
                                                 i_id_usr_crypt || ',' ||
                                                 l_token);
  
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_gen_new_reg_email;
  --
  /****************************************************************************
  * Purpose:  Check if user email is unique
  * Author:   Daniel Hochleitner
  * Created:  15.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_usr_email_unique(i_usr_email IN usr.usr_email%TYPE,
                                  i_id_usr    IN usr.id_usr%TYPE := NULL)
    RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_usr_email_unique';
    --
    l_retval BOOLEAN;
    l_id_usr usr.id_usr%TYPE;
    l_email  usr.usr_email%TYPE;
    --
    CURSOR l_cur_usr IS
      SELECT usr.id_usr
        FROM usr
       WHERE upper(usr.usr_email) = upper(TRIM(i_usr_email));
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_id_usr;
    CLOSE l_cur_usr;
    --
    IF l_id_usr IS NULL THEN
      l_retval := TRUE;
    ELSE
      l_retval := FALSE;
    END IF;
    --
    -- except user own address
    IF i_id_usr IS NOT NULL THEN
      l_email := upper(api_usr.get_usr_email(i_id_usr => i_id_usr));
      IF l_email = upper(TRIM(i_usr_email)) THEN
        l_retval := TRUE;
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
  END check_usr_email_unique;
  --
  /****************************************************************************
  * Purpose:  Check if current user pwd is correct
  * Author:   Daniel Hochleitner
  * Created:  20.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_usr_pwd_correct(i_id_usr  IN usr.id_usr%TYPE,
                                 i_usr_pwd IN usr.usr_pwd%TYPE)
    RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_usr_pwd_correct';
    --
    l_retval     BOOLEAN := FALSE;
    l_usr_db_pwd usr.usr_pwd%TYPE;
    l_pwd_crypt  usr.usr_pwd%TYPE;
  
    --
  BEGIN
    --
    -- encrypt input pwd
    l_pwd_crypt := api_utils.do_encrypt(i_string => i_usr_pwd);
    --
    -- get encrypted pwd stored in db
    l_usr_db_pwd := api_usr.get_usr_pwd(i_id_usr => i_id_usr);
    --
    -- compare strings
    IF l_pwd_crypt = l_usr_db_pwd THEN
      l_retval := TRUE;
    ELSE
      l_retval := FALSE;
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
  END check_usr_pwd_correct;
  --
  /****************************************************************************
  * Purpose:  Check if user twitter name is unique
  * Author:   Daniel Hochleitner
  * Created:  16.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_usr_twitter_name_unique(i_twitter_name IN usr.twitter_name%TYPE,
                                         i_id_usr       IN usr.id_usr%TYPE := NULL)
    RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_usr_twitter_name_unique';
    --
    l_retval       BOOLEAN;
    l_id_usr       usr.id_usr%TYPE;
    l_twitter_name usr.twitter_name%TYPE;
    --
    CURSOR l_cur_usr IS
      SELECT usr.id_usr
        FROM usr
       WHERE upper(usr.twitter_name) = upper(TRIM(i_twitter_name));
  BEGIN
    --
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_id_usr;
    CLOSE l_cur_usr;
    --
    IF l_id_usr IS NULL THEN
      l_retval := TRUE;
    ELSE
      l_retval := FALSE;
    END IF;
    --
    -- except user own twitter name
    IF i_id_usr IS NOT NULL THEN
      l_twitter_name := upper(api_usr.get_twitter_name(i_id_usr => i_id_usr));
      IF l_twitter_name = upper(TRIM(i_twitter_name)) THEN
        l_retval := TRUE;
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
  END check_usr_twitter_name_unique;
  --
  /****************************************************************************
  * Purpose:  Fills the items on User profile pages
  * Author:   Daniel Hochleitner
  * Created:  18.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_fill_usr_profile(i_id_usr                  IN usr.id_usr%TYPE,
                                o_usr_email               OUT usr.usr_email%TYPE,
                                o_usr_name                OUT VARCHAR2,
                                o_twitter_name            OUT usr.twitter_name%TYPE,
                                o_usr_highscore           OUT usr.usr_highscore%TYPE,
                                o_twitter_profile_pic_url OUT usr.twitter_profile_pic_url%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_fill_usr_profile';
    --
    l_rec_usr          api_usr.pub_rec_usr_type;
    l_crappy_home_path VARCHAR2(200);
    --
  BEGIN
    -- get record
    l_rec_usr := api_usr.get_rec_usr(i_id_usr => i_id_usr);
    -- set values
    o_usr_email               := l_rec_usr.usr_email;
    o_usr_name                := l_rec_usr.usr_firstname || ' ' ||
                                 l_rec_usr.usr_lastname;
    o_twitter_name            := nvl(l_rec_usr.twitter_name,
                                     '-');
    o_usr_highscore           := nvl(l_rec_usr.usr_highscore,
                                     0);
    l_crappy_home_path        := REPLACE(v('CRAPPY_HOME'),
                                         '#IMAGE_PREFIX#',
                                         v('IMAGE_PREFIX'));
    o_twitter_profile_pic_url := nvl(l_rec_usr.twitter_profile_pic_url,
                                     l_crappy_home_path ||
                                     'img/avatar-placeholder.png');
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_fill_usr_profile;
  --
  /****************************************************************************
  * Purpose:  Fills the items on User profile edit page
  * Author:   Daniel Hochleitner
  * Created:  18.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_fill_usr_edit_profile(i_id_usr          IN usr.id_usr%TYPE,
                                     o_usr_email       OUT usr.usr_email%TYPE,
                                     o_usr_firstname   OUT usr.usr_firstname%TYPE,
                                     o_usr_lastname    OUT usr.usr_lastname%TYPE,
                                     o_twitter_name    OUT usr.twitter_name%TYPE,
                                     o_show_acc_public OUT usr.show_acc_public%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_fill_usr_edit_profile';
    --
    l_rec_usr api_usr.pub_rec_usr_type;
    --
  BEGIN
    -- get record
    l_rec_usr := api_usr.get_rec_usr(i_id_usr => i_id_usr);
    -- set values
    o_usr_email       := l_rec_usr.usr_email;
    o_usr_firstname   := l_rec_usr.usr_firstname;
    o_usr_lastname    := l_rec_usr.usr_lastname;
    o_twitter_name    := l_rec_usr.twitter_name;
    o_show_acc_public := l_rec_usr.show_acc_public;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_fill_usr_edit_profile;
  --
  /****************************************************************************
  * Purpose:  Updates USR Table from profile edit page
  * Author:   Daniel Hochleitner
  * Created:  18.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_update_usr_edit_profile(i_id_usr          IN usr.id_usr%TYPE,
                                       i_usr_email       IN usr.usr_email%TYPE,
                                       i_usr_firstname   IN usr.usr_firstname%TYPE,
                                       i_usr_lastname    IN usr.usr_lastname%TYPE,
                                       i_twitter_name    IN usr.twitter_name%TYPE,
                                       i_show_acc_public IN usr.show_acc_public%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_update_usr_edit_profile';
    --
    l_rec_usr      api_usr.pub_rec_usr_type;
    l_twitter_name usr.twitter_name%TYPE;
    l_twitter_id   usr.twitter_id%TYPE;
    --
  BEGIN
    -- get record
    l_rec_usr := api_usr.get_rec_usr(i_id_usr => i_id_usr);
    -- set values
    l_rec_usr.usr_email       := i_usr_email;
    l_rec_usr.usr_firstname   := i_usr_firstname;
    l_rec_usr.usr_lastname    := i_usr_lastname;
    l_rec_usr.show_acc_public := i_show_acc_public;
    -- twitter settings
    -- then saved and item value equal do nothing
    IF upper(l_rec_usr.twitter_name) = upper(i_twitter_name) THEN
      GOTO ifend;
      -- get twitter ID and profile pic URL when new value
    ELSIF l_rec_usr.twitter_name IS NULL AND i_twitter_name IS NOT NULL THEN
      l_twitter_name := TRIM(i_twitter_name);
      l_twitter_id   := api_twitter.get_twitter_id(i_twitter_name => l_twitter_name);
      --
      l_rec_usr.twitter_name            := l_twitter_name;
      l_rec_usr.twitter_id              := l_twitter_id;
      l_rec_usr.twitter_profile_pic_url := api_twitter.get_twitter_profile_pic_url(i_twitter_id => l_twitter_id);
      -- when i_twitter_name is null set ID and profile pic URL also to null
    ELSIF l_rec_usr.twitter_name IS NOT NULL AND i_twitter_name IS NULL THEN
      l_rec_usr.twitter_name            := NULL;
      l_rec_usr.twitter_id              := NULL;
      l_rec_usr.twitter_profile_pic_url := NULL;
      -- delete all twitter friend entries
      api_usr_tw_friends.del_usr_tw_friends_per_usr(i_id_usr => i_id_usr);
    END IF;
    <<ifend>>
  --
    -- update usr table
    api_usr.upd_usr(i_rec_usr => l_rec_usr);
    --
    -- insert in twitter_friends table
    IF l_twitter_id IS NOT NULL THEN
      api_twitter.ins_twitter_friends(i_id_usr => i_id_usr);
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_update_usr_edit_profile;
  --
  /****************************************************************************
  * Purpose:  Changes the User password
  * Author:   Daniel Hochleitner
  * Created:  20.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_update_usr_pwd(i_id_usr  IN usr.id_usr%TYPE,
                              i_usr_pwd IN usr.usr_pwd%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_update_usr_pwd';
    --
    l_rec_usr   api_usr.pub_rec_usr_type;
    l_pwd_crypt usr.usr_pwd%TYPE;
    --
  BEGIN
    -- get record
    l_rec_usr := api_usr.get_rec_usr(i_id_usr => i_id_usr);
    -- set value and encrypt
    l_pwd_crypt       := api_utils.do_encrypt(i_string => i_usr_pwd);
    l_rec_usr.usr_pwd := l_pwd_crypt;
    -- update
    api_usr.upd_usr(i_rec_usr => l_rec_usr);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_update_usr_pwd;
  --
  /****************************************************************************
  * Purpose:  Sets the Game Highscore for User
  * Author:   Daniel Hochleitner
  * Created:  20.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_set_usr_highscore(i_id_usr        IN usr.id_usr%TYPE,
                                 i_usr_highscore IN usr.usr_highscore%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_set_usr_highscore';
    --
    l_rec_usr api_usr.pub_rec_usr_type;
    --
  BEGIN
    -- get record
    l_rec_usr := api_usr.get_rec_usr(i_id_usr => i_id_usr);
    -- set values when highscore is set
    IF i_usr_highscore IS NOT NULL THEN
      l_rec_usr.usr_highscore := i_usr_highscore;
      -- update
      api_usr.upd_usr(i_rec_usr => l_rec_usr);
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
  * Purpose:  Check if user is admin user
  * Author:   Daniel Hochleitner
  * Created:  20.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_usr_admin(i_id_usr IN usr.id_usr%TYPE) RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_usr_admin';
    --
    l_retval BOOLEAN;
    --
  BEGIN
    -- check if id_usr is admin id
    IF i_id_usr = api_usr.pubc_admin_pk THEN
      l_retval := TRUE;
    ELSE
      l_retval := FALSE;
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
  END check_usr_admin;
  --
  /****************************************************************************
  * Purpose:  Check if user has a public account
  * Author:   Daniel Hochleitner
  * Created:  20.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_usr_public(i_id_usr IN usr.id_usr%TYPE) RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_usr_public';
    --
    l_show_acc_public usr.show_acc_public%TYPE;
    l_retval          BOOLEAN;
    --
  BEGIN
    -- check if id_usr is public
    l_show_acc_public := api_usr.get_show_acc_public(i_id_usr => i_id_usr);
    --
    IF l_show_acc_public = 1 THEN
      l_retval := TRUE;
    ELSE
      l_retval := FALSE;
    END IF;
    -- admin all rights
    IF i_id_usr = api_usr.pubc_admin_pk THEN
      l_retval := TRUE;
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
  END check_usr_public;
  --
  /****************************************************************************
  * Purpose:  Check if user has a twitter account
  * Author:   Daniel Hochleitner
  * Created:  20.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_usr_twitter(i_id_usr IN usr.id_usr%TYPE) RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_usr_twitter';
    --
    l_twitter_id usr.twitter_id%TYPE;
    l_retval     BOOLEAN;
    --
  BEGIN
    -- check if id_usr has a twitter account
    l_twitter_id := api_usr.get_twitter_id(i_id_usr => i_id_usr);
    --
    IF l_twitter_id IS NULL THEN
      l_retval := FALSE;
    ELSE
      l_retval := TRUE;
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
  END check_usr_twitter;
  --
  /****************************************************************************
  * Purpose:  Check if user has a active account
  * Author:   Daniel Hochleitner
  * Created:  20.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_usr_active(i_id_usr IN usr.id_usr%TYPE) RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_usr_active';
    --
    l_acc_active usr.acc_active%TYPE;
    l_retval     BOOLEAN;
    --
  BEGIN
    -- check if id_usr is active
    l_acc_active := api_usr.get_acc_active(i_id_usr => i_id_usr);
    --
    IF l_acc_active = 1 THEN
      l_retval := FALSE;
    ELSE
      l_retval := TRUE;
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
  END check_usr_active;
  --
  /****************************************************************************
  * Purpose:  Check if user has a inactive account
  * Author:   Daniel Hochleitner
  * Created:  20.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_usr_inactive(i_id_usr IN usr.id_usr%TYPE) RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_usr_inactive';
    --
    l_acc_active usr.acc_active%TYPE;
    l_retval     BOOLEAN;
    --
  BEGIN
    -- check if id_usr is inactive
    l_acc_active := api_usr.get_acc_active(i_id_usr => i_id_usr);
    --
    IF l_acc_active = 0 THEN
      l_retval := FALSE;
    ELSE
      l_retval := TRUE;
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
  END check_usr_inactive;
  --
  /****************************************************************************
  * Purpose:  Changes the User status (active/inactive)
  * Author:   Daniel Hochleitner
  * Created:  20.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_change_usr_acc_status(i_id_usr     IN usr.id_usr%TYPE,
                                     i_acc_active IN usr.acc_active%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_change_usr_acc_status';
    --
    l_rec_usr api_usr.pub_rec_usr_type;
    --
  BEGIN
    -- get record
    l_rec_usr := api_usr.get_rec_usr(i_id_usr => i_id_usr);
    -- set value
    l_rec_usr.acc_active := i_acc_active;
    -- update
    api_usr.upd_usr(i_rec_usr => l_rec_usr);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_change_usr_acc_status;
  --
  /****************************************************************************
  * Purpose:  Sets the username in Brwoser LocalStorage (For Fullscreen WebApps)
  * Author:   Daniel Hochleitner
  * Created:  22.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE set_username_localstorage(i_user_name IN VARCHAR2) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'set_username_localstorage';
    --
  BEGIN
    -- add js inline code
    apex_javascript.add_inline_code(p_code => 'localStorage.setItem("USERNAME", "' ||
                                              lower(i_user_name) || '");');
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END set_username_localstorage;
  --
  /****************************************************************************
  * Purpose:  Get username from Brwoser LocalStorage and sets Page item with value
  * Author:   Daniel Hochleitner
  * Created:  22.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE get_username_localstorage(i_item_name IN VARCHAR2) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'set_username_localstorage';
    --
    l_js_string VARCHAR2(1000);
    --
  BEGIN
    -- build js string
    l_js_string := 'var username = localStorage.getItem("USERNAME");' ||
                   chr(10);
    l_js_string := l_js_string || 'apex.item("' || upper(i_item_name) ||
                   '").setValue(username);';
    -- add js inline code
    apex_javascript.add_inline_code(p_code => l_js_string);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_username_localstorage;
  --
  /****************************************************************************
  * Purpose:  Creates admin user for setup script
  * Author:   Daniel Hochleitner
  * Created:  23.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_insert_admin_setup(i_usr_firstname IN usr.usr_firstname%TYPE,
                                  i_usr_lastname  IN usr.usr_lastname%TYPE,
                                  i_usr_email     IN usr.usr_email%TYPE,
                                  i_usr_pwd       IN usr.usr_pwd%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_insert_admin_setup';
    --
    l_rec_usr api_usr.pub_rec_usr_type;
    l_id_usr  usr.id_usr%TYPE;
    l_pwd     usr.usr_pwd%TYPE;
    --
  BEGIN
    --
    -- create admin user
    l_rec_usr.id_usr          := api_usr.pubc_admin_pk; -- admin user ID
    l_rec_usr.usr_email       := TRIM(lower(i_usr_email));
    l_rec_usr.usr_firstname   := i_usr_firstname;
    l_rec_usr.usr_lastname    := i_usr_lastname;
    l_rec_usr.acc_active      := 1;
    l_rec_usr.show_acc_public := 0;
    -- encrypt pwd
    l_pwd             := api_utils.do_encrypt(i_string => i_usr_pwd);
    l_rec_usr.usr_pwd := l_pwd;
    -- insert
    l_id_usr := api_usr.ins_usr(i_rec_usr => l_rec_usr);
    --  
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_insert_admin_setup;
  --
  /****************************************************************************
  * Purpose:  Count all registered Users
  * Author:   Daniel Hochleitner
  * Created:  04.09.15
  * Changed:
  ****************************************************************************/
  FUNCTION count_all_usr RETURN NUMBER IS
    --
    l_function CONSTANT VARCHAR2(30) := 'count_all_usr';
    --
    l_count NUMBER;
    CURSOR l_cur_usr IS
      SELECT COUNT(usr.id_usr)
        FROM usr
       WHERE usr.id_usr != api_usr.getc_admin_pk;
    --
  BEGIN
    -- fetch usr count in var
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_count;
    CLOSE l_cur_usr;
    --
    RETURN nvl(l_count,
               0);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END count_all_usr;
  --
END api_usr;
/

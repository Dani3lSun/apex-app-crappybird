CREATE OR REPLACE PACKAGE BODY api_auth IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_auth';
  --
  /****************************************************************************
  * Purpose:  User Auth, sets USR_ID
  * Author:   Daniel Hochleitner
  * Created:  13.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION do_auth(i_usr_email IN usr.usr_email%TYPE,
                   i_usr_pwd   IN usr.usr_pwd%TYPE,
                   o_id_usr    OUT usr.id_usr%TYPE) RETURN BOOLEAN IS
    l_function CONSTANT VARCHAR2(30) := 'do_auth';
    --
    l_id_usr        usr.id_usr%TYPE;
    l_usr_pwd_crypt usr.usr_pwd%TYPE;
    l_return        BOOLEAN;
    --
    -- user cursor
    CURSOR l_cur_usr IS
      SELECT usr.id_usr
        FROM usr
       WHERE upper(usr.usr_email) = upper(i_usr_email)
         AND usr.usr_pwd = l_usr_pwd_crypt
         AND usr.acc_active = 1;
    --
  BEGIN
    --
    l_usr_pwd_crypt := api_utils.do_encrypt(i_usr_pwd);
    --
    -- check user login
    OPEN l_cur_usr;
    FETCH l_cur_usr
      INTO l_id_usr;
    --
    IF l_cur_usr%FOUND THEN
      -- set Apex Auth Result to 0 (successful)
      apex_util.set_authentication_result(0);
      o_id_usr := l_id_usr;
      l_return := TRUE;
    ELSE
      -- set Apex Auth Result to 1 (wrong username)
      apex_util.set_authentication_result(1);
      l_return := FALSE;
    END IF;
    --
    CLOSE l_cur_usr;
    --
    RETURN l_return;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => 'User: ' || i_usr_email ||
                                           chr(10) || SQLERRM);
      RAISE;
  END do_auth;
  --
  /****************************************************************************
  * Purpose:  Apex Login Function
  * Author:   Daniel Hochleitner
  * Created:  13.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION do_login(p_username IN VARCHAR2,
                    p_password IN VARCHAR2) RETURN BOOLEAN IS
    l_function CONSTANT VARCHAR2(30) := 'do_login';
    --
    l_return BOOLEAN;
    l_id_usr usr.id_usr%TYPE;
    --
  BEGIN
    --
    -- authentification
    l_return := api_auth.do_auth(i_usr_email => p_username,
                                 i_usr_pwd   => p_password,
                                 o_id_usr    => l_id_usr);
    --
    -- if successful
    IF l_return THEN
      --
      -- set Apex Auth Result to 0 (successful)
      apex_util.set_authentication_result(0);
      --
      -- set User ID to app item
      apex_util.set_session_state(p_name  => 'F_ID_USR',
                                  p_value => l_id_usr);
    ELSE
      --
      -- set Apex Auth Result to 1 (wrong username)
      apex_util.set_authentication_result(1);
    END IF;
    --
    RETURN l_return;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => 'User: ' || p_username || chr(10) ||
                                           SQLERRM);
      RAISE;
  END do_login;
  --
END api_auth;
/

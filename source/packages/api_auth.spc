CREATE OR REPLACE PACKAGE api_auth IS
  --
  -- Package for user authentication and login
  --

  --
  -- User Auth, sets USR_ID
  -- #param i_usr_email
  -- #param i_usr_pwd
  -- #param o_id_usr
  -- #return Boolean
  FUNCTION do_auth(i_usr_email IN usr.usr_email%TYPE,
                   i_usr_pwd   IN usr.usr_pwd%TYPE,
                   o_id_usr    OUT usr.id_usr%TYPE) RETURN BOOLEAN;
  --
  -- Apex Login Function
  -- #param p_username
  -- #param p_password
  -- #return Boolean
  FUNCTION do_login(p_username IN VARCHAR2,
                    p_password IN VARCHAR2) RETURN BOOLEAN;
  --
END api_auth;
/

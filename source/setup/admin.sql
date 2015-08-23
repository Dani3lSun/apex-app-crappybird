Rem Setup Script to install admin user
Rem Author: Daniel Hochleitner

SET VERIFY OFF
SET DEFINE '&'

prompt Enter values below for installation of Admin user
prompt

whenever sqlerror exit

-- input of values
accept USR_FIRSTNAME CHAR prompt 'Enter firstname of admin user: '
accept USR_LASTNAME CHAR prompt 'Enter lastname of admin user: '
accept USR_EMAIL CHAR prompt 'Enter email of admin user (used for login): '
accept USR_PWD CHAR prompt 'Enter password of admin user (used for login): '

prompt ...creating admin user

-- create admin user procedure
set serveroutput on
BEGIN
  api_usr.do_insert_admin_setup(i_usr_firstname => '&USR_FIRSTNAME.',
                                i_usr_lastname  => '&USR_LASTNAME.',
                                i_usr_email     => '&USR_EMAIL.',
                                i_usr_pwd       => '&USR_PWD.');
END;
/
COMMIT;
/

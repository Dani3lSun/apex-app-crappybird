CREATE OR REPLACE PACKAGE api_mail IS
  --
  -- API-Package for sending Mails
  --

  --
  -- Send Email
  -- #param i_to
  -- #param i_from
  -- #param i_cc
  -- #param i_bcc
  -- #param i_replyto
  -- #param i_subject
  -- #param i_body
  -- #param i_body_html
  -- #return MAIL_ID
  FUNCTION send_mail(i_to        IN VARCHAR2 := NULL,
                     i_from      IN VARCHAR2 := NULL,
                     i_cc        IN VARCHAR2 := NULL,
                     i_bcc       IN VARCHAR2 := NULL,
                     i_replyto   IN VARCHAR2 := NULL,
                     i_subject   IN VARCHAR2,
                     i_body      IN CLOB,
                     i_body_html IN CLOB := NULL) RETURN NUMBER;
  --
END api_mail;
/

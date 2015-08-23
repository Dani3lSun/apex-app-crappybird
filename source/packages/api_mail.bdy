CREATE OR REPLACE PACKAGE BODY api_mail IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_mail';
  --
  /****************************************************************************
  * Purpose:  Send Email, wrapps APEX_MAIL.SEND
  * Author:   Daniel Hochleitner
  * Created:  13.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION send_mail(i_to        IN VARCHAR2 := NULL,
                     i_from      IN VARCHAR2 := NULL,
                     i_cc        IN VARCHAR2 := NULL,
                     i_bcc       IN VARCHAR2 := NULL,
                     i_replyto   IN VARCHAR2 := NULL,
                     i_subject   IN VARCHAR2,
                     i_body      IN CLOB,
                     i_body_html IN CLOB := NULL) RETURN NUMBER IS
    --
    l_function CONSTANT VARCHAR2(30) := 'send_mail';
    --
    l_workspace_id NUMBER;
    l_mail_id      NUMBER;
  BEGIN
    -- Set Apex Workspace ID and Security Group ID
    SELECT MAX(workspace_id)
      INTO l_workspace_id
      FROM apex_applications;
    --
    apex_util.set_security_group_id(p_security_group_id => l_workspace_id);
    -- send Mail
    l_mail_id := apex_mail.send(p_to        => i_to,
                                p_from      => i_from,
                                p_cc        => i_cc,
                                p_bcc       => i_bcc,
                                p_replyto   => i_replyto,
                                p_subj      => i_subject,
                                p_body      => i_body,
                                p_body_html => i_body_html);
    -- Push Queue (send now)
    apex_mail.push_queue();
    --
    RETURN l_mail_id;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END send_mail;
  --
END api_mail;
/

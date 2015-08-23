CREATE OR REPLACE PACKAGE BODY api_err_log IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_err_log';
  priv_id_err_log NUMBER;
  --
  /*************************************************************************
  * Purpose:  INSERTS dataset into err_log and returns PK
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  *************************************************************************/
  FUNCTION ins_err_log(i_rec_err_log IN pub_rec_err_log_type)
    RETURN err_log.id_err_log%TYPE IS
    l_function CONSTANT VARCHAR2(30) := 'ins_err_log';
    --
    PRAGMA AUTONOMOUS_TRANSACTION;
    --
    l_id_err_log err_log.id_err_log%TYPE;
  BEGIN
    --
    -- if id_err_log not present,
    -- get next value of Sequence
    --
    IF i_rec_err_log.id_err_log IS NULL THEN
      l_id_err_log := seq_pk.nextval;
    ELSE
      l_id_err_log := i_rec_err_log.id_err_log;
    END IF;
    --
    INSERT INTO err_log
      (err_log.id_err_log,
       err_log.err_log_function,
       err_log.err_log_text,
       err_log.err_log_date,
       err_log.id_usr,
       err_log.app_id,
       err_log.app_page_id)
    VALUES
      (l_id_err_log,
       i_rec_err_log.err_log_function,
       i_rec_err_log.err_log_text,
       i_rec_err_log.err_log_date,
       i_rec_err_log.id_usr,
       i_rec_err_log.app_id,
       i_rec_err_log.app_page_id);
    --
    COMMIT;
    --
    RETURN l_id_err_log;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END ins_err_log;
  --
  /*************************************************************************
  * Purpose:  UPDATES dataset of table err_log
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE upd_err_log(i_rec_err_log IN pub_rec_err_log_type,
                        i_checksum    IN VARCHAR2 := NULL) IS
    l_function CONSTANT VARCHAR2(30) := 'upd_err_log';
    --
    l_md5_bool   BOOLEAN := TRUE;
    l_rec_before api_err_log.pub_rec_err_log_type;
  BEGIN
    --
    l_rec_before := api_err_log.get_rec_err_log(i_id_err_log => i_rec_err_log.id_err_log);
    --
    IF i_checksum IS NOT NULL THEN
      l_md5_bool := do_check_md5_err_log(i_checksum    => i_checksum,
                                         i_rec_err_log => l_rec_before);
    END IF;
    --
    IF (i_checksum IS NULL) OR (l_md5_bool = TRUE) THEN
      UPDATE err_log
         SET err_log.err_log_function = i_rec_err_log.err_log_function,
             err_log.err_log_text     = i_rec_err_log.err_log_text,
             err_log.err_log_date     = i_rec_err_log.err_log_date,
             err_log.id_usr           = i_rec_err_log.id_usr,
             err_log.app_id           = i_rec_err_log.app_id,
             err_log.app_page_id      = i_rec_err_log.app_page_id
       WHERE id_err_log = i_rec_err_log.id_err_log;
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
  END upd_err_log;
  --
  /*************************************************************************
  * Purpose:  DELETES dataset of table err_log
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE del_err_log(i_id_err_log IN err_log.id_err_log%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'del_err_log';
  BEGIN
    --
    DELETE FROM err_log
     WHERE err_log.id_err_log = i_id_err_log;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END del_err_log;
  --
  /****************************************************************************
  * Purpose:  Get Record of table err_log
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_rec_err_log(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN pub_rec_err_log_type IS
    l_function CONSTANT VARCHAR2(30) := 'get_rec_err_log';
    --
    l_retval pub_rec_err_log_type;
    CURSOR l_cur_err_log IS
      SELECT err_log.id_err_log,
             err_log.err_log_function,
             err_log.err_log_text,
             err_log.err_log_date,
             err_log.id_usr,
             err_log.app_id,
             err_log.app_page_id
        FROM err_log
       WHERE err_log.id_err_log = i_id_err_log;
    l_rec_cur l_cur_err_log%ROWTYPE;
    --
  BEGIN
    --
    OPEN l_cur_err_log;
    FETCH l_cur_err_log
      INTO l_rec_cur;
    IF l_cur_err_log%FOUND THEN
      l_retval.id_err_log       := l_rec_cur.id_err_log;
      l_retval.err_log_function := l_rec_cur.err_log_function;
      l_retval.err_log_text     := l_rec_cur.err_log_text;
      l_retval.err_log_date     := l_rec_cur.err_log_date;
      l_retval.id_usr           := l_rec_cur.id_usr;
      l_retval.app_id           := l_rec_cur.app_id;
      l_retval.app_page_id      := l_rec_cur.app_page_id;
    END IF;
    CLOSE l_cur_err_log;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_rec_err_log;
  --
  /*************************************************************************
  * Purpose:  Generates md5 checksum for err_log using Record-type
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  *************************************************************************/
  FUNCTION get_md5_err_log(i_rec_err_log IN pub_rec_err_log_type)
    RETURN VARCHAR2 IS
    l_function CONSTANT VARCHAR2(30) := 'get_md5_err_log';
    --
    l_md5_string VARCHAR2(32000);
    l_rec_string CLOB;
    l_seperator  VARCHAR2(10) := '|';
  BEGIN
    --
    l_rec_string := i_rec_err_log.id_err_log || l_seperator ||
                    i_rec_err_log.err_log_function || l_seperator ||
                    i_rec_err_log.err_log_text || l_seperator ||
                    i_rec_err_log.err_log_date || l_seperator ||
                    i_rec_err_log.id_usr || l_seperator ||
                    i_rec_err_log.app_id || l_seperator ||
                    i_rec_err_log.app_page_id || l_seperator;
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
  END get_md5_err_log;
  --
  /*************************************************************************
  * Purpose:  Compares (Before/After) md5 checksum of err_log
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  *************************************************************************/
  FUNCTION do_check_md5_err_log(i_checksum    IN VARCHAR2,
                                i_rec_err_log IN pub_rec_err_log_type)
    RETURN BOOLEAN IS
    l_function CONSTANT VARCHAR2(30) := 'do_check_md5_err_log';
    --
    l_md5_string VARCHAR2(32000);
    l_return     BOOLEAN;
  BEGIN
    --
    l_md5_string := get_md5_err_log(i_rec_err_log => i_rec_err_log);
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
  END do_check_md5_err_log;
  --
  /****************************************************************************
  * Purpose:  Get err_log.id_err_log of err_log
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_err_log(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.id_err_log%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_err_log';
    --
    l_retval err_log.id_err_log%TYPE;
    CURSOR l_cur_err_log IS
      SELECT err_log.id_err_log
        FROM err_log
       WHERE err_log.id_err_log = i_id_err_log;
  BEGIN
    --
    OPEN l_cur_err_log;
    FETCH l_cur_err_log
      INTO l_retval;
    CLOSE l_cur_err_log;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_err_log;
  --

  /****************************************************************************
  * Purpose:  Get err_log.err_log_function of err_log
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_err_log_function(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.err_log_function%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_err_log_function';
    --
    l_retval err_log.err_log_function%TYPE;
    CURSOR l_cur_err_log IS
      SELECT err_log.err_log_function
        FROM err_log
       WHERE err_log.id_err_log = i_id_err_log;
  BEGIN
    --
    OPEN l_cur_err_log;
    FETCH l_cur_err_log
      INTO l_retval;
    CLOSE l_cur_err_log;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_err_log_function;
  --

  /****************************************************************************
  * Purpose:  Get err_log.err_log_text of err_log
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_err_log_text(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.err_log_text%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_err_log_text';
    --
    l_retval err_log.err_log_text%TYPE;
    CURSOR l_cur_err_log IS
      SELECT err_log.err_log_text
        FROM err_log
       WHERE err_log.id_err_log = i_id_err_log;
  BEGIN
    --
    OPEN l_cur_err_log;
    FETCH l_cur_err_log
      INTO l_retval;
    CLOSE l_cur_err_log;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_err_log_text;
  --

  /****************************************************************************
  * Purpose:  Get err_log.err_log_date of err_log
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_err_log_date(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.err_log_date%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_err_log_date';
    --
    l_retval err_log.err_log_date%TYPE;
    CURSOR l_cur_err_log IS
      SELECT err_log.err_log_date
        FROM err_log
       WHERE err_log.id_err_log = i_id_err_log;
  BEGIN
    --
    OPEN l_cur_err_log;
    FETCH l_cur_err_log
      INTO l_retval;
    CLOSE l_cur_err_log;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_err_log_date;
  --

  /****************************************************************************
  * Purpose:  Get err_log.id_usr of err_log
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.id_usr%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr';
    --
    l_retval err_log.id_usr%TYPE;
    CURSOR l_cur_err_log IS
      SELECT err_log.id_usr
        FROM err_log
       WHERE err_log.id_err_log = i_id_err_log;
  BEGIN
    --
    OPEN l_cur_err_log;
    FETCH l_cur_err_log
      INTO l_retval;
    CLOSE l_cur_err_log;
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
  * Purpose:  Get err_log.app_id of err_log
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_app_id(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.app_id%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_app_id';
    --
    l_retval err_log.app_id%TYPE;
    CURSOR l_cur_err_log IS
      SELECT err_log.app_id
        FROM err_log
       WHERE err_log.id_err_log = i_id_err_log;
  BEGIN
    --
    OPEN l_cur_err_log;
    FETCH l_cur_err_log
      INTO l_retval;
    CLOSE l_cur_err_log;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_app_id;
  --

  /****************************************************************************
  * Purpose:  Get err_log.app_page_id of err_log
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_app_page_id(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.app_page_id%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_app_page_id';
    --
    l_retval err_log.app_page_id%TYPE;
    CURSOR l_cur_err_log IS
      SELECT err_log.app_page_id
        FROM err_log
       WHERE err_log.id_err_log = i_id_err_log;
  BEGIN
    --
    OPEN l_cur_err_log;
    FETCH l_cur_err_log
      INTO l_retval;
    CLOSE l_cur_err_log;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_app_page_id;
  --
  /****************************************************************************
  * Purpose:  Do error log entries for database funtions
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE do_log(i_log_function IN VARCHAR2,
                   i_log_text     IN CLOB) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_log';
    --
    l_rec_log api_err_log.pub_rec_err_log_type;
    --
  BEGIN
    --
    l_rec_log.err_log_function := substr(i_log_function,
                                         1,
                                         1000);
    l_rec_log.err_log_text     := i_log_text;
    l_rec_log.err_log_date     := SYSDATE;
    l_rec_log.id_usr           := v('F_ID_USR');
    l_rec_log.app_id           := v('APP_ID');
    l_rec_log.app_page_id      := v('APP_PAGE_ID');
    --
    priv_id_err_log := api_err_log.ins_err_log(i_rec_err_log => l_rec_log);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_log;
  --
  /****************************************************************************
  * Purpose:  Do error log entries for apex
  * Author:   Daniel Hochleitner
  * Created:  13.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION do_log_apex(p_error IN apex_error.t_error)
    RETURN apex_error.t_error_result IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_log_apex';
    --
    l_result          apex_error.t_error_result;
    l_log_function    VARCHAR2(1000);
    l_http_user_agent VARCHAR2(400);
    l_session_var     VARCHAR2(200);
    l_log_text        CLOB;
    l_rec_log         api_err_log.pub_rec_err_log_type;
  BEGIN
    l_result := apex_error.init_error_result(p_error => p_error);
    --
    l_http_user_agent := substr(owa_util.get_cgi_env('HTTP_USER_AGENT'),
                                1,
                                400);
    --
    l_session_var := substr('F_ID_USR: ' || v('F_ID_USR') || 'APP_SESSION:' ||
                            v('APP_SESSION'),
                            1,
                            200);
    --
    l_log_function := substr('APEX: ' || p_error.component.type || ' - ' ||
                             p_error.component.name,
                             1,
                             1000);
    --
    l_log_text := p_error.ora_sqlerrm || chr(10) || 'ERROR_MESSAGE: ' ||
                  chr(10) || p_error.message || chr(10) ||
                  'APEX_COMPONENT: ' || chr(10) || p_error.component.type ||
                  ' - ' || p_error.component.name || chr(10) ||
                  'APEX_ERROR_CODE: ' || chr(10) || p_error.apex_error_code ||
                  chr(10) || 'ERROR_BACKTRACE: ' || chr(10) ||
                  p_error.error_backtrace || chr(10) || 'HTTP_USER_AGENT: ' ||
                  chr(10) || l_http_user_agent || chr(10) || 'SESSION:' ||
                  chr(10) || l_session_var;
    --
  
    l_rec_log.err_log_function := l_log_function;
    l_rec_log.err_log_text     := l_log_text;
    l_rec_log.err_log_date     := SYSDATE;
    l_rec_log.id_usr           := v('F_ID_USR');
    l_rec_log.app_id           := v('APP_ID');
    l_rec_log.app_page_id      := v('APP_PAGE_ID');
    --
    priv_id_err_log := api_err_log.ins_err_log(i_rec_err_log => l_rec_log);
    --
    RETURN l_result;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_log_apex;
  --
END api_err_log;
/

CREATE OR REPLACE PACKAGE api_err_log IS
  --
  -- API-Package for table err_log
  --

  --
  -- Record for err_log
  --
  TYPE pub_rec_err_log_type IS RECORD(
    id_err_log       err_log.id_err_log%TYPE,
    err_log_function err_log.err_log_function%TYPE,
    err_log_text     err_log.err_log_text%TYPE,
    err_log_date     err_log.err_log_date%TYPE,
    id_usr           err_log.id_usr%TYPE,
    app_id           err_log.app_id%TYPE,
    app_page_id      err_log.app_page_id%TYPE);
  --
  -- Inserts dataset in err_log
  -- #param  i_rec_err_log Record-Type of table
  -- #return ID (PK of dataset)
  FUNCTION ins_err_log(i_rec_err_log IN pub_rec_err_log_type)
    RETURN err_log.id_err_log%TYPE;
  --
  --
  -- Updates datset of table err_log
  -- #param  i_rec_err_log  Record-Type of err_log
  -- #param  i_checksum Checksumme md5 before
  PROCEDURE upd_err_log(i_rec_err_log IN pub_rec_err_log_type,
                        i_checksum    IN VARCHAR2 := NULL);
  --
  --
  -- Deletes dataset of table err_log
  -- #param  i_id_err_log  PK-ID of err_log
  PROCEDURE del_err_log(i_id_err_log IN err_log.id_err_log%TYPE);
  --
  --
  -- Get record of table err_log
  -- #param i_id_err_log ID aus err_log
  -- #return Record-Type for err_log
  FUNCTION get_rec_err_log(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN pub_rec_err_log_type;
  --
  --
  -- Generates md5 checksum for err_log
  -- #param  i_rec_err_log Record-Type of table
  -- #return md5 Checksum in Varchar2
  FUNCTION get_md5_err_log(i_rec_err_log IN pub_rec_err_log_type)
    RETURN VARCHAR2;
  --
  --
  -- Compares (Before/After) md5 checksum for err_log
  -- #param  i_checksum checksum before
  -- #param  i_rec_err_log Record-Type of table
  -- #return Boolean value
  FUNCTION do_check_md5_err_log(i_checksum    IN VARCHAR2,
                                i_rec_err_log IN pub_rec_err_log_type)
    RETURN BOOLEAN;
  --
  --
  -- Get id_err_log of err_log
  -- #param i_id_err_log Id der err_log
  -- #return id_err_log aus err_log
  FUNCTION get_id_err_log(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.id_err_log%TYPE;
  --

  --
  -- Get err_log_function of err_log
  -- #param i_id_err_log Id der err_log
  -- #return err_log_function aus err_log
  FUNCTION get_err_log_function(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.err_log_function%TYPE;
  --

  --
  -- Get err_log_text of err_log
  -- #param i_id_err_log Id der err_log
  -- #return err_log_text aus err_log
  FUNCTION get_err_log_text(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.err_log_text%TYPE;
  --

  --
  -- Get err_log_date of err_log
  -- #param i_id_err_log Id der err_log
  -- #return err_log_date aus err_log
  FUNCTION get_err_log_date(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.err_log_date%TYPE;
  --

  --
  -- Get id_usr of err_log
  -- #param i_id_err_log Id der err_log
  -- #return id_usr aus err_log
  FUNCTION get_id_usr(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.id_usr%TYPE;
  --

  --
  -- Get app_id of err_log
  -- #param i_id_err_log Id der err_log
  -- #return app_id aus err_log
  FUNCTION get_app_id(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.app_id%TYPE;
  --

  --
  -- Get app_page_id of err_log
  -- #param i_id_err_log Id der err_log
  -- #return app_page_id aus err_log
  FUNCTION get_app_page_id(i_id_err_log IN err_log.id_err_log%TYPE)
    RETURN err_log.app_page_id%TYPE;
  --
  -- Do error log entries for database funtions
  -- #param i_log_function
  -- #param i_log_text
  PROCEDURE do_log(i_log_function IN VARCHAR2,
                   i_log_text     IN CLOB);
  --
  -- Do error log entries for apex
  -- #param p_error apex_error.t_error
  -- #return apex_error.t_error_result
  FUNCTION do_log_apex(p_error IN apex_error.t_error)
    RETURN apex_error.t_error_result;
  --

END api_err_log;
/

CREATE OR REPLACE PACKAGE api_usr_token IS
  --
  -- API-Package for table usr_token
  --

  --
  -- Record for usr_token
  --
  TYPE pub_rec_usr_token_type IS RECORD(
    id_usr_token usr_token.id_usr_token%TYPE,
    id_usr       usr_token.id_usr%TYPE,
    token        usr_token.token%TYPE,
    token_date   usr_token.token_date%TYPE);
  --
  -- Inserts dataset in usr_token
  -- #param  i_rec_usr_token Record-Type of table
  -- #return ID (PK of dataset)
  FUNCTION ins_usr_token(i_rec_usr_token IN pub_rec_usr_token_type)
    RETURN usr_token.id_usr_token%TYPE;
  --
  --
  -- Updates datset of table usr_token
  -- #param  i_rec_usr_token  Record-Type of usr_token
  -- #param  i_checksum Checksumme md5 before
  PROCEDURE upd_usr_token(i_rec_usr_token IN pub_rec_usr_token_type,
                          i_checksum      IN VARCHAR2 := NULL);
  --
  --
  -- Deletes dataset of table usr_token
  -- #param  i_id_usr_token  PK-ID of usr_token
  PROCEDURE del_usr_token(i_id_usr_token IN usr_token.id_usr_token%TYPE);
  --
  --
  -- Get record of table usr_token
  -- #param i_id_usr_token ID aus usr_token
  -- #return Record-Type for usr_token
  FUNCTION get_rec_usr_token(i_id_usr_token IN usr_token.id_usr_token%TYPE)
    RETURN pub_rec_usr_token_type;
  --
  --
  -- Generates md5 checksum for usr_token
  -- #param  i_rec_usr_token Record-Type of table
  -- #return md5 Checksum in Varchar2
  FUNCTION get_md5_usr_token(i_rec_usr_token IN pub_rec_usr_token_type)
    RETURN VARCHAR2;
  --
  --
  -- Compares (Before/After) md5 checksum for usr_token
  -- #param  i_checksum checksum before
  -- #param  i_rec_usr_token Record-Type of table
  -- #return Boolean value
  FUNCTION do_check_md5_usr_token(i_checksum      IN VARCHAR2,
                                  i_rec_usr_token IN pub_rec_usr_token_type)
    RETURN BOOLEAN;
  --
  --
  -- Get id_usr_token of usr_token
  -- #param i_id_usr_token Id der usr_token
  -- #return id_usr_token aus usr_token
  FUNCTION get_id_usr_token(i_id_usr_token IN usr_token.id_usr_token%TYPE)
    RETURN usr_token.id_usr_token%TYPE;
  --

  --
  -- Get id_usr of usr_token
  -- #param i_id_usr_token Id der usr_token
  -- #return id_usr aus usr_token
  FUNCTION get_id_usr(i_id_usr_token IN usr_token.id_usr_token%TYPE)
    RETURN usr_token.id_usr%TYPE;
  --

  --
  -- Get token of usr_token
  -- #param i_id_usr_token Id der usr_token
  -- #return token aus usr_token
  FUNCTION get_token(i_id_usr_token IN usr_token.id_usr_token%TYPE)
    RETURN usr_token.token%TYPE;
  --

  --
  -- Get token_date of usr_token
  -- #param i_id_usr_token Id der usr_token
  -- #return token_date aus usr_token
  FUNCTION get_token_date(i_id_usr_token IN usr_token.id_usr_token%TYPE)
    RETURN usr_token.token_date%TYPE;
  --
  -- Ckeck if a User Token is Valid (Default Time: Sysdate - 60 minutes)
  -- #param i_id_usr
  -- #param i_token
  -- #param i_default_min
  -- #return BOOLEAN
  FUNCTION check_token_valid(i_id_usr      IN usr_token.id_usr%TYPE,
                             i_token       usr_token.token%TYPE,
                             i_default_min IN NUMBER := 60) RETURN BOOLEAN;
  --
  -- DELETES all tokens from specified user
  -- #param id_usr
  PROCEDURE del_token_per_usr(i_id_usr IN usr_token.id_usr%TYPE);
  --

END api_usr_token;
/

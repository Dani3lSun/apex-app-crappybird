CREATE OR REPLACE PACKAGE api_utils IS
  --
  -- API-Package for different things
  --

  --
  -- Default encryption-key
  -- #return Key-String
  FUNCTION get_key RETURN VARCHAR2;
  --
  -- Encrypt a string
  -- #param i_string
  -- #return encrypted string
  FUNCTION do_encrypt(i_string VARCHAR2) RETURN VARCHAR2;
  --
  -- Decrypt a string
  -- #param i_string
  -- #return decrypted string
  FUNCTION do_decrypt(i_string VARCHAR2) RETURN VARCHAR2;
  --
  -- DEFAULT-TEMPLATE for password generator
  -- #return template string
  FUNCTION get_pwd_template RETURN VARCHAR2;
  --
  -- DEFAULT-TEMPLATE for token generator (Template without specials chars)
  -- #return template string
  FUNCTION get_token_template RETURN VARCHAR2;
  --
  -- Password Generator
  -- #param i_template
  -- #return password string
  FUNCTION pwd_gen(i_template IN VARCHAR2) RETURN VARCHAR2;
  --
  -- Check Email if correctly formatted
  -- #param i_email_adr
  -- #return Boolean
  FUNCTION do_check_email(i_email_adr IN VARCHAR2) RETURN BOOLEAN;
  --
  -- Wrapper for APEX_ZIP.ADD_FILE
  -- #param p_zipped_blob
  -- #param p_name
  -- #param p_content
  PROCEDURE zip_add_file(p_zipped_blob IN OUT NOCOPY BLOB,
                         p_name        IN VARCHAR2,
                         p_content     CLOB);
  --
END api_utils;
/

CREATE OR REPLACE PACKAGE BODY api_utils IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_utils';
  --
  /****************************************************************************
  * Purpose:  Default encryption-key
  * Author:   Daniel Hochleitner
  * Created:  13.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION get_key RETURN VARCHAR2 IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_key';
    --
  BEGIN
    RETURN '2A429F44B3A616FFCE5CBB3FD454F09743CD51576D525997924DAD04A0C44DF6';
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_key;
  --
  /****************************************************************************
  * Purpose:  Encrypt a string
  * Author:   Daniel Hochleitner
  * Created:  13.08.2015
  * Geändert:
  ****************************************************************************/
  FUNCTION do_encrypt(i_string VARCHAR2) RETURN VARCHAR2 IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_encrypt';
    --
    l_encrypt_string VARCHAR2(4000);
    l_raw_data       RAW(300);
    l_encryption     PLS_INTEGER := dbms_crypto.encrypt_aes256 +
                                    dbms_crypto.chain_cbc +
                                    dbms_crypto.pad_zero;
  BEGIN
    l_raw_data := dbms_crypto.encrypt(src => utl_i18n.string_to_raw(i_string,
                                                                    'AL32UTF8'),
                                      typ => l_encryption,
                                      key => get_key);
    --
    l_encrypt_string := rawtohex(l_raw_data);
    --
    RETURN l_encrypt_string;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_encrypt;
  --
  /****************************************************************************
  * Purpose:  Decrypt a string
  * Author:   Daniel Hochleitner
  * Created:  06.05.2015
  * Changed:
  ****************************************************************************/
  FUNCTION do_decrypt(i_string VARCHAR2) RETURN VARCHAR2 IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_decrypt';
    --
    l_decrypt_string VARCHAR2(4000);
    l_raw_data       RAW(300);
    l_encryption     PLS_INTEGER := dbms_crypto.encrypt_aes256 +
                                    dbms_crypto.chain_cbc +
                                    dbms_crypto.pad_zero;
  BEGIN
    l_raw_data := dbms_crypto.decrypt(src => hextoraw(i_string),
                                      typ => l_encryption,
                                      key => get_key);
    --
    l_decrypt_string := utl_i18n.raw_to_char(l_raw_data,
                                             'AL32UTF8');
    --
    RETURN l_decrypt_string;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_decrypt;
  --
  /****************************************************************************
  * Purpose:  DEFAULT-TEMPLATE for password generator
  * Author:   Daniel Hochleitner
  * Created:  13.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION get_pwd_template RETURN VARCHAR2 IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_pwd_template';
    --
  BEGIN
    RETURN 'ulnxudxaunlelu';
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_pwd_template;
  --
  /****************************************************************************
  * Purpose:  DEFAULT-TEMPLATE for token generator (Template without specials chars)
  * Author:   Daniel Hochleitner
  * Created:  14.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION get_token_template RETURN VARCHAR2 IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_token_template';
    --
  BEGIN
    RETURN 'ulnualaaunluluaaluau';
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_token_template;
  --
  /****************************************************************************
  * Purpose: Password Generator
  * Author:  Daniel Hochleitner
  * Created: 13.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION pwd_gen(i_template IN VARCHAR2) RETURN VARCHAR2 IS
    /*
    Template characters :
    * u upper case alpha characters only
    * l lower case alpha characters only
    * a alpha characters only (mixed case)
    * x any alpha-numeric characters (upper)
    * y any alpha-numeric characters (lower)
    * n numeric characters*
    * p any printable char (ASCII subset)*
    * c any NON-alphanumeric characters
    * b any non-alpha characters
    * d any non-alpha characters (useful mode)
    * e any NON-alphanumeric characters (useful mode)
    */
    n    NUMBER;
    rval NUMBER;
    v    VARCHAR2(1);
    vret VARCHAR2(4000);
    vstr VARCHAR2(4000);
    nrng NUMBER;
    l_function CONSTANT VARCHAR2(30) := 'pass_gen';
  BEGIN
    n    := length(i_template);
    v    := '';
    vret := '';
    FOR i IN 1 .. n LOOP
      v := substr(i_template,
                  i,
                  1);
      IF v = 'u' THEN
        -- upper case alpha characters only
        vstr := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      ELSIF v = 'l' THEN
        -- lower case alpha characters only
        vstr := 'abcdefghijklmnopqrstuvwxyz';
      ELSIF v = 'a' THEN
        -- alpha characters only (mixed case)
        vstr := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
      ELSIF v = 'x' THEN
        -- any alpha-numeric characters (upper)
        vstr := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      ELSIF v = 'y' THEN
        -- any alpha-numeric characters (lower)
        vstr := '0123456789abcdefghijklmnopqrstuvwxyz';
      ELSIF v = 'n' THEN
        -- numeric characters
        vstr := '0123456789';
      ELSIF v = 'p' THEN
        -- any printable char (ASCII subset)
        vstr := ' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      ELSIF v = 'r' THEN
        -- any printable char (ASCII subset) (useful mode)
        vstr := '!#$%&()*0123456789+/<=>?@\{}[]ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
      ELSIF v = 'c' THEN
        -- any NON-alphanumeric characters
        vstr := ' !"#$%&''()*+,-./:;<=>?@[\]^_`{|}~';
      ELSIF v = 'e' THEN
        -- any NON-alphanumeric characters (useful mode)
        vstr := '!#$%&()*+/<=>?@\{}[]';
      ELSIF v = 'b' THEN
        -- any non-alpha characters
        vstr := ' !"#$%&''()*+,-./0123456789:;<=>?@[\]^_`{|}~';
      ELSIF v = 'd' THEN
        -- any non-alpha characters (useful mode)
        vstr := '!#$%&()*0123456789+/<=>?@\{}[]';
      ELSE
        vstr := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      END IF;
      nrng := length(vstr);
      rval := trunc(nrng * dbms_random.value) + 1;
      vret := vret || substr(vstr,
                             rval,
                             1);
    END LOOP;
    RETURN vret;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END pwd_gen;
  --
  /****************************************************************************
  * Purpose:  Check Email if correctly formatted
  * Author:   Daniel Hochleitner
  * Created:  13.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION do_check_email(i_email_adr IN VARCHAR2) RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'do_check_email';
    l_domain VARCHAR2(100);
    l_tld    VARCHAR2(100);
    l_length NUMBER;
    --
  BEGIN
    IF i_email_adr IS NULL THEN
      RETURN TRUE;
    END IF;
    --
    -- check if "." and "@" are present
    --
    IF instr(i_email_adr,
             '.') = 0 OR instr(i_email_adr,
                               '@') = 0 THEN
      RETURN FALSE;
      -- check if multiple "@" are present
    END IF;
    IF instr(i_email_adr,
             '@',
             1,
             2) > 0 THEN
      RETURN FALSE;
    END IF;
    --
    -- check some special chars
    --
    IF instr(i_email_adr,
             '§') > 0 THEN
      RETURN FALSE;
    END IF;
    --    
    IF instr(i_email_adr,
             '$') > 0 THEN
      RETURN FALSE;
    END IF;
    --
    IF instr(i_email_adr,
             '%') > 0 THEN
      RETURN FALSE;
    END IF;
    --
    IF instr(i_email_adr,
             '&') > 0 THEN
      RETURN FALSE;
    END IF;
    --
    IF instr(i_email_adr,
             '/') > 0 THEN
      RETURN FALSE;
    END IF;
    --
    IF instr(i_email_adr,
             '(') > 0 THEN
      RETURN FALSE;
    END IF;
    --
    IF instr(i_email_adr,
             ')') > 0 THEN
      RETURN FALSE;
    END IF;
    --
    IF instr(i_email_adr,
             '?') > 0 THEN
      RETURN FALSE;
    END IF;
    --
    -- check if blank is present
    --
    IF instr(i_email_adr,
             ' ') != 0 THEN
      RETURN FALSE;
    END IF;
    --
    -- check if domain has an "."
    --
    l_domain := substr(i_email_adr,
                       instr(i_email_adr,
                             '@') + 1);
    IF instr(l_domain,
             '.') = 0 THEN
      RETURN FALSE;
    END IF;
    --
    -- check if Top-Level-Domain has min. 2 chars
    --
    l_tld    := substr(l_domain,
                       instr(l_domain,
                             '.') + 1);
    l_length := length(l_tld);
    IF l_length < 2 THEN
      RETURN FALSE;
    END IF;
    --
    -- check Top-Level-Domain if valid
    --
    l_tld := REPLACE(l_tld,
                     '.');
  
    FOR i IN 1 .. l_length LOOP
      IF substr(upper(l_tld),
                i,
                1) NOT BETWEEN 'A' AND 'Z' THEN
        RETURN FALSE;
      END IF;
    END LOOP;
    --
    -- email is correct
    --
    RETURN TRUE;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_check_email;
  --
  /****************************************************************************
  * Purpose:  Wrapper for APEX_ZIP.ADD_FILE
  * Author:   Daniel Hochleitner
  * Created:  13.08.2015
  * Changed:
  ****************************************************************************/
  PROCEDURE zip_add_file(p_zipped_blob IN OUT NOCOPY BLOB,
                         p_name        IN VARCHAR2,
                         p_content     CLOB) AS
    --
    l_function CONSTANT VARCHAR2(30) := 'zip_add_file';
    l_tmp       BLOB;
    dest_offset INTEGER := 1;
    src_offset  INTEGER := 1;
    l_warning   INTEGER;
    l_lang_ctx  INTEGER := dbms_lob.default_lang_ctx;
    --
  BEGIN
    dbms_lob.createtemporary(l_tmp,
                             TRUE);
    --
    dbms_lob.converttoblob(l_tmp,
                           p_content,
                           dbms_lob.lobmaxsize,
                           dest_offset,
                           src_offset,
                           nls_charset_id('AL32UTF8'),
                           l_lang_ctx,
                           l_warning);
    --
    apex_zip.add_file(p_zipped_blob,
                      p_name,
                      l_tmp);
    --
    dbms_lob.freetemporary(l_tmp);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END zip_add_file;
  --
END api_utils;
/

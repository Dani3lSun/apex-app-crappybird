CREATE OR REPLACE PACKAGE api_system IS
  --
  -- API-Package for table system
  --

  --
  -- Constants
  --
  pubc_system_pk CONSTANT NUMBER := 10;
  --
  -- Record for system
  --
  TYPE pub_rec_system_type IS RECORD(
    id_system               system.id_system%TYPE,
    twitter_consumer_key    system.twitter_consumer_key%TYPE,
    twitter_consumer_secret system.twitter_consumer_secret%TYPE,
    twitter_api_bearer      system.twitter_api_bearer%TYPE,
    twitter_ssl_wallet_path system.twitter_ssl_wallet_path%TYPE,
    twitter_ssl_wallet_pwd  system.twitter_ssl_wallet_pwd%TYPE,
    email_from              system.email_from%TYPE,
    email_register_subject  system.email_register_subject%TYPE,
    email_register_text     system.email_register_text%TYPE,
    email_usrpwd_subject    system.email_usrpwd_subject%TYPE,
    email_usrpwd_text       system.email_usrpwd_text%TYPE);
  --
  -- Functions for constants
  --
  FUNCTION getc_system_pk RETURN NUMBER;
  --
  -- Inserts dataset in system
  -- #param  i_rec_system Record-Type of table
  -- #return ID (PK of dataset)
  FUNCTION ins_system(i_rec_system IN pub_rec_system_type)
    RETURN system.id_system%TYPE;
  --
  --
  -- Updates datset of table system
  -- #param  i_rec_system  Record-Type of system
  -- #param  i_checksum Checksumme md5 before
  PROCEDURE upd_system(i_rec_system IN pub_rec_system_type,
                       i_checksum   IN VARCHAR2 := NULL);
  --
  --
  -- Deletes dataset of table system
  -- #param  i_id_system  PK-ID of system
  PROCEDURE del_system(i_id_system IN system.id_system%TYPE);
  --
  --
  -- Get record of table system
  -- #param i_id_system ID aus system
  -- #return Record-Type for system
  FUNCTION get_rec_system(i_id_system IN system.id_system%TYPE)
    RETURN pub_rec_system_type;
  --
  --
  -- Generates md5 checksum for system
  -- #param  i_rec_system Record-Type of table
  -- #return md5 Checksum in Varchar2
  FUNCTION get_md5_system(i_rec_system IN pub_rec_system_type)
    RETURN VARCHAR2;
  --
  --
  -- Compares (Before/After) md5 checksum for system
  -- #param  i_checksum checksum before
  -- #param  i_rec_system Record-Type of table
  -- #return Boolean value
  FUNCTION do_check_md5_system(i_checksum   IN VARCHAR2,
                               i_rec_system IN pub_rec_system_type)
    RETURN BOOLEAN;
  --
  --
  -- Get id_system of system
  -- #param i_id_system Id der system
  -- #return id_system aus system
  FUNCTION get_id_system(i_id_system IN system.id_system%TYPE)
    RETURN system.id_system%TYPE;
  --

  --
  -- Get twitter_consumer_key of system
  -- #param i_id_system Id der system
  -- #return twitter_consumer_key aus system
  FUNCTION get_twitter_consumer_key(i_id_system IN system.id_system%TYPE)
    RETURN system.twitter_consumer_key%TYPE;
  --

  --
  -- Get twitter_consumer_secret of system
  -- #param i_id_system Id der system
  -- #return twitter_consumer_secret aus system
  FUNCTION get_twitter_consumer_secret(i_id_system IN system.id_system%TYPE)
    RETURN system.twitter_consumer_secret%TYPE;
  --

  --
  -- Get twitter_api_bearer of system
  -- #param i_id_system Id der system
  -- #return twitter_api_bearer aus system
  FUNCTION get_twitter_api_bearer(i_id_system IN system.id_system%TYPE)
    RETURN system.twitter_api_bearer%TYPE;
  --

  --
  -- Get twitter_ssl_wallet_path of system
  -- #param i_id_system Id der system
  -- #return twitter_ssl_wallet_path aus system
  FUNCTION get_twitter_ssl_wallet_path(i_id_system IN system.id_system%TYPE)
    RETURN system.twitter_ssl_wallet_path%TYPE;
  --

  --
  -- Get twitter_ssl_wallet_pwd of system
  -- #param i_id_system Id der system
  -- #return twitter_ssl_wallet_pwd aus system
  FUNCTION get_twitter_ssl_wallet_pwd(i_id_system IN system.id_system%TYPE)
    RETURN system.twitter_ssl_wallet_pwd%TYPE;
  --

  --
  -- Get email_from of system
  -- #param i_id_system Id der system
  -- #return email_from aus system
  FUNCTION get_email_from(i_id_system IN system.id_system%TYPE)
    RETURN system.email_from%TYPE;
  --

  --
  -- Get email_register_subject of system
  -- #param i_id_system Id der system
  -- #return email_register_subject aus system
  FUNCTION get_email_register_subject(i_id_system IN system.id_system%TYPE)
    RETURN system.email_register_subject%TYPE;
  --

  --
  -- Get email_register_text of system
  -- #param i_id_system Id der system
  -- #return email_register_text aus system
  FUNCTION get_email_register_text(i_id_system IN system.id_system%TYPE)
    RETURN system.email_register_text%TYPE;
  --

  --
  -- Get email_usrpwd_subject of system
  -- #param i_id_system Id der system
  -- #return email_usrpwd_subject aus system
  FUNCTION get_email_usrpwd_subject(i_id_system IN system.id_system%TYPE)
    RETURN system.email_usrpwd_subject%TYPE;
  --

  --
  -- Get email_usrpwd_text of system
  -- #param i_id_system Id der system
  -- #return email_usrpwd_text aus system
  FUNCTION get_email_usrpwd_text(i_id_system IN system.id_system%TYPE)
    RETURN system.email_usrpwd_text%TYPE;
  --
  -- Fills the items on system admin pages
  -- #param o_twitter_consumer_key
  -- #param o_twitter_consumer_secret
  -- #param o_twitter_ssl_wallet_path
  -- #param o_twitter_ssl_wallet_pwd
  -- #param o_email_from
  PROCEDURE do_fill_system(o_twitter_consumer_key    OUT system.twitter_consumer_key%TYPE,
                           o_twitter_consumer_secret OUT system.twitter_consumer_secret%TYPE,
                           o_twitter_ssl_wallet_path OUT system.twitter_ssl_wallet_path%TYPE,
                           o_twitter_ssl_wallet_pwd  OUT system.twitter_ssl_wallet_pwd%TYPE,
                           o_email_from              OUT system.email_from%TYPE);
  --
  -- Updates SYSTEM Table from system edit page
  -- #param i_twitter_consumer_key
  -- #param i_twitter_consumer_secret
  -- #param i_twitter_ssl_wallet_path
  -- #param i_twitter_ssl_wallet_pwd
  -- #param i_email_from
  PROCEDURE do_update_system(i_twitter_consumer_key    IN system.twitter_consumer_key%TYPE,
                             i_twitter_consumer_secret IN system.twitter_consumer_secret%TYPE,
                             i_twitter_ssl_wallet_path IN system.twitter_ssl_wallet_path%TYPE,
                             i_twitter_ssl_wallet_pwd  IN system.twitter_ssl_wallet_pwd%TYPE,
                             i_email_from              IN system.email_from%TYPE);
  --
  -- Insert System defaults in setup script
  -- #param i_twitter_consumer_key
  -- #param i_twitter_consumer_secret
  -- #param i_twitter_ssl_wallet_path
  -- #param i_twitter_ssl_wallet_pwd
  -- #param i_email_from
  PROCEDURE do_insert_system_setup(i_twitter_consumer_key    IN system.twitter_consumer_key%TYPE,
                                   i_twitter_consumer_secret IN system.twitter_consumer_secret%TYPE,
                                   i_twitter_ssl_wallet_path IN system.twitter_ssl_wallet_path%TYPE,
                                   i_twitter_ssl_wallet_pwd  IN system.twitter_ssl_wallet_pwd%TYPE,
                                   i_email_from              IN system.email_from%TYPE);
  --

END api_system;
/

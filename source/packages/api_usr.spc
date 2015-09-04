CREATE OR REPLACE PACKAGE api_usr IS
  --
  -- API-Package for table usr
  --

  --
  -- Constants
  --
  pubc_admin_pk CONSTANT NUMBER := 10;
  --
  -- Record for usr
  --
  TYPE pub_rec_usr_type IS RECORD(
    id_usr                  usr.id_usr%TYPE,
    usr_email               usr.usr_email%TYPE,
    usr_pwd                 usr.usr_pwd%TYPE,
    usr_firstname           usr.usr_firstname%TYPE,
    usr_lastname            usr.usr_lastname%TYPE,
    twitter_name            usr.twitter_name%TYPE,
    twitter_profile_pic_url usr.twitter_profile_pic_url%TYPE,
    twitter_id              usr.twitter_id%TYPE,
    show_acc_public         usr.show_acc_public%TYPE,
    acc_active              usr.acc_active%TYPE,
    usr_highscore           usr.usr_highscore%TYPE);
  --
  -- Functions for constants
  --
  FUNCTION getc_admin_pk RETURN NUMBER;
  --
  -- Inserts dataset in usr
  -- #param  i_rec_usr Record-Type of table
  -- #return ID (PK of dataset)
  FUNCTION ins_usr(i_rec_usr IN pub_rec_usr_type) RETURN usr.id_usr%TYPE;
  --
  --
  -- Updates datset of table usr
  -- #param  i_rec_usr  Record-Type of usr
  -- #param  i_checksum Checksumme md5 before
  PROCEDURE upd_usr(i_rec_usr  IN pub_rec_usr_type,
                    i_checksum IN VARCHAR2 := NULL);
  --
  --
  -- Deletes dataset of table usr
  -- #param  i_id_usr  PK-ID of usr
  PROCEDURE del_usr(i_id_usr IN usr.id_usr%TYPE);
  --
  --
  -- Get record of table usr
  -- #param i_id_usr ID aus usr
  -- #return Record-Type for usr
  FUNCTION get_rec_usr(i_id_usr IN usr.id_usr%TYPE) RETURN pub_rec_usr_type;
  --
  --
  -- Generates md5 checksum for usr
  -- #param  i_rec_usr Record-Type of table
  -- #return md5 Checksum in Varchar2
  FUNCTION get_md5_usr(i_rec_usr IN pub_rec_usr_type) RETURN VARCHAR2;
  --
  --
  -- Compares (Before/After) md5 checksum for usr
  -- #param  i_checksum checksum before
  -- #param  i_rec_usr Record-Type of table
  -- #return Boolean value
  FUNCTION do_check_md5_usr(i_checksum IN VARCHAR2,
                            i_rec_usr  IN pub_rec_usr_type) RETURN BOOLEAN;
  --
  --
  -- Get id_usr of usr
  -- #param i_id_usr Id der usr
  -- #return id_usr aus usr
  FUNCTION get_id_usr(i_id_usr IN usr.id_usr%TYPE) RETURN usr.id_usr%TYPE;
  --
  --
  -- Get usr.id_usr of usr from twitter_id
  -- #param i_twitter_id
  -- #return id_usr aus usr
  FUNCTION get_id_usr(i_twitter_id IN usr.twitter_id%TYPE)
    RETURN usr.id_usr%TYPE;
  --
  -- Get usr.id_usr of usr from email address
  -- #param i_usr_email
  -- #return id_usr aus usr
  FUNCTION get_id_usr(i_usr_email IN usr.usr_email%TYPE)
    RETURN usr.id_usr%TYPE;
  --
  -- Get usr_email of usr
  -- #param i_id_usr Id der usr
  -- #return usr_email aus usr
  FUNCTION get_usr_email(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.usr_email%TYPE;
  --

  --
  -- Get usr_pwd of usr
  -- #param i_id_usr Id der usr
  -- #return usr_pwd aus usr
  FUNCTION get_usr_pwd(i_id_usr IN usr.id_usr%TYPE) RETURN usr.usr_pwd%TYPE;
  --

  --
  -- Get usr_firstname of usr
  -- #param i_id_usr Id der usr
  -- #return usr_firstname aus usr
  FUNCTION get_usr_firstname(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.usr_firstname%TYPE;
  --

  --
  -- Get usr_lastname of usr
  -- #param i_id_usr Id der usr
  -- #return usr_lastname aus usr
  FUNCTION get_usr_lastname(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.usr_lastname%TYPE;
  --

  --
  -- Get twitter_name of usr
  -- #param i_id_usr Id der usr
  -- #return twitter_name aus usr
  FUNCTION get_twitter_name(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.twitter_name%TYPE;
  --
  -- Get twitter_id of usr
  -- #param i_id_usr Id der usr
  -- #return twitter_id aus usr
  FUNCTION get_twitter_id(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.twitter_id%TYPE;
  --
  -- Get twitter_profile_pic_url of usr
  -- #param i_id_usr Id der usr
  -- #return twitter_profile_pic_url aus usr
  FUNCTION get_twitter_profile_pic_url(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.twitter_profile_pic_url%TYPE;
  --
  -- Get show_acc_public of usr
  -- #param i_id_usr Id der usr
  -- #return show_acc_public aus usr
  FUNCTION get_show_acc_public(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.show_acc_public%TYPE;
  --

  --
  -- Get acc_active of usr
  -- #param i_id_usr Id der usr
  -- #return acc_active aus usr
  FUNCTION get_acc_active(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.acc_active%TYPE;
  --
  -- Get usr_highscore of usr
  -- #param i_id_usr Id der usr
  -- #return usr_highscore aus usr
  FUNCTION get_usr_highscore(i_id_usr IN usr.id_usr%TYPE)
    RETURN usr.usr_highscore%TYPE;
  --
  -- Register User with (generated pwd/active=0) + send email with link
  -- #param i_usr_firstname
  -- #param i_usr_lastname
  -- #param i_usr_email
  -- #param i_software_url
  PROCEDURE do_register_usr(i_usr_firstname IN usr.usr_firstname%TYPE,
                            i_usr_lastname  IN usr.usr_lastname%TYPE,
                            i_usr_email     IN usr.usr_email%TYPE,
                            i_software_url  IN VARCHAR2);
  --
  -- Finishes registration of user (set account akctive + new pwd)
  -- #param i_id_usr_crypt
  -- #param i_token
  -- #param i_usr_pwd
  PROCEDURE do_finish_register_usr(i_id_usr_crypt IN VARCHAR2,
                                   i_token        IN usr_token.token%TYPE,
                                   i_usr_pwd      IN usr.usr_pwd%TYPE);
  --
  -- Send email when User lost his password with token-link
  -- #param i_usr_email
  -- #param i_software_url
  PROCEDURE do_send_pwd_lost_mail(i_usr_email    IN usr.usr_email%TYPE,
                                  i_software_url IN VARCHAR2);
  --
  -- Finishes password lost function of user (set new pwd)
  -- #param i_id_usr_crypt
  -- #param i_token
  -- #param i_usr_pwd
  PROCEDURE do_finish_password_lost(i_id_usr_crypt IN VARCHAR2,
                                    i_token        IN usr_token.token%TYPE,
                                    i_usr_pwd      IN usr.usr_pwd%TYPE);
  --
  -- Generates new registration email
  -- #param i_id_usr_crypt
  -- #param i_software_url
  PROCEDURE do_gen_new_reg_email(i_id_usr_crypt IN VARCHAR2,
                                 i_software_url IN VARCHAR2);
  --
  -- Check if user email is unique
  -- #param i_usr_email
  -- #param i_id_usr
  -- #return BOOLEAN
  FUNCTION check_usr_email_unique(i_usr_email IN usr.usr_email%TYPE,
                                  i_id_usr    IN usr.id_usr%TYPE := NULL)
    RETURN BOOLEAN;
  --
  -- Check if current user pwd is correct
  -- #param i_id_usr
  -- #param i_usr_pwd
  -- #return BOOLEAN
  FUNCTION check_usr_pwd_correct(i_id_usr  IN usr.id_usr%TYPE,
                                 i_usr_pwd IN usr.usr_pwd%TYPE)
    RETURN BOOLEAN;
  --
  -- Check if user twitter name is unique
  -- #param i_twitter_name
  -- #param i_id_usr
  -- #return BOOLEAN
  FUNCTION check_usr_twitter_name_unique(i_twitter_name IN usr.twitter_name%TYPE,
                                         i_id_usr       IN usr.id_usr%TYPE := NULL)
    RETURN BOOLEAN;
  --
  -- Fills the items on User profile pages
  -- #param i_id_usr
  -- #param o_usr_email
  -- #param o_usr_name
  -- #param o_twitter_name
  -- #param o_usr_highscore
  -- #param o_twitter_profile_pic_url
  PROCEDURE do_fill_usr_profile(i_id_usr                  IN usr.id_usr%TYPE,
                                o_usr_email               OUT usr.usr_email%TYPE,
                                o_usr_name                OUT VARCHAR2,
                                o_twitter_name            OUT usr.twitter_name%TYPE,
                                o_usr_highscore           OUT usr.usr_highscore%TYPE,
                                o_twitter_profile_pic_url OUT usr.twitter_profile_pic_url%TYPE);
  --
  -- Fills the items on User profile edit page
  -- #param i_id_usr
  -- #param o_usr_email
  -- #param o_usr_firstname
  -- #param o_usr_lastname
  -- #param o_twitter_name
  -- #param o_show_acc_public
  PROCEDURE do_fill_usr_edit_profile(i_id_usr          IN usr.id_usr%TYPE,
                                     o_usr_email       OUT usr.usr_email%TYPE,
                                     o_usr_firstname   OUT usr.usr_firstname%TYPE,
                                     o_usr_lastname    OUT usr.usr_lastname%TYPE,
                                     o_twitter_name    OUT usr.twitter_name%TYPE,
                                     o_show_acc_public OUT usr.show_acc_public%TYPE);
  --
  -- Updates USR Table from profile edit page
  -- #param i_id_usr
  -- #param i_usr_email
  -- #param i_usr_firstname
  -- #param i_usr_lastname
  -- #param i_twitter_name
  -- #param i_show_acc_public
  PROCEDURE do_update_usr_edit_profile(i_id_usr          IN usr.id_usr%TYPE,
                                       i_usr_email       IN usr.usr_email%TYPE,
                                       i_usr_firstname   IN usr.usr_firstname%TYPE,
                                       i_usr_lastname    IN usr.usr_lastname%TYPE,
                                       i_twitter_name    IN usr.twitter_name%TYPE,
                                       i_show_acc_public IN usr.show_acc_public%TYPE);
  --
  -- Changes the User password
  -- #param i_id_usr
  -- #param i_usr_pwd
  PROCEDURE do_update_usr_pwd(i_id_usr  IN usr.id_usr%TYPE,
                              i_usr_pwd IN usr.usr_pwd%TYPE);
  --
  -- Sets the Game Highscore for User
  -- #param i_id_usr
  -- #param i_usr_highscore
  PROCEDURE do_set_usr_highscore(i_id_usr        IN usr.id_usr%TYPE,
                                 i_usr_highscore IN usr.usr_highscore%TYPE);
  --
  -- Check if user is admin user
  -- #param i_id_usr
  FUNCTION check_usr_admin(i_id_usr IN usr.id_usr%TYPE) RETURN BOOLEAN;
  --
  -- Check if user has a public account
  -- #param i_id_usr
  FUNCTION check_usr_public(i_id_usr IN usr.id_usr%TYPE) RETURN BOOLEAN;
  --
  -- Check if user has a twitter account
  -- #param i_id_usr
  FUNCTION check_usr_twitter(i_id_usr IN usr.id_usr%TYPE) RETURN BOOLEAN;
  --
  -- Check if user has a active account
  -- #param i_id_usr
  FUNCTION check_usr_active(i_id_usr IN usr.id_usr%TYPE) RETURN BOOLEAN;
  --
  -- Check if user has a inactive account
  -- #param i_id_usr
  FUNCTION check_usr_inactive(i_id_usr IN usr.id_usr%TYPE) RETURN BOOLEAN;
  --
  -- Changes the User status (active/inactive)
  -- #param i_id_usr
  -- #param i_acc_active
  PROCEDURE do_change_usr_acc_status(i_id_usr     IN usr.id_usr%TYPE,
                                     i_acc_active IN usr.acc_active%TYPE);
  --
  -- Sets the username in Brwoser LocalStorage (For Fullscreen WebApps)
  -- #param i_user_name
  PROCEDURE set_username_localstorage(i_user_name IN VARCHAR2);
  --
  -- Get username from Brwoser LocalStorage and sets Page item with value
  -- #param i_item_name
  PROCEDURE get_username_localstorage(i_item_name IN VARCHAR2);
  --
  -- Creates admin user for setup script
  -- #param i_usr_firstname
  -- #param i_usr_lastname
  -- #param i_usr_email
  -- #param i_usr_pwd
  PROCEDURE do_insert_admin_setup(i_usr_firstname IN usr.usr_firstname%TYPE,
                                  i_usr_lastname  IN usr.usr_lastname%TYPE,
                                  i_usr_email     IN usr.usr_email%TYPE,
                                  i_usr_pwd       IN usr.usr_pwd%TYPE);
  --
  -- Count all registered Users
  -- #return number
  FUNCTION count_all_usr RETURN NUMBER;
  --
END api_usr;
/

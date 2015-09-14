CREATE OR REPLACE PACKAGE api_usr_battle IS
  --
  -- API-Package for table usr_battle
  --

  --
  -- Record for usr_battle
  --
  TYPE pub_rec_usr_battle_type IS RECORD(
    id_usr_battle        usr_battle.id_usr_battle%TYPE,
    id_usr_challenger    usr_battle.id_usr_challenger%TYPE,
    id_usr_receiver      usr_battle.id_usr_receiver%TYPE,
    highscore_challenger usr_battle.highscore_challenger%TYPE,
    highscore_receiver   usr_battle.highscore_receiver%TYPE);
  --
  -- Inserts dataset in usr_battle
  -- #param  i_rec_usr_battle Record-Type of table
  -- #return ID (PK of dataset)
  FUNCTION ins_usr_battle(i_rec_usr_battle IN pub_rec_usr_battle_type)
    RETURN usr_battle.id_usr_battle%TYPE;
  --
  --
  -- Updates datset of table usr_battle
  -- #param  i_rec_usr_battle  Record-Type of usr_battle
  -- #param  i_checksum Checksumme md5 before
  PROCEDURE upd_usr_battle(i_rec_usr_battle IN pub_rec_usr_battle_type,
                           i_checksum       IN VARCHAR2 := NULL);
  --
  --
  -- Deletes dataset of table usr_battle
  -- #param  i_id_usr_battle  PK-ID of usr_battle
  PROCEDURE del_usr_battle(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE);
  --
  --
  -- Get record of table usr_battle
  -- #param i_id_usr_battle ID aus usr_battle
  -- #return Record-Type for usr_battle
  FUNCTION get_rec_usr_battle(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN pub_rec_usr_battle_type;
  --
  --
  -- Generates md5 checksum for usr_battle
  -- #param  i_rec_usr_battle Record-Type of table
  -- #return md5 Checksum in Varchar2
  FUNCTION get_md5_usr_battle(i_rec_usr_battle IN pub_rec_usr_battle_type)
    RETURN VARCHAR2;
  --
  --
  -- Compares (Before/After) md5 checksum for usr_battle
  -- #param  i_checksum checksum before
  -- #param  i_rec_usr_battle Record-Type of table
  -- #return Boolean value
  FUNCTION do_check_md5_usr_battle(i_checksum       IN VARCHAR2,
                                   i_rec_usr_battle IN pub_rec_usr_battle_type)
    RETURN BOOLEAN;
  --
  --
  -- Get id_usr_battle of usr_battle
  -- #param i_id_usr_battle Id der usr_battle
  -- #return id_usr_battle aus usr_battle
  FUNCTION get_id_usr_battle(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN usr_battle.id_usr_battle%TYPE;
  --

  --
  -- Get id_usr_challenger of usr_battle
  -- #param i_id_usr_battle Id der usr_battle
  -- #return id_usr_challenger aus usr_battle
  FUNCTION get_id_usr_challenger(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN usr_battle.id_usr_challenger%TYPE;
  --

  --
  -- Get id_usr_receiver of usr_battle
  -- #param i_id_usr_battle Id der usr_battle
  -- #return id_usr_receiver aus usr_battle
  FUNCTION get_id_usr_receiver(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN usr_battle.id_usr_receiver%TYPE;
  --

  --
  -- Get highscore_challenger of usr_battle
  -- #param i_id_usr_battle Id der usr_battle
  -- #return highscore_challenger aus usr_battle
  FUNCTION get_highscore_challenger(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN usr_battle.highscore_challenger%TYPE;
  --

  --
  -- Get highscore_receiver of usr_battle
  -- #param i_id_usr_battle Id der usr_battle
  -- #return highscore_receiver aus usr_battle
  FUNCTION get_highscore_receiver(i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN usr_battle.highscore_receiver%TYPE;
  --
  -- Get usr_battle.id_usr_battle from both id_usr
  -- #param i_id_usr_challenger
  -- #param i_id_usr_receiver
  -- #return id_usr_battle
  FUNCTION get_id_usr_battle_users(i_id_usr_challenger IN usr_battle.id_usr_challenger%TYPE,
                                   i_id_usr_receiver   IN usr_battle.id_usr_receiver%TYPE)
    RETURN usr_battle.id_usr_battle%TYPE;
  --
  -- Insert User IDs when Battle not present (Battle Game Page)
  -- #param i_id_usr_challenger
  -- #param i_id_usr_receiver
  -- #return id_usr_battle
  FUNCTION do_insert_usr_battle(i_id_usr_challenger IN usr_battle.id_usr_challenger%TYPE,
                                i_id_usr_receiver   IN usr_battle.id_usr_receiver%TYPE)
    RETURN usr_battle.id_usr_battle%TYPE;
  --
  -- Check if ID_USR is challenger or receiver of battle
  -- #param i_id_usr
  -- #param i_id_usr_battle
  -- return VARCHAR2 (C = challenger / R = receiver)
  FUNCTION check_challenger_receiver(i_id_usr        IN NUMBER,
                                     i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN VARCHAR2;
  --
  -- Check if Highscore if ID_USR is better than opposite
  -- #param i_id_usr
  -- #param i_id_usr_battle
  -- return BOOLEAN
  FUNCTION check_better_highscore(i_id_usr        IN NUMBER,
                                  i_id_usr_battle IN usr_battle.id_usr_battle%TYPE)
    RETURN BOOLEAN;
  --
  -- Check if open incoming Battles are present
  -- #param i_id_usr
  -- #return BOOLEAN
  FUNCTION check_open_battle(i_id_usr IN NUMBER) RETURN BOOLEAN;
  --
  -- Set Highscore of user battle per user
  -- #param i_id_usr
  -- #param i_id_usr_battle
  -- #param i_highscore
  PROCEDURE do_set_usr_highscore(i_id_usr        IN NUMBER,
                                 i_id_usr_battle IN usr_battle.id_usr_battle%TYPE,
                                 i_highscore     IN NUMBER);
  --
  -- Fill items on battle details page
  -- #param i_id_usr_battle
  -- #param o_id_usr_challenger
  -- #param o_id_usr_receiver
  -- #param o_name_chall
  -- #param o_name_rec
  -- #param o_twitter_name_chall
  -- #param o_twitter_name_rec
  -- #param o_profile_pic_url_chall
  -- #param o_profile_pic_url_rec
  -- #param o_highscore_challenger
  -- #param o_highscore_receiver
  PROCEDURE do_fill_battle_details(i_id_usr_battle         IN usr_battle.id_usr_battle%TYPE,
                                   o_id_usr_challenger     OUT usr_battle.id_usr_challenger%TYPE,
                                   o_id_usr_receiver       OUT usr_battle.id_usr_receiver%TYPE,
                                   o_name_chall            OUT VARCHAR2,
                                   o_name_rec              OUT VARCHAR2,
                                   o_twitter_name_chall    OUT usr.twitter_name%TYPE,
                                   o_twitter_name_rec      OUT usr.twitter_name%TYPE,
                                   o_profile_pic_url_chall OUT usr.twitter_profile_pic_url%TYPE,
                                   o_profile_pic_url_rec   OUT usr.twitter_profile_pic_url%TYPE,
                                   o_highscore_challenger  OUT usr_battle.highscore_challenger%TYPE,
                                   o_highscore_receiver    OUT usr_battle.highscore_receiver%TYPE);
  --
  -- Send email when Challenger-User starts a new Battle with Receiver
  -- #param i_id_usr_challenger
  -- #param i_id_usr_receiver
  -- #param i_software_url
  PROCEDURE do_send_new_battle_mail(i_id_usr_challenger IN usr_battle.id_usr_challenger%TYPE,
                                    i_id_usr_receiver   IN usr_battle.id_usr_receiver%TYPE,
                                    i_software_url      IN VARCHAR2);
  --
END api_usr_battle;
/

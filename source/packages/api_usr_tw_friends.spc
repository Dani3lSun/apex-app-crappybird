CREATE OR REPLACE PACKAGE api_usr_tw_friends IS
  --
  -- API-Package for table usr_tw_friends
  --

  --
  -- Record for usr_tw_friends
  --
  TYPE pub_rec_usr_tw_friends_type IS RECORD(
    id_usr_tw_friends     usr_tw_friends.id_usr_tw_friends%TYPE,
    id_usr                usr_tw_friends.id_usr%TYPE,
    id_usr_friend         usr_tw_friends.id_usr_friend%TYPE,
    usr_friend_twitter_id usr_tw_friends.usr_friend_twitter_id%TYPE);
  --
  -- Inserts dataset in usr_tw_friends
  -- #param  i_rec_usr_tw_friends Record-Type of table
  -- #return ID (PK of dataset)
  FUNCTION ins_usr_tw_friends(i_rec_usr_tw_friends IN pub_rec_usr_tw_friends_type)
    RETURN usr_tw_friends.id_usr_tw_friends%TYPE;
  --
  --
  -- Updates datset of table usr_tw_friends
  -- #param  i_rec_usr_tw_friends  Record-Type of usr_tw_friends
  -- #param  i_checksum Checksumme md5 before
  PROCEDURE upd_usr_tw_friends(i_rec_usr_tw_friends IN pub_rec_usr_tw_friends_type,
                               i_checksum           IN VARCHAR2 := NULL);
  --
  --
  -- Deletes dataset of table usr_tw_friends
  -- #param  i_id_usr_tw_friends  PK-ID of usr_tw_friends
  PROCEDURE del_usr_tw_friends(i_id_usr_tw_friends IN usr_tw_friends.id_usr_tw_friends%TYPE);
  --
  -- DELETES all rows from table usr_tw_friends per user
  -- #param  i_id_usr
  PROCEDURE del_usr_tw_friends_per_usr(i_id_usr IN usr_tw_friends.id_usr%TYPE);
  --
  --
  -- Get record of table usr_tw_friends
  -- #param i_id_usr_tw_friends ID aus usr_tw_friends
  -- #return Record-Type for usr_tw_friends
  FUNCTION get_rec_usr_tw_friends(i_id_usr_tw_friends IN usr_tw_friends.id_usr_tw_friends%TYPE)
    RETURN pub_rec_usr_tw_friends_type;
  --
  --
  -- Generates md5 checksum for usr_tw_friends
  -- #param  i_rec_usr_tw_friends Record-Type of table
  -- #return md5 Checksum in Varchar2
  FUNCTION get_md5_usr_tw_friends(i_rec_usr_tw_friends IN pub_rec_usr_tw_friends_type)
    RETURN VARCHAR2;
  --
  --
  -- Compares (Before/After) md5 checksum for usr_tw_friends
  -- #param  i_checksum checksum before
  -- #param  i_rec_usr_tw_friends Record-Type of table
  -- #return Boolean value
  FUNCTION do_check_md5_usr_tw_friends(i_checksum           IN VARCHAR2,
                                       i_rec_usr_tw_friends IN pub_rec_usr_tw_friends_type)
    RETURN BOOLEAN;
  --
  --
  -- Get id_usr_tw_friends of usr_tw_friends
  -- #param i_id_usr_tw_friends Id der usr_tw_friends
  -- #return id_usr_tw_friends aus usr_tw_friends
  FUNCTION get_id_usr_tw_friends(i_id_usr_tw_friends IN usr_tw_friends.id_usr_tw_friends%TYPE)
    RETURN usr_tw_friends.id_usr_tw_friends%TYPE;
  --

  --
  -- Get id_usr of usr_tw_friends
  -- #param i_id_usr_tw_friends Id der usr_tw_friends
  -- #return id_usr aus usr_tw_friends
  FUNCTION get_id_usr(i_id_usr_tw_friends IN usr_tw_friends.id_usr_tw_friends%TYPE)
    RETURN usr_tw_friends.id_usr%TYPE;
  --

  --
  -- Get id_usr_friend of usr_tw_friends
  -- #param i_id_usr_tw_friends Id der usr_tw_friends
  -- #return id_usr_friend aus usr_tw_friends
  FUNCTION get_id_usr_friend(i_id_usr_tw_friends IN usr_tw_friends.id_usr_tw_friends%TYPE)
    RETURN usr_tw_friends.id_usr_friend%TYPE;
  --

  --
  -- Get usr_friend_twitter_id of usr_tw_friends
  -- #param i_id_usr_tw_friends Id der usr_tw_friends
  -- #return usr_friend_twitter_id aus usr_tw_friends
  FUNCTION get_usr_friend_twitter_id(i_id_usr_tw_friends IN usr_tw_friends.id_usr_tw_friends%TYPE)
    RETURN usr_tw_friends.usr_friend_twitter_id%TYPE;
  --

END api_usr_tw_friends;
/

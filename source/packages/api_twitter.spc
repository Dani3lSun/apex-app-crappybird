CREATE OR REPLACE PACKAGE api_twitter IS
  --
  -- API-Package for Twitter Public API (Application Only Auth)
  --

  --
  -- Exceptions for Twitter
  --
  pubc_errcode_http_status_code CONSTANT NUMBER := -20001;
  --
  -- Check if Response HTTP Status is successful (2XX Status codes)
  PROCEDURE check_error_http_status;
  --
  -- Encode consumer key and secret for twitter authentication request
  -- #param i_consumer_key
  -- #param i_consumer_secret
  -- #return base64 string
  FUNCTION encode_key_secret_base64(i_consumer_key    IN system.twitter_consumer_key%TYPE,
                                    i_consumer_secret IN system.twitter_consumer_secret%TYPE)
    RETURN VARCHAR2;
  --
  -- Get Twitter bearer (auth token) for future authentication
  -- #param i_twitter_consumer_key
  -- #param i_twitter_consumer_secret
  FUNCTION get_twitter_bearer_token(i_twitter_consumer_key    IN system.twitter_consumer_key%TYPE := NULL,
                                    i_twitter_consumer_secret IN system.twitter_consumer_secret%TYPE := NULL)
    RETURN system.twitter_api_bearer%TYPE;
  --
  -- Invalidate Twitter bearer (auth token) + remove from system table
  PROCEDURE invalidate_bearer_token;
  --
  -- Resets twitter bearer token to a new one (invalidate + get new)
  PROCEDURE reset_twitter_bearer_token;
  --
  -- Set HTTP Headers for Twitter REST Calls
  -- #param i_bearer_token
  PROCEDURE set_http_headers(i_bearer_token IN system.twitter_api_bearer%TYPE);
  --
  -- Function to test the different API calls from Twitter
  -- #param i_url
  -- #return clob json string
  FUNCTION get_api_test_url_result(i_url IN VARCHAR2) RETURN CLOB;
  --
  -- Get Twitter limits of api calls, max value and current used
  -- #param o_users_lookup_limit
  -- #param o_users_lookup_remaining
  -- #param o_friends_ids_limit
  -- #param o_friends_ids_remaining
  -- #param o_followers_ids_limit
  -- #param o_followers_ids_remaining
  -- #param o_search_tweets_limit
  -- #param o_search_tweets_remaining
  -- #return clob json string
  FUNCTION get_twitter_rate_limit_status(o_users_lookup_limit      OUT NUMBER,
                                         o_users_lookup_remaining  OUT NUMBER,
                                         o_friends_ids_limit       OUT NUMBER,
                                         o_friends_ids_remaining   OUT NUMBER,
                                         o_followers_ids_limit     OUT NUMBER,
                                         o_followers_ids_remaining OUT NUMBER,
                                         o_search_tweets_limit     OUT NUMBER,
                                         o_search_tweets_remaining OUT NUMBER)
    RETURN CLOB;
  --
  -- Check if Twitter API Calls are possible, or if limit is reached
  -- #param i_api_type (users/friends/followers/search)
  FUNCTION check_twitter_api_limits(i_api_type IN VARCHAR2) RETURN BOOLEAN;
  --
  -- Get all Twitter Follower IDs(Following People) per twitter user id 
  -- #param i_twitter_id
  -- #return clob json string
  FUNCTION get_twitter_followers(i_twitter_id IN usr.twitter_id%TYPE)
    RETURN CLOB;
  --
  -- Get all Twitter friend IDs(People you follow) per twitter user id 
  -- #param i_twitter_id
  -- #return clob json string
  FUNCTION get_twitter_friends(i_twitter_id IN usr.twitter_id%TYPE)
    RETURN CLOB;
  --
  -- Get all Twitter friend IDs(People you follow) per id_usr from usr table 
  -- + insert all ids found in table usr_tw_friends
  -- #param i_id_usr
  PROCEDURE ins_twitter_friends(i_id_usr IN usr.id_usr%TYPE);
  --
  -- Find the Twitter User ID for an twitter name
  -- #param i_twitter_name
  -- #return twitter_id
  FUNCTION get_twitter_id(i_twitter_name IN usr.twitter_name%TYPE)
    RETURN usr.twitter_id%TYPE;
  --
  -- Find the Twitter User name for an twitter ID
  -- #param i_twitter_id
  -- #return twitter_name
  FUNCTION get_twitter_name(i_twitter_id IN usr.twitter_id%TYPE)
    RETURN usr.twitter_name%TYPE;
  --
  -- Find the Twitter Profile Pic URL for an twitter ID
  -- #param i_twitter_id
  -- #param i_ssl (1 = https / 0 = http)
  -- #return profile-pic url
  FUNCTION get_twitter_profile_pic_url(i_twitter_id IN usr.twitter_id%TYPE,
                                       i_ssl        IN NUMBER := 1)
    RETURN usr.twitter_profile_pic_url%TYPE;
  --
  -- Get all Tweets as search result with specified search string
  -- #param i_search_string
  -- #param i_count (<=100)
  -- #return clob json string
  FUNCTION get_search_results(i_search_string IN VARCHAR2,
                              i_count         IN NUMBER := 20) RETURN CLOB;
  --
END api_twitter;
/

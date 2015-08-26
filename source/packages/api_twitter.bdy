CREATE OR REPLACE PACKAGE BODY api_twitter IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_twitter';
  --
  /****************************************************************************
  * Purpose:  Check if Response HTTP Status is successful (2XX Status codes)
  * Author:   Daniel Hochleitner
  * Created:  16.08.2015
  * Changed:
  ****************************************************************************/
  PROCEDURE check_error_http_status IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_error_http_status';
    --
    l_status_code VARCHAR2(100);
    l_name        VARCHAR2(200);
    l_value       VARCHAR2(200);
    l_error_msg   CLOB;
    --
  BEGIN
    --
    -- get http headers from response
    FOR i IN 1 .. apex_web_service.g_headers.count LOOP
      l_status_code := apex_web_service.g_status_code;
      l_name        := apex_web_service.g_headers(i).name;
      l_value       := apex_web_service.g_headers(i).value;
      -- If not successful throw error
      IF l_status_code NOT LIKE '2%' THEN
        l_error_msg := 'Response HTTP Status NOT OK' || chr(10) || 'Name: ' ||
                       l_name || chr(10) || 'Value: ' || l_value || chr(10) ||
                       'Status Code: ' || l_status_code;
        raise_application_error(pubc_errcode_http_status_code,
                                l_error_msg);
      END IF;
    END LOOP;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END check_error_http_status;
  -- 
  /****************************************************************************
  * Purpose:  Encode consumer key and secret for twitter authentication request
  * Author:   Daniel Hochleitner
  * Created:  15.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION encode_key_secret_base64(i_consumer_key    IN system.twitter_consumer_key%TYPE,
                                    i_consumer_secret IN system.twitter_consumer_secret%TYPE)
    RETURN VARCHAR2 IS
    --
    l_function CONSTANT VARCHAR2(30) := 'encode_key_secret_base64';
    --
    l_string            VARCHAR2(500);
    l_string_raw        RAW(500);
    l_string_base64     VARCHAR2(2000);
    l_string_base64_raw RAW(2000);
    --
  BEGIN
    -- concate in-parameters with ":" (url encoded)
    l_string := apex_util.url_encode(i_consumer_key) || ':' ||
                apex_util.url_encode(i_consumer_secret);
    -- build base64 string
    l_string_raw        := utl_raw.cast_to_raw(c => l_string);
    l_string_base64_raw := utl_encode.base64_encode(r => l_string_raw);
    l_string_base64     := utl_raw.cast_to_varchar2(r => l_string_base64_raw);
    --
    -- escape special chars
    l_string_base64 := REPLACE(REPLACE(REPLACE(l_string_base64,
                                               chr(10),
                                               ''),
                                       chr(13),
                                       ''),
                               chr(9),
                               '');
    --
    RETURN l_string_base64;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END encode_key_secret_base64;
  --
  /****************************************************************************
  * Purpose:  Get Twitter bearer (auth token) for future authentication
  * Author:   Daniel Hochleitner
  * Created:  15.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_bearer_token(i_twitter_consumer_key    IN system.twitter_consumer_key%TYPE := NULL,
                                    i_twitter_consumer_secret IN system.twitter_consumer_secret%TYPE := NULL)
    RETURN system.twitter_api_bearer%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_bearer_token';
    --
    l_rec_system            api_system.pub_rec_system_type;
    l_ssl_wallet_pwd        system.twitter_ssl_wallet_pwd%TYPE;
    l_encoded_key_secret    VARCHAR2(2000);
    l_twitter_response_json CLOB;
    l_twitter_response_xml  xmltype;
    l_twitter_bearer        system.twitter_api_bearer%TYPE;
    --
    CURSOR l_cur_twitter_xml IS
      SELECT access_token
        FROM xmltable('/json' passing l_twitter_response_xml columns
                      token_type path 'token_type',
                      access_token path 'access_token')
       WHERE token_type = 'bearer';
    --
  BEGIN
    -- get values from system table
    l_rec_system := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    -- get twitter bearer only when value in system table is null
    IF l_rec_system.twitter_api_bearer IS NULL THEN
      -- get parameter
      l_ssl_wallet_pwd     := api_utils.do_decrypt(i_string => l_rec_system.twitter_ssl_wallet_pwd);
      l_encoded_key_secret := api_twitter.encode_key_secret_base64(i_consumer_key    => nvl(i_twitter_consumer_key,
                                                                                            l_rec_system.twitter_consumer_key),
                                                                   i_consumer_secret => nvl(i_twitter_consumer_secret,
                                                                                            l_rec_system.twitter_consumer_secret));
      --
      -- set http headers
      -- Host
      apex_web_service.g_request_headers(1).name := 'Host';
      apex_web_service.g_request_headers(1).value := 'api.twitter.com';
      -- User-Agent
      apex_web_service.g_request_headers(2).name := 'User-Agent';
      apex_web_service.g_request_headers(2).value := 'Mozilla/4.0';
      -- Authorisation (Basic + Base64 String)
      apex_web_service.g_request_headers(3).name := 'Authorization';
      apex_web_service.g_request_headers(3).value := 'Basic ' ||
                                                     l_encoded_key_secret;
      -- Content-type
      apex_web_service.g_request_headers(4).name := 'Content-Type';
      apex_web_service.g_request_headers(4).value := 'application/x-www-form-urlencoded;charset=UTF-8';
      -- Content-Length
      apex_web_service.g_request_headers(5).name := 'Content-Length';
      apex_web_service.g_request_headers(5).value := '29';
      -- Accept-Encoding
      apex_web_service.g_request_headers(6).name := 'Accept-Encoding';
      apex_web_service.g_request_headers(6).value := 'gzip';
      --
      -- do rest request
      l_twitter_response_json := apex_web_service.make_rest_request(p_url         => 'https://api.twitter.com/oauth2/token',
                                                                    p_http_method => 'POST',
                                                                    p_body        => 'grant_type=client_credentials',
                                                                    p_wallet_path => 'file:' ||
                                                                                     l_rec_system.twitter_ssl_wallet_path,
                                                                    p_wallet_pwd  => l_ssl_wallet_pwd);
      --
      -- check if http status is successfull (2XX) (throw error if not)
      api_twitter.check_error_http_status;
      --
      -- json to xml
      l_twitter_response_xml := apex_json.to_xmltype(l_twitter_response_json);
      --
      -- open cursor with xmltable and fetch into var
      OPEN l_cur_twitter_xml;
      FETCH l_cur_twitter_xml
        INTO l_twitter_bearer;
      CLOSE l_cur_twitter_xml;
      --
      -- insert twitter bearer into system table
      l_rec_system.twitter_api_bearer := l_twitter_bearer;
      -- update
      api_system.upd_system(i_rec_system => l_rec_system);
      COMMIT;
    ELSE
      -- if twitter bearer in system table only return that value
      l_twitter_bearer := l_rec_system.twitter_api_bearer;
    END IF;
    --
    RETURN l_twitter_bearer;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_bearer_token;
  --
  /****************************************************************************
  * Purpose:  Invalidate Twitter bearer (auth token) + remove from system table
  * Author:   Daniel Hochleitner
  * Created:  15.08.2015
  * Changed:
  ****************************************************************************/
  PROCEDURE invalidate_bearer_token IS
    --
    l_function CONSTANT VARCHAR2(30) := 'invalidate_bearer_token';
    --
    l_rec_system            api_system.pub_rec_system_type;
    l_ssl_wallet_pwd        system.twitter_ssl_wallet_pwd%TYPE;
    l_encoded_key_secret    VARCHAR2(2000);
    l_twitter_response_json CLOB;
    l_twitter_bearer        system.twitter_api_bearer%TYPE;
    --
  BEGIN
    -- get values from system table and twitter bearer
    l_rec_system     := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    l_twitter_bearer := api_twitter.get_twitter_bearer_token;
    --
    -- only go forward then bearer token is present
    IF l_twitter_bearer IS NOT NULL THEN
      -- get parameter
      l_ssl_wallet_pwd     := api_utils.do_decrypt(i_string => l_rec_system.twitter_ssl_wallet_pwd);
      l_encoded_key_secret := api_twitter.encode_key_secret_base64(i_consumer_key    => l_rec_system.twitter_consumer_key,
                                                                   i_consumer_secret => l_rec_system.twitter_consumer_secret);
      --
      -- set http headers
      -- Host
      apex_web_service.g_request_headers(1).name := 'Host';
      apex_web_service.g_request_headers(1).value := 'api.twitter.com';
      -- User-Agent
      apex_web_service.g_request_headers(2).name := 'User-Agent';
      apex_web_service.g_request_headers(2).value := 'Mozilla/4.0';
      -- Authorisation (Basic + Base64 String)
      apex_web_service.g_request_headers(3).name := 'Authorization';
      apex_web_service.g_request_headers(3).value := 'Basic ' ||
                                                     l_encoded_key_secret;
      -- Content-type
      apex_web_service.g_request_headers(4).name := 'Content-Type';
      apex_web_service.g_request_headers(4).value := 'application/x-www-form-urlencoded;charset=UTF-8';
      -- Content-Length
      apex_web_service.g_request_headers(5).name := 'Content-Length';
      apex_web_service.g_request_headers(5).value := length('access_token=' ||
                                                            l_twitter_bearer);
      -- Accept-Encoding
      apex_web_service.g_request_headers(6).name := 'Accept-Encoding';
      apex_web_service.g_request_headers(6).value := 'gzip';
      --
      -- do rest request
      l_twitter_response_json := apex_web_service.make_rest_request(p_url         => 'https://api.twitter.com/oauth2/invalidate_token',
                                                                    p_http_method => 'POST',
                                                                    p_body        => 'access_token=' ||
                                                                                     l_twitter_bearer,
                                                                    p_wallet_path => 'file:' ||
                                                                                     l_rec_system.twitter_ssl_wallet_path,
                                                                    p_wallet_pwd  => l_ssl_wallet_pwd);
      --
      -- check if http status is successfull (2XX) (throw error if not)
      api_twitter.check_error_http_status;
      --
      -- remove twitter bearer from system table
      l_rec_system.twitter_api_bearer := NULL;
      -- update
      api_system.upd_system(i_rec_system => l_rec_system);
      COMMIT;
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END invalidate_bearer_token;
  --
  /****************************************************************************
  * Purpose:  Resets twitter bearer token to a new one (invalidate + get new)
  * Author:   Daniel Hochleitner
  * Created:  26.08.2015
  * Changed:
  ****************************************************************************/
  PROCEDURE reset_twitter_bearer_token IS
    --
    l_function CONSTANT VARCHAR2(30) := 'reset_twitter_bearer_token';
    --
    l_twitter_bearer system.twitter_api_bearer%TYPE;
    --
  BEGIN
    -- call invalidate function
    api_twitter.invalidate_bearer_token;
    --
    -- call get bearer function
    l_twitter_bearer := api_twitter.get_twitter_bearer_token;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END reset_twitter_bearer_token;
  --
  /****************************************************************************
  * Purpose:  Set HTTP Headers for Twitter REST Calls
  * Author:   Daniel Hochleitner
  * Created:  16.08.2015
  * Changed:
  ****************************************************************************/
  PROCEDURE set_http_headers(i_bearer_token IN system.twitter_api_bearer%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'set_http_headers';
    --
  BEGIN
    --
    -- set http headers
    -- Host
    apex_web_service.g_request_headers(1).name := 'Host';
    apex_web_service.g_request_headers(1).value := 'api.twitter.com';
    -- User-Agent
    apex_web_service.g_request_headers(2).name := 'User-Agent';
    apex_web_service.g_request_headers(2).value := 'Mozilla/4.0';
    -- Authorisation (Bearer)
    apex_web_service.g_request_headers(3).name := 'Authorization';
    apex_web_service.g_request_headers(3).value := 'Bearer ' ||
                                                   i_bearer_token;
    -- Accept-Encoding
    apex_web_service.g_request_headers(4).name := 'Accept-Encoding';
    apex_web_service.g_request_headers(4).value := 'gzip';
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END set_http_headers;
  --
  /****************************************************************************
  * Purpose:  Function to test the different API calls from Twitter
  * Author:   Daniel Hochleitner
  * Created:  16.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION get_api_test_url_result(i_url IN VARCHAR2) RETURN CLOB IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_api_test_url_result';
    --
    l_rec_system     api_system.pub_rec_system_type;
    l_ssl_wallet_pwd system.twitter_ssl_wallet_pwd%TYPE;
    --
    l_twitter_response_json CLOB;
    l_twitter_bearer        system.twitter_api_bearer%TYPE;
    --
  BEGIN
    -- get values from system table and twitter bearer
    l_rec_system     := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    l_twitter_bearer := api_twitter.get_twitter_bearer_token;
    --
    -- only go forward then bearer token is present
    IF l_twitter_bearer IS NOT NULL THEN
      -- get parameter
      l_ssl_wallet_pwd := api_utils.do_decrypt(i_string => l_rec_system.twitter_ssl_wallet_pwd);
      --
      -- set http headers
      api_twitter.set_http_headers(i_bearer_token => l_twitter_bearer);
      --
      -- do rest request
      l_twitter_response_json := apex_web_service.make_rest_request(p_url         => i_url,
                                                                    p_http_method => 'GET',
                                                                    p_wallet_path => 'file:' ||
                                                                                     l_rec_system.twitter_ssl_wallet_path,
                                                                    p_wallet_pwd  => l_ssl_wallet_pwd);
      --
      -- check if http status is successfull (2XX) (throw error if not)
      api_twitter.check_error_http_status;
      --
    END IF;
    --
    RETURN l_twitter_response_json;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_api_test_url_result;
  --
  /****************************************************************************
  * Purpose:  Get Twitter limits of api calls, max value and current used
  * Author:   Daniel Hochleitner
  * Created:  15.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_rate_limit_status(o_users_lookup_limit      OUT NUMBER,
                                         o_users_lookup_remaining  OUT NUMBER,
                                         o_friends_ids_limit       OUT NUMBER,
                                         o_friends_ids_remaining   OUT NUMBER,
                                         o_followers_ids_limit     OUT NUMBER,
                                         o_followers_ids_remaining OUT NUMBER,
                                         o_search_tweets_limit     OUT NUMBER,
                                         o_search_tweets_remaining OUT NUMBER)
    RETURN CLOB IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_rate_limit_status';
    --
    l_rec_system            api_system.pub_rec_system_type;
    l_ssl_wallet_pwd        system.twitter_ssl_wallet_pwd%TYPE;
    l_twitter_response_json CLOB;
    l_twitter_response_xml  xmltype;
    l_twitter_bearer        system.twitter_api_bearer%TYPE;
    --
    l_users_lookup_limit      NUMBER;
    l_users_lookup_remaining  NUMBER;
    l_friends_ids_limit       NUMBER;
    l_friends_ids_remaining   NUMBER;
    l_followers_ids_limit     NUMBER;
    l_followers_ids_remaining NUMBER;
    l_search_tweets_limit     NUMBER;
    l_search_tweets_remaining NUMBER;
    --
    CURSOR l_cur_twitter_xml IS
      SELECT users_lookup_limit,
             users_lookup_remaining,
             friends_ids_limit,
             friends_ids_remaining,
             search_tweets_limit,
             search_tweets_remaining,
             followers_ids_limit,
             followers_ids_remaining
        FROM xmltable('/json/resources' passing l_twitter_response_xml
                      columns users_lookup_limit path
                      'users/_users_lookup/limit',
                      users_lookup_remaining path
                      'users/_users_lookup/remaining',
                      friends_ids_limit path 'friends/_friends_ids/limit',
                      friends_ids_remaining path
                      'friends/_friends_ids/remaining',
                      search_tweets_limit path 'search/_search_tweets/limit',
                      search_tweets_remaining path
                      'search/_search_tweets/remaining',
                      followers_ids_limit path
                      'followers/_followers_ids/limit',
                      followers_ids_remaining path
                      'followers/_followers_ids/remaining');
    --
  BEGIN
    -- get values from system table and twitter bearer
    l_rec_system     := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    l_twitter_bearer := api_twitter.get_twitter_bearer_token;
    --
    -- only go forward then bearer token is present
    IF l_twitter_bearer IS NOT NULL THEN
      -- get parameter
      l_ssl_wallet_pwd := api_utils.do_decrypt(i_string => l_rec_system.twitter_ssl_wallet_pwd);
      --
      -- set http headers
      api_twitter.set_http_headers(i_bearer_token => l_twitter_bearer);
      --
      -- do rest request
      l_twitter_response_json := apex_web_service.make_rest_request(p_url         => 'https://api.twitter.com/1.1/application/rate_limit_status.json?resources=followers,friends,users,search',
                                                                    p_http_method => 'GET',
                                                                    p_wallet_path => 'file:' ||
                                                                                     l_rec_system.twitter_ssl_wallet_path,
                                                                    p_wallet_pwd  => l_ssl_wallet_pwd);
      --
      -- check if http status is successfull (2XX) (throw error if not)
      api_twitter.check_error_http_status;
      --
      -- json to xml
      l_twitter_response_xml := apex_json.to_xmltype(l_twitter_response_json);
      --
      -- open cursor with xmltable and fetch into var
      OPEN l_cur_twitter_xml;
      FETCH l_cur_twitter_xml
        INTO l_users_lookup_limit,
             l_users_lookup_remaining,
             l_friends_ids_limit,
             l_friends_ids_remaining,
             l_search_tweets_limit,
             l_search_tweets_remaining,
             l_followers_ids_limit,
             l_followers_ids_remaining;
      CLOSE l_cur_twitter_xml;
    END IF;
    -- outparameters
    o_users_lookup_limit      := l_users_lookup_limit;
    o_users_lookup_remaining  := l_users_lookup_remaining;
    o_friends_ids_limit       := l_friends_ids_limit;
    o_friends_ids_remaining   := l_friends_ids_remaining;
    o_followers_ids_limit     := l_followers_ids_limit;
    o_followers_ids_remaining := l_followers_ids_remaining;
    o_search_tweets_limit     := l_search_tweets_limit;
    o_search_tweets_remaining := l_search_tweets_remaining;
    --
    RETURN l_twitter_response_json;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_rate_limit_status;
  --
  /****************************************************************************
  * Purpose:  Check if Twitter API Calls are possible, or if limit is reached
  * Author:   Daniel Hochleitner
  * Created:  16.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION check_twitter_api_limits(i_api_type IN VARCHAR2) RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_twitter_api_limits';
    --
    l_users_lookup_limit      NUMBER;
    l_users_lookup_remaining  NUMBER;
    l_friends_ids_limit       NUMBER;
    l_friends_ids_remaining   NUMBER;
    l_followers_ids_limit     NUMBER;
    l_followers_ids_remaining NUMBER;
    l_search_tweets_limit     NUMBER;
    l_search_tweets_remaining NUMBER;
    l_twitter_response_json   CLOB;
    --
    l_return BOOLEAN := FALSE;
    --
  BEGIN
    --
    -- do rest request
    l_twitter_response_json := api_twitter.get_twitter_rate_limit_status(o_users_lookup_limit      => l_users_lookup_limit,
                                                                         o_users_lookup_remaining  => l_users_lookup_remaining,
                                                                         o_friends_ids_limit       => l_friends_ids_limit,
                                                                         o_friends_ids_remaining   => l_friends_ids_remaining,
                                                                         o_followers_ids_limit     => l_followers_ids_limit,
                                                                         o_followers_ids_remaining => l_followers_ids_remaining,
                                                                         o_search_tweets_limit     => l_search_tweets_limit,
                                                                         o_search_tweets_remaining => l_search_tweets_remaining);
    --
    -- Check Twitter API
    -- For Users API Calls
    IF upper(i_api_type) = 'USERS' THEN
      IF l_users_lookup_remaining > 0 THEN
        l_return := TRUE;
      ELSE
        l_return := FALSE;
      END IF;
      -- For Friends API Calls
    ELSIF upper(i_api_type) = 'FRIENDS' THEN
      IF l_friends_ids_remaining > 0 THEN
        l_return := TRUE;
      ELSE
        l_return := FALSE;
      END IF;
      -- For Followers API Calls
    ELSIF upper(i_api_type) = 'FOLLOWERS' THEN
      IF l_followers_ids_remaining > 0 THEN
        l_return := TRUE;
      ELSE
        l_return := FALSE;
      END IF;
      -- For Searches API Calls
    ELSIF upper(i_api_type) = 'SEARCH' THEN
      IF l_search_tweets_remaining > 0 THEN
        l_return := TRUE;
      ELSE
        l_return := FALSE;
      END IF;
    END IF;
    --
    RETURN l_return;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END check_twitter_api_limits;
  --
  /****************************************************************************
  * Purpose:  Get all Twitter Follower IDs(Following People) per twitter user id 
  * Author:   Daniel Hochleitner
  * Created:  16.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_followers(i_twitter_id IN usr.twitter_id%TYPE)
    RETURN CLOB IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_followers';
    --
    l_rec_system     api_system.pub_rec_system_type;
    l_ssl_wallet_pwd system.twitter_ssl_wallet_pwd%TYPE;
    --
    l_twitter_response_json CLOB;
    l_twitter_bearer        system.twitter_api_bearer%TYPE;
    --
  BEGIN
    -- get values from system table and twitter bearer
    l_rec_system     := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    l_twitter_bearer := api_twitter.get_twitter_bearer_token;
    --
    -- check API Call limits (go forward when limit not reached)
    IF api_twitter.check_twitter_api_limits(i_api_type => 'followers') THEN
      --
      -- only go forward then bearer token is present
      IF l_twitter_bearer IS NOT NULL THEN
        -- get parameter
        l_ssl_wallet_pwd := api_utils.do_decrypt(i_string => l_rec_system.twitter_ssl_wallet_pwd);
        --
        -- set http headers
        api_twitter.set_http_headers(i_bearer_token => l_twitter_bearer);
        --
        -- do rest request
        l_twitter_response_json := apex_web_service.make_rest_request(p_url         => 'https://api.twitter.com/1.1/followers/ids.json?user_id=' ||
                                                                                       i_twitter_id ||
                                                                                       '&count=5000',
                                                                      p_http_method => 'GET',
                                                                      p_wallet_path => 'file:' ||
                                                                                       l_rec_system.twitter_ssl_wallet_path,
                                                                      p_wallet_pwd  => l_ssl_wallet_pwd);
        --
        -- check if http status is successfull (2XX) (throw error if not)
        api_twitter.check_error_http_status;
        --
      END IF;
    END IF;
    --
    RETURN l_twitter_response_json;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_followers;
  --
  /****************************************************************************
  * Purpose:  Get all Twitter friend IDs(People you follow) per twitter user id 
  * Author:   Daniel Hochleitner
  * Created:  16.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_friends(i_twitter_id IN usr.twitter_id%TYPE)
    RETURN CLOB IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_friends';
    --
    l_rec_system     api_system.pub_rec_system_type;
    l_ssl_wallet_pwd system.twitter_ssl_wallet_pwd%TYPE;
    --
    l_twitter_response_json CLOB;
    l_twitter_bearer        system.twitter_api_bearer%TYPE;
    --
  BEGIN
    -- get values from system table and twitter bearer
    l_rec_system     := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    l_twitter_bearer := api_twitter.get_twitter_bearer_token;
    --
    -- check API Call limits (go forward when limit not reached)
    IF api_twitter.check_twitter_api_limits(i_api_type => 'friends') THEN
      --
      -- only go forward then bearer token is present
      IF l_twitter_bearer IS NOT NULL THEN
        -- get parameter
        l_ssl_wallet_pwd := api_utils.do_decrypt(i_string => l_rec_system.twitter_ssl_wallet_pwd);
        --
        -- set http headers
        api_twitter.set_http_headers(i_bearer_token => l_twitter_bearer);
        --
        -- do rest request
        l_twitter_response_json := apex_web_service.make_rest_request(p_url         => 'https://api.twitter.com/1.1/friends/ids.json?user_id=' ||
                                                                                       i_twitter_id ||
                                                                                       '&count=5000',
                                                                      p_http_method => 'GET',
                                                                      p_wallet_path => 'file:' ||
                                                                                       l_rec_system.twitter_ssl_wallet_path,
                                                                      p_wallet_pwd  => l_ssl_wallet_pwd);
        --
        -- check if http status is successfull (2XX) (throw error if not)
        api_twitter.check_error_http_status;
        --
      END IF;
    END IF;
    --
    RETURN l_twitter_response_json;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_friends;
  --
  /****************************************************************************
  * Purpose:  Get all Twitter friend IDs(People you follow) per id_usr from usr table 
  *           + insert all ids found in table usr_tw_friends
  * Author:   Daniel Hochleitner
  * Created:  16.08.2015
  * Changed:
  ****************************************************************************/
  PROCEDURE ins_twitter_friends(i_id_usr IN usr.id_usr%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'ins_twitter_friends';
    --
    l_rec_usr_tw_friends api_usr_tw_friends.pub_rec_usr_tw_friends_type;
    l_id_usr_tw_friends  usr_tw_friends.id_usr_tw_friends%TYPE;
    --
    l_twitter_response_json CLOB;
    l_twitter_response_xml  xmltype;
    --
    CURSOR l_cur_twitter_xml IS
      SELECT user_id
        FROM xmltable('/json/ids/row' passing l_twitter_response_xml
                      columns user_id path 'text()');
    --
  BEGIN
    --
    -- do rest request
    l_twitter_response_json := api_twitter.get_twitter_friends(i_twitter_id => api_usr.get_twitter_id(i_id_usr => i_id_usr));
    --
    -- json to xml
    l_twitter_response_xml := apex_json.to_xmltype(l_twitter_response_json);
    --
    -- delete all user entries and open cursor with xmltable and insert in table usr_tw_friends
    api_usr_tw_friends.del_usr_tw_friends_per_usr(i_id_usr => i_id_usr);
    COMMIT;
    --
    FOR l_rec_twitter_xml IN l_cur_twitter_xml LOOP
      l_rec_usr_tw_friends.id_usr                := i_id_usr;
      l_rec_usr_tw_friends.id_usr_friend         := api_usr.get_id_usr(i_twitter_id => l_rec_twitter_xml.user_id);
      l_rec_usr_tw_friends.usr_friend_twitter_id := l_rec_twitter_xml.user_id;
      --
      l_id_usr_tw_friends := api_usr_tw_friends.ins_usr_tw_friends(i_rec_usr_tw_friends => l_rec_usr_tw_friends);
    END LOOP;
    COMMIT;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END ins_twitter_friends;
  --
  /****************************************************************************
  * Purpose:  Find the Twitter User ID for an twitter name
  * Author:   Daniel Hochleitner
  * Created:  16.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_id(i_twitter_name IN usr.twitter_name%TYPE)
    RETURN usr.twitter_id%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_id';
    --
    l_rec_system     api_system.pub_rec_system_type;
    l_ssl_wallet_pwd system.twitter_ssl_wallet_pwd%TYPE;
    --
    l_twitter_id usr.twitter_id%TYPE;
    --
    l_twitter_response_json CLOB;
    l_twitter_response_xml  xmltype;
    l_twitter_bearer        system.twitter_api_bearer%TYPE;
    --
    CURSOR l_cur_twitter_xml IS
      SELECT user_id
        FROM xmltable('/json/row' passing l_twitter_response_xml columns
                      user_id path 'id_str',
                      user_name path 'screen_name')
       WHERE upper(user_name) = upper(i_twitter_name);
    --
  BEGIN
    -- get values from system table and twitter bearer
    l_rec_system     := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    l_twitter_bearer := api_twitter.get_twitter_bearer_token;
    --
    -- check API Call limits (go forward when limit not reached)
    IF api_twitter.check_twitter_api_limits(i_api_type => 'users') THEN
      --
      -- only go forward then bearer token is present
      IF l_twitter_bearer IS NOT NULL THEN
        -- get parameter
        l_ssl_wallet_pwd := api_utils.do_decrypt(i_string => l_rec_system.twitter_ssl_wallet_pwd);
        --
        -- set http headers
        api_twitter.set_http_headers(i_bearer_token => l_twitter_bearer);
        --
        -- do rest request
        l_twitter_response_json := apex_web_service.make_rest_request(p_url         => 'https://api.twitter.com/1.1/users/lookup.json?screen_name=' ||
                                                                                       TRIM(upper(i_twitter_name)) ||
                                                                                       '&include_entities=false',
                                                                      p_http_method => 'GET',
                                                                      p_wallet_path => 'file:' ||
                                                                                       l_rec_system.twitter_ssl_wallet_path,
                                                                      p_wallet_pwd  => l_ssl_wallet_pwd);
        --
        -- check if http status is successfull (2XX) (throw error if not)
        api_twitter.check_error_http_status;
        --
        -- json to xml
        l_twitter_response_xml := apex_json.to_xmltype(l_twitter_response_json);
        --
        -- open cursor with xmltable and fetch into var
        OPEN l_cur_twitter_xml;
        FETCH l_cur_twitter_xml
          INTO l_twitter_id;
        CLOSE l_cur_twitter_xml;
        --
      END IF;
    END IF;
    --
    RETURN l_twitter_id;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_id;
  --
  /****************************************************************************
  * Purpose:  Find the Twitter User name for an twitter ID
  * Author:   Daniel Hochleitner
  * Created:  16.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_name(i_twitter_id IN usr.twitter_id%TYPE)
    RETURN usr.twitter_name%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_name';
    --
    l_rec_system     api_system.pub_rec_system_type;
    l_ssl_wallet_pwd system.twitter_ssl_wallet_pwd%TYPE;
    --
    l_twitter_name usr.twitter_name%TYPE;
    --
    l_twitter_response_json CLOB;
    l_twitter_response_xml  xmltype;
    l_twitter_bearer        system.twitter_api_bearer%TYPE;
    --
    CURSOR l_cur_twitter_xml IS
      SELECT user_name
        FROM xmltable('/json/row' passing l_twitter_response_xml columns
                      user_id path 'id_str',
                      user_name path 'screen_name')
       WHERE user_id = i_twitter_id;
    --
  BEGIN
    -- get values from system table and twitter bearer
    l_rec_system     := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    l_twitter_bearer := api_twitter.get_twitter_bearer_token;
    --
    -- check API Call limits (go forward when limit not reached)
    IF api_twitter.check_twitter_api_limits(i_api_type => 'users') THEN
      --
      -- only go forward then bearer token is present
      IF l_twitter_bearer IS NOT NULL THEN
        -- get parameter
        l_ssl_wallet_pwd := api_utils.do_decrypt(i_string => l_rec_system.twitter_ssl_wallet_pwd);
        --
        -- set http headers
        api_twitter.set_http_headers(i_bearer_token => l_twitter_bearer);
        --
        -- do rest request
        l_twitter_response_json := apex_web_service.make_rest_request(p_url         => 'https://api.twitter.com/1.1/users/lookup.json?user_id=' ||
                                                                                       i_twitter_id ||
                                                                                       '&include_entities=false',
                                                                      p_http_method => 'GET',
                                                                      p_wallet_path => 'file:' ||
                                                                                       l_rec_system.twitter_ssl_wallet_path,
                                                                      p_wallet_pwd  => l_ssl_wallet_pwd);
        --
        -- check if http status is successfull (2XX) (throw error if not)
        api_twitter.check_error_http_status;
        --
        -- json to xml
        l_twitter_response_xml := apex_json.to_xmltype(l_twitter_response_json);
        --
        -- open cursor with xmltable and fetch into var
        OPEN l_cur_twitter_xml;
        FETCH l_cur_twitter_xml
          INTO l_twitter_name;
        CLOSE l_cur_twitter_xml;
        --
      END IF;
    END IF;
    --
    RETURN l_twitter_name;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_name;
  --
  /****************************************************************************
  * Purpose:  Find the Twitter Profile Pic URL for an twitter ID
  * Author:   Daniel Hochleitner
  * Created:  16.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION get_twitter_profile_pic_url(i_twitter_id IN usr.twitter_id%TYPE,
                                       i_ssl        IN NUMBER := 1)
    RETURN usr.twitter_profile_pic_url%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_twitter_profile_pic_url';
    --
    l_rec_system     api_system.pub_rec_system_type;
    l_ssl_wallet_pwd system.twitter_ssl_wallet_pwd%TYPE;
    --
    l_return          usr.twitter_profile_pic_url%TYPE;
    l_twitter_url     usr.twitter_profile_pic_url%TYPE;
    l_twitter_url_ssl usr.twitter_profile_pic_url%TYPE;
    --
    l_twitter_response_json CLOB;
    l_twitter_response_xml  xmltype;
    l_twitter_bearer        system.twitter_api_bearer%TYPE;
    --
    CURSOR l_cur_twitter_xml IS
      SELECT profile_image_url,
             profile_image_url_https
        FROM xmltable('/json/row' passing l_twitter_response_xml columns
                      user_id path 'id_str',
                      profile_image_url path 'profile_image_url',
                      profile_image_url_https path 'profile_image_url_https')
       WHERE user_id = i_twitter_id;
    --
  BEGIN
    -- get values from system table and twitter bearer
    l_rec_system     := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    l_twitter_bearer := api_twitter.get_twitter_bearer_token;
    --
    -- check API Call limits (go forward when limit not reached)
    IF api_twitter.check_twitter_api_limits(i_api_type => 'users') THEN
      --
      -- only go forward then bearer token is present
      IF l_twitter_bearer IS NOT NULL THEN
        -- get parameter
        l_ssl_wallet_pwd := api_utils.do_decrypt(i_string => l_rec_system.twitter_ssl_wallet_pwd);
        --
        -- set http headers
        api_twitter.set_http_headers(i_bearer_token => l_twitter_bearer);
        --
        -- do rest request
        l_twitter_response_json := apex_web_service.make_rest_request(p_url         => 'https://api.twitter.com/1.1/users/lookup.json?user_id=' ||
                                                                                       i_twitter_id ||
                                                                                       '&include_entities=false',
                                                                      p_http_method => 'GET',
                                                                      p_wallet_path => 'file:' ||
                                                                                       l_rec_system.twitter_ssl_wallet_path,
                                                                      p_wallet_pwd  => l_ssl_wallet_pwd);
        --
        -- check if http status is successfull (2XX) (throw error if not)
        api_twitter.check_error_http_status;
        --
        -- json to xml
        l_twitter_response_xml := apex_json.to_xmltype(l_twitter_response_json);
        --
        -- open cursor with xmltable and fetch into var
        OPEN l_cur_twitter_xml;
        FETCH l_cur_twitter_xml
          INTO l_twitter_url,
               l_twitter_url_ssl;
        CLOSE l_cur_twitter_xml;
        --
      END IF;
    END IF;
    --
    -- Get SSL URL oder normal
    IF nvl(i_ssl,
           1) = 1 THEN
      -- replace to get fullsize original image
      l_return := REPLACE(l_twitter_url_ssl,
                          '_normal',
                          '');
    ELSE
      -- replace to get fullsize original image
      l_return := REPLACE(l_twitter_url,
                          '_normal',
                          '');
    END IF;
    --
    RETURN l_return;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_twitter_profile_pic_url;
  --
  /****************************************************************************
  * Purpose:  Get all Tweets as search result with specified search string
  * Author:   Daniel Hochleitner
  * Created:  16.08.2015
  * Changed:
  ****************************************************************************/
  FUNCTION get_search_results(i_search_string IN VARCHAR2,
                              i_count         IN NUMBER := 20) RETURN CLOB IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_search_results';
    --
    l_rec_system     api_system.pub_rec_system_type;
    l_ssl_wallet_pwd system.twitter_ssl_wallet_pwd%TYPE;
    --
    l_count                 NUMBER;
    l_twitter_response_json CLOB;
    l_twitter_bearer        system.twitter_api_bearer%TYPE;
    --
  BEGIN
    -- get values from system table and twitter bearer
    l_rec_system     := api_system.get_rec_system(i_id_system => api_system.pubc_system_pk);
    l_twitter_bearer := api_twitter.get_twitter_bearer_token;
    --
    -- check API Call limits (go forward when limit not reached)
    IF api_twitter.check_twitter_api_limits(i_api_type => 'search') THEN
      --
      -- only go forward then bearer token is present
      IF l_twitter_bearer IS NOT NULL THEN
        -- get parameter
        l_ssl_wallet_pwd := api_utils.do_decrypt(i_string => l_rec_system.twitter_ssl_wallet_pwd);
        --
        -- set http headers
        api_twitter.set_http_headers(i_bearer_token => l_twitter_bearer);
        --
        -- count max value
        IF i_count > 100 THEN
          l_count := 100;
        ELSE
          l_count := i_count;
        END IF;
        --
        -- do rest request
        l_twitter_response_json := apex_web_service.make_rest_request(p_url         => 'https://api.twitter.com/1.1/search/tweets.json?q=' ||
                                                                                       apex_util.url_encode(i_search_string) ||
                                                                                       '&include_entities=false&count=' ||
                                                                                       l_count,
                                                                      p_http_method => 'GET',
                                                                      p_wallet_path => 'file:' ||
                                                                                       l_rec_system.twitter_ssl_wallet_path,
                                                                      p_wallet_pwd  => l_ssl_wallet_pwd);
        --
        -- check if http status is successfull (2XX) (throw error if not)
        api_twitter.check_error_http_status;
        --
      END IF;
    END IF;
    --
    RETURN l_twitter_response_json;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_search_results;
  --
END api_twitter;
/

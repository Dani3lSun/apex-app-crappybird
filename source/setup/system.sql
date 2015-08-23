Rem Setup Script to install system defaults
Rem Author: Daniel Hochleitner

SET VERIFY OFF
SET DEFINE '&'

prompt Enter values below for installation of System Defaults
prompt Wallet Path could be /path/to/wallet or C:\path\to\Wallet
prompt

whenever sqlerror exit

-- input of values
accept EMAIL CHAR prompt 'Enter standard email sender address: '
accept TWITTER_KEY CHAR prompt 'Enter Twitter Consumer Key: '
accept TWITTER_SECRET CHAR prompt 'Enter Twitter Consumer Secret: '
accept TWITTER_WALLET_PATH CHAR prompt 'Enter Path of the Twitter SSL Wallet: '
accept TWITTER_WALLET_PWD CHAR prompt 'Enter Password of the Twitter SSL Wallet: '

prompt ...creating system defaults

-- create system defaults
set serveroutput on
BEGIN
  api_system.do_insert_system_setup(i_twitter_consumer_key    => '&TWITTER_KEY.',
                                    i_twitter_consumer_secret => '&TWITTER_SECRET.',
                                    i_twitter_ssl_wallet_path => '&TWITTER_WALLET_PATH.',
                                    i_twitter_ssl_wallet_pwd  => '&TWITTER_WALLET_PWD.',
                                    i_email_from              => '&EMAIL.');
END;
/
COMMIT;
/

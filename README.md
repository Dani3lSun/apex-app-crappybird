**Table of Contents**

- [CrappyBird](#app-name)
	- [Description](#description)
	- [Demo](#demo)
	- [Changelog](#changelog)
	- [Install](#install)
		- [Preparations](#preparations)
			- [Twitter API](#twitter-api)
			- [Oracle SSL Wallet](#oracle-ssl-wallet)
			- [Oracle Apex](#oracle-apex)
		- [Database](#database)
			- [As user with sysdba permissions](#user-sysdba)
			- [As APP_SCHEMA user](#user-appschema)
		- [Webserver](#webserver)
		- [Oracle Apex App Settings](#apex-app-settings)
	- [Source Description](#source-description)
		- [Application](#application)
		- [Plugins](#plugins)
		- [Tables](#tables)
		- [Packages](#packages)
		- [Sequences](#sequences)
		- [Data Model](#data-model)
		- [SSL Wallet](#ssl-wallet)
		- [3Party Libs](#3party-libs)
	- [License](#license)
	- [Preview](#preview)
	
#CrappyBird
##Description
CrappyBird is a game made with Oracle Apex. The game view itself is inspired from the [Open Source JS/HTML5 Game CrappyBird](https://github.com/varunpant/CrappyBird) from varunpant.
The game was extended to fit in the Oracle Apex environment and for better customization. Also a complete social component was added, so you can play against people or friends. Therefore a login with your email is needed.
For example you can:
- Choose the bird color
- Choose the Daymode
- Change all sorts of colors of the complete playground
- Play against public people
- Play against your twitter friends
- Play against people in your local area
- Mess your results in ranking lists
The game runs best in WebKit browsers like Safari or Google Chrome. It is mobile optimized and best results can be achieved with iOS Safari, because the game runs in complete fullscreen mode (WebApp). Just bookmark the page to your homescreen.

This game was designed and built to be part of the [ODTUG Apex Gaming Competition 2015](http://competition.odtug.com/pls/apex/f?p=AGC2015).

##Demo
A demo application is available under
https://apex.danielh.de/ords/f?p=CB
Create a login and the fun can begin. 

##Changelog
####0.8 - Beta Testing

##Install
###Preparations
####Twitter API
The game uses the [Twitter REST API (Application-only Authentication)](https://dev.twitter.com/rest/public) to display info from twitter. Because of that, you must create a twitter developer account.
Also you must create a Twitter App under [https://apps.twitter.com/](https://apps.twitter.com/) to get the authentication tokens.
Create a readonly App named for example "CrappyBird Apex" and note down the 2 tokens (Consumer Key / Consumer Secret). These keys are needed later.

####Oracle SSL Wallet
To comunicate with the Twitter API (api.twitter.com) over HTTPS, a SSL Wallet is needed for database which contains the 2 CA certificates from api.twitter.com.
A ready to go wallet is included in the source directory under [../source/wallets/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/wallets).
The password of the wallet is "Twitter2015".

####Oracle Apex
- Create a new empty Workspace and Schema on DB.
- In Apex Administration add valid email settings. APEX_MAIL is used to send emails.

###Database
####As user with sysdba permissions
Some features require sysdba rights. Please run following commands before running the setup!

- Grant to dbms_crypto (needed for password encryption/decryption of the app)

```language-sql
grant execute on sys.dbms_crypto to APP_SCHEMA;
```

- Network ACL (needed to connect to REST services of Twitter API)

```language-sql
BEGIN
  -- add privilege to user
  dbms_network_acl_admin.add_privilege(acl        => 'twitter_acl_file.xml',
                                       principal  => 'APP_SCHEMA',
                                       is_grant   => FALSE,
                                       privilege  => 'connect',
                                       position   => NULL,
                                       start_date => NULL,
                                       end_date   => NULL);

  COMMIT;
  -- assign_acl to api.twitter.com
  dbms_network_acl_admin.assign_acl(acl        => 'twitter_acl_file.xml',
                                    host       => 'api.twitter.com',
                                    lower_port => 443,
                                    upper_port => NULL);

  COMMIT;
END;
/
```

####As APP_SCHEMA user
- Connect with SQLPlus as the APP_SCHEMA User
- Run setup.sql file located in [../source/setup/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/setup). This will install all the database objects needed to run CrappyBird App.
- Check for invalid objects! If so recompile them!
- Run admin.sql file located in [../source/setup/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/setup). You will be prompted for a email address and password. This will create the admin user to login within the app.
- Run system.sql file located in [../source/setup/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/setup). You will be prompted for both Twitter API Keys from Preparations step before, the standard email sender address of the app and location/password of the Oracle SSL Wallet. This step is important, as it is needed!

###Webserver
- Deploy all files and subfolders from [../server directory](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/server) on your Apex Webserver.

###Oracle Apex App Settings
- Import the 300.sql file located in [../source/apex/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/apex) into your newly created Workspace.
- Under App Settings / Substitution Strings: Change the string CRAPPY_HOME to the actual location of the server folder on your webserver.
- Under App Settings / Substitution Strings: Change the string SOFTWARE_URL to the actual URL of the app. For example: https://apex.danielh.de/ords/f?p=&APP_ID.

Now your are ready to go, and people can use the game and can register on first page!


##Source Description
The following points describe the different components of the source I developed.
###Application
- Name: CrappyBird
- Files: [../source/apex/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/apex) f300.sql
- Description: The complete Oracle Apex Application for the game

###Plugins
- Name: Add2Home
- Files: [../source/apex/plugins](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/apex/plugins) dynamic_action_plugin_com_apex-evangelists_add2home.sql
- Description: Plugin from Roel Hartman to display a Add2Home Popup on login screen for iOS devices

###Tables
- Name: USR
- Files: [../source/tables/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/tables) usr.sql
- Description: Table that holds user information, like email/password etc.

---
- Name: USR_PREFS
- Files: [../source/tables/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/tables) usr_prefs.sql
- Description: Table that holds user preferences, like preferred colors of the game.

---
- Name: USR_LOCATION
- Files: [../source/tables/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/tables) usr_location.sql
- Description: Table that holds gps coordinates of the user to display friends nearby.

---
- Name: USR_TOKEN
- Files: [../source/tables/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/tables) usr_token.sql
- Description: Table that holds user token. Used for registering and password lost function.

---
- Name: USR_TW_FRIENDS
- Files: [../source/tables/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/tables) usr_tw_friends.sql
- Description: Table that holds information about the twitter friends of a user.

---
- Name: USR_BATTLE
- Files: [../source/tables/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/tables) usr_battle.sql
- Description: Table that holds information about game battles between users

---
- Name: SYSTEM
- Files: [../source/tables/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/tables) system.sql
- Description: Table that holds system / app relevant information, like twitter token, email sender address etc.

---
- Name: ERR_LOG
- Files: [../source/tables/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/tables) err_log.sql
- Description: Table that is used for error logging functions.

###Packages
- Name: API_AUTH
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_auth.spc / api_auth.bdy
- Description: Package for user / apex authentication

---
- Name: API_ERR_LOG
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_err_log.spc / api_err_log.bdy
- Description: Package for error logging

---
- Name: API_GAME
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_game.spc / api_game.bdy
- Description: Package for the crappybird game (rendering/highscore/etc.)

---
- Name: API_MAIL
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_mail.spc / api_mail.bdy
- Description: Package for sending emails

---
- Name: API_SYSTEM
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_system.spc / api_system.bdy
- Description: Package for system table and functions/parameters

---
- Name: API_TWITTER
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_twitter.spc / api_twitter.bdy
- Description: Package for using the Twitter REST API

---
- Name: API_USR
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_usr.spc / api_usr.bdy
- Description: Package for user table and functions

---
- Name: API_USR_BATTLE
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_usr_battle.spc / api_usr_battle.bdy
- Description: Package for user game battle table and functions

---
- Name: API_USR_LOCATION
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_usr_location.spc / api_usr_location.bdy
- Description: Package for user location table and functions

---
- Name: API_USR_PREFS
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_usr_prefs.spc / api_usr_prefs.bdy
- Description: Package for user preferences table and functions

---
- Name: API_USR_TOKEN
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_usr_token.spc / api_usr_token.bdy
- Description: Package for user token table and functions

---
- Name: API_USR_TW_FRIENDS
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_usr_tw_friends.spc / api_usr_tw_friends.bdy
- Description: Package for users twitter friends table and functions

---
- Name: API_UTILS
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_utils.spc / api_utils.bdy
- Description: Package for general use of often used functions, like encryption etc.

###Sequences
- Name: SEQ_PK
- Files: [../source/sequence/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/sequence) seq_pk.sql
- Description: Sequence for Primary Keys of tables

###Data Model
- Name: crappybird
- Files: [../source/db_model/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/db_model) crappybird.dmd and folder
- Description: Complete DB Model of CrappyBird game designed with Oracle DataModeler 4.1

###SSL Wallet
- Name: twitter_wallet
- Files: [../source/wallets/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/wallets) twitter_wallet.zip
- Description: Oracle SSL Wallet that contains the 2 CA certificates of api.twitter.com / Password: Twitter2015

###3Party Libs
Several parts of the application uses 3party code that is listed here:
- Part: Theme
- Name: material-apex
- Author: Vincent Morneau
- Link: https://github.com/vincentmorneau/material-apex
- License: MIT
- Files: [../server/theme/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/server/theme)
- Modifications: Some Template changes/ CSS changes

---
- Part: CrappyBird Game
- Name: CrappyBird
- Author: Varun Pant
- Link: https://github.com/varunpant/CrappyBird
- License: MIT
- Files: [../source/packages/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/packages) api_game.spc / api_game.bdy
- Modifications: Some CSS changes / changed canvas object / JS changes to write highscore in apex item / theming engine from DB / added images

---
- Part: Color Picker
- Name: Spectrum
- Author: Brian Grinstead
- Link: https://github.com/bgrins/spectrum
- License: Own Open Source License
- Files: [../server/](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/server) in css and js subfolders
- Modifications: None

---
- Part: Plugin
- Name: Add2Home
- Author: Roel Hartman
- Link: http://www.apex-plugin.com/oracle-apex-plugins/dynamic-action-plugin/add2homescreen_272.html
- License: Own Open Source License
- Files: [../source/apex/plugins](https://github.com/Dani3lSun/apex-app-crappybird/tree/master/source/apex/plugins) dynamic_action_plugin_com_apex-evangelists_add2home.sql
- Modifications: None

Thanks to all of you to make such amazing code public!

##License
This software is under MIT License.
[LICENSE](https://github.com/Dani3lSun/apex-app-crappybird/blob/master/LICENSE)

##Preview
![](https://github.com/Dani3lSun/apex-app-crappybird/blob/master/preview/preview_01.png)
![](https://github.com/Dani3lSun/apex-app-crappybird/blob/master/preview/preview_02.png)
![](https://github.com/Dani3lSun/apex-app-crappybird/blob/master/preview/preview_03.png)
![](https://github.com/Dani3lSun/apex-app-crappybird/blob/master/preview/preview_04.png)
![](https://github.com/Dani3lSun/apex-app-crappybird/blob/master/preview/preview_05.png)
![](https://github.com/Dani3lSun/apex-app-crappybird/blob/master/preview/preview_06.png)

---


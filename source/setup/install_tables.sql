Rem Install Tables and Constraints
Rem Author: Daniel Hochleitner

SET VERIFY OFF
SET DEFINE OFF

prompt Install tables

@@../tables/err_log.sql
@@../tables/system.sql
@@../tables/usr.sql
@@../tables/usr_battle.sql
@@../tables/usr_location.sql
@@../tables/usr_prefs.sql
@@../tables/usr_token.sql
@@../tables/usr_tw_friends.sql
@@../tables/pub_themes.sql
@@../tables/table_constraints.sql

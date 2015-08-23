Rem Setup Script to install CrappyBird Apex Application DB Objects
Rem Author: Daniel Hochleitner

SET VERIFY OFF
SET DEFINE OFF

prompt CrappyBird Apex Application DB Objects

prompt Install Tables
@install_tables.sql

prompt Install Sequence
@@../sequence/seq_pk.sql

prompt Install Packages
@install_packages.sql

prompt ...Installation Complete

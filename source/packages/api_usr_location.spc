CREATE OR REPLACE PACKAGE api_usr_location IS
  --
  -- API-Package for table usr_location
  --

  --
  -- Record for usr_location
  --
  TYPE pub_rec_usr_location_type IS RECORD(
    id_usr_location usr_location.id_usr_location%TYPE,
    id_usr          usr_location.id_usr%TYPE,
    geo_latitude    usr_location.geo_latitude%TYPE,
    geo_longitude   usr_location.geo_longitude%TYPE);
  --
  -- Inserts dataset in usr_location
  -- #param  i_rec_usr_location Record-Type of table
  -- #return ID (PK of dataset)
  FUNCTION ins_usr_location(i_rec_usr_location IN pub_rec_usr_location_type)
    RETURN usr_location.id_usr_location%TYPE;
  --
  --
  -- Updates datset of table usr_location
  -- #param  i_rec_usr_location  Record-Type of usr_location
  -- #param  i_checksum Checksumme md5 before
  PROCEDURE upd_usr_location(i_rec_usr_location IN pub_rec_usr_location_type,
                             i_checksum         IN VARCHAR2 := NULL);
  --
  --
  -- Deletes dataset of table usr_location
  -- #param  i_id_usr_location  PK-ID of usr_location
  PROCEDURE del_usr_location(i_id_usr_location IN usr_location.id_usr_location%TYPE);
  --
  --
  -- Get record of table usr_location
  -- #param i_id_usr_location ID aus usr_location
  -- #return Record-Type for usr_location
  FUNCTION get_rec_usr_location(i_id_usr_location IN usr_location.id_usr_location%TYPE)
    RETURN pub_rec_usr_location_type;
  --
  --
  -- Generates md5 checksum for usr_location
  -- #param  i_rec_usr_location Record-Type of table
  -- #return md5 Checksum in Varchar2
  FUNCTION get_md5_usr_location(i_rec_usr_location IN pub_rec_usr_location_type)
    RETURN VARCHAR2;
  --
  --
  -- Compares (Before/After) md5 checksum for usr_location
  -- #param  i_checksum checksum before
  -- #param  i_rec_usr_location Record-Type of table
  -- #return Boolean value
  FUNCTION do_check_md5_usr_location(i_checksum         IN VARCHAR2,
                                     i_rec_usr_location IN pub_rec_usr_location_type)
    RETURN BOOLEAN;
  --
  --
  -- Get id_usr_location of usr_location
  -- #param i_id_usr_location Id der usr_location
  -- #return id_usr_location aus usr_location
  FUNCTION get_id_usr_location(i_id_usr_location IN usr_location.id_usr_location%TYPE)
    RETURN usr_location.id_usr_location%TYPE;
  --

  --
  -- Get id_usr of usr_location
  -- #param i_id_usr_location Id der usr_location
  -- #return id_usr aus usr_location
  FUNCTION get_id_usr(i_id_usr_location IN usr_location.id_usr_location%TYPE)
    RETURN usr_location.id_usr%TYPE;
  --

  --
  -- Get geo_latitude of usr_location
  -- #param i_id_usr_location Id der usr_location
  -- #return geo_latitude aus usr_location
  FUNCTION get_geo_latitude(i_id_usr_location IN usr_location.id_usr_location%TYPE)
    RETURN usr_location.geo_latitude%TYPE;
  --

  --
  -- Get geo_longitude of usr_location
  -- #param i_id_usr_location Id der usr_location
  -- #return geo_longitude aus usr_location
  FUNCTION get_geo_longitude(i_id_usr_location IN usr_location.id_usr_location%TYPE)
    RETURN usr_location.geo_longitude%TYPE;
  --
  -- DELETES all entries from specified user
  -- #param i_id_usr
  PROCEDURE del_all_usr_location(i_id_usr IN usr_location.id_usr%TYPE);
  --
  -- Insert new Geo Coordninates for specified user
  -- #param i_id_usr
  -- #param i_geo_latitude
  -- #param i_geo_longitude
  PROCEDURE insert_geo_coords(i_id_usr        IN usr_location.id_usr%TYPE,
                              i_geo_latitude  IN usr_location.geo_latitude%TYPE,
                              i_geo_longitude IN usr_location.geo_longitude%TYPE);
  --
  -- Get the distance in specified unit between 2 Users
  -- #param i_id_usr1
  -- #param i_id_usr2
  -- #param i_unit (KM/Mile) valid UNIT_OF_MEAS_NAME from SDO_UNITS_OF_MEASURE table
  -- return distance in specified unit - default: mile
  FUNCTION get_distance_between_usr(i_id_usr1 IN usr_location.id_usr%TYPE,
                                    i_id_usr2 IN usr_location.id_usr%TYPE,
                                    i_unit    IN VARCHAR2) RETURN NUMBER;
  --
  -- Check if user has gps coords saved (gps enabled)
  -- #param i_id_usr
  -- #return BOOLEAN
  FUNCTION check_usr_gps_enabled(i_id_usr IN usr_location.id_usr%TYPE)
    RETURN BOOLEAN;
  --
  -- Render Google Maps with Users nearby
  -- #param i_id_usr
  -- #param i_distance
  -- #param i_crappy_home_path
  PROCEDURE render_nearby_usr_gmaps(i_id_usr           IN usr_location.id_usr%TYPE,
                                    i_distance         IN NUMBER,
                                    i_crappy_home_path IN VARCHAR2);
  --

END api_usr_location;
/

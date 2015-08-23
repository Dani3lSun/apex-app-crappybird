CREATE OR REPLACE PACKAGE BODY api_usr_location IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_usr_location';
  --
  /*************************************************************************
  * Purpose:  INSERTS dataset into usr_location and returns PK
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  *************************************************************************/
  FUNCTION ins_usr_location(i_rec_usr_location IN pub_rec_usr_location_type)
    RETURN usr_location.id_usr_location%TYPE IS
    l_function CONSTANT VARCHAR2(30) := 'ins_usr_location';
    --
    l_id_usr_location usr_location.id_usr_location%TYPE;
  BEGIN
    --
    -- if id_usr_location not present,
    -- get next value of Sequence
    --
    IF i_rec_usr_location.id_usr_location IS NULL THEN
      l_id_usr_location := seq_pk.nextval;
    ELSE
      l_id_usr_location := i_rec_usr_location.id_usr_location;
    END IF;
    --
    INSERT INTO usr_location
      (usr_location.id_usr_location,
       usr_location.id_usr,
       usr_location.geo_latitude,
       usr_location.geo_longitude)
    VALUES
      (l_id_usr_location,
       i_rec_usr_location.id_usr,
       i_rec_usr_location.geo_latitude,
       i_rec_usr_location.geo_longitude);
    --
    RETURN l_id_usr_location;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END ins_usr_location;
  --
  /*************************************************************************
  * Purpose:  UPDATES dataset of table usr_location
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE upd_usr_location(i_rec_usr_location IN pub_rec_usr_location_type,
                             i_checksum         IN VARCHAR2 := NULL) IS
    l_function CONSTANT VARCHAR2(30) := 'upd_usr_location';
    --
    l_md5_bool   BOOLEAN := TRUE;
    l_rec_before api_usr_location.pub_rec_usr_location_type;
  BEGIN
    --
    l_rec_before := api_usr_location.get_rec_usr_location(i_id_usr_location => i_rec_usr_location.id_usr_location);
    --
    IF i_checksum IS NOT NULL THEN
      l_md5_bool := do_check_md5_usr_location(i_checksum         => i_checksum,
                                              i_rec_usr_location => l_rec_before);
    END IF;
    --
    IF (i_checksum IS NULL) OR (l_md5_bool = TRUE) THEN
      UPDATE usr_location
         SET usr_location.id_usr        = i_rec_usr_location.id_usr,
             usr_location.geo_latitude  = i_rec_usr_location.geo_latitude,
             usr_location.geo_longitude = i_rec_usr_location.geo_longitude
       WHERE id_usr_location = i_rec_usr_location.id_usr_location;
    ELSE
      raise_application_error(-20001,
                              'Current data has changed. Please reload the page.');
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END upd_usr_location;
  --
  /*************************************************************************
  * Purpose:  DELETES dataset of table usr_location
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE del_usr_location(i_id_usr_location IN usr_location.id_usr_location%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'del_usr_location';
  BEGIN
    --
    DELETE FROM usr_location
     WHERE usr_location.id_usr_location = i_id_usr_location;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END del_usr_location;
  --
  /****************************************************************************
  * Purpose:  Get Record of table usr_location
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_rec_usr_location(i_id_usr_location IN usr_location.id_usr_location%TYPE)
    RETURN pub_rec_usr_location_type IS
    l_function CONSTANT VARCHAR2(30) := 'get_rec_usr_location';
    --
    l_retval pub_rec_usr_location_type;
    CURSOR l_cur_usr_location IS
      SELECT usr_location.id_usr_location,
             usr_location.id_usr,
             usr_location.geo_latitude,
             usr_location.geo_longitude
        FROM usr_location
       WHERE usr_location.id_usr_location = i_id_usr_location;
    l_rec_cur l_cur_usr_location%ROWTYPE;
    --
  BEGIN
    --
    OPEN l_cur_usr_location;
    FETCH l_cur_usr_location
      INTO l_rec_cur;
    IF l_cur_usr_location%FOUND THEN
      l_retval.id_usr_location := l_rec_cur.id_usr_location;
      l_retval.id_usr          := l_rec_cur.id_usr;
      l_retval.geo_latitude    := l_rec_cur.geo_latitude;
      l_retval.geo_longitude   := l_rec_cur.geo_longitude;
    END IF;
    CLOSE l_cur_usr_location;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_rec_usr_location;
  --
  /*************************************************************************
  * Purpose:  Generates md5 checksum for usr_location using Record-type
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  *************************************************************************/
  FUNCTION get_md5_usr_location(i_rec_usr_location IN pub_rec_usr_location_type)
    RETURN VARCHAR2 IS
    l_function CONSTANT VARCHAR2(30) := 'get_md5_usr_location';
    --
    l_md5_string VARCHAR2(32000);
    l_rec_string CLOB;
    l_seperator  VARCHAR2(10) := '|';
  BEGIN
    --
    l_rec_string := i_rec_usr_location.id_usr_location || l_seperator ||
                    i_rec_usr_location.id_usr || l_seperator ||
                    i_rec_usr_location.geo_latitude || l_seperator ||
                    i_rec_usr_location.geo_longitude || l_seperator;
    --
    l_md5_string := sys.utl_raw.cast_to_raw(sys.dbms_obfuscation_toolkit.md5(input_string => l_rec_string));
    --
    RETURN l_md5_string;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_md5_usr_location;
  --
  /*************************************************************************
  * Purpose:  Compares (Before/After) md5 checksum of usr_location
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  *************************************************************************/
  FUNCTION do_check_md5_usr_location(i_checksum         IN VARCHAR2,
                                     i_rec_usr_location IN pub_rec_usr_location_type)
    RETURN BOOLEAN IS
    l_function CONSTANT VARCHAR2(30) := 'do_check_md5_usr_location';
    --
    l_md5_string VARCHAR2(32000);
    l_return     BOOLEAN;
  BEGIN
    --
    l_md5_string := get_md5_usr_location(i_rec_usr_location => i_rec_usr_location);
    --
    IF i_checksum = l_md5_string THEN
      l_return := TRUE;
    ELSE
      l_return := FALSE;
    END IF;
    --
    RETURN l_return;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END do_check_md5_usr_location;
  --
  /****************************************************************************
  * Purpose:  Get usr_location.id_usr_location of usr_location
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr_location(i_id_usr_location IN usr_location.id_usr_location%TYPE)
    RETURN usr_location.id_usr_location%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr_location';
    --
    l_retval usr_location.id_usr_location%TYPE;
    CURSOR l_cur_usr_location IS
      SELECT usr_location.id_usr_location
        FROM usr_location
       WHERE usr_location.id_usr_location = i_id_usr_location;
  BEGIN
    --
    OPEN l_cur_usr_location;
    FETCH l_cur_usr_location
      INTO l_retval;
    CLOSE l_cur_usr_location;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_usr_location;
  --

  /****************************************************************************
  * Purpose:  Get usr_location.id_usr of usr_location
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_id_usr(i_id_usr_location IN usr_location.id_usr_location%TYPE)
    RETURN usr_location.id_usr%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_id_usr';
    --
    l_retval usr_location.id_usr%TYPE;
    CURSOR l_cur_usr_location IS
      SELECT usr_location.id_usr
        FROM usr_location
       WHERE usr_location.id_usr_location = i_id_usr_location;
  BEGIN
    --
    OPEN l_cur_usr_location;
    FETCH l_cur_usr_location
      INTO l_retval;
    CLOSE l_cur_usr_location;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_id_usr;
  --

  /****************************************************************************
  * Purpose:  Get usr_location.geo_latitude of usr_location
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_geo_latitude(i_id_usr_location IN usr_location.id_usr_location%TYPE)
    RETURN usr_location.geo_latitude%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_geo_latitude';
    --
    l_retval usr_location.geo_latitude%TYPE;
    CURSOR l_cur_usr_location IS
      SELECT usr_location.geo_latitude
        FROM usr_location
       WHERE usr_location.id_usr_location = i_id_usr_location;
  BEGIN
    --
    OPEN l_cur_usr_location;
    FETCH l_cur_usr_location
      INTO l_retval;
    CLOSE l_cur_usr_location;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_geo_latitude;
  --

  /****************************************************************************
  * Purpose:  Get usr_location.geo_longitude of usr_location
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_geo_longitude(i_id_usr_location IN usr_location.id_usr_location%TYPE)
    RETURN usr_location.geo_longitude%TYPE IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_geo_longitude';
    --
    l_retval usr_location.geo_longitude%TYPE;
    CURSOR l_cur_usr_location IS
      SELECT usr_location.geo_longitude
        FROM usr_location
       WHERE usr_location.id_usr_location = i_id_usr_location;
  BEGIN
    --
    OPEN l_cur_usr_location;
    FETCH l_cur_usr_location
      INTO l_retval;
    CLOSE l_cur_usr_location;
    --
    RETURN l_retval;
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_geo_longitude;
  --
  /*************************************************************************
  * Purpose:  DELETES all entries from specified user
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE del_all_usr_location(i_id_usr IN usr_location.id_usr%TYPE) IS
    l_function CONSTANT VARCHAR2(30) := 'del_all_usr_location';
  BEGIN
    --
    DELETE FROM usr_location
     WHERE usr_location.id_usr = i_id_usr;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END del_all_usr_location;
  --
  /****************************************************************************
  * Purpose:  Insert new Geo Coordninates for specified user
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  ****************************************************************************/
  PROCEDURE insert_geo_coords(i_id_usr        IN usr_location.id_usr%TYPE,
                              i_geo_latitude  IN usr_location.geo_latitude%TYPE,
                              i_geo_longitude IN usr_location.geo_longitude%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'insert_geo_coords';
    --
    l_rec_usr_location api_usr_location.pub_rec_usr_location_type;
    l_id_usr_location  usr_location.id_usr_location%TYPE;
    --
  BEGIN
    --
    -- only when coordinates are not null
    IF i_geo_latitude IS NOT NULL AND i_geo_longitude IS NOT NULL THEN
      --
      -- delete all user entries
      api_usr_location.del_all_usr_location(i_id_usr => i_id_usr);
      COMMIT;
      -- insert new coordinates
      l_rec_usr_location.id_usr        := i_id_usr;
      l_rec_usr_location.geo_latitude  := i_geo_latitude;
      l_rec_usr_location.geo_longitude := i_geo_longitude;
      --
      l_id_usr_location := api_usr_location.ins_usr_location(i_rec_usr_location => l_rec_usr_location);
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END insert_geo_coords;
  --
  /****************************************************************************
  * Purpose:  Get the distance in specified unit between 2 Users
  * Author:   Daniel Hochleitner
  * Created:  17.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION get_distance_between_usr(i_id_usr1 IN usr_location.id_usr%TYPE,
                                    i_id_usr2 IN usr_location.id_usr%TYPE,
                                    i_unit    IN VARCHAR2) RETURN NUMBER IS
    --
    l_function CONSTANT VARCHAR2(30) := 'get_distance_between_usr';
    --
    l_distance NUMBER;
    CURSOR l_cur_usr_distance IS
      SELECT sdo_geom.sdo_distance(sdo_geometry(
                                                -- this identifies the object as a two-dimensional point.
                                                2001,
                                                -- this identifies the object as using the GCS_WGS_1984 geographic coordinate system.
                                                4326,
                                                NULL,
                                                sdo_elem_info_array(1,
                                                                    1,
                                                                    1),
                                                -- this is the longitude and latitude of point 1.
                                                sdo_ordinate_array(usr1_loc.geo_longitude,
                                                                   usr1_loc.geo_latitude)),
                                   sdo_geometry(
                                                -- this identifies the object as a two-dimensional point.
                                                2001,
                                                -- this identifies the object as using the GCS_WGS_1984 geographic coordinate system.
                                                4326,
                                                NULL,
                                                sdo_elem_info_array(1,
                                                                    1,
                                                                    1),
                                                -- this is the longitude and latitude of point 2.
                                                sdo_ordinate_array(usr2_loc.geo_longitude,
                                                                   usr2_loc.geo_latitude)),
                                   1,
                                   'unit=' || nvl(i_unit,
                                                  'mile')) distance
        FROM (SELECT usr_location.geo_latitude,
                     usr_location.geo_longitude
                FROM usr_location
               WHERE usr_location.id_usr = i_id_usr1) usr1_loc,
             (SELECT usr_location.geo_latitude,
                     usr_location.geo_longitude
                FROM usr_location
               WHERE usr_location.id_usr = i_id_usr2) usr2_loc;
    --
    --
  BEGIN
    --
    OPEN l_cur_usr_distance;
    FETCH l_cur_usr_distance
      INTO l_distance;
    CLOSE l_cur_usr_distance;
    --
    RETURN l_distance;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END get_distance_between_usr;
  --
  /****************************************************************************
  * Purpose:  Check if user has gps coords saved (gps enabled)
  * Author:   Daniel Hochleitner
  * Created:  22.08.15
  * Changed:
  ****************************************************************************/
  FUNCTION check_usr_gps_enabled(i_id_usr IN usr_location.id_usr%TYPE)
    RETURN BOOLEAN IS
    --
    l_function CONSTANT VARCHAR2(30) := 'check_usr_gps_enabled';
    --
    l_retval          BOOLEAN;
    l_id_usr_location usr_location.id_usr_location%TYPE;
    --
    CURSOR l_cur_usr_location IS
      SELECT usr_location.id_usr_location
        FROM usr_location
       WHERE usr_location.id_usr = i_id_usr;
    --
  BEGIN
    -- open cursor and fetch into var
    OPEN l_cur_usr_location;
    FETCH l_cur_usr_location
      INTO l_id_usr_location;
    CLOSE l_cur_usr_location;
    --
    -- when found gps = enabled else not
    IF l_id_usr_location IS NULL THEN
      l_retval := FALSE;
    ELSE
      l_retval := TRUE;
    END IF;
    --
    RETURN l_retval;
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END check_usr_gps_enabled;
  --
END api_usr_location;
/

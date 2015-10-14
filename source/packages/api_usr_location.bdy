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
  /*************************************************************************
  * Purpose:  Render Google Maps with Users nearby
  * Author:   Daniel Hochleitner
  * Created:  30.08.15
  * Changed:
  *************************************************************************/
  PROCEDURE render_nearby_usr_gmaps(i_id_usr           IN usr_location.id_usr%TYPE,
                                    i_distance         IN NUMBER,
                                    i_crappy_home_path IN VARCHAR2) IS
    l_function CONSTANT VARCHAR2(30) := 'render_nearby_usr_gmaps';
    --
    l_crappy_home_path VARCHAR2(500);
    l_count            NUMBER := 0;
    l_css_string       CLOB;
    l_gmap_string      CLOB;
    l_geo_latitude     usr_location.geo_latitude%TYPE;
    l_geo_longitude    usr_location.geo_longitude%TYPE;
    -- cursor for gps position of user
    CURSOR l_cur_usr_location IS
      SELECT usr_location.geo_latitude,
             usr_location.geo_longitude
        FROM usr_location
       WHERE usr_location.id_usr = i_id_usr;
    -- cursor for nearby users
    CURSOR l_cur_usr_nearby IS
      SELECT usr.id_usr,
             usr.usr_firstname || ' ' || usr.usr_lastname AS usr_name,
             nvl(usr.twitter_profile_pic_url,
                 l_crappy_home_path || 'img/avatar-placeholder.png') AS profile_pic_url,
             apex_page.get_url(p_application => v('APP_ID'),
                               p_page        => 6,
                               p_clear_cache => 6,
                               p_items       => 'P6_PAGE_FROM,P6_ID_USR',
                               p_values      => '14,' || usr.id_usr) AS profile_url,
             usr_location.geo_latitude,
             usr_location.geo_longitude
        FROM usr,
             usr_location
       WHERE usr.id_usr = usr_location.id_usr
         AND usr.acc_active = 1
         AND usr.show_acc_public = 1
         AND usr.id_usr != i_id_usr
         AND usr.id_usr != api_usr.getc_admin_pk
         AND api_usr_location.get_distance_between_usr(i_id_usr1 => i_id_usr,
                                                       i_id_usr2 => usr.id_usr,
                                                       i_unit    => 'mile') <
             i_distance;
    --
  BEGIN
    -- Get Home of CrappyBird Files
    l_crappy_home_path := REPLACE(i_crappy_home_path,
                                  '#IMAGE_PREFIX#',
                                  v('IMAGE_PREFIX'));
    -- Build Custom CSS
    l_css_string := '<style>' || chr(10) || ' .round_img {' || chr(10) ||
                    '  width: 50px;' || chr(10) || '  border-radius: 50%;' ||
                    chr(10) || '  vertical-align:middle;' || chr(10) || ' }' ||
                    chr(10) || ' .materialboxed {' || chr(10) ||
                    '  cursor: auto;' || chr(10) || ' }' || chr(10) ||
                    '</style>';
    -- write CSS to HTTP
    htp.p(l_css_string);
    --
    -- Build JS Gmap String
    -- Header
    -- Map Div
    l_gmap_string := '<div id="map"></div>' || chr(10);
    -- needed JS Libs
    l_gmap_string := l_gmap_string ||
                     '<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>' ||
                     chr(10);
    l_gmap_string := l_gmap_string ||
                     '<script type="text/javascript" src="' ||
                     l_crappy_home_path || 'js/gmaps.min.js"></script>' ||
                     chr(10);
    -- Device width + height
    l_gmap_string := l_gmap_string || '<script type="text/javascript">' ||
                     chr(10);
    l_gmap_string := l_gmap_string ||
                     '  var width = document.documentElement.clientWidth;' ||
                     chr(10);
    l_gmap_string := l_gmap_string ||
                     '  var height = document.documentElement.clientHeight;' ||
                     chr(10);
    l_gmap_string := l_gmap_string ||
                     '  var map_div = document.getElementById("map");' ||
                     chr(10);
    l_gmap_string := l_gmap_string ||
                     '  map_div.style.width = width + "px";' || chr(10);
    l_gmap_string := l_gmap_string ||
                     '  map_div.style.height = (height - 92) + "px";' ||
                     chr(10);
    -- Gmap
    OPEN l_cur_usr_location;
    FETCH l_cur_usr_location
      INTO l_geo_latitude,
           l_geo_longitude;
    CLOSE l_cur_usr_location;
    --
    l_gmap_string := l_gmap_string || '  var map;' || chr(10);
    l_gmap_string := l_gmap_string || '  map = new GMaps({' || chr(10);
    l_gmap_string := l_gmap_string || '    div: ''#map'',' || chr(10);
    -- position of user
    l_gmap_string := l_gmap_string || '    lat: ' || l_geo_latitude || ',' ||
                     chr(10);
    l_gmap_string := l_gmap_string || '    lng: ' || l_geo_longitude || ',' ||
                     chr(10);
    -- conrols of map
    l_gmap_string := l_gmap_string || '    zoomControl : true,' || chr(10);
    l_gmap_string := l_gmap_string || '    zoomControlOpt: {' || chr(10);
    l_gmap_string := l_gmap_string || '     style : ''SMALL'',' || chr(10);
    l_gmap_string := l_gmap_string || '     position: ''TOP_LEFT''' ||
                     chr(10);
    l_gmap_string := l_gmap_string || '    },' || chr(10);
    l_gmap_string := l_gmap_string || '    panControl : false,' || chr(10);
    l_gmap_string := l_gmap_string || '    streetViewControl : false,' ||
                     chr(10);
    l_gmap_string := l_gmap_string || '    mapTypeControl: false,' ||
                     chr(10);
    l_gmap_string := l_gmap_string || '    overviewMapControl: false' ||
                     chr(10);
    l_gmap_string := l_gmap_string || '  });' || chr(10);
    -- map marker for all users in distance
    FOR l_rec IN l_cur_usr_nearby LOOP
      l_count := l_count + 1;
      -- reset to users geo coords
      l_geo_latitude  := l_rec.geo_latitude;
      l_geo_longitude := l_rec.geo_longitude;
      --
      l_gmap_string := l_gmap_string || '  map.addMarker({' || chr(10);
      l_gmap_string := l_gmap_string || '   lat: ' || l_rec.geo_latitude || ',' ||
                       chr(10);
      l_gmap_string := l_gmap_string || '   lng: ' || l_rec.geo_longitude || ',' ||
                       chr(10);
      l_gmap_string := l_gmap_string || '   title: ''' || l_rec.usr_name ||
                       ''',' || chr(10);
      -- info popup with user pic and name/link to profile
      l_gmap_string := l_gmap_string || '   infoWindow: {' || chr(10);
      l_gmap_string := l_gmap_string || '    content: ''<p><a href="' ||
                       l_rec.profile_url ||
                       '"><img class="initialized materialboxed responsive-img round_img" src="' ||
                       l_rec.profile_pic_url || '"><span>&nbsp;' ||
                       l_rec.usr_name || '</span></a></p>''' || chr(10);
      l_gmap_string := l_gmap_string || '    }' || chr(10);
      l_gmap_string := l_gmap_string || '   });' || chr(10);
    END LOOP;
    -- if only 1 user found set center of map to that and zoom out / else fit zoom for all markers
    IF l_count <= 1 THEN
      l_gmap_string := l_gmap_string || '  map.setCenter(' ||
                       l_geo_latitude || ',' || l_geo_longitude || ');' ||
                       chr(10);
      l_gmap_string := l_gmap_string || '  map.setZoom(8);' || chr(10);
    ELSE
      l_gmap_string := l_gmap_string || '  map.fitZoom();' || chr(10);
    END IF;
    -- close JS
    l_gmap_string := l_gmap_string || '</script>';
    -- write JS Gmap String to HTTP
    htp.p(l_gmap_string);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END render_nearby_usr_gmaps;
  --
END api_usr_location;
/

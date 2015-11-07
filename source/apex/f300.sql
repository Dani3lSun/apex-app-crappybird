set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.2.00.07'
,p_default_workspace_id=>25109139251478639
,p_default_application_id=>300
,p_default_owner=>'CRAPPYBIRD'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 300 - CrappyBird
--
-- Application Export:
--   Application:     300
--   Name:            CrappyBird
--   Date and Time:   22:25 Saturday November 7, 2015
--   Exported By:     DH
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.2.00.07
--   Instance ID:     61915694930844
--

-- Application Statistics:
--   Pages:                     26
--     Items:                  117
--     Validations:             30
--     Processes:               44
--     Regions:                 76
--     Buttons:                 44
--     Dynamic Actions:         70
--   Shared Components:
--     Logic:
--       Items:                  1
--       Processes:              1
--     Navigation:
--       Lists:                  2
--       Breadcrumbs:            1
--         Entries:              1
--     Security:
--       Authentication:         1
--       Authorization:          4
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 5
--         Region:              11
--         Label:                3
--         List:                 4
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               1
--         Report:              14
--       Plug-ins:               1
--     Globalization:
--     Reports:
--   Supporting Objects:  Included

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,300)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'CRAPPYBIRD')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'CrappyBird')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'CB')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'41FDB2D7DCB8A1436DBCB7B83E68E5A893F2A4BA8549590703436B2D9A017C16'
,p_bookmark_checksum_function=>'SH1'
,p_max_session_length_sec=>14400
,p_max_session_idle_sec=>7200
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(77450323033128766)
,p_application_tab_set=>0
,p_logo_image=>'TEXT:CrappyBird'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'1.7'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'api_err_log.do_log_apex'
,p_default_error_display_loc=>'INLINE_IN_NOTIFICATION'
,p_substitution_string_01=>'CRAPPY_HOME'
,p_substitution_value_01=>'#IMAGE_PREFIX#crappybird/'
,p_substitution_string_02=>'PATH'
,p_substitution_value_02=>'&CRAPPY_HOME.theme/'
,p_substitution_string_03=>'APP_FAVICONS'
,p_substitution_value_03=>'<link rel="icon" sizes="64x64" href="&CRAPPY_HOME.img/appicons/favicon.png">'
,p_substitution_string_04=>'SOFTWARE_URL'
,p_substitution_value_04=>'https://apex.danielh.de/ords/f?p=&APP_ID.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151107222454'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(77381210056098344)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(77410203236098359)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'My Profile'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_text_01=>'<i class="material-icons">person_pin</i>'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(26306922867658032)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Customize'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:::'
,p_list_text_01=>'<i class="material-icons">build</i>'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'7,20'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(26980959747490704)
,p_list_item_display_sequence=>18
,p_list_item_link_text=>'Public Themes'
,p_list_item_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.::::'
,p_list_text_01=>'<i class="material-icons">photo_library</i>'
,p_security_scheme=>wwv_flow_api.id(26449853624835556)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'21,22,21'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(26580061490913221)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Battles'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_text_01=>'<i class="material-icons">thumbs_up_down</i>'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'12,13'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(26152258053630332)
,p_list_item_display_sequence=>25
,p_list_item_link_text=>'Public Users'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_text_01=>'<i class="material-icons">face</i>'
,p_security_scheme=>wwv_flow_api.id(26449853624835556)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(26219219491476559)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Twitter Friends'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_text_01=>'<i class="material-icons">favorite</i>'
,p_security_scheme=>wwv_flow_api.id(26450081745841091)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(26228806469501714)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Nearby Users'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_text_01=>'<i class="material-icons">location_on</i>'
,p_security_scheme=>wwv_flow_api.id(26559138998757238)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(26399120791798202)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Global Ranking'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_list_text_01=>'<i class="material-icons">stars</i>'
,p_security_scheme=>wwv_flow_api.id(26449853624835556)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'11'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(26503286391980503)
,p_list_item_display_sequence=>75
,p_list_item_link_text=>'System Settings'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_list_text_01=>'<i class="material-icons">settings</i>'
,p_security_scheme=>wwv_flow_api.id(26449655403829591)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(26475514227872154)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'User Settings'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::'
,p_list_text_01=>'<i class="material-icons">supervisor_account</i>'
,p_security_scheme=>wwv_flow_api.id(26449655403829591)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'17,18'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(26459807659818259)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Error Log'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::'
,p_list_text_01=>'<i class="material-icons">report</i>'
,p_security_scheme=>wwv_flow_api.id(26449655403829591)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'16'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(77418644648147739)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(26281805452939676)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&nbsp;'
,p_list_item_link_target=>'f?p=&APP_ID.:&P0_PAGE_FROM.:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_list_item_disp_condition=>'P0_SHOW_BACK_BTN'
,p_list_item_disp_condition2=>'1'
,p_list_text_01=>'<i class="material-icons right-l">keyboard_arrow_left</i>'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(77419653068147741)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Logout'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_list_item_disp_condition=>'101,102,103'
,p_list_text_01=>'<i class="material-icons right-l">exit_to_app</i>'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files
begin
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(77380937001098343)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(77381046403098343)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(77381140525098344)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(26449655403829591)
,p_name=>'IS_ADMIN_USER'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_usr.check_usr_admin(i_id_usr => :f_id_usr);',
'END;'))
,p_error_message=>'No permissions'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(26449853624835556)
,p_name=>'IS_USER_PUBLIC'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_usr.check_usr_public(i_id_usr => :f_id_usr);',
'END;'))
,p_error_message=>'No permissions'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(26450081745841091)
,p_name=>'HAS_USER_TWITTER'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_usr.check_usr_twitter(i_id_usr => :f_id_usr);',
'END;'))
,p_error_message=>'No permissions'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(26559138998757238)
,p_name=>'HAS_USER_GPS'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_usr_location.check_usr_gps_enabled(i_id_usr => :f_id_usr);',
'END;'))
,p_error_message=>'No permissions'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(26509923689214365)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_SHOW_BACK_BTN_DEFAULT'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  :P0_SHOW_BACK_BTN := 0;',
'END;'))
);
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(77451676142236428)
,p_name=>'F_ID_USR'
,p_protection_level=>'S'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs
begin
null;
end;
/
prompt --application/shared_components/navigation/trees
begin
null;
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(26456229815732840)
,p_group_name=>'ADMIN'
,p_group_desc=>'Admin pages'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(26372213871014189)
,p_group_name=>'GAME'
,p_group_desc=>'CrappyBird Game regarding pages'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(26371657845008979)
,p_group_name=>'LOGIN'
,p_group_desc=>'Login regarding pages'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(26372131622012720)
,p_group_name=>'PEOPLE'
,p_group_desc=>'Other people regarding pages'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(26981688303505812)
,p_group_name=>'THEME'
,p_group_desc=>'Theme regarding pages'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(26371712667010661)
,p_group_name=>'USER'
,p_group_desc=>'Own user regarding pages'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(77410154953098359)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(77410527971098360)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(26258419162616417)
,p_theme_id=>101
,p_name=>'Page - Standard Login'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<head>',
'    <title>#TITLE#</title>',
'    #FAVICONS#',
'    ',
'    <!-- Meta -->',
'    <meta charset="utf-8">',
'    <meta name="author" content="Vincent Morneau">',
'    <meta name="description" content="Material Design Theme for APEX">',
'    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'    <meta name="apple-mobile-web-app-capable" content="yes" />',
'    <meta name="apple-mobile-web-app-status-bar-style" content="default" />',
'    <!-- iOS App Icons -->',
'    <link rel="apple-touch-icon" href="&CRAPPY_HOME.img/appicons/appicon.png?v=#APP_VERSION#" />',
'    <link rel="apple-touch-icon" sizes="72x72" href="&CRAPPY_HOME.img/appicons/appicon-72.png?v=#APP_VERSION#" />',
'    <link rel="apple-touch-icon" sizes="144x144" href="&CRAPPY_HOME.img/appicons/appicon-72@2x.png?v=#APP_VERSION#" />',
'    <link rel="apple-touch-icon" sizes="114x114" href="&CRAPPY_HOME.img/appicons/appicon@2x.png?v=#APP_VERSION#" />',
'    <link rel="apple-touch-icon" sizes="120x120" href="&CRAPPY_HOME.img/appicons/appicon-60@2x.png?v=#APP_VERSION#" />',
'    <link rel="apple-touch-icon" sizes="180x180" href="&CRAPPY_HOME.img/appicons/appicon-60@3x.png?v=#APP_VERSION#" />',
'    <link rel="apple-touch-icon" sizes="60x60" href="&CRAPPY_HOME.img/appicons/appicon-60.png?v=#APP_VERSION#" />',
'    <link rel="apple-touch-icon" sizes="76x76" href="&CRAPPY_HOME.img/appicons/appicon-76.png?v=#APP_VERSION#" />',
'    <link rel="apple-touch-icon" sizes="152x152" href="&CRAPPY_HOME.img/appicons/appicon-76@2x.png?v=#APP_VERSION#" />',
'    ',
'    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">',
'    ',
'    <!-- Mandatory APEX CSS Stuff -->',
'    #HEAD#',
'    #APEX_CSS#',
'    ',
'    <!-- Material APEX CSS -->',
'    #THEME_CSS#',
'    #THEME_STYLE_CSS#',
'    #TEMPLATE_CSS#',
'    ',
'    <!-- Additionnal CSS -->',
'    #APPLICATION_CSS#',
'    #PAGE_CSS#',
'    ',
'</head>',
'<body class="#PAGE_CSS_CLASSES#" #ONLOAD#>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_OPEN#',
'',
'<!-- Item Container -->',
'#REGION_POSITION_01# ',
'',
'',
'<!-- Content -->',
'<main>           ',
'    <!-- Notifications -->',
'    #GLOBAL_NOTIFICATION#',
'    #SUCCESS_MESSAGE#',
'    #NOTIFICATION_MESSAGE#',
'',
'    <div class="row">',
'        <div class="&P0_BODY_COLUMN_CLASSES.">',
'            #BODY#',
'        </div>',
'        ',
'        <!-- Scrollspy -->',
'        #REGION_POSITION_04#     ',
'    </div>',
'',
'    <!-- Modals -->',
'    #REGION_POSITION_06#',
'    ',
'</main>',
'',
'<!-- Footer -->',
'<footer class="page-footer">',
'    #REGION_POSITION_08#',
'</footer>',
'',
'#FORM_CLOSE#'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!-- Mandatory APEX JS Stuff -->',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'',
'<!-- Material APEX JS -->',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'    ',
'<!-- Additionnal CSS -->',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'',
'<!-- Generated stuff -->',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    <div class="col s12">',
'        <div class="card-panel green lighten-2 white-text">#SUCCESS_MESSAGE#</div>               ',
'    </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    <div class="col s12">',
'        <div class="card-panel red lighten-2 white-text">#MESSAGE#</div>               ',
'    </div>',
'</div>'))
,p_theme_class_id=>8
,p_default_template_options=>'page-center-logo:main-container:page-navbar-fixed'
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'#ROWS#'
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    #COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col s12 m#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'    #CONTENT#',
'</div>'))
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(26258862897616426)
,p_page_template_id=>wwv_flow_api.id(26258419162616417)
,p_name=>'Item Container'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(26259371442616426)
,p_page_template_id=>wwv_flow_api.id(26258419162616417)
,p_name=>'Hamburger Menu'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(26259887916616426)
,p_page_template_id=>wwv_flow_api.id(26258419162616417)
,p_name=>'Scrollspy'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(26260316069616426)
,p_page_template_id=>wwv_flow_api.id(26258419162616417)
,p_name=>'Modals'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(26260812388616427)
,p_page_template_id=>wwv_flow_api.id(26258419162616417)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(41736985200764756)
,p_theme_id=>101
,p_name=>'Page - Standard No Footer'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<head>',
'    <title>#TITLE#</title>',
'    #FAVICONS#',
'    ',
'    <!-- Meta -->',
'    <meta charset="utf-8">',
'    <meta name="author" content="Vincent Morneau">',
'    <meta name="description" content="Material Design Theme for APEX">',
'    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'    <meta name="apple-mobile-web-app-capable" content="yes" />',
'    <meta name="apple-mobile-web-app-status-bar-style" content="default" />',
'    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">',
'    ',
'    <!-- Mandatory APEX CSS Stuff -->',
'    #HEAD#',
'    #APEX_CSS#',
'    ',
'    <!-- Material APEX CSS -->',
'    #THEME_CSS#',
'    #THEME_STYLE_CSS#',
'    #TEMPLATE_CSS#',
'    ',
'    <!-- Additionnal CSS -->',
'    #APPLICATION_CSS#',
'    #PAGE_CSS#',
'    ',
'</head>',
'<body class="#PAGE_CSS_CLASSES#" #ONLOAD#>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_OPEN#',
'',
'<!-- Item Container -->',
'#REGION_POSITION_01# ',
'',
'<!-- Navbar & Sidenav -->',
'<header>',
'    <div id="app-navbar">',
'        <nav>',
'            <div class="nav-wrapper">',
'                #REGION_POSITION_02#',
'                <a href="&HOME_URL." class="brand-logo hide-on-small-only">#LOGO#</a>',
'                #NAVIGATION_BAR#',
'            </div>',
'        </nav>',
'    </div>',
'    #SIDE_GLOBAL_NAVIGATION_LIST#',
'</header>',
'',
'',
'<!-- Content -->',
'<main>           ',
'    <!-- Notifications -->',
'    #GLOBAL_NOTIFICATION#',
'    #SUCCESS_MESSAGE#',
'    #NOTIFICATION_MESSAGE#',
'',
'    <div class="row">',
'        <div class="&P0_BODY_COLUMN_CLASSES.">',
'            #BODY#',
'        </div>',
'        ',
'        <!-- Scrollspy -->',
'        #REGION_POSITION_04#     ',
'    </div>',
'',
'    <!-- Modals -->',
'    #REGION_POSITION_06#',
'    ',
'</main>',
'',
'#FORM_CLOSE#'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!-- Mandatory APEX JS Stuff -->',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'',
'<!-- Material APEX JS -->',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'    ',
'<!-- Additionnal CSS -->',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'',
'<!-- Generated stuff -->',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    <div class="col s12">',
'        <div class="card-panel green lighten-2 white-text">#SUCCESS_MESSAGE#</div>               ',
'    </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    <div class="col s12">',
'        <div class="card-panel red lighten-2 white-text">#MESSAGE#</div>               ',
'    </div>',
'</div>'))
,p_theme_class_id=>8
,p_default_template_options=>'page-center-logo:main-container:page-navbar-fixed'
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'#ROWS#'
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    #COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col s12 m#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'    #CONTENT#',
'</div>'))
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(41737349194764758)
,p_page_template_id=>wwv_flow_api.id(41736985200764756)
,p_name=>'Item Container'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(41737814914764758)
,p_page_template_id=>wwv_flow_api.id(41736985200764756)
,p_name=>'Hamburger Menu'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(41738372155764758)
,p_page_template_id=>wwv_flow_api.id(41736985200764756)
,p_name=>'Scrollspy'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(41738879750764758)
,p_page_template_id=>wwv_flow_api.id(41736985200764756)
,p_name=>'Modals'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(41739355660764758)
,p_page_template_id=>wwv_flow_api.id(41736985200764756)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(77381301645098344)
,p_theme_id=>101
,p_name=>'Page - Clean'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<head>',
'    <title>#TITLE#</title>',
'    ',
'    <!-- Meta -->',
'    <meta charset="utf-8">',
'    <meta name="author" content="Vincent Morneau">',
'    <meta name="description" content="Material Design Theme for APEX">',
'    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'    <meta name="apple-mobile-web-app-capable" content="yes" />',
'    <meta name="apple-mobile-web-app-status-bar-style" content="default" />',
'    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">',
'    ',
'    <!-- Mandatory APEX CSS Stuff -->',
'    #HEAD#',
'    #APEX_CSS#',
'    ',
'    <!-- Material APEX CSS -->',
'    #THEME_CSS#',
'    #THEME_STYLE_CSS#',
'    #TEMPLATE_CSS#',
'    ',
'    <!-- Additionnal CSS -->',
'    #APPLICATION_CSS#',
'    #PAGE_CSS#',
'</head>',
'<body class="#PAGE_CSS_CLASSES#" #ONLOAD#>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_OPEN#',
'',
'<!-- Item Container -->',
'#REGION_POSITION_01#',
'',
'#GLOBAL_NOTIFICATION#',
'#SUCCESS_MESSAGE#',
'#NOTIFICATION_MESSAGE#',
'',
'#BODY#',
'',
'#FORM_CLOSE#'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!-- Mandatory APEX JS Stuff -->',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'',
'<!-- Material APEX JS -->',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'    ',
'<!-- Additionnal CSS -->',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'',
'<!-- Generated stuff -->',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    <div class="col s12">',
'        <div class="card-panel green lighten-2 white-text">#SUCCESS_MESSAGE#</div>               ',
'    </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    <div class="col s12">',
'        <div class="card-panel red lighten-2 white-text">#MESSAGE#</div>               ',
'    </div>',
'</div>'))
,p_theme_class_id=>8
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'    #ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    #COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col s12 m#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'    #CONTENT#',
'</div>'))
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(77381402607098344)
,p_page_template_id=>wwv_flow_api.id(77381301645098344)
,p_name=>'Item Container'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(77381494509098344)
,p_theme_id=>101
,p_name=>'Page - Modal'
,p_is_popup=>true
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<head>',
'    <title>#TITLE#</title>',
'    ',
'    <!-- Meta -->',
'    <meta charset="utf-8">',
'    <meta name="author" content="Vincent Morneau">',
'    <meta name="description" content="Material Design Theme for APEX">',
'    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'    <meta name="apple-mobile-web-app-capable" content="yes" />',
'    <meta name="apple-mobile-web-app-status-bar-style" content="default" />',
'    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">',
'    ',
'    <!-- Mandatory APEX CSS Stuff -->',
'    #HEAD#',
'    #APEX_CSS#',
'    ',
'    <!-- Material APEX CSS -->',
'    #THEME_CSS#',
'    #THEME_STYLE_CSS#',
'    #TEMPLATE_CSS#',
'    ',
'    <!-- Additionnal CSS -->',
'    #APPLICATION_CSS#',
'    #PAGE_CSS#',
'</head>',
'<body class="#PAGE_CSS_CLASSES#" #ONLOAD#>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_OPEN#',
'',
'<!-- Item Container -->',
'#REGION_POSITION_01#',
'',
'<div class="modal #PAGE_CSS_CLASSES#">',
'    <div class="modal-content">',
'        #GLOBAL_NOTIFICATION#',
'        #SUCCESS_MESSAGE#',
'        #NOTIFICATION_MESSAGE#',
'        ',
'        <div class="row">',
'            <div class="&P0_BODY_COLUMN_CLASSES.">',
'                #BODY#',
'            </div>',
'            <!-- Scrollspy -->',
'            #REGION_POSITION_04#     ',
'        </div>',
'    </div>',
'    <div class="modal-footer">',
'        #REGION_POSITION_07#',
'    </div>',
'</div>',
'',
'#FORM_CLOSE#'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!-- Mandatory APEX JS Stuff -->',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'',
'<!-- Material APEX JS -->',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'    ',
'<!-- Additionnal CSS -->',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'',
'<!-- Generated stuff -->',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    <div class="col s12">',
'        <div class="card-panel green lighten-2 white-text">#SUCCESS_MESSAGE#</div>               ',
'    </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    <div class="col s12">',
'        <div class="card-panel red lighten-2 white-text">#MESSAGE#</div>               ',
'    </div>',
'</div>'))
,p_theme_class_id=>8
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'#ROWS#'
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    #COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col s12 m#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'    #CONTENT#',
'</div>'))
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'500'
,p_dialog_width=>'70%'
,p_dialog_browser_frame=>'MODAL'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(77381653691098344)
,p_page_template_id=>wwv_flow_api.id(77381494509098344)
,p_name=>'Item Container'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(77381714549098344)
,p_page_template_id=>wwv_flow_api.id(77381494509098344)
,p_name=>'Scrollspy'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(77381812905098344)
,p_page_template_id=>wwv_flow_api.id(77381494509098344)
,p_name=>'Modal Footer'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(77382002662098345)
,p_theme_id=>101
,p_name=>'Page - Standard'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<head>',
'    <title>#TITLE#</title>',
'    #FAVICONS#',
'    ',
'    <!-- Meta -->',
'    <meta charset="utf-8">',
'    <meta name="author" content="Vincent Morneau">',
'    <meta name="description" content="Material Design Theme for APEX">',
'    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'    <meta name="apple-mobile-web-app-capable" content="yes" />',
'    <meta name="apple-mobile-web-app-status-bar-style" content="default" />',
'    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">',
'    ',
'    <!-- Mandatory APEX CSS Stuff -->',
'    #HEAD#',
'    #APEX_CSS#',
'    ',
'    <!-- Material APEX CSS -->',
'    #THEME_CSS#',
'    #THEME_STYLE_CSS#',
'    #TEMPLATE_CSS#',
'    ',
'    <!-- Additionnal CSS -->',
'    #APPLICATION_CSS#',
'    #PAGE_CSS#',
'    ',
'</head>',
'<body class="#PAGE_CSS_CLASSES#" #ONLOAD#>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_OPEN#',
'',
'<!-- Item Container -->',
'#REGION_POSITION_01# ',
'',
'<!-- Navbar & Sidenav -->',
'<header>',
'    <div id="app-navbar">',
'        <nav>',
'            <div class="nav-wrapper">',
'                #REGION_POSITION_02#',
'                <a href="&HOME_URL." class="brand-logo hide-on-small-only">#LOGO#</a>',
'                #NAVIGATION_BAR#',
'            </div>',
'        </nav>',
'    </div>',
'    #SIDE_GLOBAL_NAVIGATION_LIST#',
'</header>',
'',
'',
'<!-- Content -->',
'<main>           ',
'    <!-- Notifications -->',
'    #GLOBAL_NOTIFICATION#',
'    #SUCCESS_MESSAGE#',
'    #NOTIFICATION_MESSAGE#',
'',
'    <div class="row">',
'        <div class="&P0_BODY_COLUMN_CLASSES.">',
'            #BODY#',
'        </div>',
'        ',
'        <!-- Scrollspy -->',
'        #REGION_POSITION_04#     ',
'    </div>',
'',
'    <!-- Modals -->',
'    #REGION_POSITION_06#',
'    ',
'</main>',
'',
'<!-- Footer -->',
'<footer class="page-footer">',
'    #REGION_POSITION_08#',
'</footer>',
'',
'#FORM_CLOSE#'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!-- Mandatory APEX JS Stuff -->',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'',
'<!-- Material APEX JS -->',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'    ',
'<!-- Additionnal CSS -->',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'',
'<!-- Generated stuff -->',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    <div class="col s12">',
'        <div class="card-panel green lighten-2 white-text">#SUCCESS_MESSAGE#</div>               ',
'    </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    <div class="col s12">',
'        <div class="card-panel red lighten-2 white-text">#MESSAGE#</div>               ',
'    </div>',
'</div>'))
,p_theme_class_id=>8
,p_default_template_options=>'page-center-logo:main-container:page-navbar-fixed'
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'#ROWS#'
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'    #COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col s12 m#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'    #CONTENT#',
'</div>'))
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(77382085587098345)
,p_page_template_id=>wwv_flow_api.id(77382002662098345)
,p_name=>'Item Container'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(77382263738098345)
,p_page_template_id=>wwv_flow_api.id(77382002662098345)
,p_name=>'Hamburger Menu'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(77382344750098345)
,p_page_template_id=>wwv_flow_api.id(77382002662098345)
,p_name=>'Scrollspy'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(77382446009098345)
,p_page_template_id=>wwv_flow_api.id(77382002662098345)
,p_name=>'Modals'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(77382495718098345)
,p_page_template_id=>wwv_flow_api.id(77382002662098345)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(77389617922098347)
,p_template_name=>'Button - Standard'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#><i class="material-icons">#ICON_CSS_CLASSES#</i>#LABEL#</a>',
''))
,p_translate_this_template=>'N'
,p_theme_class_id=>6
,p_preset_template_options=>'icon-float-left:btn'
,p_theme_id=>101
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(77382999392098345)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<blockquote>',
'    #BODY#',
'</blockquote>'))
,p_page_plug_template_name=>'Region - Blockquote'
,p_theme_id=>101
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(77383167968098345)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="card-panel #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'    #BODY#',
'</div>'))
,p_page_plug_template_name=>'Region - Card Panel'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>101
,p_theme_class_id=>21
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(77383238655098345)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<pre class="#REGION_CSS_CLASSES#"><code class="#REGION_CSS_CLASSES#">',
'#BODY#',
'</code></pre>'))
,p_page_plug_template_name=>'Region - Code'
,p_theme_id=>101
,p_theme_class_id=>21
,p_preset_template_options=>'language-markup'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(77383924706098345)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'    <div class="container">',
'        <div class="row">',
'            <div class="col m6 s12">',
'                <p class="white-text">This App was built using <a class="grey-text text-lighten-2" href="http://www.oracle.com/technetwork/developer-tools/apex/overview/index.html" target="_blank">Oracle APEX 5</a></p>',
'            </div>',
'            <div class="col m4 offset-m2 s12">',
'                <h5 class="white-text">Where to find me?</h5>',
'                <ul>',
'                    <li><a class="white-text" href="http://blog.danielh.de/" target="_blank"><i class="fa fa-rss padding-right-15"></i>My Blog</a></li>',
'                    <li><a class="white-text" href="https://github.com/Dani3lSun" target="_blank"><i class="fa fa-github-square padding-right-15"></i>Github</a></li>',
'                    <li><a class="white-text" href="https://twitter.com/Dani3lSun" target="_blank"><i class="fa fa-twitter padding-right-15"></i>Twitter</a></li>',
'                </ul>',
'            </div>',
'        </div>',
'    </div>',
'    <div class="footer-copyright">',
'        <div class="container">',
'            © 2015 Daniel Hochleitner',
'            <a class="grey-text text-lighten-4 right" href="http://opensource.org/licenses/MIT" target="_blank">MIT License</a>',
'        </div>',
'    </div>',
'</div>'))
,p_page_plug_template_name=>'Region - Footer'
,p_theme_id=>101
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(77383982196098345)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="region modal #REGION_CSS_CLASSES#">',
'    <div class="modal-content">',
'        <h4>#TITLE#</h4>',
'        #BODY#',
'    </div>',
'    <div class="modal-footer">',
'        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>',
'    </div>',
'</div>'))
,p_page_plug_template_name=>'Region - Modal'
,p_theme_id=>101
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(77384361789098345)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="parallax-container">',
'    <div class="parallax">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Region - Parallax'
,p_theme_id=>101
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(77384442759098345)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="preloader-wrapper big active #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'  <div class="spinner-layer spinner-blue">',
'    <div class="circle-clipper left">',
'      <div class="circle"></div>',
'    </div><div class="gap-patch">',
'      <div class="circle"></div>',
'    </div><div class="circle-clipper right">',
'      <div class="circle"></div>',
'    </div>',
'  </div>',
'',
'  <div class="spinner-layer spinner-red">',
'    <div class="circle-clipper left">',
'      <div class="circle"></div>',
'    </div><div class="gap-patch">',
'      <div class="circle"></div>',
'    </div><div class="circle-clipper right">',
'      <div class="circle"></div>',
'    </div>',
'  </div>',
'',
'  <div class="spinner-layer spinner-yellow">',
'    <div class="circle-clipper left">',
'      <div class="circle"></div>',
'    </div><div class="gap-patch">',
'      <div class="circle"></div>',
'    </div><div class="circle-clipper right">',
'      <div class="circle"></div>',
'    </div>',
'  </div>',
'',
'  <div class="spinner-layer spinner-green">',
'    <div class="circle-clipper left">',
'      <div class="circle"></div>',
'    </div><div class="gap-patch">',
'      <div class="circle"></div>',
'    </div><div class="circle-clipper right">',
'      <div class="circle"></div>',
'    </div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Region - Preloader Circular'
,p_theme_id=>101
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(77384508218098345)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="progress #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'      <div class="indeterminate"></div>',
'</div>'))
,p_page_plug_template_name=>'Region - Preloader Linear'
,p_theme_id=>101
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(77384647680098346)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="center promo #REGION_CSS_CLASSES#">',
'    <i class="material-icons">#ICON_CSS_CLASSES#</i>',
'    <p class="promo-caption">#TITLE#</p>',
'    <p class="light center">#BODY#</p>',
'</div>'))
,p_page_plug_template_name=>'Region - Promo'
,p_theme_id=>101
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(77384709376098346)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="section clearfix #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'    <p class="header">#TITLE#</p>',
'    #CREATE#',
'    ',
'    #BODY#',
'    ',
'    #CREATE2#',
'</div>'))
,p_page_plug_template_name=>'Region - Section'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>101
,p_theme_class_id=>21
,p_preset_template_options=>'h2'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(77385906338098346)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="video-container #REGION_CSS_CLASSES#">',
'    #BODY#',
'</div>'))
,p_page_plug_template_name=>'Region - Video Responsive'
,p_theme_id=>101
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(77388280297098347)
,p_list_template_current=>'<li><a href="#LINK#">#A01#<span class="hide-on-med-and-down">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<a href="#LINK#">#A01#<span class="hide-on-med-and-down">#TEXT#</span></a>'
,p_list_template_name=>'List - Navbar'
,p_theme_id=>101
,p_theme_class_id=>9
,p_list_template_before_rows=>'<div class="right navbar-list">'
,p_list_template_after_rows=>'</div>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(77388581412098347)
,p_list_template_current=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'List - Scrollspy'
,p_theme_id=>101
,p_theme_class_id=>9
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col hide-on-small-only m3 l2">    ',
'<ul class="section table-of-contents">'))
,p_list_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'</div>'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(77388737096098347)
,p_list_template_current=>'<li class="active"><a href="#LINK#" class="truncate">#A01##TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#" class="truncate">#A01##TEXT#</a></li>'
,p_list_template_name=>'List - SideNav'
,p_theme_id=>101
,p_theme_class_id=>9
,p_list_template_before_rows=>' <ul id="app-sidenav" class="side-nav #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="collapsible-body">',
'    <ul>        '))
,p_after_sub_list=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'</div>'))
,p_sub_list_item_current=>'<li class="active"><a href="#LINK#" class="truncate">#TEXT#</a></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#" class="truncate">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="no-padding">',
'  <ul class="collapsible collapsible-accordion">',
'    <li>',
'      <a class="collapsible-header active truncate">#A01##TEXT#</a>      ',
'    </li>',
'  </ul>',
'</li>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="no-padding">',
'  <ul class="collapsible collapsible-accordion">',
'    <li>',
'      <a class="collapsible-header truncate">#A01##TEXT#</a>      ',
'    </li>',
'  </ul>',
'</li>'))
,p_sub_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="no-padding">',
'  <ul class="collapsible collapsible-accordion">',
'    <li>',
'      <a class="collapsible-header active truncate">#A01##TEXT#</a>      ',
'    </li>',
'  </ul>',
'</li>'))
,p_sub_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="no-padding">',
'  <ul class="collapsible collapsible-accordion">',
'    <li>',
'      <a class="collapsible-header truncate">#A01##TEXT#</a>      ',
'    </li>',
'  </ul>',
'</li>'))
,p_a01_label=>'Icon Tag'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(77388773498098347)
,p_list_template_current=>'<li class="tab"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li class="tab"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'List - Tabs'
,p_theme_id=>101
,p_theme_class_id=>9
,p_list_template_before_rows=>'<ul class="tabs">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Column CSS Classes'
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(26183047332521031)
,p_row_template_name=>'Report - Collection Secondary Content 2 Links without Header'
,p_row_template1=>'<li class="collection-item"><div>#DISPLAY#<a href="#TARGET1#" class="secondary-content #BUTTON_CSS_CLASSES#"><i class="material-icons">#ICON_CSS_CLASSES1#</i></a><a href="#TARGET2#" class="secondary-content #BUTTON_CSS_CLASSES#"><i class="material-ic'
||'ons">#ICON_CSS_CLASSES2#</i></a></div></li>'
,p_row_template_before_rows=>'<ul class="collection #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_before_column_heading=>'<li class="collection-header">'
,p_after_column_heading=>'</li>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>101
,p_theme_class_id=>7
,p_row_template_comment=>'Header template: <h4>#COLUMN_HEADER#</h4>'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(26415682571986712)
,p_row_template_name=>'Report - Collection Links without Header'
,p_row_template1=>'<a href="#TARGET#" class="collection-item">#DISPLAY#<span class="new badge">#BADGE#</span></a>'
,p_row_template_condition1=>':NEW_BADGE is not null'
,p_row_template2=>'<a href="#TARGET#" class="collection-item">#DISPLAY#<span class="badge">#BADGE#</span></a>'
,p_row_template_before_rows=>'<div class="collection #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>101
,p_theme_class_id=>7
,p_row_template_comment=>'Header template: <h4>#COLUMN_HEADER#</h4>'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(33240388021852770)
,p_row_template_name=>'Report - Card Image without Action Area'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="#COLUMN_CSS_CLASSES#">    ',
'    <div class="card">',
'        <div class="card-image">',
'            #IMG#',
'            <span class="card-title">#TITLE#</span>',
'        </div>',
'        <div class="card-content">',
'            #CONTENT#',
'        </div>',
'    </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="row">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>101
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(42111131538472418)
,p_row_template_name=>'Report - Collection Secondary Content without Header'
,p_row_template1=>'<li class="collection-item"><div>#DISPLAY#<a href="#TARGET#" class="secondary-content #BUTTON_CSS_CLASSES#"><i class="material-icons">#ICON_CSS_CLASSES#</i></a></div></li>'
,p_row_template_before_rows=>'<ul class="collection #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_before_column_heading=>'<li class="collection-header">'
,p_after_column_heading=>'</li>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>101
,p_theme_class_id=>7
,p_row_template_comment=>'Header template: <h4>#COLUMN_HEADER#</h4>'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(77386045199098346)
,p_row_template_name=>'Report - Card Basic'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="#COLUMN_CSS_CLASSES#">',
'    <div class="card">',
'        <div class="card-content">',
'            <p class="card-title black-text">#TITLE#</p>',
'            #CONTENT#',
'        </div>',
'        <div class="card-action">',
'            <p>',
'                <a href="#BTN_LINK_1#">#BTN_LABEL_1#</a>',
'                <a href="#BTN_LINK_2#">#BTN_LABEL_2#</a>',
'            </p>',
'        </div>',
'    </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="row">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>101
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(77386094770098346)
,p_row_template_name=>'Report - Card Image'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="#COLUMN_CSS_CLASSES#">    ',
'    <div class="card">',
'        <div class="card-image">',
'            #IMG#',
'            <span class="card-title">#TITLE#</span>',
'        </div>',
'        <div class="card-content">',
'            #CONTENT#',
'        </div>',
'        <div class="card-action">',
'            <p>',
'                <a href="#BTN_LINK_1#">#BTN_LABEL_1#</a>',
'                <a href="#BTN_LINK_2#">#BTN_LABEL_2#</a>',
'            </p>',
'        </div>',
'    </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="row">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>101
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(77386255019098346)
,p_row_template_name=>'Report - Card Reveal'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    <div class="#COLUMN_CSS_CLASSES#">',
'        <div class="card">',
'            <div class="card-image activator waves-effect waves-block waves-light">',
'                #IMG#',
'            </div>',
'            <div class="card-content">',
'              <span class="card-title activator grey-text text-darken-4">#TITLE# <i class="material-icons right">more_vert</i></span>',
'            </div>',
'            <div class="card-action">',
'                <p>',
'                    <a href="#BTN_LINK_1#">#BTN_LABEL_1#</a>',
'                    <a href="#BTN_LINK_2#">#BTN_LABEL_2#</a>',
'                </p>',
'            </div>',
'            <div class="card-reveal">',
'              <span class="card-title grey-text text-darken-4">#TITLE# <i class="material-icons right">close</i></span>',
'              #CONTENT#',
'            </div>',
'        </div>',
'    </div>'))
,p_row_template_before_rows=>'<div class="row">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>101
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(77386294446098346)
,p_row_template_name=>'Report - Collapsible'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'    <div class="collapsible-header"><i class="material-icons">#ICON_CSS_CLASSES#</i>#TITLE#</div>',
'    <div class="collapsible-body"><p>#DESCRIPTION#</p></div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="collapsible #COMPONENT_CSS_CLASSES#" data-collapsible="">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>101
,p_theme_class_id=>7
,p_preset_template_options=>'accordion'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(77386801039098346)
,p_row_template_name=>'Report - Collection Basic'
,p_row_template1=>'<li class="collection-item">#DISPLAY#<span class="new badge">#BADGE#</span></li>'
,p_row_template_condition1=>':NEW_BADGE is not null'
,p_row_template2=>'<li class="collection-item">#DISPLAY#<span class="badge">#BADGE#</span></li>'
,p_row_template_before_rows=>'<ul class="collection #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_before_column_heading=>'<li class="collection-header">'
,p_column_heading_template=>'<h4>#COLUMN_HEADER#</h4>'
,p_after_column_heading=>'</li>'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>101
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(77387002278098346)
,p_row_template_name=>'Report - Collection Links'
,p_row_template1=>'<a href="#TARGET#" class="collection-item">#DISPLAY#<span class="new badge">#BADGE#</span></a>'
,p_row_template_condition1=>':NEW_BADGE is not null'
,p_row_template2=>'<a href="#TARGET#" class="collection-item">#DISPLAY#<span class="badge">#BADGE#</span></a>'
,p_row_template_before_rows=>'<div class="collection #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_before_column_heading=>'<li class="collection-header">'
,p_column_heading_template=>'<h4>#COLUMN_HEADER#</h4>'
,p_after_column_heading=>'</li>'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>101
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(77387270781098346)
,p_row_template_name=>'Report - Collection Secondary Content'
,p_row_template1=>'<li class="collection-item"><div>#DISPLAY#<a href="#TARGET#" class="secondary-content #BUTTON_CSS_CLASSES#"><i class="material-icons">#ICON_CSS_CLASSES#</i></a></div></li>'
,p_row_template_before_rows=>'<ul class="collection #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_before_column_heading=>'<li class="collection-header">'
,p_column_heading_template=>'<h4>#COLUMN_HEADER#</h4>'
,p_after_column_heading=>'</li>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>101
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(77387386840098346)
,p_row_template_name=>'Report - Dropdown Content'
,p_row_template1=>'<li><a href="#TARGET#">#DISPLAY#<span class="new badge">#BADGE#</span></a></li>'
,p_row_template_condition1=>':NEW_BADGE is not null'
,p_row_template2=>'<li><a href="#TARGET#">#DISPLAY#<span class="badge">#BADGE#</span></a></li>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a class="btn dropdown-button" href="#!" data-activates="#REGION_STATIC_ID#_REPORT"><i class="material-icons right">arrow_drop_down</i></a>',
'<ul id="#REGION_STATIC_ID#_REPORT" class="dropdown-content #COMPONENT_CSS_CLASSES#">'))
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_before_column_heading=>'<li class="collection-header">'
,p_after_column_heading=>'</li>'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>101
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(77387558658098346)
,p_row_template_name=>'Report - Slider'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
'    #IMG#',
'    <div class="caption">',
'        <h3>#TITLE#</h3>',
'        <h5>#DESCRIPTION#</h5>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<div class="slider"><ul class="slides">'
,p_row_template_after_rows=>'</ul></div>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>101
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(77387667636098346)
,p_row_template_name=>'Report - Standard'
,p_row_template1=>'<td headers="#COLUMN_HEADER_NAME#" data-label="#COLUMN_HEADER#" #ALIGNMENT#>#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>'<table id="report_#REGION_STATIC_ID#" class="#COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES#>'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'</table>',
'<tfoot class="right">',
'    <div>#EXTERNAL_LINK##CSV_LINK#</div>',
'    <div class="report-pagination">#PAGINATION#</div>',
'</tfoot>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<thead>',
'<tr>'))
,p_column_heading_template=>'<th data-field="#COLUMN_HEADER_NAME#" #ALIGNMENT# #COLUMN_WIDTH# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tr>',
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="instructiontext">#TEXT#</span>'
,p_next_page_template=>'<a href="#LINK#"><i class="material-icons">navigate_next</i></a>'
,p_previous_page_template=>'<a href="#LINK#"><i class="material-icons">navigate_before</i></a>'
,p_next_set_template=>'<a href="#LINK#"><i class="material-icons">skip_next</i></a>'
,p_previous_set_template=>'<a href="#LINK#"><i class="material-icons">skip_previous</i></a>'
,p_theme_id=>101
,p_theme_class_id=>7
,p_default_template_options=>'borderless'
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(77387667636098346)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(77388966345098347)
,p_template_name=>'Item - File Input'
,p_template_body1=>'<span>'
,p_template_body2=>'</span>'
,p_before_item=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="file-field input-field">',
'<input class="file-path validate" type="text"/>',
'<div class="btn">'))
,p_after_item=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</div>',
'</div>'))
,p_theme_id=>101
,p_theme_class_id=>5
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(77389017413098347)
,p_template_name=>'Item - Materialbox'
,p_template_body1=>'<label class="big-label">'
,p_template_body2=>'</label>'
,p_before_element=>'<div data-caption="#CURRENT_ITEM_HELP_TEXT# ">'
,p_after_element=>'</div>'
,p_theme_id=>101
,p_theme_class_id=>5
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(77389129397098347)
,p_template_name=>'Item - Standard'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" data-tooltip="#CURRENT_ITEM_HELP_TEXT#">'
,p_template_body2=>'</label>'
,p_before_item=>'<div class="input-field #ITEM_CSS_CLASSES#">'
,p_after_item=>'</div>'
,p_theme_id=>101
,p_theme_class_id=>5
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(77390139941098347)
,p_name=>'Breadcrumb'
,p_current_page_option=>'#NAME#'
,p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>'
,p_between_levels=>'&nbsp;&gt;&nbsp;'
,p_max_levels=>12
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>101
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(77390351518098348)
,p_popup_icon=>'#IMAGE_PREFIX#f_spacer.gif'
,p_popup_icon_attr=>'alt="#LIST_OF_VALUES#" title="#LIST_OF_VALUES#" class="uPopupLOVIcon"'
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title</title>',
'#APEX_CSS#',
'#APEX_JAVASCRIPT#',
'<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge" /><![endif]-->',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_26/css/4_2.css?v=#APEX_VERSION#" type="text/css" media="all"/>',
'#THEME_CSS#',
'</head>'))
,p_page_body_attr=>'class="uPopUpLOV"'
,p_before_field_text=>'<div class="uActionBar">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="searchField"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="smallButton"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="smallButton hotButton"'
,p_next_button_text=>'Next >'
,p_next_button_attr=>'class="smallButton"'
,p_prev_button_text=>'< Previous'
,p_prev_button_attr=>'class="smallButton"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'400'
,p_height=>'450'
,p_result_row_x_of_y=>'<div class="lovPagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>500
,p_before_result_set=>'<div class="lovLinks">'
,p_theme_id=>101
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(77390194957098348)
,p_cal_template_name=>'Calendar - Standard'
,p_day_of_week_format=>'<th>#IDAY#</th>'
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="">',
' <tr>',
'   <td align="center" style="font-weight:bold;">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="1" cellpadding="1" cellspacing="1" summary="0">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_day_title_format=>'<div>#DD#</div><br />'
,p_day_open_format=>'<td valign="top">'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" bgcolor="#d3d3d3">'
,p_weekend_title_format=>'<div>#DD#</div>'
,p_weekend_open_format=>'<td valign="top">'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div>#DD#</div>'
,p_nonday_open_format=>'<td valign="top">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_theme_id=>101
,p_theme_class_id=>4
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(77390670183098348)
,p_theme_id=>101
,p_theme_name=>'Material Design'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(77382002662098345)
,p_default_dialog_template=>wwv_flow_api.id(77381494509098344)
,p_error_template=>wwv_flow_api.id(77382002662098345)
,p_printer_friendly_template=>wwv_flow_api.id(77382002662098345)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(77382002662098345)
,p_default_button_template=>wwv_flow_api.id(77389617922098347)
,p_default_region_template=>wwv_flow_api.id(77384709376098346)
,p_default_chart_template=>wwv_flow_api.id(77384709376098346)
,p_default_form_template=>wwv_flow_api.id(77384709376098346)
,p_default_reportr_template=>wwv_flow_api.id(77384709376098346)
,p_default_tabform_template=>wwv_flow_api.id(77384709376098346)
,p_default_wizard_template=>wwv_flow_api.id(77384709376098346)
,p_default_menur_template=>wwv_flow_api.id(77384709376098346)
,p_default_listr_template=>wwv_flow_api.id(77384709376098346)
,p_default_irr_template=>wwv_flow_api.id(77384709376098346)
,p_default_report_template=>wwv_flow_api.id(77387667636098346)
,p_default_label_template=>wwv_flow_api.id(77389129397098347)
,p_default_menu_template=>wwv_flow_api.id(77390139941098347)
,p_default_calendar_template=>wwv_flow_api.id(77390194957098348)
,p_default_list_template=>wwv_flow_api.id(77388280297098347)
,p_default_top_nav_list_temp=>wwv_flow_api.id(77388737096098347)
,p_default_side_nav_list_temp=>wwv_flow_api.id(77388737096098347)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(77384709376098346)
,p_default_dialogr_template=>wwv_flow_api.id(77384709376098346)
,p_default_option_label=>wwv_flow_api.id(77389129397098347)
,p_default_header_template=>wwv_flow_api.id(77384709376098346)
,p_default_footer_template=>wwv_flow_api.id(77384709376098346)
,p_default_required_label=>wwv_flow_api.id(77389129397098347)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(77388280297098347)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(101),'')
,p_files_version=>14
,p_icon_library=>'FONTAWESOME'
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'&PATH.build/assets/js/apex-init#MIN#.js',
'&PATH.build/assets/vendor/prism/js/prism.js',
'&PATH.build/assets/js/materialize.min.js',
'&PATH.build/assets/js/app#MIN#.js'))
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'&PATH.build/assets/vendor/prism/css/prism.css',
'&PATH.build/assets/css/app#MIN#.css'))
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(77390384675098348)
,p_theme_id=>101
,p_name=>'Default'
,p_is_current=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#default.less'
,p_theme_roller_read_only=>true
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(77442311799626375)
,p_theme_id=>101
,p_name=>'Darker Blue'
,p_is_current=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#default.less'
,p_theme_roller_config=>'{"customCSS":"","vars":{"@g_primary_color":"#007fd4"}}'
,p_theme_roller_output_file_url=>'#THEME_DB_IMAGES#25271441012109603.css'
,p_theme_roller_read_only=>false
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A7B0A2020227472616E736C617465223A20747275652C0A20202267726F757073223A5B0A20207B0A20202020226E616D65223A2022476C6F62616C20436F6C6F7273222C0A2020202022636F6D6D6F6E223A20747275652C0A2020202022736571';
wwv_flow_api.g_varchar2_table(2) := '75656E6365223A20310A20207D0A20205D0A7D0A2A2F0A0A2F2A0A7B0A20202276617222203A202240675F7072696D6172795F636F6C6F72222C0A2020226E616D6522203A20225072696D61727920436F6C6F72222C0A2020227479706522203A202263';
wwv_flow_api.g_varchar2_table(3) := '6F6C6F72222C0A20202267726F7570223A2022476C6F62616C20436F6C6F7273220A7D0A2A2F0A40675F7072696D6172795F636F6C6F723A20233030424344343B0A0A2F2A0A7B0A20202276617222203A202240675F7365636F6E646172795F636F6C6F';
wwv_flow_api.g_varchar2_table(4) := '72222C0A2020226E616D6522203A20225365636F6E6461727920436F6C6F72222C0A2020227479706522203A2022636F6C6F72222C0A20202267726F7570223A2022476C6F62616C20436F6C6F7273220A7D0A2A2F0A40675F7365636F6E646172795F63';
wwv_flow_api.g_varchar2_table(5) := '6F6C6F723A20234546353335303B0A0A6E61760A2C2E75692D7769646765740A2C7464202E75692D73746174652D6163746976650A2C7464202E75692D73746174652D686F7665720A2C2E706167696E6174696F6E202E696E737472756374696F6E7465';
wwv_flow_api.g_varchar2_table(6) := '787420620A2C666F6F7465722E706167652D666F6F7465720A2C2E706167696E6174696F6E206C692E6163746976650A2C2E736964652D6E6176202E636F6C6C61707369626C652D626F6479206C692E6163746976652C202E736964652D6E61762E6669';
wwv_flow_api.g_varchar2_table(7) := '786564202E636F6C6C61707369626C652D626F6479206C692E616374697665207B0A202020206261636B67726F756E643A2040675F7072696D6172795F636F6C6F723B0A202020206261636B67726F756E642D636F6C6F723A2040675F7072696D617279';
wwv_flow_api.g_varchar2_table(8) := '5F636F6C6F723B0A7D0A0A2E70726F6D6F2D6920690A2C2E70726F6D6F20690A2C2E6865616465720A2C692E70726F6D6F0A2C2E74616273202E7461622061207B0A20202020636F6C6F723A2040675F7072696D6172795F636F6C6F723B0A7D0A0A626C';
wwv_flow_api.g_varchar2_table(9) := '6F636B71756F7465207B0A20202020626F726465722D6C6566743A2035707820736F6C69642040675F7072696D6172795F636F6C6F723B200A7D0A0A2E636F6C6C656374696F6E202E636F6C6C656374696F6E2D6974656D2E6163746976650A2C737061';
wwv_flow_api.g_varchar2_table(10) := '6E2E62616467652E6E65770A2C2E70726F6772657373202E64657465726D696E6174650A2C2E70726F6772657373202E696E64657465726D696E6174650A2C2E62746E2C202E62746E2D6C617267650A2C2E612D4952522D746F6F6C626172202E612D49';
wwv_flow_api.g_varchar2_table(11) := '52522D636F6E74726F6C47726F75702E612D4952522D636F6E74726F6C47726F75702D2D73656172636820627574746F6E2C202E612D4952522D746F6F6C626172202E612D4952522D636F6E74726F6C47726F75702E612D4952522D636F6E74726F6C47';
wwv_flow_api.g_varchar2_table(12) := '726F75702D2D6F7074696F6E7320627574746F6E2C202E612D4952522D746F6F6C626172202E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D7265706F7274566965772C202E612D4952522D64657461696C2D726F772C202E612D49';
wwv_flow_api.g_varchar2_table(13) := '52522D706167696E6174696F6E2D6974656D3A66697273742D6368696C64202E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D706167696E6174696F6E2C202E612D4952522D706167696E6174696F6E2D6974656D3A6C6173742D63';
wwv_flow_api.g_varchar2_table(14) := '68696C64202E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D706167696E6174696F6E0A2C2E62746E2D666C6F6174696E672C202E612D4952522D746F6F6C626172202E612D4952522D636F6E74726F6C47726F75702E612D495252';
wwv_flow_api.g_varchar2_table(15) := '2D636F6E74726F6C47726F75702D2D766965777320627574746F6E0A2C5B747970653D22636865636B626F78225D2E66696C6C65642D696E3A636865636B6564202B206C6162656C3A6166746572207B0A202020206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(16) := '723A2040675F7365636F6E646172795F636F6C6F723B0A7D0A0A2E636F6C6C656374696F6E20612E636F6C6C656374696F6E2D6974656D0A2C2E7365636F6E646172792D636F6E74656E740A2C2E64726F70646F776E2D636F6E74656E74206C69203E20';
wwv_flow_api.g_varchar2_table(17) := '612C202E64726F70646F776E2D636F6E74656E74206C69203E207370616E0A2C696E7075745B747970653D746578745D3A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C20696E7075745B747970653D70617373776F72645D';
wwv_flow_api.g_varchar2_table(18) := '3A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C20696E7075745B747970653D656D61696C5D3A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C20696E7075745B747970653D75726C5D3A666F63';
wwv_flow_api.g_varchar2_table(19) := '75733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C20696E7075745B747970653D74696D655D3A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C20696E7075745B747970653D646174655D3A666F6375733A6E';
wwv_flow_api.g_varchar2_table(20) := '6F74285B726561646F6E6C795D29202B206C6162656C2C20696E7075745B747970653D6461746574696D652D6C6F63616C5D3A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C20696E7075745B747970653D74656C5D3A666F';
wwv_flow_api.g_varchar2_table(21) := '6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C20696E7075745B747970653D6E756D6265725D3A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C20696E7075745B747970653D7365617263685D3A666F';
wwv_flow_api.g_varchar2_table(22) := '6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C2074657874617265612E6D6174657269616C697A652D74657874617265613A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C0A2C2E696E7075742D666965';
wwv_flow_api.g_varchar2_table(23) := '6C64202E7072656669782E6163746976650A2C5B747970653D22726164696F225D3A636865636B6564202B206C6162656C3A61667465720A2C5B747970653D22726164696F225D2E776974682D6761703A636865636B6564202B206C6162656C3A616674';
wwv_flow_api.g_varchar2_table(24) := '65720A7B0A20202020636F6C6F723A2040675F7365636F6E646172795F636F6C6F723B0A7D0A0A696E7075745B747970653D746578745D3A666F6375733A6E6F74285B726561646F6E6C795D292C20696E7075745B747970653D70617373776F72645D3A';
wwv_flow_api.g_varchar2_table(25) := '666F6375733A6E6F74285B726561646F6E6C795D292C20696E7075745B747970653D656D61696C5D3A666F6375733A6E6F74285B726561646F6E6C795D292C20696E7075745B747970653D75726C5D3A666F6375733A6E6F74285B726561646F6E6C795D';
wwv_flow_api.g_varchar2_table(26) := '292C20696E7075745B747970653D74696D655D3A666F6375733A6E6F74285B726561646F6E6C795D292C20696E7075745B747970653D646174655D3A666F6375733A6E6F74285B726561646F6E6C795D292C20696E7075745B747970653D646174657469';
wwv_flow_api.g_varchar2_table(27) := '6D652D6C6F63616C5D3A666F6375733A6E6F74285B726561646F6E6C795D292C20696E7075745B747970653D74656C5D3A666F6375733A6E6F74285B726561646F6E6C795D292C20696E7075745B747970653D6E756D6265725D3A666F6375733A6E6F74';
wwv_flow_api.g_varchar2_table(28) := '285B726561646F6E6C795D292C20696E7075745B747970653D7365617263685D3A666F6375733A6E6F74285B726561646F6E6C795D292C2074657874617265612E6D6174657269616C697A652D74657874617265613A666F6375733A6E6F74285B726561';
wwv_flow_api.g_varchar2_table(29) := '646F6E6C795D29200A7B0A20202020626F726465722D626F74746F6D3A2031707820736F6C69642040675F7365636F6E646172795F636F6C6F723B0A20202020626F782D736861646F773A203020317078203020302040675F7365636F6E646172795F63';
wwv_flow_api.g_varchar2_table(30) := '6F6C6F723B200A7D0A0A5B747970653D22726164696F225D3A636865636B6564202B206C6162656C3A61667465720A2C5B747970653D22726164696F225D2E776974682D6761703A636865636B6564202B206C6162656C3A6265666F72650A2C5B747970';
wwv_flow_api.g_varchar2_table(31) := '653D22726164696F225D2E776974682D6761703A636865636B6564202B206C6162656C3A61667465720A2C5B747970653D22636865636B626F78225D2E66696C6C65642D696E3A636865636B6564202B206C6162656C3A61667465720A7B0A2020202062';
wwv_flow_api.g_varchar2_table(32) := '6F726465723A2032707820736F6C69642040675F7365636F6E646172795F636F6C6F723B0A7D0A0A5B747970653D22636865636B626F78225D3A636865636B6564202B206C6162656C3A6265666F7265200A7B0A20202020626F726465722D7269676874';
wwv_flow_api.g_varchar2_table(33) := '3A2032707820736F6C69642040675F7365636F6E646172795F636F6C6F723B0A20202020626F726465722D626F74746F6D3A2032707820736F6C69642040675F7365636F6E646172795F636F6C6F723B0A7D0A0A5B747970653D22636865636B626F7822';
wwv_flow_api.g_varchar2_table(34) := '5D3A696E64657465726D696E617465202B206C6162656C3A6265666F72650A7B0A20202020626F726465722D72696768743A2032707820736F6C69642040675F7365636F6E646172795F636F6C6F723B0A7D0A0A2E62746E3A686F7665722C202E62746E';
wwv_flow_api.g_varchar2_table(35) := '2D6C617267653A686F7665722C202E612D4952522D746F6F6C626172202E612D4952522D636F6E74726F6C47726F75702E612D4952522D636F6E74726F6C47726F75702D2D73656172636820627574746F6E3A686F7665722C202E612D4952522D746F6F';
wwv_flow_api.g_varchar2_table(36) := '6C626172202E612D4952522D636F6E74726F6C47726F75702E612D4952522D636F6E74726F6C47726F75702D2D6F7074696F6E7320627574746F6E3A686F7665722C202E612D4952522D746F6F6C626172202E612D4952522D627574746F6E2E612D4952';
wwv_flow_api.g_varchar2_table(37) := '522D627574746F6E2D2D7265706F7274566965773A686F7665722C202E612D4952522D64657461696C2D726F773A686F7665722C202E612D4952522D706167696E6174696F6E2D6974656D3A66697273742D6368696C64202E612D4952522D627574746F';
wwv_flow_api.g_varchar2_table(38) := '6E2E612D4952522D627574746F6E2D2D706167696E6174696F6E3A686F7665722C202E612D4952522D706167696E6174696F6E2D6974656D3A6C6173742D6368696C64202E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D70616769';
wwv_flow_api.g_varchar2_table(39) := '6E6174696F6E3A686F766572207B0A202020206261636B67726F756E642D636F6C6F723A206C69676874656E2840675F7365636F6E646172795F636F6C6F722C203525293B200A7D0A';
wwv_flow_api.create_theme_file(
 p_id=>wwv_flow_api.id(77390492083098348)
,p_theme_id=>101
,p_file_name=>'default.less'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A200A202A204461726B657220426C75650A202A20202020284F7261636C65204170706C69636174696F6E2045787072657373205468656D65205374796C65290A202A200A202A2054686973204353532066696C65207761732067656E657261746564';
wwv_flow_api.g_varchar2_table(2) := '207573696E6720746865204F7261636C65204170706C69636174696F6E204578707265737320352E30205468656D6520526F6C6C65722E200A202A200A202A2F0A0A6E61762C0A2E75692D7769646765742C0A7464202E75692D73746174652D61637469';
wwv_flow_api.g_varchar2_table(3) := '76652C0A7464202E75692D73746174652D686F7665722C0A2E706167696E6174696F6E202E696E737472756374696F6E7465787420622C0A666F6F7465722E706167652D666F6F7465722C0A2E706167696E6174696F6E206C692E6163746976652C0A2E';
wwv_flow_api.g_varchar2_table(4) := '736964652D6E6176202E636F6C6C61707369626C652D626F6479206C692E6163746976652C0A2E736964652D6E61762E6669786564202E636F6C6C61707369626C652D626F6479206C692E616374697665207B0A20206261636B67726F756E643A202330';
wwv_flow_api.g_varchar2_table(5) := '30376664343B0A20206261636B67726F756E642D636F6C6F723A20233030376664343B0A7D0A2E70726F6D6F2D6920692C0A2E70726F6D6F20692C0A2E6865616465722C0A692E70726F6D6F2C0A2E74616273202E7461622061207B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(6) := '3A20233030376664343B0A7D0A626C6F636B71756F7465207B0A2020626F726465722D6C6566743A2035707820736F6C696420233030376664343B0A7D0A2E636F6C6C656374696F6E202E636F6C6C656374696F6E2D6974656D2E6163746976652C0A73';
wwv_flow_api.g_varchar2_table(7) := '70616E2E62616467652E6E65772C0A2E70726F6772657373202E64657465726D696E6174652C0A2E70726F6772657373202E696E64657465726D696E6174652C0A2E62746E2C0A2E62746E2D6C617267652C0A2E612D4952522D746F6F6C626172202E61';
wwv_flow_api.g_varchar2_table(8) := '2D4952522D636F6E74726F6C47726F75702E612D4952522D636F6E74726F6C47726F75702D2D73656172636820627574746F6E2C0A2E612D4952522D746F6F6C626172202E612D4952522D636F6E74726F6C47726F75702E612D4952522D636F6E74726F';
wwv_flow_api.g_varchar2_table(9) := '6C47726F75702D2D6F7074696F6E7320627574746F6E2C0A2E612D4952522D746F6F6C626172202E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D7265706F7274566965772C0A2E612D4952522D64657461696C2D726F772C0A2E61';
wwv_flow_api.g_varchar2_table(10) := '2D4952522D706167696E6174696F6E2D6974656D3A66697273742D6368696C64202E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D706167696E6174696F6E2C0A2E612D4952522D706167696E6174696F6E2D6974656D3A6C617374';
wwv_flow_api.g_varchar2_table(11) := '2D6368696C64202E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D706167696E6174696F6E2C0A2E62746E2D666C6F6174696E672C0A2E612D4952522D746F6F6C626172202E612D4952522D636F6E74726F6C47726F75702E612D49';
wwv_flow_api.g_varchar2_table(12) := '52522D636F6E74726F6C47726F75702D2D766965777320627574746F6E2C0A5B747970653D22636865636B626F78225D2E66696C6C65642D696E3A636865636B6564202B206C6162656C3A6166746572207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(13) := '723A20236566353335303B0A7D0A2E636F6C6C656374696F6E20612E636F6C6C656374696F6E2D6974656D2C0A2E7365636F6E646172792D636F6E74656E742C0A2E64726F70646F776E2D636F6E74656E74206C69203E20612C0A2E64726F70646F776E';
wwv_flow_api.g_varchar2_table(14) := '2D636F6E74656E74206C69203E207370616E2C0A696E7075745B747970653D746578745D3A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C0A696E7075745B747970653D70617373776F72645D3A666F6375733A6E6F74285B';
wwv_flow_api.g_varchar2_table(15) := '726561646F6E6C795D29202B206C6162656C2C0A696E7075745B747970653D656D61696C5D3A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C0A696E7075745B747970653D75726C5D3A666F6375733A6E6F74285B72656164';
wwv_flow_api.g_varchar2_table(16) := '6F6E6C795D29202B206C6162656C2C0A696E7075745B747970653D74696D655D3A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C0A696E7075745B747970653D646174655D3A666F6375733A6E6F74285B726561646F6E6C79';
wwv_flow_api.g_varchar2_table(17) := '5D29202B206C6162656C2C0A696E7075745B747970653D6461746574696D652D6C6F63616C5D3A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C0A696E7075745B747970653D74656C5D3A666F6375733A6E6F74285B726561';
wwv_flow_api.g_varchar2_table(18) := '646F6E6C795D29202B206C6162656C2C0A696E7075745B747970653D6E756D6265725D3A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C0A696E7075745B747970653D7365617263685D3A666F6375733A6E6F74285B726561';
wwv_flow_api.g_varchar2_table(19) := '646F6E6C795D29202B206C6162656C2C0A74657874617265612E6D6174657269616C697A652D74657874617265613A666F6375733A6E6F74285B726561646F6E6C795D29202B206C6162656C2C0A2E696E7075742D6669656C64202E7072656669782E61';
wwv_flow_api.g_varchar2_table(20) := '63746976652C0A5B747970653D22726164696F225D3A636865636B6564202B206C6162656C3A61667465722C0A5B747970653D22726164696F225D2E776974682D6761703A636865636B6564202B206C6162656C3A6166746572207B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(21) := '3A20236566353335303B0A7D0A696E7075745B747970653D746578745D3A666F6375733A6E6F74285B726561646F6E6C795D292C0A696E7075745B747970653D70617373776F72645D3A666F6375733A6E6F74285B726561646F6E6C795D292C0A696E70';
wwv_flow_api.g_varchar2_table(22) := '75745B747970653D656D61696C5D3A666F6375733A6E6F74285B726561646F6E6C795D292C0A696E7075745B747970653D75726C5D3A666F6375733A6E6F74285B726561646F6E6C795D292C0A696E7075745B747970653D74696D655D3A666F6375733A';
wwv_flow_api.g_varchar2_table(23) := '6E6F74285B726561646F6E6C795D292C0A696E7075745B747970653D646174655D3A666F6375733A6E6F74285B726561646F6E6C795D292C0A696E7075745B747970653D6461746574696D652D6C6F63616C5D3A666F6375733A6E6F74285B726561646F';
wwv_flow_api.g_varchar2_table(24) := '6E6C795D292C0A696E7075745B747970653D74656C5D3A666F6375733A6E6F74285B726561646F6E6C795D292C0A696E7075745B747970653D6E756D6265725D3A666F6375733A6E6F74285B726561646F6E6C795D292C0A696E7075745B747970653D73';
wwv_flow_api.g_varchar2_table(25) := '65617263685D3A666F6375733A6E6F74285B726561646F6E6C795D292C0A74657874617265612E6D6174657269616C697A652D74657874617265613A666F6375733A6E6F74285B726561646F6E6C795D29207B0A2020626F726465722D626F74746F6D3A';
wwv_flow_api.g_varchar2_table(26) := '2031707820736F6C696420236566353335303B0A2020626F782D736861646F773A2030203170782030203020236566353335303B0A7D0A5B747970653D22726164696F225D3A636865636B6564202B206C6162656C3A61667465722C0A5B747970653D22';
wwv_flow_api.g_varchar2_table(27) := '726164696F225D2E776974682D6761703A636865636B6564202B206C6162656C3A6265666F72652C0A5B747970653D22726164696F225D2E776974682D6761703A636865636B6564202B206C6162656C3A61667465722C0A5B747970653D22636865636B';
wwv_flow_api.g_varchar2_table(28) := '626F78225D2E66696C6C65642D696E3A636865636B6564202B206C6162656C3A6166746572207B0A2020626F726465723A2032707820736F6C696420236566353335303B0A7D0A5B747970653D22636865636B626F78225D3A636865636B6564202B206C';
wwv_flow_api.g_varchar2_table(29) := '6162656C3A6265666F7265207B0A2020626F726465722D72696768743A2032707820736F6C696420236566353335303B0A2020626F726465722D626F74746F6D3A2032707820736F6C696420236566353335303B0A7D0A5B747970653D22636865636B62';
wwv_flow_api.g_varchar2_table(30) := '6F78225D3A696E64657465726D696E617465202B206C6162656C3A6265666F7265207B0A2020626F726465722D72696768743A2032707820736F6C696420236566353335303B0A7D0A2E62746E3A686F7665722C0A2E62746E2D6C617267653A686F7665';
wwv_flow_api.g_varchar2_table(31) := '722C0A2E612D4952522D746F6F6C626172202E612D4952522D636F6E74726F6C47726F75702E612D4952522D636F6E74726F6C47726F75702D2D73656172636820627574746F6E3A686F7665722C0A2E612D4952522D746F6F6C626172202E612D495252';
wwv_flow_api.g_varchar2_table(32) := '2D636F6E74726F6C47726F75702E612D4952522D636F6E74726F6C47726F75702D2D6F7074696F6E7320627574746F6E3A686F7665722C0A2E612D4952522D746F6F6C626172202E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D72';
wwv_flow_api.g_varchar2_table(33) := '65706F7274566965773A686F7665722C0A2E612D4952522D64657461696C2D726F773A686F7665722C0A2E612D4952522D706167696E6174696F6E2D6974656D3A66697273742D6368696C64202E612D4952522D627574746F6E2E612D4952522D627574';
wwv_flow_api.g_varchar2_table(34) := '746F6E2D2D706167696E6174696F6E3A686F7665722C0A2E612D4952522D706167696E6174696F6E2D6974656D3A6C6173742D6368696C64202E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D706167696E6174696F6E3A686F7665';
wwv_flow_api.g_varchar2_table(35) := '72207B0A20206261636B67726F756E642D636F6C6F723A20236631366136373B0A7D0A';
wwv_flow_api.create_theme_file(
 p_id=>wwv_flow_api.id(77442719346626376)
,p_theme_id=>101
,p_file_name=>'25271441012109603.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77383278997098345)
,p_theme_id=>101
,p_name=>'LANGUAGE_TYPE'
,p_display_name=>'Language Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77384890977098346)
,p_theme_id=>101
,p_name=>'SECTION_HEADER_SIZE'
,p_display_name=>'Section Header Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77386449570098346)
,p_theme_id=>101
,p_name=>'COLLAPSIBLE_BEHAVIOR'
,p_display_name=>'Collapsible Behavior'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77387898024098347)
,p_theme_id=>101
,p_name=>'RESPONSIVE_BEHAVIOR'
,p_display_name=>'Responsive Behavior'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77389831107098347)
,p_theme_id=>101
,p_name=>'ICON_FLOAT'
,p_display_name=>'Icon Float'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_help_text=>'Only applies if your button has an icon'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77390673642098348)
,p_theme_id=>101
,p_name=>'BACKGROUND_MODIFIER'
,p_display_name=>'Background Modifier'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77391173472098348)
,p_theme_id=>101
,p_name=>'BACKGROUND_COLOR'
,p_display_name=>'Background Color'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77391470187098348)
,p_theme_id=>101
,p_name=>'TEXT_COLOR'
,p_display_name=>'Text Color'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77391876851098349)
,p_theme_id=>101
,p_name=>'BACKGROUND_MODIFIER'
,p_display_name=>'Background Modifier'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77395444703098349)
,p_theme_id=>101
,p_name=>'TEXT_COLOR'
,p_display_name=>'Text Color'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77397516356098350)
,p_theme_id=>101
,p_name=>'HIDING_CONTENT'
,p_display_name=>'Hiding Content'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77398278066098350)
,p_theme_id=>101
,p_name=>'ALIGNMENT'
,p_display_name=>'Alignment'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77399171405098351)
,p_theme_id=>101
,p_name=>'SHADOW'
,p_display_name=>'Shadow'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77399467740098351)
,p_theme_id=>101
,p_name=>'SHADOW'
,p_display_name=>'Shadow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77400454955098351)
,p_theme_id=>101
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77400868350098351)
,p_theme_id=>101
,p_name=>'WAVE_COLOR'
,p_display_name=>'Wave Color'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'None'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77401362705098351)
,p_theme_id=>101
,p_name=>'HIDING_CONTENT'
,p_display_name=>'Hiding Content'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77402146585098352)
,p_theme_id=>101
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77402295544098352)
,p_theme_id=>101
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77402648580098352)
,p_theme_id=>101
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77404485504098352)
,p_theme_id=>101
,p_name=>'BACKGROUND_COLOR'
,p_display_name=>'Background Color'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(77406777001098353)
,p_theme_id=>101
,p_name=>'HIDING_CONTENT'
,p_display_name=>'Hiding Content'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(26183451029521033)
,p_theme_id=>101
,p_name=>'WITH_HEADER'
,p_display_name=>'With Header'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(26183047332521031)
,p_css_classes=>'with-header'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(26261374707616429)
,p_theme_id=>101
,p_name=>'CENTER_LOGO'
,p_display_name=>'Center Logo'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(26258419162616417)
,p_css_classes=>'page-center-logo'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(26261733640616430)
,p_theme_id=>101
,p_name=>'CONTAINER'
,p_display_name=>'Container'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(26258419162616417)
,p_css_classes=>'main-container'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(26262149360616430)
,p_theme_id=>101
,p_name=>'NAVIGATION_BAR_FIXED'
,p_display_name=>'Navigation Bar Fixed'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(26258419162616417)
,p_css_classes=>'page-navbar-fixed'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(26262581036616430)
,p_theme_id=>101
,p_name=>'SIDE_NAVIGATION_FIXED'
,p_display_name=>'Side Navigation Fixed'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(26258419162616417)
,p_css_classes=>'side-nav-fixed'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(26416095201986715)
,p_theme_id=>101
,p_name=>'WITH_HEADER'
,p_display_name=>'With Header'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(26415682571986712)
,p_css_classes=>'with-header'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(41739813632764761)
,p_theme_id=>101
,p_name=>'CENTER_LOGO'
,p_display_name=>'Center Logo'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(41736985200764756)
,p_css_classes=>'page-center-logo'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(41740287292764762)
,p_theme_id=>101
,p_name=>'CONTAINER'
,p_display_name=>'Container'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(41736985200764756)
,p_css_classes=>'main-container'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(41740668108764762)
,p_theme_id=>101
,p_name=>'NAVIGATION_BAR_FIXED'
,p_display_name=>'Navigation Bar Fixed'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(41736985200764756)
,p_css_classes=>'page-navbar-fixed'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(41741095951764762)
,p_theme_id=>101
,p_name=>'SIDE_NAVIGATION_FIXED'
,p_display_name=>'Side Navigation Fixed'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(41736985200764756)
,p_css_classes=>'side-nav-fixed'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(42111500440472423)
,p_theme_id=>101
,p_name=>'WITH_HEADER'
,p_display_name=>'With Header'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(42111131538472418)
,p_css_classes=>'with-header'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77381900011098344)
,p_theme_id=>101
,p_name=>'FIXED_FOOTER'
,p_display_name=>'Fixed Footer'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(77381494509098344)
,p_css_classes=>'modal-fixed-footer'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77382581468098345)
,p_theme_id=>101
,p_name=>'CENTER_LOGO'
,p_display_name=>'Center Logo'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(77382002662098345)
,p_css_classes=>'page-center-logo'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77382733312098345)
,p_theme_id=>101
,p_name=>'CONTAINER'
,p_display_name=>'Container'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(77382002662098345)
,p_css_classes=>'main-container'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77382793877098345)
,p_theme_id=>101
,p_name=>'NAVIGATION_BAR_FIXED'
,p_display_name=>'Navigation Bar Fixed'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(77382002662098345)
,p_css_classes=>'page-navbar-fixed'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77382954865098345)
,p_theme_id=>101
,p_name=>'SIDE_NAVIGATION_FIXED'
,p_display_name=>'Side Navigation Fixed'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(77382002662098345)
,p_css_classes=>'side-nav-fixed'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77383438527098345)
,p_theme_id=>101
,p_name=>'CSS'
,p_display_name=>'CSS'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77383238655098345)
,p_css_classes=>'language-css'
,p_group_id=>wwv_flow_api.id(77383278997098345)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77383536599098345)
,p_theme_id=>101
,p_name=>'HTML'
,p_display_name=>'HTML'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77383238655098345)
,p_css_classes=>'language-markup'
,p_group_id=>wwv_flow_api.id(77383278997098345)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77383626932098345)
,p_theme_id=>101
,p_name=>'JAVASCRIPT'
,p_display_name=>'JavaScript'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77383238655098345)
,p_css_classes=>'language-javascript'
,p_group_id=>wwv_flow_api.id(77383278997098345)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77383708371098345)
,p_theme_id=>101
,p_name=>'SCSS'
,p_display_name=>'SCSS'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77383238655098345)
,p_css_classes=>'language-scss'
,p_group_id=>wwv_flow_api.id(77383278997098345)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77383844856098345)
,p_theme_id=>101
,p_name=>'SQL'
,p_display_name=>'SQL'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77383238655098345)
,p_css_classes=>'language-sql'
,p_group_id=>wwv_flow_api.id(77383278997098345)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77384135220098345)
,p_theme_id=>101
,p_name=>'BOTTOM_SHEET'
,p_display_name=>'Bottom Sheet'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77383982196098345)
,p_css_classes=>'bottom-sheet'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77384210756098345)
,p_theme_id=>101
,p_name=>'FIXED_FOOTER'
,p_display_name=>'Fixed Footer'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77383982196098345)
,p_css_classes=>'modal-fixed-footer'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77384832116098346)
,p_theme_id=>101
,p_name=>'CONTAINER'
,p_display_name=>'Container'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77384709376098346)
,p_css_classes=>'container'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77385053669098346)
,p_theme_id=>101
,p_name=>'H1'
,p_display_name=>'H1'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77384709376098346)
,p_css_classes=>'h1'
,p_group_id=>wwv_flow_api.id(77384890977098346)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77385083408098346)
,p_theme_id=>101
,p_name=>'H2'
,p_display_name=>'H2'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77384709376098346)
,p_css_classes=>'h2'
,p_group_id=>wwv_flow_api.id(77384890977098346)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77385245833098346)
,p_theme_id=>101
,p_name=>'H3'
,p_display_name=>'H3'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77384709376098346)
,p_css_classes=>'h3'
,p_group_id=>wwv_flow_api.id(77384890977098346)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77385309161098346)
,p_theme_id=>101
,p_name=>'H4'
,p_display_name=>'H4'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77384709376098346)
,p_css_classes=>'h4'
,p_group_id=>wwv_flow_api.id(77384890977098346)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77385412314098346)
,p_theme_id=>101
,p_name=>'H5'
,p_display_name=>'H5'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77384709376098346)
,p_css_classes=>'h5'
,p_group_id=>wwv_flow_api.id(77384890977098346)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77385558222098346)
,p_theme_id=>101
,p_name=>'H6'
,p_display_name=>'H6'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77384709376098346)
,p_css_classes=>'h6'
,p_group_id=>wwv_flow_api.id(77384890977098346)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77385583367098346)
,p_theme_id=>101
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77384709376098346)
,p_css_classes=>'hide-title'
,p_group_id=>wwv_flow_api.id(77384890977098346)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77385741694098346)
,p_theme_id=>101
,p_name=>'MATERIALBOX'
,p_display_name=>'Materialbox'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77384709376098346)
,p_css_classes=>'apex-materialbox'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77385776954098346)
,p_theme_id=>101
,p_name=>'SCROLLSPY'
,p_display_name=>'Scrollspy'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(77384709376098346)
,p_css_classes=>'scrollspy'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77386497347098346)
,p_theme_id=>101
,p_name=>'ACCORDION'
,p_display_name=>'Accordion'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(77386294446098346)
,p_css_classes=>'accordion'
,p_group_id=>wwv_flow_api.id(77386449570098346)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77386628781098346)
,p_theme_id=>101
,p_name=>'EXPANDABLE'
,p_display_name=>'Expandable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(77386294446098346)
,p_css_classes=>'expandable'
,p_group_id=>wwv_flow_api.id(77386449570098346)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77386708417098346)
,p_theme_id=>101
,p_name=>'POPOUT'
,p_display_name=>'Popout'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(77386294446098346)
,p_css_classes=>'popout'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77386970602098346)
,p_theme_id=>101
,p_name=>'WITH_HEADER'
,p_display_name=>'With Header'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(77386801039098346)
,p_css_classes=>'with-header'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77387094780098346)
,p_theme_id=>101
,p_name=>'WITH_HEADER'
,p_display_name=>'With Header'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(77387002278098346)
,p_css_classes=>'with-header'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77387295579098346)
,p_theme_id=>101
,p_name=>'WITH_HEADER'
,p_display_name=>'With Header'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(77387270781098346)
,p_css_classes=>'with-header'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77387694277098346)
,p_theme_id=>101
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(77387667636098346)
,p_css_classes=>'borderless'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77387789023098346)
,p_theme_id=>101
,p_name=>'HOVERABLE'
,p_display_name=>'Hoverable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(77387667636098346)
,p_css_classes=>'hoverable'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77388019548098347)
,p_theme_id=>101
,p_name=>'RESPONSIVE'
,p_display_name=>'Style 1'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(77387667636098346)
,p_css_classes=>'responsive-table'
,p_group_id=>wwv_flow_api.id(77387898024098347)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77388166064098347)
,p_theme_id=>101
,p_name=>'STRIPED'
,p_display_name=>'Striped'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(77387667636098346)
,p_css_classes=>'striped'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77388170814098347)
,p_theme_id=>101
,p_name=>'STYLE_2'
,p_display_name=>'Style 2'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(77387667636098346)
,p_css_classes=>'table-responsive'
,p_group_id=>wwv_flow_api.id(77387898024098347)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77388428407098347)
,p_theme_id=>101
,p_name=>'CENTER_LOGO'
,p_display_name=>'Center Logo'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(77388280297098347)
,p_css_classes=>'center-logo'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77388563173098347)
,p_theme_id=>101
,p_name=>'NAVBAR_FIXED'
,p_display_name=>'Navbar Fixed'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(77388280297098347)
,p_css_classes=>'navbar-fixed'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77389187537098347)
,p_theme_id=>101
,p_name=>'IMAGE_CIRCLE'
,p_display_name=>'Image Circle'
,p_display_sequence=>1
,p_field_template_id=>wwv_flow_api.id(77389129397098347)
,p_css_classes=>'item-image-circle'
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77389331862098347)
,p_theme_id=>101
,p_name=>'IMAGE_RESPONSIVE'
,p_display_name=>'Image Responsive'
,p_display_sequence=>1
,p_field_template_id=>wwv_flow_api.id(77389129397098347)
,p_css_classes=>'item-image-responsive'
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77389441254098347)
,p_theme_id=>101
,p_name=>'MATERIAL_DATE_PICKER'
,p_display_name=>'Material Date Picker'
,p_display_sequence=>1
,p_field_template_id=>wwv_flow_api.id(77389129397098347)
,p_css_classes=>'material-apex-datepicker'
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77389521211098347)
,p_theme_id=>101
,p_name=>'NO_LABEL'
,p_display_name=>'No Label'
,p_display_sequence=>1
,p_field_template_id=>wwv_flow_api.id(77389129397098347)
,p_css_classes=>'item-no-label'
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77389686738098347)
,p_theme_id=>101
,p_name=>'FIXED_ACTION_BUTTON'
,p_display_name=>'Fixed Action Button'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_css_classes=>'fixed-action-btn'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77389883486098347)
,p_theme_id=>101
,p_name=>'ICON-FLOAT-LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_css_classes=>'icon-float-left'
,p_group_id=>wwv_flow_api.id(77389831107098347)
,p_template_types=>'BUTTON'
,p_help_text=>'Only applies if the button has an icon.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77390048932098347)
,p_theme_id=>101
,p_name=>'ICON-FLOAT-RIGHT'
,p_display_name=>'Right'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_css_classes=>'icon-float-right'
,p_group_id=>wwv_flow_api.id(77389831107098347)
,p_template_types=>'BUTTON'
,p_help_text=>'Only applies if the button has an icon.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77390780200098348)
,p_theme_id=>101
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>1
,p_css_classes=>'accent-1'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77390953675098348)
,p_theme_id=>101
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>1
,p_css_classes=>'accent-2'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77390983441098348)
,p_theme_id=>101
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>1
,p_css_classes=>'accent-3'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77391168882098348)
,p_theme_id=>101
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>1
,p_css_classes=>'accent-4'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77391351765098348)
,p_theme_id=>101
,p_name=>'AMBER'
,p_display_name=>'Amber'
,p_display_sequence=>1
,p_css_classes=>'amber'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77391483750098348)
,p_theme_id=>101
,p_name=>'AMBER_TEXT'
,p_display_name=>'Amber'
,p_display_sequence=>1
,p_css_classes=>'amber-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77391661344098349)
,p_theme_id=>101
,p_name=>'BLUE_GREY_TEXT'
,p_display_name=>'Blue Grey'
,p_display_sequence=>1
,p_css_classes=>'blue-grey-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77391679036098349)
,p_theme_id=>101
,p_name=>'BLUE_TEXT'
,p_display_name=>'Blue'
,p_display_sequence=>1
,p_css_classes=>'blue-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77391790285098349)
,p_theme_id=>101
,p_name=>'BROWN_TEXT'
,p_display_name=>'Brown'
,p_display_sequence=>1
,p_css_classes=>'brown-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77392047069098349)
,p_theme_id=>101
,p_name=>'BTN_BG_ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>1
,p_css_classes=>'accent-1'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77392168832098349)
,p_theme_id=>101
,p_name=>'BTN_BG_ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>1
,p_css_classes=>'accent-2'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77392189049098349)
,p_theme_id=>101
,p_name=>'BTN_BG_ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>1
,p_css_classes=>'accent-3'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77392298697098349)
,p_theme_id=>101
,p_name=>'BTN_BG_ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>1
,p_css_classes=>'accent-4'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77392407398098349)
,p_theme_id=>101
,p_name=>'BTN_BG_BLACK'
,p_display_name=>'Black'
,p_display_sequence=>1
,p_css_classes=>'black'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77392543563098349)
,p_theme_id=>101
,p_name=>'BTN_BG_BLUE'
,p_display_name=>'Blue'
,p_display_sequence=>1
,p_css_classes=>'blue'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77392670000098349)
,p_theme_id=>101
,p_name=>'BTN_BG_BLUE_GREY'
,p_display_name=>'Blue Grey'
,p_display_sequence=>1
,p_css_classes=>'blue-grey'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77392683043098349)
,p_theme_id=>101
,p_name=>'BTN_BG_BROWN'
,p_display_name=>'Brown'
,p_display_sequence=>1
,p_css_classes=>'brown'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77392778884098349)
,p_theme_id=>101
,p_name=>'BTN_BG_CYAN'
,p_display_name=>'Cyan'
,p_display_sequence=>1
,p_css_classes=>'cyan'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77392968902098349)
,p_theme_id=>101
,p_name=>'BTN_BG_DARKEN_1'
,p_display_name=>'Darken 1'
,p_display_sequence=>1
,p_css_classes=>'darken-1'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77393044879098349)
,p_theme_id=>101
,p_name=>'BTN_BG_DARKEN_2'
,p_display_name=>'Darken 2'
,p_display_sequence=>1
,p_css_classes=>'darken-2'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77393126562098349)
,p_theme_id=>101
,p_name=>'BTN_BG_DARKEN_3'
,p_display_name=>'Darken 3'
,p_display_sequence=>1
,p_css_classes=>'darken-3'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77393199368098349)
,p_theme_id=>101
,p_name=>'BTN_BG_DARKEN_4'
,p_display_name=>'Darken 4'
,p_display_sequence=>1
,p_css_classes=>'darken-4'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77393359097098349)
,p_theme_id=>101
,p_name=>'BTN_BG_DEEP_ORANGE'
,p_display_name=>'Deep Orange'
,p_display_sequence=>1
,p_css_classes=>'deep-orange'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77393430421098349)
,p_theme_id=>101
,p_name=>'BTN_BG_DEEP_PURPLE'
,p_display_name=>'Deep Purple'
,p_display_sequence=>1
,p_css_classes=>'deep-purple'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77393537950098349)
,p_theme_id=>101
,p_name=>'BTN_BG_GREEN'
,p_display_name=>'Green'
,p_display_sequence=>1
,p_css_classes=>'green'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77393660671098349)
,p_theme_id=>101
,p_name=>'BTN_BG_GREY'
,p_display_name=>'Grey'
,p_display_sequence=>1
,p_css_classes=>'grey'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77393694169098349)
,p_theme_id=>101
,p_name=>'BTN_BG_INDIGO'
,p_display_name=>'Indigo'
,p_display_sequence=>1
,p_css_classes=>'indigo'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77393797221098349)
,p_theme_id=>101
,p_name=>'BTN_BG_LIGHTEN_1'
,p_display_name=>'Lighten 1'
,p_display_sequence=>1
,p_css_classes=>'lighten-1'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77393965949098349)
,p_theme_id=>101
,p_name=>'BTN_BG_LIGHTEN_2'
,p_display_name=>'Lighten 2'
,p_display_sequence=>1
,p_css_classes=>'lighten-2'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77394005680098349)
,p_theme_id=>101
,p_name=>'BTN_BG_LIGHTEN_3'
,p_display_name=>'Lighten 3'
,p_display_sequence=>1
,p_css_classes=>'lighten-3'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77394096928098349)
,p_theme_id=>101
,p_name=>'BTN_BG_LIGHTEN_4'
,p_display_name=>'Lighten 4'
,p_display_sequence=>1
,p_css_classes=>'lighten-4'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77394259062098349)
,p_theme_id=>101
,p_name=>'BTN_BG_LIGHTEN_5'
,p_display_name=>'Lighten 5'
,p_display_sequence=>1
,p_css_classes=>'lighten-5'
,p_group_id=>wwv_flow_api.id(77391876851098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77394366797098349)
,p_theme_id=>101
,p_name=>'BTN_BG_LIGHT_BLUE'
,p_display_name=>'Light Blue'
,p_display_sequence=>1
,p_css_classes=>'light-blue'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77394433976098349)
,p_theme_id=>101
,p_name=>'BTN_BG_LIGHT_GREEN'
,p_display_name=>'Light Green'
,p_display_sequence=>1
,p_css_classes=>'light-green'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77394569806098349)
,p_theme_id=>101
,p_name=>'BTN_BG_LIME'
,p_display_name=>'Lime'
,p_display_sequence=>1
,p_css_classes=>'lime'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77394610043098349)
,p_theme_id=>101
,p_name=>'BTN_BG_ORANGE'
,p_display_name=>'Orange'
,p_display_sequence=>1
,p_css_classes=>'orange'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77394736129098349)
,p_theme_id=>101
,p_name=>'BTN_BG_PINK'
,p_display_name=>'Pink'
,p_display_sequence=>1
,p_css_classes=>'pink'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77394847093098349)
,p_theme_id=>101
,p_name=>'BTN_BG_PURPLE'
,p_display_name=>'Purple'
,p_display_sequence=>1
,p_css_classes=>'purple'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77394907160098349)
,p_theme_id=>101
,p_name=>'BTN_BG_RED'
,p_display_name=>'Red'
,p_display_sequence=>1
,p_css_classes=>'red'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77395028624098349)
,p_theme_id=>101
,p_name=>'BTN_BG_TEAL'
,p_display_name=>'Teal'
,p_display_sequence=>1
,p_css_classes=>'teal'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77395098578098349)
,p_theme_id=>101
,p_name=>'BTN_BG_TRANSPARENT'
,p_display_name=>'Transparent'
,p_display_sequence=>1
,p_css_classes=>'transparent'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77395229875098349)
,p_theme_id=>101
,p_name=>'BTN_BG_WHITE'
,p_display_name=>'White'
,p_display_sequence=>1
,p_css_classes=>'white'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77395357529098349)
,p_theme_id=>101
,p_name=>'BTN_BG_YELLOW'
,p_display_name=>'Yellow'
,p_display_sequence=>1
,p_css_classes=>'yellow'
,p_group_id=>wwv_flow_api.id(77391173472098348)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77395558834098349)
,p_theme_id=>101
,p_name=>'BTN_TEXT_AMBER'
,p_display_name=>'Amber'
,p_display_sequence=>1
,p_css_classes=>'amber-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77395638702098349)
,p_theme_id=>101
,p_name=>'BTN_TEXT_BLUE'
,p_display_name=>'Blue'
,p_display_sequence=>1
,p_css_classes=>'blue-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77395765918098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_BLUE_GREY'
,p_display_name=>'Blue Grey'
,p_display_sequence=>1
,p_css_classes=>'blue-grey-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77395838118098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_BROWN'
,p_display_name=>'Brown'
,p_display_sequence=>1
,p_css_classes=>'brown-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77395962411098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_CYAN'
,p_display_name=>'Cyan'
,p_display_sequence=>1
,p_css_classes=>'cyan-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77396056825098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_DEEP_ORANGE'
,p_display_name=>'Deep Orange'
,p_display_sequence=>1
,p_css_classes=>'deep-orange-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77396071944098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_DEEP_PURPLE'
,p_display_name=>'Deep Purple'
,p_display_sequence=>1
,p_css_classes=>'deep-purple-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77396231312098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_GREEN'
,p_display_name=>'Green'
,p_display_sequence=>1
,p_css_classes=>'green-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77396341727098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_GREY'
,p_display_name=>'Grey'
,p_display_sequence=>1
,p_css_classes=>'grey-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77396455820098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_INDIGO'
,p_display_name=>'Indigo'
,p_display_sequence=>1
,p_css_classes=>'indigo-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77396528621098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_LIGHT_BLUE'
,p_display_name=>'Light Blue'
,p_display_sequence=>1
,p_css_classes=>'light-blue-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77396653291098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_LIGHT_GREEN'
,p_display_name=>'Light Green'
,p_display_sequence=>1
,p_css_classes=>'light-green-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77396749481098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_LIME'
,p_display_name=>'Lime'
,p_display_sequence=>1
,p_css_classes=>'lime-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77396775096098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_ORANGE'
,p_display_name=>'Orange'
,p_display_sequence=>1
,p_css_classes=>'orange-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77396943117098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_PINK'
,p_display_name=>'Pink'
,p_display_sequence=>1
,p_css_classes=>'pink-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77397021879098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_PURPLE'
,p_display_name=>'Purple'
,p_display_sequence=>1
,p_css_classes=>'purple-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77397105566098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_RED'
,p_display_name=>'Red'
,p_display_sequence=>1
,p_css_classes=>'red-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77397192079098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_TEAL'
,p_display_name=>'Teal'
,p_display_sequence=>1
,p_css_classes=>'teal-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77397325057098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_WHITE'
,p_display_name=>'White'
,p_display_sequence=>1
,p_css_classes=>'white-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77397395355098350)
,p_theme_id=>101
,p_name=>'BTN_TEXT_YELLOW'
,p_display_name=>'Yellow'
,p_display_sequence=>1
,p_css_classes=>'yellow-text'
,p_group_id=>wwv_flow_api.id(77395444703098349)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77397589688098350)
,p_theme_id=>101
,p_name=>'B_HIDDEN_FOR_ALL_DEVICES'
,p_display_name=>'Hidden for all Devices'
,p_display_sequence=>1
,p_css_classes=>'hide'
,p_group_id=>wwv_flow_api.id(77397516356098350)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77397732852098350)
,p_theme_id=>101
,p_name=>'B_HIDDEN_FOR_LARGE_ONLY'
,p_display_name=>'Hidden for Large Only'
,p_display_sequence=>1
,p_css_classes=>'hide-on-large-only'
,p_group_id=>wwv_flow_api.id(77397516356098350)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77397864372098350)
,p_theme_id=>101
,p_name=>'B_HIDDEN_FOR_MEDIUM_AND_ABOVE'
,p_display_name=>'Hidden for Medium and Above'
,p_display_sequence=>1
,p_css_classes=>'hide-on-med-and-up'
,p_group_id=>wwv_flow_api.id(77397516356098350)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77397950037098350)
,p_theme_id=>101
,p_name=>'B_HIDDEN_FOR_MEDIUM_AND_BELOW'
,p_display_name=>'Hidden for Medium and Below'
,p_display_sequence=>1
,p_css_classes=>'hide-on-med-and-down'
,p_group_id=>wwv_flow_api.id(77397516356098350)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77398051827098350)
,p_theme_id=>101
,p_name=>'B_HIDDEN_FOR_MEDIUM_ONLY'
,p_display_name=>'Hidden for Medium Only'
,p_display_sequence=>1
,p_css_classes=>'hide-on-med-only'
,p_group_id=>wwv_flow_api.id(77397516356098350)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77398083361098350)
,p_theme_id=>101
,p_name=>'B_HIDDEN_FOR_SMALL_AND_LARGE'
,p_display_name=>'Hidden for Small and Large'
,p_display_sequence=>1
,p_css_classes=>'hide-on-small-only hide-on-large-only'
,p_group_id=>wwv_flow_api.id(77397516356098350)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77398236878098350)
,p_theme_id=>101
,p_name=>'B_HIDDEN_FOR_SMALL_ONLY'
,p_display_name=>'Hidden for Small Only'
,p_display_sequence=>1
,p_css_classes=>'hide-on-small-only'
,p_group_id=>wwv_flow_api.id(77397516356098350)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77398470401098350)
,p_theme_id=>101
,p_name=>'CENTER'
,p_display_name=>'Center'
,p_display_sequence=>1
,p_css_classes=>'center-align'
,p_group_id=>wwv_flow_api.id(77398278066098350)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77398542117098350)
,p_theme_id=>101
,p_name=>'CYAN_TEXT'
,p_display_name=>'Cyan'
,p_display_sequence=>1
,p_css_classes=>'cyan-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77398622873098350)
,p_theme_id=>101
,p_name=>'DARKEN_1'
,p_display_name=>'Darken 1'
,p_display_sequence=>1
,p_css_classes=>'darken-1'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77398723639098350)
,p_theme_id=>101
,p_name=>'DARKEN_2'
,p_display_name=>'Darken 2'
,p_display_sequence=>1
,p_css_classes=>'darken-2'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77398821294098350)
,p_theme_id=>101
,p_name=>'DARKEN_3'
,p_display_name=>'Darken 3'
,p_display_sequence=>1
,p_css_classes=>'darken-3'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77398874767098350)
,p_theme_id=>101
,p_name=>'DARKEN_4'
,p_display_name=>'Darken 4'
,p_display_sequence=>1
,p_css_classes=>'darken-4'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77399002902098351)
,p_theme_id=>101
,p_name=>'DEEP_ORANGE_TEXT'
,p_display_name=>'Deep Orange'
,p_display_sequence=>1
,p_css_classes=>'deep-orange-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77399097694098351)
,p_theme_id=>101
,p_name=>'DEEP_PURPLE_TEXT'
,p_display_name=>'Deep Purple'
,p_display_sequence=>1
,p_css_classes=>'deep-purple-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77399315942098351)
,p_theme_id=>101
,p_name=>'DEPTH_1'
,p_display_name=>'Depth 1'
,p_display_sequence=>1
,p_css_classes=>'z-depth-1'
,p_group_id=>wwv_flow_api.id(77399171405098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77399568576098351)
,p_theme_id=>101
,p_name=>'DEPTH_1'
,p_display_name=>'Depth 1'
,p_display_sequence=>1
,p_css_classes=>'z-depth-1'
,p_group_id=>wwv_flow_api.id(77399467740098351)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77399630358098351)
,p_theme_id=>101
,p_name=>'DEPTH_2'
,p_display_name=>'Depth 2'
,p_display_sequence=>1
,p_css_classes=>'z-depth-2'
,p_group_id=>wwv_flow_api.id(77399171405098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77399766482098351)
,p_theme_id=>101
,p_name=>'DEPTH_2'
,p_display_name=>'Depth 2'
,p_display_sequence=>1
,p_css_classes=>'z-depth-2'
,p_group_id=>wwv_flow_api.id(77399467740098351)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77399834775098351)
,p_theme_id=>101
,p_name=>'DEPTH_3'
,p_display_name=>'Depth 3'
,p_display_sequence=>1
,p_css_classes=>'z-depth-3'
,p_group_id=>wwv_flow_api.id(77399171405098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77399962810098351)
,p_theme_id=>101
,p_name=>'DEPTH_3'
,p_display_name=>'Depth 3'
,p_display_sequence=>1
,p_css_classes=>'z-depth-3'
,p_group_id=>wwv_flow_api.id(77399467740098351)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77400025170098351)
,p_theme_id=>101
,p_name=>'DEPTH_4'
,p_display_name=>'Depth 4'
,p_display_sequence=>1
,p_css_classes=>'z-depth-4'
,p_group_id=>wwv_flow_api.id(77399171405098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77400088661098351)
,p_theme_id=>101
,p_name=>'DEPTH_4'
,p_display_name=>'Depth 4'
,p_display_sequence=>1
,p_css_classes=>'z-depth-4'
,p_group_id=>wwv_flow_api.id(77399467740098351)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77400183595098351)
,p_theme_id=>101
,p_name=>'DEPTH_5'
,p_display_name=>'Depth 5'
,p_display_sequence=>1
,p_css_classes=>'z-depth-5'
,p_group_id=>wwv_flow_api.id(77399171405098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77400283074098351)
,p_theme_id=>101
,p_name=>'DEPTH_5'
,p_display_name=>'Depth 5'
,p_display_sequence=>1
,p_css_classes=>'z-depth-5'
,p_group_id=>wwv_flow_api.id(77399467740098351)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77400489630098351)
,p_theme_id=>101
,p_name=>'FLAT'
,p_display_name=>'Flat'
,p_display_sequence=>1
,p_css_classes=>'btn-flat'
,p_group_id=>wwv_flow_api.id(77400454955098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77400603565098351)
,p_theme_id=>101
,p_name=>'FLOATING'
,p_display_name=>'Floating'
,p_display_sequence=>1
,p_css_classes=>'btn-floating'
,p_group_id=>wwv_flow_api.id(77400454955098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77400731562098351)
,p_theme_id=>101
,p_name=>'FLOW_TEXT'
,p_display_name=>'Flow Text'
,p_display_sequence=>1
,p_css_classes=>'flow-text-region'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77400877391098351)
,p_theme_id=>101
,p_name=>'GREEN'
,p_display_name=>'Green'
,p_display_sequence=>1
,p_css_classes=>'waves-green'
,p_group_id=>wwv_flow_api.id(77400868350098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77401030412098351)
,p_theme_id=>101
,p_name=>'GREEN_TEXT'
,p_display_name=>'Green'
,p_display_sequence=>1
,p_css_classes=>'green-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77401159881098351)
,p_theme_id=>101
,p_name=>'GREY_TEXT'
,p_display_name=>'Grey'
,p_display_sequence=>1
,p_css_classes=>'grey-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77401181553098351)
,p_theme_id=>101
,p_name=>'INDIGO_TEXT'
,p_display_name=>'Indigo'
,p_display_sequence=>1
,p_css_classes=>'indigo-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77401429253098351)
,p_theme_id=>101
,p_name=>'I_HIDDEN_FOR_ALL_DEVICES'
,p_display_name=>'Hidden for all Devices'
,p_display_sequence=>1
,p_css_classes=>'hide'
,p_group_id=>wwv_flow_api.id(77401362705098351)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77401517981098351)
,p_theme_id=>101
,p_name=>'I_HIDDEN_FOR_LARGE_ONLY'
,p_display_name=>'Hidden for Large Only'
,p_display_sequence=>1
,p_css_classes=>'hide-on-large-only'
,p_group_id=>wwv_flow_api.id(77401362705098351)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77401663335098351)
,p_theme_id=>101
,p_name=>'I_HIDDEN_FOR_MEDIUM_AND_ABOVE'
,p_display_name=>'Hidden for Medium and Above'
,p_display_sequence=>1
,p_css_classes=>'hide-on-med-and-up'
,p_group_id=>wwv_flow_api.id(77401362705098351)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77401768666098351)
,p_theme_id=>101
,p_name=>'I_HIDDEN_FOR_MEDIUM_AND_BELOW'
,p_display_name=>'Hidden for Medium and Below'
,p_display_sequence=>1
,p_css_classes=>'hide-on-med-and-down'
,p_group_id=>wwv_flow_api.id(77401362705098351)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77401798131098351)
,p_theme_id=>101
,p_name=>'I_HIDDEN_FOR_MEDIUM_ONLY'
,p_display_name=>'Hidden for Medium Only'
,p_display_sequence=>1
,p_css_classes=>'hide-on-med-only'
,p_group_id=>wwv_flow_api.id(77401362705098351)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77401901820098351)
,p_theme_id=>101
,p_name=>'I_HIDDEN_FOR_SMALL_AND_LARGE'
,p_display_name=>'Hidden for Small and Large'
,p_display_sequence=>1
,p_css_classes=>'hide-on-small-only hide-on-large-only'
,p_group_id=>wwv_flow_api.id(77401362705098351)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77402049521098352)
,p_theme_id=>101
,p_name=>'I_HIDDEN_FOR_SMALL_ONLY'
,p_display_name=>'Hidden for Small Only'
,p_display_sequence=>1
,p_css_classes=>'hide-on-small-only'
,p_group_id=>wwv_flow_api.id(77401362705098351)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77402222624098352)
,p_theme_id=>101
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'btn-large'
,p_group_id=>wwv_flow_api.id(77402146585098352)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77402422843098352)
,p_theme_id=>101
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'left'
,p_group_id=>wwv_flow_api.id(77402295544098352)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77402494304098352)
,p_theme_id=>101
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'left-align'
,p_group_id=>wwv_flow_api.id(77398278066098350)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77402743413098352)
,p_theme_id=>101
,p_name=>'LEFT_FLOAT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'left'
,p_group_id=>wwv_flow_api.id(77402648580098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77402866819098352)
,p_theme_id=>101
,p_name=>'LIGHT'
,p_display_name=>'Light'
,p_display_sequence=>1
,p_css_classes=>'waves-light'
,p_group_id=>wwv_flow_api.id(77400868350098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77402873113098352)
,p_theme_id=>101
,p_name=>'LIGHTEN_1'
,p_display_name=>'Lighten 1'
,p_display_sequence=>1
,p_css_classes=>'lighten-1'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77403015827098352)
,p_theme_id=>101
,p_name=>'LIGHTEN_2'
,p_display_name=>'Lighten 2'
,p_display_sequence=>1
,p_css_classes=>'lighten-2'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77403072148098352)
,p_theme_id=>101
,p_name=>'LIGHTEN_3'
,p_display_name=>'Lighten 3'
,p_display_sequence=>1
,p_css_classes=>'lighten-3'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77403234190098352)
,p_theme_id=>101
,p_name=>'LIGHTEN_4'
,p_display_name=>'Lighten 4'
,p_display_sequence=>1
,p_css_classes=>'lighten-4'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77403307794098352)
,p_theme_id=>101
,p_name=>'LIGHTEN_5'
,p_display_name=>'Lighten 5'
,p_display_sequence=>1
,p_css_classes=>'lighten-5'
,p_group_id=>wwv_flow_api.id(77390673642098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77403451328098352)
,p_theme_id=>101
,p_name=>'LIGHT_BLUE_TEXT'
,p_display_name=>'Light Blue'
,p_display_sequence=>1
,p_css_classes=>'light-blue-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77403564515098352)
,p_theme_id=>101
,p_name=>'LIGHT_GREEN_TEXT'
,p_display_name=>'Light Green'
,p_display_sequence=>1
,p_css_classes=>'light-green-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77403578627098352)
,p_theme_id=>101
,p_name=>'LIME_TEXT'
,p_display_name=>'Lime'
,p_display_sequence=>1
,p_css_classes=>'lime-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77403687143098352)
,p_theme_id=>101
,p_name=>'ORANGE'
,p_display_name=>'Orange'
,p_display_sequence=>1
,p_css_classes=>'waves-orange'
,p_group_id=>wwv_flow_api.id(77400868350098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77403788335098352)
,p_theme_id=>101
,p_name=>'ORANGE_TEXT'
,p_display_name=>'Orange'
,p_display_sequence=>1
,p_css_classes=>'orange-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77403970395098352)
,p_theme_id=>101
,p_name=>'PINK_TEXT'
,p_display_name=>'Pink'
,p_display_sequence=>1
,p_css_classes=>'pink-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77404002284098352)
,p_theme_id=>101
,p_name=>'PURPLE'
,p_display_name=>'Purple'
,p_display_sequence=>1
,p_css_classes=>'waves-purple'
,p_group_id=>wwv_flow_api.id(77400868350098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77404080637098352)
,p_theme_id=>101
,p_name=>'PURPLE_TEXT'
,p_display_name=>'Purple'
,p_display_sequence=>1
,p_css_classes=>'purple-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77404214580098352)
,p_theme_id=>101
,p_name=>'RAISED'
,p_display_name=>'Raised'
,p_display_sequence=>1
,p_css_classes=>'btn'
,p_group_id=>wwv_flow_api.id(77400454955098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77404349541098352)
,p_theme_id=>101
,p_name=>'RED'
,p_display_name=>'Red'
,p_display_sequence=>1
,p_css_classes=>'waves-red'
,p_group_id=>wwv_flow_api.id(77400868350098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77404423981098352)
,p_theme_id=>101
,p_name=>'RED_TEXT'
,p_display_name=>'Red'
,p_display_sequence=>1
,p_css_classes=>'red-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77404650591098352)
,p_theme_id=>101
,p_name=>'REGION_BG_AMBER'
,p_display_name=>'Amber'
,p_display_sequence=>1
,p_css_classes=>'amber'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77404712815098352)
,p_theme_id=>101
,p_name=>'REGION_BG_BLACK'
,p_display_name=>'Black'
,p_display_sequence=>1
,p_css_classes=>'black'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77404841149098352)
,p_theme_id=>101
,p_name=>'REGION_BG_BLUE'
,p_display_name=>'Blue'
,p_display_sequence=>1
,p_css_classes=>'blue'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77404896449098352)
,p_theme_id=>101
,p_name=>'REGION_BG_BLUE_GREY'
,p_display_name=>'Blue Grey'
,p_display_sequence=>1
,p_css_classes=>'blue-grey'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77405040706098352)
,p_theme_id=>101
,p_name=>'REGION_BG_BROWN'
,p_display_name=>'Brown'
,p_display_sequence=>1
,p_css_classes=>'brown'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77405129277098352)
,p_theme_id=>101
,p_name=>'REGION_BG_CYAN'
,p_display_name=>'Cyan'
,p_display_sequence=>1
,p_css_classes=>'cyan'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77405173540098352)
,p_theme_id=>101
,p_name=>'REGION_BG_DEEP_ORANGE'
,p_display_name=>'Deep Orange'
,p_display_sequence=>1
,p_css_classes=>'deep-orange'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77405299628098352)
,p_theme_id=>101
,p_name=>'REGION_BG_DEEP_PURPLE'
,p_display_name=>'Deep Purple'
,p_display_sequence=>1
,p_css_classes=>'deep-purple'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77405431033098352)
,p_theme_id=>101
,p_name=>'REGION_BG_GREEN'
,p_display_name=>'Green'
,p_display_sequence=>1
,p_css_classes=>'green'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77405537273098352)
,p_theme_id=>101
,p_name=>'REGION_BG_GREY'
,p_display_name=>'Grey'
,p_display_sequence=>1
,p_css_classes=>'grey'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77405575505098352)
,p_theme_id=>101
,p_name=>'REGION_BG_INDIGO'
,p_display_name=>'Indigo'
,p_display_sequence=>1
,p_css_classes=>'indigo'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77405697341098352)
,p_theme_id=>101
,p_name=>'REGION_BG_LIGHT_BLUE'
,p_display_name=>'Light Blue'
,p_display_sequence=>1
,p_css_classes=>'light-blue'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77405861616098352)
,p_theme_id=>101
,p_name=>'REGION_BG_LIGHT_GREEN'
,p_display_name=>'Light Green'
,p_display_sequence=>1
,p_css_classes=>'light-green'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77405878115098352)
,p_theme_id=>101
,p_name=>'REGION_BG_LIME'
,p_display_name=>'Lime'
,p_display_sequence=>1
,p_css_classes=>'lime'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77406009226098353)
,p_theme_id=>101
,p_name=>'REGION_BG_ORANGE'
,p_display_name=>'Orange'
,p_display_sequence=>1
,p_css_classes=>'orange'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77406151719098353)
,p_theme_id=>101
,p_name=>'REGION_BG_PINK'
,p_display_name=>'Pink'
,p_display_sequence=>1
,p_css_classes=>'pink'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77406244934098353)
,p_theme_id=>101
,p_name=>'REGION_BG_PURPLE'
,p_display_name=>'Purple'
,p_display_sequence=>1
,p_css_classes=>'purple'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77406323227098353)
,p_theme_id=>101
,p_name=>'REGION_BG_RED'
,p_display_name=>'Red'
,p_display_sequence=>1
,p_css_classes=>'red'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77406393976098353)
,p_theme_id=>101
,p_name=>'REGION_BG_TEAL'
,p_display_name=>'Teal'
,p_display_sequence=>1
,p_css_classes=>'teal'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77406539429098353)
,p_theme_id=>101
,p_name=>'REGION_BG_TRANSPARENT'
,p_display_name=>'Transparent'
,p_display_sequence=>1
,p_css_classes=>'transparent'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77406662765098353)
,p_theme_id=>101
,p_name=>'REGION_BG_WHITE'
,p_display_name=>'White'
,p_display_sequence=>1
,p_css_classes=>'white'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77406756953098353)
,p_theme_id=>101
,p_name=>'REGION_BG_YELLOW'
,p_display_name=>'Yellow'
,p_display_sequence=>1
,p_css_classes=>'yellow'
,p_group_id=>wwv_flow_api.id(77404485504098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77406936817098353)
,p_theme_id=>101
,p_name=>'REGION_HIDDEN_FOR_ALL_DEVICES'
,p_display_name=>'Hidden for all Devices'
,p_display_sequence=>1
,p_css_classes=>'hide'
,p_group_id=>wwv_flow_api.id(77406777001098353)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77407006650098353)
,p_theme_id=>101
,p_name=>'REGION_HIDDEN_FOR_MOBILE_ONLY'
,p_display_name=>'Hidden for Small Only'
,p_display_sequence=>1
,p_css_classes=>'hide-on-small-only'
,p_group_id=>wwv_flow_api.id(77406777001098353)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77407124352098353)
,p_theme_id=>101
,p_name=>'REGION_HIDDEN_FOR_TABLET_ONLY'
,p_display_name=>'Hidden for Medium Only'
,p_display_sequence=>1
,p_css_classes=>'hide-on-med-only'
,p_group_id=>wwv_flow_api.id(77406777001098353)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77407219368098353)
,p_theme_id=>101
,p_name=>'RIGHT'
,p_display_name=>'Right'
,p_display_sequence=>1
,p_css_classes=>'right'
,p_group_id=>wwv_flow_api.id(77402295544098352)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77407341025098353)
,p_theme_id=>101
,p_name=>'RIGHT'
,p_display_name=>'Right'
,p_display_sequence=>1
,p_css_classes=>'right-align'
,p_group_id=>wwv_flow_api.id(77398278066098350)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77407420683098353)
,p_theme_id=>101
,p_name=>'RIGHT_FLOAT'
,p_display_name=>'Right'
,p_display_sequence=>1
,p_css_classes=>'right'
,p_group_id=>wwv_flow_api.id(77402648580098352)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77407552669098353)
,p_theme_id=>101
,p_name=>'R_HIDDEN_FOR_DESKTOP_ONLY'
,p_display_name=>'Hidden for Large Only'
,p_display_sequence=>1
,p_css_classes=>'hide-on-large-only'
,p_group_id=>wwv_flow_api.id(77406777001098353)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77407603813098353)
,p_theme_id=>101
,p_name=>'R_HIDDEN_FOR_SMALL_AND_LARGE'
,p_display_name=>'Hidden for Small and Large'
,p_display_sequence=>1
,p_css_classes=>'hide-on-small-only hide-on-large-only'
,p_group_id=>wwv_flow_api.id(77406777001098353)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77407725962098353)
,p_theme_id=>101
,p_name=>'R_HIDDEN_FOR_TABLET_AND_ABOVE'
,p_display_name=>'Hidden for Medium and Above'
,p_display_sequence=>1
,p_css_classes=>'hide-on-med-and-up'
,p_group_id=>wwv_flow_api.id(77406777001098353)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77407844412098353)
,p_theme_id=>101
,p_name=>'R_HIDDEN_FOR_TABLET_AND_BELOW'
,p_display_name=>'Hidden for Medium and Below'
,p_display_sequence=>1
,p_css_classes=>'hide-on-med-and-down'
,p_group_id=>wwv_flow_api.id(77406777001098353)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77407883245098353)
,p_theme_id=>101
,p_name=>'TEAL'
,p_display_name=>'Teal'
,p_display_sequence=>1
,p_css_classes=>'waves-teal'
,p_group_id=>wwv_flow_api.id(77400868350098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77408017262098353)
,p_theme_id=>101
,p_name=>'TEAL_TEXT'
,p_display_name=>'Teal'
,p_display_sequence=>1
,p_css_classes=>'teal-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77408122122098353)
,p_theme_id=>101
,p_name=>'TRUNCATE_TEXT_OVERFLOW'
,p_display_name=>'Truncate Text Overflow'
,p_display_sequence=>1
,p_css_classes=>'truncate'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77408239786098353)
,p_theme_id=>101
,p_name=>'VERTICAL_ALIGNED'
,p_display_name=>'Vertical Aligned'
,p_display_sequence=>1
,p_css_classes=>'valign-wrapper'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77408284661098353)
,p_theme_id=>101
,p_name=>'WAVE_EFFECT'
,p_display_name=>'Wave Effect'
,p_display_sequence=>1
,p_css_classes=>'waves-effect'
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77408439228098353)
,p_theme_id=>101
,p_name=>'WHITE'
,p_display_name=>'White'
,p_display_sequence=>1
,p_css_classes=>'white-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77408524833098353)
,p_theme_id=>101
,p_name=>'YELLOW'
,p_display_name=>'Yellow'
,p_display_sequence=>1
,p_css_classes=>'waves-yellow'
,p_group_id=>wwv_flow_api.id(77400868350098351)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(77408613738098353)
,p_theme_id=>101
,p_name=>'YELLOW_TEXT'
,p_display_name=>'Yellow'
,p_display_sequence=>1
,p_css_classes=>'yellow-text'
,p_group_id=>wwv_flow_api.id(77391470187098348)
,p_template_types=>'REGION'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts
begin
null;
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(77450323033128766)
,p_name=>'USR Table (Custom)'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'api_auth.do_login'
,p_attribute_05=>'N'
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'f?p=&APP_ID.:101'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/com_apex_evangelists_add2home
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(58399516564223906)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.APEX-EVANGELISTS.ADD2HOME'
,p_display_name=>'Add to Home Screen'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','COM.APEX-EVANGELISTS.ADD2HOME'),'')
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function add2home (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin )',
'    return apex_plugin.t_dynamic_action_render_result',
'is',
'',
'    l_result           apex_plugin.t_dynamic_action_render_result;',
'    l_config           varchar2(1000);',
'',
'    l_returningVisitor boolean       := upper(p_dynamic_action.attribute_01) =''Y''; ',
'    l_animationIn      varchar2(6)   := nvl(lower(p_dynamic_action.attribute_02),''drop''); ',
'    l_animationOut     varchar2(6)   := nvl(lower(p_dynamic_action.attribute_03),''fade''); ',
'    l_startDelay       number(6,0)   := nvl(to_number(p_dynamic_action.attribute_04),2000);',
'    l_lifespan         number(6,0)   := nvl(to_number(p_dynamic_action.attribute_05),20000);',
'    l_bottomOffset     number(3,0)   := nvl(to_number(p_dynamic_action.attribute_06),14);',
'    l_expire           number(3,0)   := nvl(to_number(p_dynamic_action.attribute_07),0);',
'    l_message          varchar2(255) := p_dynamic_action.attribute_08;',
'    l_touchIcon        boolean       := upper(p_dynamic_action.attribute_09) =''Y''; ',
'    l_arrow            boolean       := upper(p_dynamic_action.attribute_10) =''Y''; ',
'',
'begin',
'',
'    -- During plug-in development it''s very helpful to have some debug information',
'    if apex_application.g_debug then',
'        apex_plugin_util.debug_dynamic_action (',
'            p_plugin         => p_plugin,',
'            p_dynamic_action => p_dynamic_action );',
'    end if;',
'',
'    -- Register the javascript and CSS library the plug-in uses.',
'    apex_css.add_file (',
'        p_name      => ''add2home'',',
'        p_directory => p_plugin.file_prefix,',
'        p_version   => null );',
' ',
'    apex_javascript.add_library (',
'        p_name      => ''add2home'',',
'        p_directory => p_plugin.file_prefix,',
'        p_version   => null );',
'',
'   l_config := ''{''||',
'                apex_javascript.add_attribute(''returningVisitor'', l_returningVisitor)|| ',
'                apex_javascript.add_attribute(''animationIn''     , l_animationIn)|| ',
'                apex_javascript.add_attribute(''animationOut''    , l_animationOut)|| ',
'                apex_javascript.add_attribute(''startDelay''      , l_startDelay)|| ',
'                apex_javascript.add_attribute(''lifespan''        , l_lifespan)|| ',
'                apex_javascript.add_attribute(''bottomOffset''    , l_bottomOffset)|| ',
'                apex_javascript.add_attribute(''expire''          , l_expire)|| ',
'                apex_javascript.add_attribute(''message''         , l_message)|| ',
'                apex_javascript.add_attribute(''touchIcon''       , l_touchIcon)|| ',
'                apex_javascript.add_attribute(''arrow''           , l_arrow, true, false)|| ',
'               ''}'';',
'',
'    l_result.javascript_function := ''addToHome.show( ''||l_config||'' )'';',
'',
'    return l_result;',
'',
'end add2home;'))
,p_render_function=>'Add2Home'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'	The <strong>Add to Home Screen</strong>&nbsp;dynamic action plug-in provides an unobtrusive stylish popup to indicate the IOS option of Adding the URL to the Home Screen .</p>',
'<p>',
'	The plug-in is based on the code and examples provided on&nbsp;<a href="http://cubiq.org/add-to-home-screen">http://cubiq.org/add-to-home-screen</a></p>',
'<p>',
'	Suggested use : With a &nbsp;Page Load Dynamic Action on the Login Screen or Main Menu page of your app.</p>'))
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58473527196117581)
,p_plugin_id=>wwv_flow_api.id(58399516564223906)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Returning Visitor'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Show the message to returning visitors only. The first time a user accesses your site the message is not shown. If the user comes back within a 28 days timeframe, the message is presented.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58473920295120813)
,p_plugin_id=>wwv_flow_api.id(58399516564223906)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Animation In'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'drop'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'The animation the balloon appears with.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(58474317492122100)
,p_plugin_attribute_id=>wwv_flow_api.id(58473920295120813)
,p_display_sequence=>10
,p_display_value=>'drop'
,p_return_value=>'drop'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(58474715982122785)
,p_plugin_attribute_id=>wwv_flow_api.id(58473920295120813)
,p_display_sequence=>20
,p_display_value=>'bubble'
,p_return_value=>'bubble'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(58475114688123342)
,p_plugin_attribute_id=>wwv_flow_api.id(58473920295120813)
,p_display_sequence=>30
,p_display_value=>'fade'
,p_return_value=>'fade'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58475840339126605)
,p_plugin_id=>wwv_flow_api.id(58399516564223906)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Animation Out'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'fade'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'The animation the balloon exits with.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(58476239261127115)
,p_plugin_attribute_id=>wwv_flow_api.id(58475840339126605)
,p_display_sequence=>10
,p_display_value=>'drop'
,p_return_value=>'drop'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(58476637751127823)
,p_plugin_attribute_id=>wwv_flow_api.id(58475840339126605)
,p_display_sequence=>20
,p_display_value=>'bubble'
,p_return_value=>'bubble'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(58477036458128437)
,p_plugin_attribute_id=>wwv_flow_api.id(58475840339126605)
,p_display_sequence=>30
,p_display_value=>'fade'
,p_return_value=>'fade'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58478140327141730)
,p_plugin_id=>wwv_flow_api.id(58399516564223906)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Start Delay'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'2000'
,p_display_length=>5
,p_max_length=>5
,p_is_translatable=>false
,p_help_text=>'Milliseconds to wait before showing the message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58478527603147457)
,p_plugin_id=>wwv_flow_api.id(58399516564223906)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Lifespan'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'20000'
,p_display_length=>5
,p_max_length=>5
,p_is_translatable=>false
,p_help_text=>'Milliseconds to wait before hiding the message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58478919839150973)
,p_plugin_id=>wwv_flow_api.id(58399516564223906)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Bottom Offset'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'14'
,p_display_length=>5
,p_max_length=>5
,p_is_translatable=>false
,p_help_text=>'Distance in pixels from the bottom (iPhone) or the top (iPad)'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58479343334155309)
,p_plugin_id=>wwv_flow_api.id(58399516564223906)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Expire'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'0'
,p_display_length=>5
,p_max_length=>5
,p_is_translatable=>false
,p_help_text=>'Minutes before displaying the message again. If you don’t want to show the message at each and every page load, you can set a timeframe in minutes. The message will be shown only one time inside that timeframe. Default: 0 (=always show).'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58479726297163098)
,p_plugin_id=>wwv_flow_api.id(58399516564223906)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Message'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Define a custom message to display OR set a fixed locale. If you don’t like the default message we have chosen for you, you can add your own. You can also force a language by passing the respective locale (eg: ‘en_us’ will always display the English '
||'message). Default: ” (=script decides).'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58480115945167893)
,p_plugin_id=>wwv_flow_api.id(58399516564223906)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Touch Icon'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'If "Yes", the script checks for link rel="apple-touch-icon" in the page HEAD and displays the application icon next to the message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58480539440172152)
,p_plugin_id=>wwv_flow_api.id(58399516564223906)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Arrow'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Shows the little arrow pointing the bottom bar “add” icon. For custom designs you may want to disable it (ie: set it to NO). '
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A2A0A202A0A202A204D61696E20636F6E7461696E65720A202A0A202A2F0A23616464546F486F6D6553637265656E207B0A097A2D696E6465783A393939393B0A092D7765626B69742D757365722D73656C6563743A6E6F6E653B0A09757365722D73';
wwv_flow_api.g_varchar2_table(2) := '656C6563743A6E6F6E653B0A092D7765626B69742D626F782D73697A696E673A626F726465722D626F783B0A09626F782D73697A696E673A626F726465722D626F783B0A092D7765626B69742D746F7563682D63616C6C6F75743A6E6F6E653B0A09746F';
wwv_flow_api.g_varchar2_table(3) := '7563682D63616C6C6F75743A6E6F6E653B0A0977696474683A32343070783B0A09666F6E742D73697A653A313570783B0A0970616464696E673A3132707820313470783B0A09746578742D616C69676E3A6C6566743B0A09666F6E742D66616D696C793A';
wwv_flow_api.g_varchar2_table(4) := '68656C7665746963613B0A096261636B67726F756E642D696D6167653A2D7765626B69742D6772616469656E74286C696E6561722C3020302C3020313030252C636F6C6F722D73746F7028302C23666666292C636F6C6F722D73746F7028302E30322C23';
wwv_flow_api.g_varchar2_table(5) := '656565292C636F6C6F722D73746F7028302E39382C23636363292C636F6C6F722D73746F7028312C2361336133613329293B0A09626F726465723A31707820736F6C696420233530353035303B0A092D7765626B69742D626F726465722D726164697573';
wwv_flow_api.g_varchar2_table(6) := '3A3870783B0A092D7765626B69742D6261636B67726F756E642D636C69703A70616464696E672D626F783B0A09636F6C6F723A233333333B0A09746578742D736861646F773A302031707820302072676261283235352C3235352C3235352C302E373529';
wwv_flow_api.g_varchar2_table(7) := '3B0A096C696E652D6865696768743A313330253B0A092D7765626B69742D626F782D736861646F773A30203020347078207267626128302C302C302C302E35293B0A7D0A0A23616464546F486F6D6553637265656E2E616464546F486F6D654970616420';
wwv_flow_api.g_varchar2_table(8) := '7B0A0977696474683A32363870783B0A09666F6E742D73697A653A313870783B0A0970616464696E673A313470783B0A7D0A0A2F2A2A0A202A0A202A205468652027776964652720636C617373206973206164646564207768656E2074686520706F7075';
wwv_flow_api.g_varchar2_table(9) := '7020636F6E7461696E732074686520746F7563682069636F6E0A202A0A202A2F0A23616464546F486F6D6553637265656E2E616464546F486F6D6557696465207B0A0977696474683A32393670783B0A7D0A0A23616464546F486F6D6553637265656E2E';
wwv_flow_api.g_varchar2_table(10) := '616464546F486F6D65497061642E616464546F486F6D6557696465207B0A0977696474683A33323070783B0A09666F6E742D73697A653A313870783B0A0970616464696E673A313470783B0A7D0A0A2F2A2A0A202A0A202A205468652062616C6C6F6F6E';
wwv_flow_api.g_varchar2_table(11) := '206172726F770A202A0A202A2F0A23616464546F486F6D6553637265656E202E616464546F486F6D654172726F77207B0A09706F736974696F6E3A6162736F6C7574653B0A096261636B67726F756E642D696D6167653A2D7765626B69742D6772616469';
wwv_flow_api.g_varchar2_table(12) := '656E74286C696E6561722C3020302C3130302520313030252C636F6C6F722D73746F7028302C72676261283230342C3230342C3230342C3029292C636F6C6F722D73746F7028302E342C72676261283230342C3230342C3230342C3029292C636F6C6F72';
wwv_flow_api.g_varchar2_table(13) := '2D73746F7028302E342C2363636329293B0A09626F726465722D77696474683A30203170782031707820303B0A09626F726465722D7374796C653A736F6C69643B0A09626F726465722D636F6C6F723A233530353035303B0A0977696474683A31367078';
wwv_flow_api.g_varchar2_table(14) := '3B206865696768743A313670783B0A092D7765626B69742D7472616E73666F726D3A726F746174655A283435646567293B0A09626F74746F6D3A2D3970783B206C6566743A3530253B0A096D617267696E2D6C6566743A2D3870783B0A092D7765626B69';
wwv_flow_api.g_varchar2_table(15) := '742D626F782D736861646F773A696E736574202D317078202D317078203020236139613961393B0A092D7765626B69742D626F726465722D626F74746F6D2D72696768742D7261646975733A3270783B0A7D0A0A0A2F2A2A0A202A0A202A205468652062';
wwv_flow_api.g_varchar2_table(16) := '616C6C6F6F6E206172726F7720666F7220695061640A202A0A202A2F0A23616464546F486F6D6553637265656E2E616464546F486F6D6549706164202E616464546F486F6D654172726F77207B0A092D7765626B69742D7472616E73666F726D3A726F74';
wwv_flow_api.g_varchar2_table(17) := '6174655A282D313335646567293B0A096261636B67726F756E642D696D6167653A2D7765626B69742D6772616469656E74286C696E6561722C3020302C3130302520313030252C636F6C6F722D73746F7028302C72676261283233382C3233382C323338';
wwv_flow_api.g_varchar2_table(18) := '2C3029292C636F6C6F722D73746F7028302E342C72676261283233382C3233382C3233382C3029292C636F6C6F722D73746F7028302E342C2365656529293B0A092D7765626B69742D626F782D736861646F773A696E736574202D317078202D31707820';
wwv_flow_api.g_varchar2_table(19) := '3020236666663B0A09746F703A2D3970783B20626F74746F6D3A6175746F3B206C6566743A3530253B0A7D0A0A0A2F2A2A0A202A0A202A20436C6F736520627574746F6E0A202A0A202A2F0A23616464546F486F6D6553637265656E202E616464546F48';
wwv_flow_api.g_varchar2_table(20) := '6F6D65436C6F7365207B0A092D7765626B69742D626F782D73697A696E673A626F726465722D626F783B0A09706F736974696F6E3A6162736F6C7574653B0A0972696768743A3470783B0A09746F703A3470783B0A0977696474683A313870783B0A0968';
wwv_flow_api.g_varchar2_table(21) := '65696768743A313870783B206C696E652D6865696768743A313470783B0A09746578742D616C69676E3A63656E7465723B0A09746578742D696E64656E743A3170783B0A092D7765626B69742D626F726465722D7261646975733A3970783B0A09626163';
wwv_flow_api.g_varchar2_table(22) := '6B67726F756E643A7267626128302C302C302C302E3132293B0A09636F6C6F723A233730373037303B0A092D7765626B69742D626F782D736861646F773A3020317078203020236666663B0A09666F6E742D73697A653A313670783B0A7D0A0A0A2F2A2A';
wwv_flow_api.g_varchar2_table(23) := '0A202A0A202A2054686520272B272069636F6E2C20646973706C61796564206F6E6C79206F6E20694F53203C20342E320A202A0A202A2F0A23616464546F486F6D6553637265656E202E616464546F486F6D65506C7573207B0A09666F6E742D77656967';
wwv_flow_api.g_varchar2_table(24) := '68743A626F6C643B0A09666F6E742D73697A653A312E33656D3B0A7D0A0A0A2F2A2A0A202A0A202A2054686520277368617265272069636F6E2C20646973706C61796564206F6E6C79206F6E20694F53203E3D20342E320A202A0A202A2F0A2361646454';
wwv_flow_api.g_varchar2_table(25) := '6F486F6D6553637265656E202E616464546F486F6D655368617265207B0A09646973706C61793A696E6C696E652D626C6F636B3B0A0977696474683A313870783B0A096865696768743A313570783B0A096261636B67726F756E642D7265706561743A6E';
wwv_flow_api.g_varchar2_table(26) := '6F2D7265706561743B0A096261636B67726F756E642D696D6167653A75726C28646174613A696D6167652F706E673B6261736536342C6956424F5277304B47676F414141414E5355684555674141414249414141415043415141414142446A31655A4141';
wwv_flow_api.g_varchar2_table(27) := '4141475852465748525462325A30643246795A5142425A4739695A53424A6257466E5A564A6C5957523563636C6C504141414155644A524546554B464E746B4C744C7731415978532F714A4C6858564B72325A52756C554E74697167536233437A694943';
wwv_flow_api.g_varchar2_table(28) := '4936756354465659634F6E61514F465277556E4E5452775557586770502F5164484E554551554847786F665942546C52733833695A4E6A4B546E634F4765372F7678335163685855576E36464C336A68664B5564434372357A75696656356F446948514D';
wwv_flow_api.g_varchar2_table(29) := '2B632B43496869694353574E7530386971396F48584B4C416971726752345558716C4F45595A742B2B4578454C307757372B4F57304731306D754C7639676D716665354641574B6D544D59515969464C37505977794C4F44386C536A4E683267646E507A';
wwv_flow_api.g_varchar2_table(30) := '4D4949345155427863344F6F7468624146374743424B51305962535779505173496871766574532B79307967474D6F2F4B465A66766944765234416877675A55396447596E41304A2F366E6463313569336F7559494D63565655634558496F4F78436552';
wwv_flow_api.g_varchar2_table(31) := '436677503873584253646A747055762F3151572B4B31366B4343495543346964394661304A746B6C7577566B536671504C3652776653444130614E6C78376B2F62576756694237624D53322F31766B357364735A4C4E2F414C53754C3374796C4F345241';
wwv_flow_api.g_varchar2_table(32) := '41414141424A52553545726B4A6767673D3D293B0A096261636B67726F756E642D73697A653A3138707820313570783B0A09746578742D696E64656E743A2D39393939656D3B0A096F766572666C6F773A68696464656E3B0A7D0A0A0A2F2A2A0A202A0A';
wwv_flow_api.g_varchar2_table(33) := '202A2054686520746F7563682069636F6E2028696620617661696C61626C65290A202A0A202A2F0A23616464546F486F6D6553637265656E202E616464546F486F6D65546F75636849636F6E207B0A09646973706C61793A626C6F636B3B0A09666C6F61';
wwv_flow_api.g_varchar2_table(34) := '743A6C6566743B0A092D7765626B69742D626F726465722D7261646975733A3670783B0A09626F726465722D7261646975733A3670783B0A092D7765626B69742D626F782D736861646F773A302031707820337078207267626128302C302C302C302E35';
wwv_flow_api.g_varchar2_table(35) := '292C0A0909696E73657420302030203270782072676261283235352C3235352C3235352C302E39293B0A09626F782D736861646F773A302031707820337078207267626128302C302C302C302E35292C0A0909696E736574203020302032707820726762';
wwv_flow_api.g_varchar2_table(36) := '61283235352C3235352C3235352C302E39293B0A096261636B67726F756E642D7265706561743A6E6F2D7265706561743B0A0977696474683A353770783B206865696768743A353770783B0A092D7765626B69742D6261636B67726F756E642D73697A65';
wwv_flow_api.g_varchar2_table(37) := '3A3537707820353770783B0A096261636B67726F756E642D73697A653A3537707820353770783B0A096D617267696E3A302031327078203020303B0A09626F726465723A31707820736F6C696420233333333B0A092D7765626B69742D6261636B67726F';
wwv_flow_api.g_varchar2_table(38) := '756E642D636C69703A70616464696E672D626F783B0A096261636B67726F756E642D636C69703A70616464696E672D626F783B0A7D0A0A0A2F2A2A0A202A0A202A2054686520277368617265272069636F6E20666F7220726574696E6120646973706C61';
wwv_flow_api.g_varchar2_table(39) := '790A202A0A202A2F0A406D6564696120616C6C20616E6420282D7765626B69742D6D696E2D6465766963652D706978656C2D726174696F3A203229207B0A0923616464546F486F6D6553637265656E202E616464546F486F6D655368617265207B0A0909';
wwv_flow_api.g_varchar2_table(40) := '6261636B67726F756E642D696D6167653A75726C28646174613A696D6167652F706E673B6261736536342C6956424F5277304B47676F414141414E535568455567414141435141414141654341514141414475364854594141414450456C455156523458';
wwv_flow_api.g_varchar2_table(41) := '7133545832676352527A4138652F4D376D5676322B54534E70632F545A747259366A554771676153416D4543684B4C72594B30594830524643324353436B4566436768694B5530344A38714E696771366F732B69515639384D4857467756427251515257';
wwv_flow_api.g_varchar2_table(42) := '7332316C4277356377334E4E62312F756475373252474735593737497A5857373744377341776635736379596F4C3642475853444B465A776147704C76495561656F436B7658314D6D734D304E79366F525351594F4C7549532B595A4F7066516471736C';
wwv_flow_api.g_varchar2_table(43) := '705578635A727A5456417A3471507757324F3343654977432F52537A6559364F7731516855726B722B594F5766454B446B45503852696A3743484B4A6D7246534448426477474545357769474368504E2B506E54385664527445496C31643467526A2F31';
wwv_flow_api.g_varchar2_table(44) := '455665355A53424B476838697151706F2F466F352B33432F677A304D5967347A67776271646179312F513442384247513435642F486935346C616B437255356F624F6369644A7075312B4C673977686A616279614F594C6E72494246466152442B786532';
wwv_flow_api.g_varchar2_table(45) := '79624D4457593636476D502F5741396347664770304357687930776B4D4E38696E6570466948327256316A304E51534E5162464C52516E53382F385953444242706164667634435944756232666D6548444E41734C314D425755656C3069412B58696B36';
wwv_flow_api.g_varchar2_table(46) := '6548637976443376414D535531544775412F5952532B6444376F7643514E3433474B5246435532304B6433562F617644565679415A356E695445754C41352F7A424757673945454568664A4B4E32303054617438436D52415162392B777637736F506C48';
wwv_flow_api.g_varchar2_table(47) := '743274516F72737A31755062723048545934734A77724834377A4A5A77414242414B4C4D426F51586570776754776448436F2B66584D6B51346C7278456D5135416158697050714459395632766E3039746776545049373145454759784D2B2F754D4A4C';
wwv_flow_api.g_varchar2_table(48) := '4A34737670676157474B4F692F784B676D714C5355475355643566327649564A2F43674261544955735A375A42736E302B4E7A664D4F584C4643585179546379624E366570355A5A67554F486E376A70665570735A73686475675047662B45357A6A6279';
wwv_flow_api.g_varchar2_table(49) := '4854535279513878665250504D2F733633524865756B6E536F5432326D6A6D6D6E414F494D6B555A36443178536650504166643157464B4D33734F32434D614878384D314E6A6E584B48614147476B4F573043303257655948557A34714D74782B773567';
wwv_flow_api.g_varchar2_table(50) := '554453384E636B5965356C48734D5977435A45507945456D6A4C445A466D415337434476694D647879546B4D4E56424B456D594C7662695151424942426243514730346247517646577A3643667343514C57436967494C467763666B475942694F706259';
wwv_flow_api.g_varchar2_table(51) := '754F697A5441795979446443747247615247314C436B49674D5945466849305771515A6F536C62475279484B6534714F78376976326256515739647034646C4D2F78366B6D776E575163642F5133464371775445695435732B364435762F706230535348';
wwv_flow_api.g_varchar2_table(52) := '79673775684D574141414141456C46546B5375516D4343293B0A097D0A7D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(58400844636238498)
,p_plugin_id=>wwv_flow_api.id(58399516564223906)
,p_file_name=>'add2home.css'
,p_mime_type=>'text/css'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A210A202A2041646420746F20486F6D6573637265656E2076322E302E35207E20436F70797269676874202863292032303133204D617474656F205370696E656C6C692C20687474703A2F2F63756269712E6F72670A202A2052656C65617365642075';
wwv_flow_api.g_varchar2_table(2) := '6E646572204D4954206C6963656E73652C20687474703A2F2F63756269712E6F72672F6C6963656E73650A202A2F0A76617220616464546F486F6D65203D202866756E6374696F6E20287729207B0A09766172206E6176203D20772E6E6176696761746F';
wwv_flow_api.g_varchar2_table(3) := '722C0A0909697349446576696365203D2027706C6174666F726D2720696E206E617620262620282F6970686F6E657C69706F647C697061642F6769292E74657374286E61762E706C6174666F726D292C0A09096973495061642C0A09096973526574696E';
wwv_flow_api.g_varchar2_table(4) := '612C0A090969735361666172692C0A090969735374616E64616C6F6E652C0A09094F5356657273696F6E2C0A0909737461727458203D20302C0A0909737461727459203D20302C0A09096C6173745669736974203D20302C0A0909697345787069726564';
wwv_flow_api.g_varchar2_table(5) := '2C0A0909697353657373696F6E4163746976652C0A0909697352657475726E696E6756697369746F722C0A090962616C6C6F6F6E2C0A09096F76657272696465436865636B732C0A0A0909706F736974696F6E496E74657276616C2C0A0909636C6F7365';
wwv_flow_api.g_varchar2_table(6) := '54696D656F75742C0A0A09096F7074696F6E73203D207B0A0909096175746F73746172743A2066616C73652C0909092F2F204175746F6D61746963616C6C79206F70656E207468652062616C6C6F6F6E0A09090972657475726E696E6756697369746F72';
wwv_flow_api.g_varchar2_table(7) := '3A2066616C73652C092F2F2053686F77207468652062616C6C6F6F6E20746F2072657475726E696E672076697369746F7273206F6E6C79202873657474696E67207468697320746F207472756520697320484947484C5920524543434F4D454E44454429';
wwv_flow_api.g_varchar2_table(8) := '0A090909616E696D6174696F6E496E3A202764726F70272C09092F2F2064726F70207C7C20627562626C65207C7C20666164650A090909616E696D6174696F6E4F75743A202766616465272C09092F2F2064726F70207C7C20627562626C65207C7C2066';
wwv_flow_api.g_varchar2_table(9) := '6164650A090909737461727444656C61793A20323030302C0909092F2F2032207365636F6E64732066726F6D2070616765206C6F6164206265666F7265207468652062616C6C6F6F6E20617070656172730A0909096C6966657370616E3A203135303030';
wwv_flow_api.g_varchar2_table(10) := '2C0909092F2F203135207365636F6E6473206265666F7265206974206973206175746F6D61746963616C6C792064657374726F7965640A090909626F74746F6D4F66667365743A2031342C0909092F2F2044697374616E6365206F66207468652062616C';
wwv_flow_api.g_varchar2_table(11) := '6C6F6F6E2066726F6D20626F74746F6D0A0909096578706972653A20302C09090909092F2F204D696E7574657320746F2077616974206265666F72652073686F77696E672074686520706F70757020616761696E202830203D20616C7761797320646973';
wwv_flow_api.g_varchar2_table(12) := '706C61796564290A0909096D6573736167653A2027272C090909092F2F20437573746F6D697A6520796F7572206D657373616765206F7220666F7263652061206C616E677561676520282727203D206175746F6D61746963290A090909746F7563684963';
wwv_flow_api.g_varchar2_table(13) := '6F6E3A2066616C73652C0909092F2F20446973706C61792074686520746F7563682069636F6E0A0909096172726F773A20747275652C090909092F2F20446973706C6179207468652062616C6C6F6F6E206172726F770A090909686F6F6B4F6E4C6F6164';
wwv_flow_api.g_varchar2_table(14) := '3A20747275652C0909092F2F2053686F756C6420776520686F6F6B20746F206F6E6C6F6164206576656E743F20287265616C6C7920616476616E636564207573616765290A090909636C6F7365427574746F6E3A20747275652C0909092F2F204C657420';
wwv_flow_api.g_varchar2_table(15) := '746865207573657220636C6F7365207468652062616C6C6F6F6E0A090909697465726174696F6E733A20313030090909092F2F20496E7465726E616C2F6465627567207573650A09097D2C0A0A0909696E746C203D207B0A09090961723A20202020273C';
wwv_flow_api.g_varchar2_table(16) := '7370616E206469723D2272746C223ED982D98520D8A8D8AAD8ABD8A8D98AD8AA20D987D8B0D8A720D8A7D984D8AAD8B7D8A8D98AD98220D8B9D984D989203C7370616E206469723D226C7472223E256465766963653A3C2F7370616E3ED8A7D986D982D8';
wwv_flow_api.g_varchar2_table(17) := 'B13C7370616E206469723D226C7472223E2569636F6E3C2F7370616E3E20D88C3C7374726F6E673ED8ABD98520D8A7D8B6D981D98720D8A7D984D98920D8A7D984D8B4D8A7D8B4D8A920D8A7D984D8B1D8A6D98AD8B3D98AD8A92E3C2F7374726F6E673E';
wwv_flow_api.g_varchar2_table(18) := '3C2F7370616E3E272C0A09090963615F65733A202750657220696E7374616CC2B76C617220617175657374612061706C6963616369C3B320616C20766F737472652025646576696365207072656D6575202569636F6E2069206C6C61766F7273203C7374';
wwv_flow_api.g_varchar2_table(19) := '726F6E673E41666567697220612070616E74616C6C6120645C27696E6963693C2F7374726F6E673E2E272C0A09090963735F637A3A202750726F20696E7374616C6163692061706C696B616365206E612056C3A1C5A120256465766963652C2073746973';
wwv_flow_api.g_varchar2_table(20) := '6B6EC49B7465202569636F6E20612076206E6162C3AD646365203C7374726F6E673E50C59969646174206E6120706C6F6368753C2F7374726F6E673E2E272C0A09090964615F646B3A202754696C66C3B86A2064656E6E6520736964652074696C206469';
wwv_flow_api.g_varchar2_table(21) := '6E20256465766963653A207472796B2070C3A5202569636F6E206F67206465726566746572203C7374726F6E673E46C3B86A2074696C20686A656D6D65736BC3A6726D3C2F7374726F6E673E2E272C0A09090964655F64653A2027496E7374616C6C6965';
wwv_flow_api.g_varchar2_table(22) := '72656E20536965206469657365204170702061756620496872656D20256465766963653A202569636F6E20616E74697070656E20756E642064616E6E203C7374726F6E673E5A756D20486F6D652D42696C6473636869726D3C2F7374726F6E673E2E272C';
wwv_flow_api.g_varchar2_table(23) := '0A090909656C5F67723A2027CE95CEB3CEBACEB1CF84CEB1CF83CF84CEAECF83CEB5CF84CEB520CEB1CF85CF84CEAECEBD20CF84CEB7CEBD20CE95CF86CEB1CF81CEBCCEBFCEB3CEAE20CF83CF84CEAECEBD20CF83CF85CF83CEBACEB5CF85CEAE20CF83';
wwv_flow_api.g_varchar2_table(24) := 'CEB1CF8220256465766963653A202569636F6E20CEBCCEB5CF84CEAC20CF80CEB1CF84CEACCF84CEB5203C7374726F6E673ECEA0CF81CEBFCF83CEB8CEAECEBACEB720CF83CEB520CE91CF86CEB5CF84CEB7CF81CEAFCEB13C2F7374726F6E673E2E272C';
wwv_flow_api.g_varchar2_table(25) := '0A090909656E5F75733A2027496E7374616C6C20746869732077656220617070206F6E20796F757220256465766963653A20746170202569636F6E20616E64207468656E203C7374726F6E673E41646420746F20486F6D652053637265656E3C2F737472';
wwv_flow_api.g_varchar2_table(26) := '6F6E673E2E272C0A09090965735F65733A20275061726120696E7374616C617220657374612061707020656E20737520256465766963652C2070756C7365202569636F6E20792073656C656363696F6E65203C7374726F6E673E41C3B161646972206120';
wwv_flow_api.g_varchar2_table(27) := '70616E74616C6C6120646520696E6963696F3C2F7374726F6E673E2E272C0A09090966695F66693A20274173656E6E612074C3A46DC3A4207765622D736F76656C6C7573206C616974746565736565736920256465766963653A207061696E6120256963';
wwv_flow_api.g_varchar2_table(28) := '6F6E206A612073656E206AC3A46C6B65656E2076616C69747365203C7374726F6E673E4C6973C3A4C3A4204B6F74692D76616C696B6B6F6F6E3C2F7374726F6E673E2E272C0A09090966725F66723A2027416A6F7574657A206365747465206170706C69';
wwv_flow_api.g_varchar2_table(29) := '636174696F6E2073757220766F747265202564657669636520656E20636C697175616E7420737572202569636F6E2C2070756973203C7374726F6E673E416A6F7574657220C3A0206C5C27C3A96372616E20645C276163637565696C3C2F7374726F6E67';
wwv_flow_api.g_varchar2_table(30) := '3E2E272C0A09090968655F696C3A20273C7370616E206469723D2272746C223ED794D7AAD7A7D79F20D790D7A4D79CD799D7A7D7A6D799D79420D796D79520D7A2D79C20D7942D2564657669636520D7A9D79CD79A3A20D794D7A7D7A9202569636F6E20';
wwv_flow_api.g_varchar2_table(31) := 'D795D790D796203C7374726F6E673ED794D795D7A1D7A320D79CD79ED7A1D79A20D794D791D799D7AA3C2F7374726F6E673E2E3C2F7370616E3E272C0A09090968725F68723A2027496E7374616C6972616A206F76752061706C696B6163696A75206E61';
wwv_flow_api.g_varchar2_table(32) := '2073766F6A20256465766963653A206B6C696B6E69206E61202569636F6E2069206F646162657269203C7374726F6E673E446F64616A207520706FC48D65746E69207A61736C6F6E3C2F7374726F6E673E2E272C0A09090968755F68753A202754656C65';
wwv_flow_api.g_varchar2_table(33) := '70C3AD74736520657A742061207765622D616C6B616C6D617AC3A1737420617A20C3966E20256465766963652D6AC3A172613A206E796F6D6A6F6E2061202569636F6E2D7261206D616A642061203C7374726F6E673E46C5916BC3A97065726E79C59168';
wwv_flow_api.g_varchar2_table(34) := 'C3B67A206164C3A1733C2F7374726F6E673E20676F6D6272612E272C0A09090969745F69743A2027496E7374616C6C6120717565737461206170706C6963617A696F6E652073756C2074756F20256465766963653A207072656D69207375202569636F6E';
wwv_flow_api.g_varchar2_table(35) := '206520706F69203C7374726F6E673E41676769756E6769206120486F6D653C2F7374726F6E673E2E272C0A0909096A615F6A703A2027E38193E381AEE382A6E382A7E38396E382A2E38397E383AAE38292E38182E381AAE3819FE381AE25646576696365';
wwv_flow_api.g_varchar2_table(36) := 'E381ABE382A4E383B3E382B9E38388E383BCE383ABE38199E3828BE381ABE381AF2569636F6EE38292E382BFE38383E38397E38197E381A63C7374726F6E673EE3839BE383BCE383A0E794BBE99DA2E381ABE8BFBDE58AA03C2F7374726F6E673EE38292';
wwv_flow_api.g_varchar2_table(37) := 'E981B8E38293E381A7E3818FE381A0E38195E38184E38082272C0A0909096B6F5F6B723A202725646576696365EC979020EC9BB9EC95B1EC9D8420EC84A4ECB998ED9598EBA0A4EBA9B4202569636F6EEC9D8420ED84B0ECB99820ED9B842022ED9988ED';
wwv_flow_api.g_varchar2_table(38) := '9994EBA9B4EC979020ECB694EAB08022EBA5BC20EC84A0ED839DED9598EC84B8EC9A94272C0A0909096E625F6E6F3A2027496E7374616C6C65722064656E6E6520617070656E2070C3A52064696E20256465766963653A207472796B6B2070C3A5202569';
wwv_flow_api.g_varchar2_table(39) := '636F6E206F67206465726574746572203C7374726F6E673E4C6567672074696C2070C3A520486A656D2D736B6A65726D3C2F7374726F6E673E272C0A0909096E6C5F6E6C3A2027496E7374616C6C6565722064657A6520776562617070206F7020757720';
wwv_flow_api.g_varchar2_table(40) := '256465766963653A2074696B202569636F6E20656E2064616E203C7374726F6E673E566F656720746F652061616E20626567696E73636865726D3C2F7374726F6E673E2E272C0A090909706C5F706C3A2027416279207A61696E7374616C6F7761C48720';
wwv_flow_api.g_varchar2_table(41) := '74C4992061706C696B61636A65206E6120256465766963653A206E616369C59B6E696A202569636F6E2061206E617374C499706E6965203C7374726F6E673E446F64616A206A616B6F20696B6F6EC4993C2F7374726F6E673E2E272C0A09090970745F62';
wwv_flow_api.g_varchar2_table(42) := '723A2027496E7374616C6520657374652061706C6963617469766F20656D2073657520256465766963653A20617065727465202569636F6E20652073656C6563696F6E65203C7374726F6E673E41646963696F6E617220C3A02054656C6120496E696369';
wwv_flow_api.g_varchar2_table(43) := '6F3C2F7374726F6E673E2E272C0A09090970745F70743A20275061726120696E7374616C617220657374612061706C696361C3A7C3A36F206E6F2073657520256465766963652C207072696D61206F202569636F6E2065206465706F6973206F203C7374';
wwv_flow_api.g_varchar2_table(44) := '726F6E673E41646963696F6E617220616F20656372C3A3207072696E636970616C3C2F7374726F6E673E2E272C0A09090972755F72753A2027D0A3D181D182D0B0D0BDD0BED0B2D0B8D182D0B520D18DD182D0BE20D0B2D0B5D0B12DD0BFD180D0B8D0BB';
wwv_flow_api.g_varchar2_table(45) := 'D0BED0B6D0B5D0BDD0B8D0B520D0BDD0B020D0B2D0B0D18820256465766963653A20D0BDD0B0D0B6D0BCD0B8D182D0B5202569636F6E2C20D0B7D0B0D182D0B5D0BC203C7374726F6E673ED094D0BED0B1D0B0D0B2D0B8D182D18C20D0B220C2ABD094D0';
wwv_flow_api.g_varchar2_table(46) := 'BED0BCD0BED0B9C2BB3C2F7374726F6E673E2E272C0A09090973765F73653A20274CC3A467672074696C6C2064656E6E6120776562626170706C696B6174696F6E2070C3A52064696E20256465766963653A20747279636B2070C3A5202569636F6E206F';
wwv_flow_api.g_varchar2_table(47) := '63682064C3A4726566746572203C7374726F6E673E4CC3A467672074696C6C2070C3A52068656D736BC3A4726D656E3C2F7374726F6E673E2E272C0A09090974685F74683A2027E0B895E0B8B4E0B894E0B895E0B8B1E0B989E0B887E0B980E0B8A7E0B9';
wwv_flow_api.g_varchar2_table(48) := '87E0B89AE0B981E0B8ADE0B89EE0B8AF20E0B899E0B8B5E0B989E0B89AE0B899202564657669636520E0B882E0B8ADE0B887E0B884E0B8B8E0B8933A20E0B981E0B895E0B8B0202569636F6E20E0B981E0B8A5E0B8B0203C7374726F6E673EE0B980E0B8';
wwv_flow_api.g_varchar2_table(49) := '9EE0B8B4E0B988E0B8A1E0B897E0B8B5E0B988E0B8ABE0B899E0B989E0B8B2E0B888E0B8ADE0B982E0B8AEE0B8A13C2F7374726F6E673E272C0A09090974725F74723A2027427520757967756C616D6179C4B120256465766963655C276120656B6C656D';
wwv_flow_api.g_varchar2_table(50) := '656B2069C3A7696E202569636F6E2073696D676573696E6520736F6E726173C4B16E6461203C7374726F6E673E416E6120456B72616E6120456B6C653C2F7374726F6E673E2064C3BCC49F6D6573696E6520626173C4B16E2E272C0A0909097A685F636E';
wwv_flow_api.g_varchar2_table(51) := '3A2027E682A8E58FAFE4BBA5E5B086E6ADA4E5BA94E794A8E7A88BE5BC8FE5AE89E8A385E588B0E682A8E79A84202564657669636520E4B88AE38082E8AFB7E68C89202569636F6E20E784B6E5908EE782B9E980893C7374726F6E673EE6B7BBE58AA0E8';
wwv_flow_api.g_varchar2_table(52) := '87B3E4B8BBE5B18FE5B9953C2F7374726F6E673EE38082272C0A0909097A685F74773A2027E682A8E58FAFE4BBA5E5B087E6ADA4E68789E794A8E7A88BE5BC8FE5AE89E8A39DE588B0E682A8E79A84202564657669636520E4B88AE38082E8AB8BE68C89';
wwv_flow_api.g_varchar2_table(53) := '202569636F6E20E784B6E5BE8CE9BB9EE981B83C7374726F6E673EE58AA0E585A5E4B8BBE795ABE99DA2E89EA2E5B9953C2F7374726F6E673EE38082270A09097D3B0A0A0966756E6374696F6E20696E6974202829207B0A09092F2F205072656C696D69';
wwv_flow_api.g_varchar2_table(54) := '6E61727920636865636B2C20616C6C206675727468657220636865636B732061726520706572666F726D6564206F6E206944657669636573206F6E6C790A090969662028202169734944657669636520292072657475726E3B0A0A0909766172206E6F77';
wwv_flow_api.g_varchar2_table(55) := '203D20446174652E6E6F7728292C0A0909097469746C652C0A090909693B0A0A09092F2F204D65726765206C6F63616C207769746820676C6F62616C206F7074696F6E730A09096966202820772E616464546F486F6D65436F6E6669672029207B0A0909';
wwv_flow_api.g_varchar2_table(56) := '09666F722028206920696E20772E616464546F486F6D65436F6E6669672029207B0A090909096F7074696F6E735B695D203D20772E616464546F486F6D65436F6E6669675B695D3B0A0909097D0A09097D0A09096966202820216F7074696F6E732E6175';
wwv_flow_api.g_varchar2_table(57) := '746F73746172742029206F7074696F6E732E686F6F6B4F6E4C6F6164203D2066616C73653B0A0A0909697349506164203D20282F697061642F6769292E74657374286E61762E706C6174666F726D293B0A09096973526574696E61203D20772E64657669';
wwv_flow_api.g_varchar2_table(58) := '6365506978656C526174696F20262620772E646576696365506978656C526174696F203E20313B0A09096973536166617269203D20282F5361666172692F69292E74657374286E61762E61707056657273696F6E292026262021282F4372694F532F6929';
wwv_flow_api.g_varchar2_table(59) := '2E74657374286E61762E61707056657273696F6E293B0A090969735374616E64616C6F6E65203D206E61762E7374616E64616C6F6E653B0A09094F5356657273696F6E203D206E61762E61707056657273696F6E2E6D61746368282F4F5320285C642B5F';
wwv_flow_api.g_varchar2_table(60) := '5C642B292F69293B0A09094F5356657273696F6E203D204F5356657273696F6E5B315D203F202B4F5356657273696F6E5B315D2E7265706C61636528275F272C20272E2729203A20303B0A0A09096C6173745669736974203D202B772E6C6F63616C5374';
wwv_flow_api.g_varchar2_table(61) := '6F726167652E6765744974656D2827616464546F486F6D6527293B0A0A0909697353657373696F6E416374697665203D20772E73657373696F6E53746F726167652E6765744974656D2827616464546F486F6D6553657373696F6E27293B0A0909697352';
wwv_flow_api.g_varchar2_table(62) := '657475726E696E6756697369746F72203D206F7074696F6E732E72657475726E696E6756697369746F72203F206C6173745669736974202626206C6173745669736974202B2032382A32342A36302A36302A31303030203E206E6F77203A20747275653B';
wwv_flow_api.g_varchar2_table(63) := '0A0A09096966202820216C61737456697369742029206C6173745669736974203D206E6F773B0A0A09092F2F2049662069742069732065787069726564207765206E65656420746F20726569737375652061206E65772062616C6C6F6F6E0A0909697345';
wwv_flow_api.g_varchar2_table(64) := '787069726564203D20697352657475726E696E6756697369746F72202626206C6173745669736974203C3D206E6F773B0A0A090969662028206F7074696F6E732E686F6F6B4F6E4C6F6164202920772E6164644576656E744C697374656E657228276C6F';
wwv_flow_api.g_varchar2_table(65) := '6164272C206C6F616465642C2066616C7365293B0A0909656C7365206966202820216F7074696F6E732E686F6F6B4F6E4C6F6164202626206F7074696F6E732E6175746F73746172742029206C6F6164656428293B0A097D0A0A0966756E6374696F6E20';
wwv_flow_api.g_varchar2_table(66) := '6C6F61646564202829207B0A0909772E72656D6F76654576656E744C697374656E657228276C6F6164272C206C6F616465642C2066616C7365293B0A0A0909696620282021697352657475726E696E6756697369746F72202920772E6C6F63616C53746F';
wwv_flow_api.g_varchar2_table(67) := '726167652E7365744974656D2827616464546F486F6D65272C20446174652E6E6F772829293B0A0909656C73652069662028206F7074696F6E732E65787069726520262620697345787069726564202920772E6C6F63616C53746F726167652E73657449';
wwv_flow_api.g_varchar2_table(68) := '74656D2827616464546F486F6D65272C20446174652E6E6F772829202B206F7074696F6E732E657870697265202A203630303030293B0A0A09096966202820216F76657272696465436865636B73202626202820216973536166617269207C7C20216973';
wwv_flow_api.g_varchar2_table(69) := '45787069726564207C7C20697353657373696F6E416374697665207C7C2069735374616E64616C6F6E65207C7C2021697352657475726E696E6756697369746F72202920292072657475726E3B0A0A090976617220746F75636849636F6E203D2027272C';
wwv_flow_api.g_varchar2_table(70) := '0A090909706C6174666F726D203D206E61762E706C6174666F726D2E73706C697428272027295B305D2C0A0909096C616E6775616765203D206E61762E6C616E67756167652E7265706C61636528272D272C20275F27292C0A090909692C206C3B0A0A09';
wwv_flow_api.g_varchar2_table(71) := '0962616C6C6F6F6E203D20646F63756D656E742E637265617465456C656D656E74282764697627293B0A090962616C6C6F6F6E2E6964203D2027616464546F486F6D6553637265656E273B0A090962616C6C6F6F6E2E7374796C652E6373735465787420';
wwv_flow_api.g_varchar2_table(72) := '2B3D20276C6566743A2D3939393970783B2D7765626B69742D7472616E736974696F6E2D70726F70657274793A2D7765626B69742D7472616E73666F726D2C6F7061636974793B2D7765626B69742D7472616E736974696F6E2D6475726174696F6E3A30';
wwv_flow_api.g_varchar2_table(73) := '3B2D7765626B69742D7472616E73666F726D3A7472616E736C617465336428302C302C30293B706F736974696F6E3A27202B20284F5356657273696F6E203C2035203F20276162736F6C75746527203A2027666978656427293B0A0A09092F2F204C6F63';
wwv_flow_api.g_varchar2_table(74) := '616C697A65206D6573736167650A090969662028206F7074696F6E732E6D65737361676520696E20696E746C2029207B09092F2F20596F75206D617920666F7263652061206C616E677561676520646573706974652074686520757365722773206C6F63';
wwv_flow_api.g_varchar2_table(75) := '616C650A0909096C616E6775616765203D206F7074696F6E732E6D6573736167653B0A0909096F7074696F6E732E6D657373616765203D2027273B0A09097D0A090969662028206F7074696F6E732E6D657373616765203D3D3D2027272029207B090909';
wwv_flow_api.g_varchar2_table(76) := '2F2F205765206C6F6F6B20666F722061207375697461626C65206C616E6775616765202864656661756C74656420746F20656E5F7573290A0909096F7074696F6E732E6D657373616765203D206C616E677561676520696E20696E746C203F20696E746C';
wwv_flow_api.g_varchar2_table(77) := '5B6C616E67756167655D203A20696E746C5B27656E5F7573275D3B0A09097D0A0A090969662028206F7074696F6E732E746F75636849636F6E2029207B0A090909746F75636849636F6E203D206973526574696E61203F0A09090909646F63756D656E74';
wwv_flow_api.g_varchar2_table(78) := '2E717565727953656C6563746F72282768656164206C696E6B5B72656C5E3D6170706C652D746F7563682D69636F6E5D5B73697A65733D2231313478313134225D2C68656164206C696E6B5B72656C5E3D6170706C652D746F7563682D69636F6E5D5B73';
wwv_flow_api.g_varchar2_table(79) := '697A65733D2231343478313434225D2729203A0A09090909646F63756D656E742E717565727953656C6563746F72282768656164206C696E6B5B72656C5E3D6170706C652D746F7563682D69636F6E5D5B73697A65733D223537783537225D2C68656164';
wwv_flow_api.g_varchar2_table(80) := '206C696E6B5B72656C5E3D6170706C652D746F7563682D69636F6E5D27293B0A0A0909096966202820746F75636849636F6E2029207B0A09090909746F75636849636F6E203D20273C7370616E207374796C653D226261636B67726F756E642D696D6167';
wwv_flow_api.g_varchar2_table(81) := '653A75726C2827202B20746F75636849636F6E2E68726566202B2027292220636C6173733D22616464546F486F6D65546F75636849636F6E223E3C2F7370616E3E273B0A0909097D0A09097D0A0A090962616C6C6F6F6E2E636C6173734E616D65203D20';
wwv_flow_api.g_varchar2_table(82) := '28697349506164203F2027616464546F486F6D654970616427203A2027616464546F486F6D654970686F6E652729202B2028746F75636849636F6E203F202720616464546F486F6D655769646527203A202727293B0A090962616C6C6F6F6E2E696E6E65';
wwv_flow_api.g_varchar2_table(83) := '7248544D4C203D20746F75636849636F6E202B0A0909096F7074696F6E732E6D6573736167652E7265706C616365282725646576696365272C20706C6174666F726D292E7265706C61636528272569636F6E272C204F5356657273696F6E203E3D20342E';
wwv_flow_api.g_varchar2_table(84) := '32203F20273C7370616E20636C6173733D22616464546F486F6D655368617265223E3C2F7370616E3E27203A20273C7370616E20636C6173733D22616464546F486F6D65506C7573223E2B3C2F7370616E3E2729202B0A090909286F7074696F6E732E61';
wwv_flow_api.g_varchar2_table(85) := '72726F77203F20273C7370616E20636C6173733D22616464546F486F6D654172726F77223E3C2F7370616E3E27203A20272729202B0A090909286F7074696F6E732E636C6F7365427574746F6E203F20273C7370616E20636C6173733D22616464546F48';
wwv_flow_api.g_varchar2_table(86) := '6F6D65436C6F7365223E5C75303044373C2F7370616E3E27203A202727293B0A0A0909646F63756D656E742E626F64792E617070656E644368696C642862616C6C6F6F6E293B0A0A09092F2F204164642074686520636C6F736520616374696F6E0A0909';
wwv_flow_api.g_varchar2_table(87) := '69662028206F7074696F6E732E636C6F7365427574746F6E20292062616C6C6F6F6E2E6164644576656E744C697374656E65722827636C69636B272C20636C69636B65642C2066616C7365293B0A0A0909696620282021697349506164202626204F5356';
wwv_flow_api.g_varchar2_table(88) := '657273696F6E203E3D203620292077696E646F772E6164644576656E744C697374656E657228276F7269656E746174696F6E6368616E6765272C206F7269656E746174696F6E436865636B2C2066616C7365293B0A0A090973657454696D656F75742873';
wwv_flow_api.g_varchar2_table(89) := '686F772C206F7074696F6E732E737461727444656C6179293B0A097D0A0A0966756E6374696F6E2073686F77202829207B0A0909766172206475726174696F6E2C0A09090969506164585368696674203D203230383B0A0A09092F2F2053657420746865';
wwv_flow_api.g_varchar2_table(90) := '20696E697469616C20706F736974696F6E0A090969662028206973495061642029207B0A09090969662028204F5356657273696F6E203C20352029207B0A09090909737461727459203D20772E7363726F6C6C593B0A09090909737461727458203D2077';
wwv_flow_api.g_varchar2_table(91) := '2E7363726F6C6C583B0A0909097D20656C73652069662028204F5356657273696F6E203C20362029207B0A0909090969506164585368696674203D203136303B0A0909097D0A0A09090962616C6C6F6F6E2E7374796C652E746F70203D20737461727459';
wwv_flow_api.g_varchar2_table(92) := '202B206F7074696F6E732E626F74746F6D4F6666736574202B20277078273B0A09090962616C6C6F6F6E2E7374796C652E6C656674203D20737461727458202B2069506164585368696674202D204D6174682E726F756E642862616C6C6F6F6E2E6F6666';
wwv_flow_api.g_varchar2_table(93) := '7365745769647468202F203229202B20277078273B0A0A0909097377697463682028206F7074696F6E732E616E696D6174696F6E496E2029207B0A0909090963617365202764726F70273A0A09090909096475726174696F6E203D2027302E3673273B0A';
wwv_flow_api.g_varchar2_table(94) := '090909090962616C6C6F6F6E2E7374796C652E7765626B69745472616E73666F726D203D20277472616E736C617465336428302C27202B202D28772E7363726F6C6C59202B206F7074696F6E732E626F74746F6D4F6666736574202B2062616C6C6F6F6E';
wwv_flow_api.g_varchar2_table(95) := '2E6F666673657448656967687429202B202770782C3029273B0A0909090909627265616B3B0A09090909636173652027627562626C65273A0A09090909096475726174696F6E203D2027302E3673273B0A090909090962616C6C6F6F6E2E7374796C652E';
wwv_flow_api.g_varchar2_table(96) := '6F706163697479203D202730273B0A090909090962616C6C6F6F6E2E7374796C652E7765626B69745472616E73666F726D203D20277472616E736C617465336428302C27202B2028737461727459202B20353029202B202770782C3029273B0A09090909';
wwv_flow_api.g_varchar2_table(97) := '09627265616B3B0A0909090964656661756C743A0A09090909096475726174696F6E203D20273173273B0A090909090962616C6C6F6F6E2E7374796C652E6F706163697479203D202730273B0A0909097D0A09097D20656C7365207B0A09090973746172';
wwv_flow_api.g_varchar2_table(98) := '7459203D20772E696E6E6572486569676874202B20772E7363726F6C6C593B0A0A09090969662028204F5356657273696F6E203C20352029207B0A09090909737461727458203D204D6174682E726F756E642828772E696E6E65725769647468202D2062';
wwv_flow_api.g_varchar2_table(99) := '616C6C6F6F6E2E6F6666736574576964746829202F203229202B20772E7363726F6C6C583B0A0909090962616C6C6F6F6E2E7374796C652E6C656674203D20737461727458202B20277078273B0A0909090962616C6C6F6F6E2E7374796C652E746F7020';
wwv_flow_api.g_varchar2_table(100) := '3D20737461727459202D2062616C6C6F6F6E2E6F6666736574486569676874202D206F7074696F6E732E626F74746F6D4F6666736574202B20277078273B0A0909097D20656C7365207B0A0909090962616C6C6F6F6E2E7374796C652E6C656674203D20';
wwv_flow_api.g_varchar2_table(101) := '27353025273B0A0909090962616C6C6F6F6E2E7374796C652E6D617267696E4C656674203D202D4D6174682E726F756E642862616C6C6F6F6E2E6F66667365745769647468202F203229202D202820772E6F7269656E746174696F6E2531383020262620';
wwv_flow_api.g_varchar2_table(102) := '4F5356657273696F6E203E3D2036203F203430203A20302029202B20277078273B0A0909090962616C6C6F6F6E2E7374796C652E626F74746F6D203D206F7074696F6E732E626F74746F6D4F6666736574202B20277078273B0A0909097D0A0A09090973';
wwv_flow_api.g_varchar2_table(103) := '776974636820286F7074696F6E732E616E696D6174696F6E496E29207B0A0909090963617365202764726F70273A0A09090909096475726174696F6E203D20273173273B0A090909090962616C6C6F6F6E2E7374796C652E7765626B69745472616E7366';
wwv_flow_api.g_varchar2_table(104) := '6F726D203D20277472616E736C617465336428302C27202B202D28737461727459202B206F7074696F6E732E626F74746F6D4F666673657429202B202770782C3029273B0A0909090909627265616B3B0A09090909636173652027627562626C65273A0A';
wwv_flow_api.g_varchar2_table(105) := '09090909096475726174696F6E203D2027302E3673273B0A090909090962616C6C6F6F6E2E7374796C652E7765626B69745472616E73666F726D203D20277472616E736C617465336428302C27202B202862616C6C6F6F6E2E6F66667365744865696768';
wwv_flow_api.g_varchar2_table(106) := '74202B206F7074696F6E732E626F74746F6D4F6666736574202B20353029202B202770782C3029273B0A0909090909627265616B3B0A0909090964656661756C743A0A09090909096475726174696F6E203D20273173273B0A090909090962616C6C6F6F';
wwv_flow_api.g_varchar2_table(107) := '6E2E7374796C652E6F706163697479203D202730273B0A0909097D0A09097D0A0A090962616C6C6F6F6E2E6F66667365744865696768743B092F2F2072657061696E7420747269636B0A090962616C6C6F6F6E2E7374796C652E7765626B69745472616E';
wwv_flow_api.g_varchar2_table(108) := '736974696F6E4475726174696F6E203D206475726174696F6E3B0A090962616C6C6F6F6E2E7374796C652E6F706163697479203D202731273B0A090962616C6C6F6F6E2E7374796C652E7765626B69745472616E73666F726D203D20277472616E736C61';
wwv_flow_api.g_varchar2_table(109) := '7465336428302C302C3029273B0A090962616C6C6F6F6E2E6164644576656E744C697374656E657228277765626B69745472616E736974696F6E456E64272C207472616E736974696F6E456E642C2066616C7365293B0A0A0909636C6F736554696D656F';
wwv_flow_api.g_varchar2_table(110) := '7574203D2073657454696D656F757428636C6F73652C206F7074696F6E732E6C6966657370616E293B0A097D0A0A0966756E6374696F6E206D616E75616C53686F7720282070436F6E6669672C206F7665727269646529207B0A0A090969662028202169';
wwv_flow_api.g_varchar2_table(111) := '7349446576696365207C7C2062616C6C6F6F6E20292072657475726E3B0A0A09092F2F204D65726765206C6F63616C207769746820676C6F62616C206F7074696F6E730A0909696620282070436F6E6669672029207B0A090909666F722028206920696E';
wwv_flow_api.g_varchar2_table(112) := '2070436F6E6669672029207B0A090909096F7074696F6E735B695D203D2070436F6E6669675B695D3B0A0909097D0A09097D0A0A09096F76657272696465436865636B73203D206F766572726964653B0A09096C6F6164656428293B0A097D0A0A096675';
wwv_flow_api.g_varchar2_table(113) := '6E6374696F6E20636C6F7365202829207B0A0909636C656172496E74657276616C2820706F736974696F6E496E74657276616C20293B0A0909636C65617254696D656F75742820636C6F736554696D656F757420293B0A0909636C6F736554696D656F75';
wwv_flow_api.g_varchar2_table(114) := '74203D206E756C6C3B0A0A09092F2F20636865636B2069662074686520706F70757020697320646973706C6179656420616E642070726576656E74206572726F72730A090969662028202162616C6C6F6F6E20292072657475726E3B0A0A090976617220';
wwv_flow_api.g_varchar2_table(115) := '706F7359203D20302C0A090909706F7358203D20302C0A0909096F706163697479203D202731272C0A0909096475726174696F6E203D202730273B0A0A090969662028206F7074696F6E732E636C6F7365427574746F6E20292062616C6C6F6F6E2E7265';
wwv_flow_api.g_varchar2_table(116) := '6D6F76654576656E744C697374656E65722827636C69636B272C20636C69636B65642C2066616C7365293B0A0909696620282021697349506164202626204F5356657273696F6E203E3D203620292077696E646F772E72656D6F76654576656E744C6973';
wwv_flow_api.g_varchar2_table(117) := '74656E657228276F7269656E746174696F6E6368616E6765272C206F7269656E746174696F6E436865636B2C2066616C7365293B0A0A090969662028204F5356657273696F6E203C20352029207B0A090909706F7359203D20697349506164203F20772E';
wwv_flow_api.g_varchar2_table(118) := '7363726F6C6C59202D20737461727459203A20772E7363726F6C6C59202B20772E696E6E6572486569676874202D207374617274593B0A090909706F7358203D20697349506164203F20772E7363726F6C6C58202D20737461727458203A20772E736372';
wwv_flow_api.g_varchar2_table(119) := '6F6C6C58202B204D6174682E726F756E642828772E696E6E65725769647468202D2062616C6C6F6F6E2E6F66667365745769647468292F3229202D207374617274583B0A09097D0A0A090962616C6C6F6F6E2E7374796C652E7765626B69745472616E73';
wwv_flow_api.g_varchar2_table(120) := '6974696F6E50726F7065727479203D20272D7765626B69742D7472616E73666F726D2C6F706163697479273B0A0A09097377697463682028206F7074696F6E732E616E696D6174696F6E4F75742029207B0A09090963617365202764726F70273A0A0909';
wwv_flow_api.g_varchar2_table(121) := '090969662028206973495061642029207B0A09090909096475726174696F6E203D2027302E3473273B0A09090909096F706163697479203D202730273B0A0909090909706F7359203D20706F7359202B2035303B0A090909097D20656C7365207B0A0909';
wwv_flow_api.g_varchar2_table(122) := '0909096475726174696F6E203D2027302E3673273B0A0909090909706F7359203D20706F7359202B2062616C6C6F6F6E2E6F6666736574486569676874202B206F7074696F6E732E626F74746F6D4F6666736574202B2035303B0A090909097D0A090909';
wwv_flow_api.g_varchar2_table(123) := '09627265616B3B0A090909636173652027627562626C65273A0A0909090969662028206973495061642029207B0A09090909096475726174696F6E203D2027302E3873273B0A0909090909706F7359203D20706F7359202D2062616C6C6F6F6E2E6F6666';
wwv_flow_api.g_varchar2_table(124) := '736574486569676874202D206F7074696F6E732E626F74746F6D4F6666736574202D2035303B0A090909097D20656C7365207B0A09090909096475726174696F6E203D2027302E3473273B0A09090909096F706163697479203D202730273B0A09090909';
wwv_flow_api.g_varchar2_table(125) := '09706F7359203D20706F7359202D2035303B0A090909097D0A09090909627265616B3B0A09090964656661756C743A0A090909096475726174696F6E203D2027302E3873273B0A090909096F706163697479203D202730273B0A09097D0A0A090962616C';
wwv_flow_api.g_varchar2_table(126) := '6C6F6F6E2E6164644576656E744C697374656E657228277765626B69745472616E736974696F6E456E64272C207472616E736974696F6E456E642C2066616C7365293B0A090962616C6C6F6F6E2E7374796C652E6F706163697479203D206F7061636974';
wwv_flow_api.g_varchar2_table(127) := '793B0A090962616C6C6F6F6E2E7374796C652E7765626B69745472616E736974696F6E4475726174696F6E203D206475726174696F6E3B0A090962616C6C6F6F6E2E7374796C652E7765626B69745472616E73666F726D203D20277472616E736C617465';
wwv_flow_api.g_varchar2_table(128) := '33642827202B20706F7358202B202770782C27202B20706F7359202B202770782C3029273B0A097D0A0A0A0966756E6374696F6E20636C69636B6564202829207B0A0909772E73657373696F6E53746F726167652E7365744974656D2827616464546F48';
wwv_flow_api.g_varchar2_table(129) := '6F6D6553657373696F6E272C20273127293B0A0909697353657373696F6E416374697665203D20747275653B0A0909636C6F736528293B0A097D0A0A0966756E6374696F6E207472616E736974696F6E456E64202829207B0A090962616C6C6F6F6E2E72';
wwv_flow_api.g_varchar2_table(130) := '656D6F76654576656E744C697374656E657228277765626B69745472616E736974696F6E456E64272C207472616E736974696F6E456E642C2066616C7365293B0A0A090962616C6C6F6F6E2E7374796C652E7765626B69745472616E736974696F6E5072';
wwv_flow_api.g_varchar2_table(131) := '6F7065727479203D20272D7765626B69742D7472616E73666F726D273B0A090962616C6C6F6F6E2E7374796C652E7765626B69745472616E736974696F6E4475726174696F6E203D2027302E3273273B0A0A09092F2F2057652072656163686564207468';
wwv_flow_api.g_varchar2_table(132) := '6520656E64210A0909696620282021636C6F736554696D656F75742029207B0A09090962616C6C6F6F6E2E706172656E744E6F64652E72656D6F76654368696C642862616C6C6F6F6E293B0A09090962616C6C6F6F6E203D206E756C6C3B0A0909097265';
wwv_flow_api.g_varchar2_table(133) := '7475726E3B0A09097D0A0A09092F2F204F6E20694F53203420776520737461727420636865636B696E672074686520656C656D656E7420706F736974696F6E0A090969662028204F5356657273696F6E203C203520262620636C6F736554696D656F7574';
wwv_flow_api.g_varchar2_table(134) := '202920706F736974696F6E496E74657276616C203D20736574496E74657276616C28736574506F736974696F6E2C206F7074696F6E732E697465726174696F6E73293B0A097D0A0A0966756E6374696F6E20736574506F736974696F6E202829207B0A09';
wwv_flow_api.g_varchar2_table(135) := '09766172206D6174726978203D206E6577205765624B69744353534D617472697828772E676574436F6D70757465645374796C652862616C6C6F6F6E2C206E756C6C292E7765626B69745472616E73666F726D292C0A090909706F7359203D2069734950';
wwv_flow_api.g_varchar2_table(136) := '6164203F20772E7363726F6C6C59202D20737461727459203A20772E7363726F6C6C59202B20772E696E6E6572486569676874202D207374617274592C0A090909706F7358203D20697349506164203F20772E7363726F6C6C58202D2073746172745820';
wwv_flow_api.g_varchar2_table(137) := '3A20772E7363726F6C6C58202B204D6174682E726F756E642828772E696E6E65725769647468202D2062616C6C6F6F6E2E6F6666736574576964746829202F203229202D207374617274583B0A0A09092F2F2053637265656E206469646E2774206D6F76';
wwv_flow_api.g_varchar2_table(138) := '650A09096966202820706F7359203D3D206D61747269782E6D343220262620706F7358203D3D206D61747269782E6D343120292072657475726E3B0A0A090962616C6C6F6F6E2E7374796C652E7765626B69745472616E73666F726D203D20277472616E';
wwv_flow_api.g_varchar2_table(139) := '736C61746533642827202B20706F7358202B202770782C27202B20706F7359202B202770782C3029273B0A097D0A0A092F2F20436C656172206C6F63616C20616E642073657373696F6E2073746F72616765732028746869732069732075736566756C20';
wwv_flow_api.g_varchar2_table(140) := '7072696D6172696C7920696E20646576656C6F706D656E74290A0966756E6374696F6E207265736574202829207B0A0909772E6C6F63616C53746F726167652E72656D6F76654974656D2827616464546F486F6D6527293B0A0909772E73657373696F6E';
wwv_flow_api.g_varchar2_table(141) := '53746F726167652E72656D6F76654974656D2827616464546F486F6D6553657373696F6E27293B0A097D0A0A0966756E6374696F6E206F7269656E746174696F6E436865636B202829207B0A090962616C6C6F6F6E2E7374796C652E6D617267696E4C65';
wwv_flow_api.g_varchar2_table(142) := '6674203D202D4D6174682E726F756E642862616C6C6F6F6E2E6F66667365745769647468202F203229202D202820772E6F7269656E746174696F6E25313830202626204F5356657273696F6E203E3D2036203F203430203A20302029202B20277078273B';
wwv_flow_api.g_varchar2_table(143) := '0A097D0A0A092F2F20426F6F747374726170210A09696E697428293B0A0A0972657475726E207B0A090973686F773A206D616E75616C53686F772C0A0909636C6F73653A20636C6F73652C0A090972657365743A2072657365740A097D3B0A7D29287769';
wwv_flow_api.g_varchar2_table(144) := '6E646F77293B0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(58488316739831012)
,p_plugin_id=>wwv_flow_api.id(58399516564223906)
,p_file_name=>'add2home.js'
,p_mime_type=>'application/javascript'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(77408808842098354)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>101
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(77381210056098344)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(77388737096098347)
,p_nav_list_template_options=>'#DEFAULT#'
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'&CRAPPY_HOME.js/standalone.js',
'&CRAPPY_HOME.js/functions.js'))
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(77418644648147739)
,p_nav_bar_list_template_id=>wwv_flow_api.id(77388280297098347)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Global Page - Desktop'
,p_page_mode=>'NORMAL'
,p_step_title=>'Global Page - Desktop'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'D'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20150916233016'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25308936051519347)
,p_plug_name=>'(items)'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77412683737131273)
,p_plug_name=>'(hamburger menu)'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>'<a href="#" id="menu-trigger" class="button-collapse" data-activates="app-sidenav"><i class="material-icons left">menu</i></a>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'101,102,103'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25309087230519348)
,p_name=>'P0_LATITUDE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(25308936051519347)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25309128695519349)
,p_name=>'P0_LONGITUDE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(25308936051519347)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26390291786692046)
,p_name=>'P0_PAGE_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25308936051519347)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26390314699692047)
,p_name=>'P0_SHOW_BACK_BTN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(25308936051519347)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33214558006594402)
,p_name=>'P0_HIDE_TOAST_PUBLIC_USERS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(25308936051519347)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33214823329594405)
,p_name=>'P0_HIDE_TOAST_TWITTER_USERS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(25308936051519347)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33214978683594406)
,p_name=>'P0_HIDE_TOAST_NEARBY_USERS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(25308936051519347)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25309215597519350)
,p_name=>'INSERT_GEO_COORDS'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P0_LONGITUDE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26113421143923601)
,p_event_id=>wwv_flow_api.id(25309215597519350)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr_location.insert_geo_coords(i_id_usr        => :f_id_usr,',
'                                     i_geo_latitude  => :p0_latitude,',
'                                     i_geo_longitude => :p0_longitude);',
'END;'))
,p_attribute_02=>'P0_LATITUDE,P0_LONGITUDE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26113626082923603)
,p_name=>'GET_GEO_COORDS'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'FUNCTION_BODY'
,p_display_when_cond=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'IF :APP_PAGE_ID IN (101,102,103) THEN',
'  RETURN FALSE;',
'ELSIF :P0_LATITUDE IS NOT NULL THEN',
'  RETURN FALSE;',
'ELSE',
'  RETURN TRUE;',
'END IF;'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26113708660923604)
,p_event_id=>wwv_flow_api.id(26113626082923603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'get_location("P0_LATITUDE","P0_LONGITUDE");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27092395534101301)
,p_name=>'CHECK_WEBKIT_BROWSER_ALERT'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'CURRENT_PAGE_EQUALS_CONDITION'
,p_display_when_cond=>'101'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27092469289101302)
,p_event_id=>wwv_flow_api.id(27092395534101301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'check_webkit_browser();'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'My Profile'
,p_page_mode=>'NORMAL'
,p_step_title=>'My Profile'
,p_step_sub_title=>'Home'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26371712667010661)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'img {',
'  width: 220px;',
'  box-shadow: 0 0 6px rgba(0, 0, 0, .7);',
'  -webkit-box-shadow: 0 0 6px rgba(0, 0, 0, .7);',
'  -moz-box-shadow: 0 0 6px rgba(0, 0, 0, .7);',
'}'))
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151014150508'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25308899130519346)
,p_plug_name=>'Profile'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26114170408923608)
,p_plug_name=>'(preloader)'
,p_parent_plug_id=>wwv_flow_api.id(25308899130519346)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(77384442759098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26115463503923621)
,p_plug_name=>'Details'
,p_parent_plug_id=>wwv_flow_api.id(25308899130519346)
,p_region_template_options=>'#DEFAULT#:apex-materialbox:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26511213093268434)
,p_plug_name=>'Twitter Info'
,p_region_template_options=>'#DEFAULT#:amber:red-text'
,p_plug_template=>wwv_flow_api.id(77383167968098345)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Tip: Then you enter your Twitter name much more functions are available.<br>',
'- Play against your Twitter friends<br>',
'- Have a good looking profile picture</p>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>'!'||wwv_flow_api.id(26450081745841091)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26270041472712705)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26115463503923621)
,p_button_name=>'P1_NEW_FREE_PLAY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:waves-effect:green:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Free Play'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,8:P8_PAGE_FROM:1'
,p_icon_css_classes=>'games'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26128424467887551)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(25308899130519346)
,p_button_name=>'P101_EDIT_PROFILE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:fixed-action-btn:waves-effect:red:icon-float-left:z-depth-5:btn-large:btn-floating:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Edit'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2::'
,p_icon_css_classes=>'edit'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26156945324666044)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(25308899130519346)
,p_button_name=>'P101_EDIT_PASSWORD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:waves-effect:blue:icon-float-left:z-depth-5:btn-floating:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Edit Password'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10::'
,p_icon_css_classes=>'lock_open'
,p_button_cattributes=>'style="transform: scaleY(1) scaleX(1) translateY(0px);opacity: 1;"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26113972481923606)
,p_name=>'P1_PROFILE_PIC_TWITTER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(25308899130519346)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Profile Pic'
,p_source=>'P1_PROFILE_PIC_URL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-image-circle:item-image-responsive:item-no-label'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26115518139923622)
,p_name=>'P1_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26115463503923621)
,p_prompt=>'Name'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26115651491923623)
,p_name=>'P1_EMAIL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26115463503923621)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26115743398923624)
,p_name=>'P1_TWITTER_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26115463503923621)
,p_prompt=>'Twitter'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26115862791923625)
,p_name=>'P1_HIGHSCORE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(25308899130519346)
,p_prompt=>'Highscore'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26156002862666035)
,p_name=>'P1_PROFILE_PIC_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25308899130519346)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26114202282923609)
,p_name=>'SHOW_PRELOADER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26114363649923610)
,p_event_id=>wwv_flow_api.id(26114202282923609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26114170408923608)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26114511700923612)
,p_name=>'HIDE_PRELOADER'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'unload'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26114610974923613)
,p_event_id=>wwv_flow_api.id(26114511700923612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26114170408923608)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26553368801516315)
,p_name=>'TOAST_NEW_BATTLE'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'FUNCTION_BODY'
,p_display_when_cond=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_usr_battle.check_open_battle(i_id_usr => :f_id_usr);',
'END;'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26553463343516316)
,p_event_id=>wwv_flow_api.id(26553368801516315)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Materialize.toast(''<a href="f?p=&APP_ID.:12:&APP_SESSION.">You have new incoming Battles!</a>'', 6000);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26156128283666036)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FILL_USR_PROFILE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_fill_usr_profile(i_id_usr                  => :f_id_usr,',
'                              o_usr_email               => :p1_email,',
'                              o_usr_name                => :p1_name,',
'                              o_twitter_name            => :p1_twitter_name,',
'                              o_usr_highscore           => :p1_highscore,',
'                              o_twitter_profile_pic_url => :p1_profile_pic_url);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26550951266499928)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_USERNAME_LOCAL_STORAGE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.set_username_localstorage(i_user_name => :app_user);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_is_stateful_y_n=>'Y'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Edit Profile'
,p_page_mode=>'MODAL'
,p_step_title=>'Edit Profile'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26371712667010661)
,p_step_template=>wwv_flow_api.id(77381494509098344)
,p_page_template_options=>'#DEFAULT#:modal-fixed-footer'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20150903234157'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26154383123666018)
,p_plug_name=>'Edit Profile'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'.btn {',
'  width: 100%;',
'}',
'</style>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26155089221666025)
,p_plug_name=>'(footer)'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26155362681666028)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26155089221666025)
,p_button_name=>'P2_CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:waves-effect:icon-float-left:btn-flat:waves-red'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Close'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26154973720666024)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(26155089221666025)
,p_button_name=>'P2_SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:waves-effect:icon-float-left:btn-flat:waves-red'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Save'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26155803635666033)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26154383123666018)
,p_button_name=>'P2_DELETE_PROFILE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Delete Profile'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_button_redirect_url=>'javascript:apex.confirm(''Do you really want to delete your account?'',''P2_DELETE_PROFILE'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'delete'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(26155140683666026)
,p_branch_name=>'SAVE_GOTO_P1'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(26154973720666024)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(26157156715666046)
,p_branch_name=>'DELETE_GOTO_LOGOUT'
,p_branch_action=>'&LOGOUT_URL.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(26155803635666033)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26154441864666019)
,p_name=>'P2_FIRSTNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26154383123666018)
,p_prompt=>'Firstname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26154655512666021)
,p_name=>'P2_LASTNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26154383123666018)
,p_prompt=>'Lastname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26154765888666022)
,p_name=>'P2_EMAIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(26154383123666018)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26154835285666023)
,p_name=>'P2_TWITTER_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(26154383123666018)
,p_prompt=>'Twitter'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26155783131666032)
,p_name=>'P2_ACCOUNT_PUBLIC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(26154383123666018)
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Show account public;1,Don´t show account public;0'
,p_lov_display_null=>'YES'
,p_tag_attributes=>'class="with-gap"'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26849710268121793)
,p_name=>'P2_SPACER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(26154383123666018)
,p_post_element_text=>'<br>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26156485552666039)
,p_validation_name=>'P2_FIRSTNAME_NOT_NULL'
,p_validation_sequence=>10
,p_validation=>'P2_FIRSTNAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26154973720666024)
,p_associated_item=>wwv_flow_api.id(26154441864666019)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26156580957666040)
,p_validation_name=>'P2_LASTNAME_NOT_NULL'
,p_validation_sequence=>20
,p_validation=>'P2_LASTNAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26154973720666024)
,p_associated_item=>wwv_flow_api.id(26154655512666021)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26156692906666041)
,p_validation_name=>'P2_EMAIL_NOT_NULL'
,p_validation_sequence=>30
,p_validation=>'P2_EMAIL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26154973720666024)
,p_associated_item=>wwv_flow_api.id(26154765888666022)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26784763564220493)
,p_validation_name=>'P2_EMAIL_VALID_ADDRESS'
,p_validation_sequence=>40
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_utils.do_check_email(i_email_adr => :p2_email);',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL# is not a valid email address.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26154973720666024)
,p_associated_item=>wwv_flow_api.id(26154765888666022)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26785074432222309)
,p_validation_name=>'P2_EMAIL_UNIQUE'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_usr.check_usr_email_unique(i_usr_email => :p2_email,',
'                                        i_id_usr    => :f_id_usr);',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'This #LABEL# is already registered. Choose another address.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26154973720666024)
,p_associated_item=>wwv_flow_api.id(26154765888666022)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26751934102299106)
,p_validation_name=>'P2_TWITTER_NAME_UNIQUE'
,p_validation_sequence=>60
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_usr.check_usr_twitter_name_unique(i_twitter_name => :p2_twitter_name,',
'                                               i_id_usr       => :f_id_usr);',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'This #LABEL# is already registered. Choose another name.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26154973720666024)
,p_associated_item=>wwv_flow_api.id(26154835285666023)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26155421015666029)
,p_name=>'CLOSE_MODAL'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(26155362681666028)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26155531303666030)
,p_event_id=>wwv_flow_api.id(26155421015666029)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26156372043666038)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPDATE_USR_EDIT_PROFILE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_update_usr_edit_profile(i_id_usr          => :f_id_usr,',
'                                     i_usr_email       => :p2_email,',
'                                     i_usr_firstname   => :p2_firstname,',
'                                     i_usr_lastname    => :p2_lastname,',
'                                     i_twitter_name    => :p2_twitter_name,',
'                                     i_show_acc_public => :p2_account_public);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error updating your profile.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(26154973720666024)
,p_process_success_message=>'Successfully updated your profile.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26157064568666045)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_USR_PROFILE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.del_usr(i_id_usr => :f_id_usr);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error while deleting your account.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(26155803635666033)
,p_process_success_message=>'Your account has been successfully deleted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26156276789666037)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FILL_USR_EDIT_PROFILE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_fill_usr_edit_profile(i_id_usr          => :f_id_usr,',
'                                   o_usr_email       => :p2_email,',
'                                   o_usr_firstname   => :p2_firstname,',
'                                   o_usr_lastname    => :p2_lastname,',
'                                   o_twitter_name    => :p2_twitter_name,',
'                                   o_show_acc_public => :p2_account_public);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Public Users'
,p_page_mode=>'NORMAL'
,p_step_title=>'Public Users'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26372131622012720)
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26449853624835556)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151019132508'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(26152607881666001)
,p_name=>'Public Users'
,p_template=>wwv_flow_api.id(77384709376098346)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:hide-title'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT usr.id_usr,',
'       NULL AS display,',
'       nvl(usr.twitter_profile_pic_url,',
'           ''&CRAPPY_HOME.img/avatar-placeholder.png'') AS profile_pic_url,',
'       usr.usr_firstname || '' '' || usr.usr_lastname AS usr_fullname,',
'       ''javascript:confirm_battle('''''' ||',
'       apex_page.get_url(p_application => :app_id,',
'                         p_page        => 9,',
'                         p_clear_cache => 9,',
'                         p_items       => ''P9_PAGE_FROM,P9_ID_USR_CHALLENGER,P9_ID_USR_RECEIVER'',',
'                         p_values      => ''3,'' || :f_id_usr || '','' ||',
'                                          usr.id_usr) || '''''');'' AS target1,',
'       apex_page.get_url(p_application => :app_id,',
'                         p_page        => 6,',
'                         p_clear_cache => 6,',
'                         p_items       => ''P6_PAGE_FROM,P6_ID_USR'',',
'                         p_values      => ''3,'' || usr.id_usr) AS target2,',
'       NULL AS button_css_classes,',
'       ''play_arrow'' AS icon_css_classes1,',
'       ''person_pin'' AS icon_css_classes2',
'  FROM usr',
' WHERE usr.acc_active = 1',
'   AND usr.show_acc_public = 1',
'   AND usr.id_usr != :f_id_usr',
'   AND usr.id_usr != api_usr.getc_admin_pk',
'   AND (upper(usr.usr_firstname) LIKE upper(''%'' || :p3_search || ''%'') OR',
'       upper(usr.usr_lastname) LIKE upper(''%'' || :p3_search || ''%''))',
' ORDER BY upper(usr.usr_lastname),',
'          upper(usr.usr_firstname)'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'img {',
'  width: 50px;',
'  height: 50px !important;',
'  border-radius: 50%;',
'  vertical-align:middle;',
'}',
'.material-icons {',
'  line-height: 2;',
'  font-size: 2rem;  ',
'}',
'.materialboxed {',
'    cursor: auto;',
'}',
'</style>'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P3_SEARCH'
,p_query_row_template=>wwv_flow_api.id(26183047332521031)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Users found.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26152762516666002)
,p_query_column_id=>1
,p_column_alias=>'ID_USR'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26152836904666003)
,p_query_column_id=>2
,p_column_alias=>'DISPLAY'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<img class="initialized materialboxed responsive-img" src="#PROFILE_PIC_URL#"><span>&nbsp;#USR_FULLNAME#</span>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42092983847320006)
,p_query_column_id=>3
,p_column_alias=>'PROFILE_PIC_URL'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42093039570320007)
,p_query_column_id=>4
,p_column_alias=>'USR_FULLNAME'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26153939546666014)
,p_query_column_id=>5
,p_column_alias=>'TARGET1'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26154030028666015)
,p_query_column_id=>6
,p_column_alias=>'TARGET2'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26153030175666005)
,p_query_column_id=>7
,p_column_alias=>'BUTTON_CSS_CLASSES'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26154150679666016)
,p_query_column_id=>8
,p_column_alias=>'ICON_CSS_CLASSES1'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26154212814666017)
,p_query_column_id=>9
,p_column_alias=>'ICON_CSS_CLASSES2'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26153246958666007)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:container:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26172602483028363)
,p_plug_name=>'(preloader)'
,p_parent_plug_id=>wwv_flow_api.id(26153246958666007)
,p_region_template_options=>'#DEFAULT#:center-align'
,p_plug_template=>wwv_flow_api.id(77384442759098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26910970829213715)
,p_plug_name=>'(items)'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26153435670666009)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(26153246958666007)
,p_button_name=>'P3_RESET'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Reset'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'restore'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26153343091666008)
,p_name=>'P3_SEARCH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26153246958666007)
,p_prompt=>'Search'
,p_placeholder=>'search'
,p_pre_element_text=>'<i class="material-icons prefix">search</i>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26910246839213708)
,p_name=>'P3_PREVENT_PAGE_SUBMIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26910970829213715)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26910630307213712)
,p_name=>'HIDE_PREVENT_PAGE_SUBMIT'
,p_event_sequence=>5
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26910757992213713)
,p_event_id=>wwv_flow_api.id(26910630307213712)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_PREVENT_PAGE_SUBMIT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26173102080030120)
,p_name=>'SHOW_PRELOADER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26173509621030121)
,p_event_id=>wwv_flow_api.id(26173102080030120)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26172602483028363)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26173983274031274)
,p_name=>'HIDE_PRELOADER'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'unload'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26174397897031275)
,p_event_id=>wwv_flow_api.id(26173983274031274)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26172602483028363)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26153748393666012)
,p_name=>'TOAST'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_when_cond=>'P0_HIDE_TOAST_PUBLIC_USERS'
,p_display_when_cond2=>'1'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26153824371666013)
,p_event_id=>wwv_flow_api.id(26153748393666012)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Materialize.toast(''These people waiting for competition! Press Play!'', 4000);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26910329246213709)
,p_name=>'REFRESH_REPORT'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_SEARCH'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26910484855213710)
,p_event_id=>wwv_flow_api.id(26910329246213709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26152607881666001)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26910803584213714)
,p_event_id=>wwv_flow_api.id(26910329246213709)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#P3_SEARCH").blur();'
,p_stop_execution_on_error=>'Y'
,p_da_action_comment=>'Let virtual Keyboard disappear when no submit happens'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26911064732213716)
,p_name=>'EMPTY_SEARCH'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(26153435670666009)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26911198821213717)
,p_event_id=>wwv_flow_api.id(26911064732213716)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_SEARCH'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33214672309594403)
,p_name=>'SET_SHOW_TOAST_ONCE'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_when_cond=>'P0_HIDE_TOAST_PUBLIC_USERS'
,p_display_when_cond2=>'1'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33214791310594404)
,p_event_id=>wwv_flow_api.id(33214672309594403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  apex_util.set_session_state(''P0_HIDE_TOAST_PUBLIC_USERS'',',
'                              1);',
'END;'))
,p_attribute_03=>'P0_HIDE_TOAST_PUBLIC_USERS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Twitter Friends'
,p_page_mode=>'NORMAL'
,p_step_title=>'Twitter Friends'
,p_step_sub_title=>'Twitter Friends'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26372131622012720)
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26450081745841091)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151019132710'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(26219616770476567)
,p_name=>'Twitter Friends'
,p_template=>wwv_flow_api.id(77384709376098346)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:hide-title'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT usr.id_usr,',
'       NULL AS display,',
'       nvl(usr.twitter_profile_pic_url,',
'           ''&CRAPPY_HOME.img/avatar-placeholder.png'') AS profile_pic_url,',
'       usr.usr_firstname || '' '' || usr.usr_lastname AS usr_fullname,',
'       ''javascript:confirm_battle('''''' ||',
'       apex_page.get_url(p_application => :app_id,',
'                         p_page        => 9,',
'                         p_clear_cache => 9,',
'                         p_items       => ''P9_PAGE_FROM,P9_ID_USR_CHALLENGER,P9_ID_USR_RECEIVER'',',
'                         p_values      => ''4,'' || :f_id_usr || '','' ||',
'                                          usr.id_usr) || '''''');'' AS target1,',
'       apex_page.get_url(p_application => :app_id,',
'                         p_page        => 6,',
'                         p_clear_cache => 6,',
'                         p_items       => ''P6_PAGE_FROM,P6_ID_USR'',',
'                         p_values      => ''4,'' || usr.id_usr) AS target2,',
'       NULL AS button_css_classes,',
'       ''play_arrow'' AS icon_css_classes1,',
'       ''person_pin'' AS icon_css_classes2',
'  FROM usr',
' WHERE usr.acc_active = 1',
'   AND usr.id_usr != :f_id_usr',
'   AND usr.id_usr != api_usr.getc_admin_pk',
'   AND (upper(usr.usr_firstname) LIKE upper(''%'' || :p4_search || ''%'') OR',
'       upper(usr.usr_lastname) LIKE upper(''%'' || :p4_search || ''%'') OR',
'       upper(usr.twitter_name) LIKE upper(''%'' || :p4_search || ''%''))',
'   AND (usr.id_usr IN',
'       (SELECT usr_tw_friends.id_usr_friend',
'           FROM usr_tw_friends',
'          WHERE usr_tw_friends.id_usr = :f_id_usr) OR',
'       usr.twitter_id IN',
'       (SELECT usr_tw_friends.usr_friend_twitter_id',
'           FROM usr_tw_friends',
'          WHERE usr_tw_friends.id_usr = :f_id_usr))',
' ORDER BY upper(usr.usr_lastname),',
'          upper(usr.usr_firstname)'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'img {',
'  width: 50px;',
'  height: 50px !important;',
'  border-radius: 50%;',
'  vertical-align:middle;',
'}',
'.material-icons {',
'  line-height: 2;',
'  font-size: 2rem;  ',
'}',
'.materialboxed {',
'    cursor: auto;',
'}',
'</style>'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P4_SEARCH'
,p_query_row_template=>wwv_flow_api.id(26183047332521031)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Users found.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26221674395476572)
,p_query_column_id=>1
,p_column_alias=>'ID_USR'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26222083295476572)
,p_query_column_id=>2
,p_column_alias=>'DISPLAY'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<img class="initialized materialboxed responsive-img" src="#PROFILE_PIC_URL#"><span>&nbsp;#USR_FULLNAME#</span>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42093179257320008)
,p_query_column_id=>3
,p_column_alias=>'PROFILE_PIC_URL'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42093270731320009)
,p_query_column_id=>4
,p_column_alias=>'USR_FULLNAME'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26220062039476570)
,p_query_column_id=>5
,p_column_alias=>'TARGET1'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26220427771476571)
,p_query_column_id=>6
,p_column_alias=>'TARGET2'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26222445580476572)
,p_query_column_id=>7
,p_column_alias=>'BUTTON_CSS_CLASSES'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26220881335476571)
,p_query_column_id=>8
,p_column_alias=>'ICON_CSS_CLASSES1'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26221295065476572)
,p_query_column_id=>9
,p_column_alias=>'ICON_CSS_CLASSES2'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26222858277476573)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:container:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26224003777476577)
,p_plug_name=>'(preloader)'
,p_parent_plug_id=>wwv_flow_api.id(26222858277476573)
,p_region_template_options=>'#DEFAULT#:center-align'
,p_plug_template=>wwv_flow_api.id(77384442759098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26939676440606663)
,p_plug_name=>'(items)'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26223216877476573)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(26222858277476573)
,p_button_name=>'P4_RESET'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Reset'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'restore'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26223637482476574)
,p_name=>'P4_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26222858277476573)
,p_prompt=>'Search'
,p_placeholder=>'search'
,p_pre_element_text=>'<i class="material-icons prefix">search</i>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26939941141606663)
,p_name=>'P4_PREVENT_PAGE_SUBMIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26939676440606663)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26940392251608919)
,p_name=>'HIDE_PREVENT_PAGE_SUBMIT'
,p_event_sequence=>5
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26940785048608919)
,p_event_id=>wwv_flow_api.id(26940392251608919)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_PREVENT_PAGE_SUBMIT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26224815435476584)
,p_name=>'SHOW_PRELOADER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26225311980476585)
,p_event_id=>wwv_flow_api.id(26224815435476584)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26224003777476577)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26225752591476585)
,p_name=>'HIDE_PRELOADER'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'unload'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26226288622476585)
,p_event_id=>wwv_flow_api.id(26225752591476585)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26224003777476577)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26226607813476586)
,p_name=>'TOAST'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_when_cond=>'P0_HIDE_TOAST_TWITTER_USERS'
,p_display_when_cond2=>'1'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26227176652476586)
,p_event_id=>wwv_flow_api.id(26226607813476586)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Materialize.toast(''Your friends waiting for competition! Press Play!'', 4000);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26941679403615085)
,p_name=>'EMPTY_SEARCH'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(26223216877476573)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26942017750615085)
,p_event_id=>wwv_flow_api.id(26941679403615085)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_SEARCH'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26942689455618919)
,p_name=>'REFRESH_REPORT'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_SEARCH'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26943571722618919)
,p_event_id=>wwv_flow_api.id(26942689455618919)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26219616770476567)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26943056980618919)
,p_event_id=>wwv_flow_api.id(26942689455618919)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#P4_SEARCH").blur();'
,p_stop_execution_on_error=>'Y'
,p_da_action_comment=>'Let virtual Keyboard disappear when no submit happens'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33229267836727321)
,p_name=>'SET_SHOW_TOAST_ONCE'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_when_cond=>'P0_HIDE_TOAST_TWITTER_USERS'
,p_display_when_cond2=>'1'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33229683463727326)
,p_event_id=>wwv_flow_api.id(33229267836727321)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  apex_util.set_session_state(''P0_HIDE_TOAST_TWITTER_USERS'',',
'                              1);',
'END;'))
,p_attribute_03=>'P0_HIDE_TOAST_TWITTER_USERS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Nearby Users'
,p_page_mode=>'NORMAL'
,p_step_title=>'Nearby Users'
,p_step_sub_title=>'Nearby Users'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26372131622012720)
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26559138998757238)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151019133414'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(26229260765501714)
,p_name=>'Nearby Users'
,p_template=>wwv_flow_api.id(77384709376098346)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:hide-title'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT usr.id_usr,',
'       NULL AS display,',
'       nvl(usr.twitter_profile_pic_url,',
'           ''&CRAPPY_HOME.img/avatar-placeholder.png'') AS profile_pic_url,',
'       usr.usr_firstname || '' '' || usr.usr_lastname AS usr_fullname,',
'       ''javascript:confirm_battle('''''' ||',
'       apex_page.get_url(p_application => :app_id,',
'                         p_page        => 9,',
'                         p_clear_cache => 9,',
'                         p_items       => ''P9_PAGE_FROM,P9_ID_USR_CHALLENGER,P9_ID_USR_RECEIVER'',',
'                         p_values      => ''5,'' || :f_id_usr || '','' ||',
'                                          usr.id_usr) || '''''');'' AS target1,',
'       apex_page.get_url(p_application => :app_id,',
'                         p_page        => 6,',
'                         p_clear_cache => 6,',
'                         p_items       => ''P6_PAGE_FROM,P6_ID_USR'',',
'                         p_values      => ''5,'' || usr.id_usr) AS target2,',
'       NULL AS button_css_classes,',
'       ''play_arrow'' AS icon_css_classes1,',
'       ''person_pin'' AS icon_css_classes2',
'  FROM usr',
' WHERE usr.acc_active = 1',
'   AND usr.show_acc_public = 1',
'   AND usr.id_usr != :f_id_usr',
'   AND usr.id_usr != api_usr.getc_admin_pk',
'   AND api_usr_location.get_distance_between_usr(i_id_usr1 => :f_id_usr,',
'                                                 i_id_usr2 => usr.id_usr,',
'                                                 i_unit    => ''mile'') <',
'       :p5_distance',
' ORDER BY upper(usr.usr_lastname),',
'          upper(usr.usr_firstname)'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'img {',
'  width: 50px;',
'  height: 50px !important;',
'  border-radius: 50%;',
'  vertical-align:middle;',
'}',
'.material-icons {',
'  line-height: 2;',
'  font-size: 2rem;  ',
'}',
'.materialboxed {',
'    cursor: auto;',
'}',
'</style>'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P5_DISTANCE'
,p_query_row_template=>wwv_flow_api.id(26183047332521031)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Users found.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26230879862501715)
,p_query_column_id=>1
,p_column_alias=>'ID_USR'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26231251345501715)
,p_query_column_id=>2
,p_column_alias=>'DISPLAY'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<img class="initialized materialboxed responsive-img" src="#PROFILE_PIC_URL#"><span>&nbsp;#USR_FULLNAME#</span>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42093321294320010)
,p_query_column_id=>3
,p_column_alias=>'PROFILE_PIC_URL'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42093433200320011)
,p_query_column_id=>4
,p_column_alias=>'USR_FULLNAME'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26232069444501715)
,p_query_column_id=>5
,p_column_alias=>'TARGET1'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26229648792501714)
,p_query_column_id=>6
,p_column_alias=>'TARGET2'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26231649686501715)
,p_query_column_id=>7
,p_column_alias=>'BUTTON_CSS_CLASSES'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26230023363501715)
,p_query_column_id=>8
,p_column_alias=>'ICON_CSS_CLASSES1'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26230475631501715)
,p_query_column_id=>9
,p_column_alias=>'ICON_CSS_CLASSES2'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26232473433501716)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:container:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26233654991501717)
,p_plug_name=>'(preloader)'
,p_parent_plug_id=>wwv_flow_api.id(26232473433501716)
,p_region_template_options=>'#DEFAULT#:center-align'
,p_plug_template=>wwv_flow_api.id(77384442759098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26865871771041001)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26229260765501714)
,p_button_name=>'P5_SHOW_GMAP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:fixed-action-btn:waves-effect:blue:icon-float-left:z-depth-5:btn-large:btn-floating:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Show on Map'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14:P14_PAGE_FROM:5'
,p_icon_css_classes=>'map'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26233205948501716)
,p_name=>'P5_DISTANCE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26232473433501716)
,p_item_default=>'200'
,p_prompt=>'Distance'
,p_pre_element_text=>'<i class="material-icons prefix">search</i>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:50 Miles;50,100 Miles;100,200 Miles;200,300 Miles;300,500 Miles;500,1000 Miles;1000'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26236230849501718)
,p_name=>'SHOW_PRELOADER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26236734786501718)
,p_event_id=>wwv_flow_api.id(26236230849501718)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26233654991501717)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26234486968501717)
,p_name=>'HIDE_PRELOADER'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'unload'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26234947062501718)
,p_event_id=>wwv_flow_api.id(26234486968501717)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26233654991501717)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26235336905501718)
,p_name=>'TOAST'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_when_cond=>'P0_HIDE_TOAST_NEARBY_USERS'
,p_display_when_cond2=>'1'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26235860246501718)
,p_event_id=>wwv_flow_api.id(26235336905501718)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Materialize.toast(''Local people waiting for competition! Press Play!'', 4000);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26911230260213718)
,p_name=>'REFRESH_REPORT'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_DISTANCE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26911386705213719)
,p_event_id=>wwv_flow_api.id(26911230260213718)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26229260765501714)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33230787867741619)
,p_name=>'SET_SHOW_TOAST_ONCE'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_when_cond=>'P0_HIDE_TOAST_NEARBY_USERS'
,p_display_when_cond2=>'1'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33231135510741620)
,p_event_id=>wwv_flow_api.id(33230787867741619)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  apex_util.set_session_state(''P0_HIDE_TOAST_NEARBY_USERS'',',
'                              1);',
'END;'))
,p_attribute_03=>'P0_HIDE_TOAST_NEARBY_USERS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'User Profile'
,p_page_mode=>'NORMAL'
,p_step_title=>'User Profile'
,p_step_sub_title=>'User Profile'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26372131622012720)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'img {',
'  width: 220px;',
'  box-shadow: 0 0 6px rgba(0, 0, 0, .7);',
'  -webkit-box-shadow: 0 0 6px rgba(0, 0, 0, .7);',
'  -moz-box-shadow: 0 0 6px rgba(0, 0, 0, .7);',
'}'))
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151014145632'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26241062456625349)
,p_plug_name=>'Profile'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26242684725625351)
,p_plug_name=>'(preloader)'
,p_parent_plug_id=>wwv_flow_api.id(26241062456625349)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(77384442759098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26243070924625351)
,p_plug_name=>'Details'
,p_parent_plug_id=>wwv_flow_api.id(26241062456625349)
,p_region_template_options=>'#DEFAULT#:apex-materialbox:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26565708802254340)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26243070924625351)
,p_button_name=>'P1_NEW_BATTLE_PLAY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:waves-effect:green:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Play Battle'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_PAGE_FROM,P9_ID_USR_CHALLENGER,P9_ID_USR_RECEIVER:6,&F_ID_USR.,&P6_ID_USR.'
,p_button_condition=>'P6_ID_USR'
,p_button_condition2=>'&F_ID_USR.'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_icon_css_classes=>'games'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26156710430666042)
,p_name=>'P6_ID_USR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26243070924625351)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26156820912666043)
,p_name=>'P6_PAGE_FROM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26243070924625351)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26241803644625350)
,p_name=>'P6_PROFILE_PIC_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26241062456625349)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26242264681625350)
,p_name=>'P6_PROFILE_PIC_TWITTER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26241062456625349)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Profile Pic'
,p_source=>'P6_PROFILE_PIC_URL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-image-circle:item-image-responsive:item-no-label'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26243433711625351)
,p_name=>'P6_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26243070924625351)
,p_prompt=>'Name'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26244292979625352)
,p_name=>'P6_TWITTER_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(26243070924625351)
,p_prompt=>'Twitter'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26244695002625352)
,p_name=>'P6_HIGHSCORE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26241062456625349)
,p_prompt=>'Highscore'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26246336661625353)
,p_name=>'SHOW_PRELOADER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26246852083625353)
,p_event_id=>wwv_flow_api.id(26246336661625353)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26242684725625351)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26245474203625353)
,p_name=>'HIDE_PRELOADER'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'unload'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26245919627625353)
,p_event_id=>wwv_flow_api.id(26245474203625353)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26242684725625351)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26390510160692049)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_BACK_BUTTON'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
' :P0_SHOW_BACK_BTN := 1;',
' :P0_PAGE_FROM := :P6_PAGE_FROM;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26245006188625352)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FILL_USR_PROFILE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_email usr.usr_email%TYPE;',
'BEGIN',
'  api_usr.do_fill_usr_profile(i_id_usr                  => :p6_id_usr,',
'                              o_usr_email               => l_email,',
'                              o_usr_name                => :p6_name,',
'                              o_twitter_name            => :p6_twitter_name,',
'                              o_usr_highscore           => :p6_highscore,',
'                              o_twitter_profile_pic_url => :p6_profile_pic_url);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Customize Game'
,p_page_mode=>'NORMAL'
,p_step_title=>'Customize Game'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26372213871014189)
,p_javascript_file_urls=>'&CRAPPY_HOME.js/spectrum.js'
,p_javascript_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var bottom = apex.item("P7_BOTTOM_COLOR_VALUE").getValue();',
'$("#P7_BOTTOM_COLOR").spectrum({',
'    color: bottom',
'});',
'var grass = apex.item("P7_GRASS_COLOR_VALUE").getValue();',
'$("#P7_GRASS_COLOR").spectrum({',
'    color: grass',
'});',
'var treetop = apex.item("P7_TREETOP_COLOR_VALUE").getValue();',
'$("#P7_TREETOP_COLOR").spectrum({',
'    color: treetop',
'});',
'var treetrunk = apex.item("P7_TREETRUNK_COLOR_VALUE").getValue();',
'$("#P7_TREETRUNK_COLOR").spectrum({',
'    color: treetrunk',
'});',
'var bar = apex.item("P7_BAR_COLOR_VALUE").getValue();',
'$("#P7_BAR_COLOR").spectrum({',
'    color: bar',
'});'))
,p_css_file_urls=>'&CRAPPY_HOME.css/spectrum.css'
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20150916233813'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26271013503712715)
,p_plug_name=>'Info'
,p_region_template_options=>'#DEFAULT#:center-align:amber:red-text'
,p_plug_template=>wwv_flow_api.id(77383167968098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'You can customize & share CrappyBird themes you created. Don´t forget to save before you preview!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26271165286712716)
,p_plug_name=>'Customize settings'
,p_region_template_options=>'#DEFAULT#:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26385923536692003)
,p_plug_name=>'(button)'
,p_region_template_options=>'#DEFAULT#:container:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26387592560692019)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26271165286712716)
,p_button_name=>'P7_PREVIEW_GAME'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:waves-effect:blue:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Preview'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,8:P8_PAGE_FROM:7'
,p_icon_css_classes=>'movie'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26385715162692001)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(26385923536692003)
,p_button_name=>'P7_RESET_DEFAULTS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Reset to defaults'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Do you really want to reset settings?'',''P7_RESET_DEFAULTS'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P7_ID_USR_PREFS'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'restore'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26912087758213726)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(26271165286712716)
,p_button_name=>'P7_SHARE_THEME'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:waves-effect:blue-grey:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Share Theme'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP,20:P20_PAGE_FROM:7'
,p_button_condition=>'P7_ID_USR_PREFS'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'share'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_api.id(26449853624835556)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26271945917712724)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(26271165286712716)
,p_button_name=>'P7_SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:fixed-action-btn:waves-effect:green:icon-float-left:z-depth-5:btn-large:btn-floating:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_icon_css_classes=>'save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26271294670712717)
,p_name=>'P7_START_DAYMODE'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_prompt=>'Starting Daymode'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Day;day,Night;night,Dusk;dusk,Dawn;dawn'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26271343306712718)
,p_name=>'P7_BIRD_COLOR'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_prompt=>'Bird Color'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Yellow;yellow,Blue;blue,Green;green,Red;red,Pink;pink'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26271401291712719)
,p_name=>'P7_BOTTOM_COLOR'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_prompt=>'Bottom Color'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26271573861712720)
,p_name=>'P7_GRASS_COLOR'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_prompt=>'Grass Color'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26271670329712721)
,p_name=>'P7_TREETOP_COLOR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_prompt=>'Treetop Color'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26271745781712722)
,p_name=>'P7_TREETRUNK_COLOR'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_prompt=>'Tree trunk Color'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26271815137712723)
,p_name=>'P7_BAR_COLOR'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_prompt=>'Bar Color'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26272066297712725)
,p_name=>'P7_BOTTOM_COLOR_VALUE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26272180562712726)
,p_name=>'P7_GRASS_COLOR_VALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26272278956712727)
,p_name=>'P7_TREETOP_COLOR_VALUE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26272300247712728)
,p_name=>'P7_TREETRUNK_COLOR_VALUE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26272401163712729)
,p_name=>'P7_BAR_COLOR_VALUE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26273560362712740)
,p_name=>'P7_ID_USR_PREFS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(26271165286712716)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26272541983712730)
,p_name=>'SET_VALUE_BOTTOM'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_BOTTOM_COLOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26272608173712731)
,p_event_id=>wwv_flow_api.id(26272541983712730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var t = $("#P7_BOTTOM_COLOR").spectrum("get");',
'apex.item("P7_BOTTOM_COLOR_VALUE").setValue(t.toHexString());'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26272760956712732)
,p_name=>'SET_VALUE_GRASS'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_GRASS_COLOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26272819468712733)
,p_event_id=>wwv_flow_api.id(26272760956712732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var t = $("#P7_GRASS_COLOR").spectrum("get");',
'apex.item("P7_GRASS_COLOR_VALUE").setValue(t.toHexString());'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26272964722712734)
,p_name=>'SET_VALUE_TREETOP'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_TREETOP_COLOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26273099820712735)
,p_event_id=>wwv_flow_api.id(26272964722712734)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var t = $("#P7_TREETOP_COLOR").spectrum("get");',
'apex.item("P7_TREETOP_COLOR_VALUE").setValue(t.toHexString());'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26273110846712736)
,p_name=>'SET_VALUE_TREETRUNK'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_TREETRUNK_COLOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26273221306712737)
,p_event_id=>wwv_flow_api.id(26273110846712736)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var t = $("#P7_TREETRUNK_COLOR").spectrum("get");',
'apex.item("P7_TREETRUNK_COLOR_VALUE").setValue(t.toHexString());'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26273317461712738)
,p_name=>'SET_VALUE_BAR'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_BAR_COLOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26273429726712739)
,p_event_id=>wwv_flow_api.id(26273317461712738)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var t = $("#P7_BAR_COLOR").spectrum("get");',
'apex.item("P7_BAR_COLOR_VALUE").setValue(t.toHexString());'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26343760319196431)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE_USR_PREFS'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr_prefs.do_merge_usr_prefs(i_id_usr               => :f_id_usr,',
'                                   i_id_usr_prefs         => :p7_id_usr_prefs,',
'                                   i_game_daymode         => :p7_start_daymode,',
'                                   i_game_bird_color      => :p7_bird_color,',
'                                   i_game_treetop_color   => :p7_treetop_color_value,',
'                                   i_game_treetrunk_color => :p7_treetrunk_color_value,',
'                                   i_game_bottom_color    => :p7_bottom_color_value,',
'                                   i_game_grass_color     => :p7_grass_color_value,',
'                                   i_game_bar_color       => :p7_bar_color_value);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error saving preferences.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(26271945917712724)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26385827744692002)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RESET_USR_PREFS'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr_prefs.del_usr_prefs(i_id_usr_prefs => :p7_id_usr_prefs);',
'  --',
'  apex_util.clear_page_cache(7);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error while resetting.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(26385715162692001)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26273699809712741)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FILL_USR_PREFS'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr_prefs.do_fill_usr_prefs(i_id_usr               => :f_id_usr,',
'                                  o_id_usr_prefs         => :p7_id_usr_prefs,',
'                                  o_game_daymode         => :p7_start_daymode,',
'                                  o_game_bird_color      => :p7_bird_color,',
'                                  o_game_treetop_color   => :p7_treetop_color_value,',
'                                  o_game_treetrunk_color => :p7_treetrunk_color_value,',
'                                  o_game_bottom_color    => :p7_bottom_color_value,',
'                                  o_game_grass_color     => :p7_grass_color_value,',
'                                  o_game_bar_color       => :p7_bar_color_value);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Free Game'
,p_page_mode=>'NORMAL'
,p_step_title=>'Free Game'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26372213871014189)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.btn {',
'    margin-bottom: 0em;',
'}'))
,p_step_template=>wwv_flow_api.id(77381301645098344)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_browser_cache=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20150918225059'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26269915484712704)
,p_plug_name=>'CrappyBird Game'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_game.render_crappybird_usr(i_id_usr              => :f_id_usr,',
'                                 i_crappy_home_path    => :crappy_home ||',
'                                                          ''game/'',',
'                                 i_highscore_item_name => ''P8_HIGHSCORE'');',
'END;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26270234502712707)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(26269915484712704)
,p_button_name=>'P8_BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Exit Game'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:&P8_PAGE_FROM.:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26273854744712743)
,p_name=>'P8_HIGHSCORE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26269915484712704)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26387770404692021)
,p_name=>'P8_PAGE_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26269915484712704)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26347339700512901)
,p_name=>'SET_USR_HIGHSCORE'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_HIGHSCORE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26347416724512902)
,p_event_id=>wwv_flow_api.id(26347339700512901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_set_usr_highscore(i_id_usr        => :f_id_usr,',
'                               i_usr_highscore => :p8_highscore);',
'END;'))
,p_attribute_02=>'P8_HIGHSCORE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26347540080512903)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_INIT_HIGHSCORE_COOKIE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_game.set_highscore_cookie_usr(i_id_usr => :f_id_usr);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Battle Game'
,p_page_mode=>'NORMAL'
,p_step_title=>'Battle Game'
,p_step_sub_title=>'Battle Game'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26372213871014189)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.btn {',
'    margin-bottom: 0em;',
'}'))
,p_step_template=>wwv_flow_api.id(77381301645098344)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_browser_cache=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20150918225107'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26395682643788579)
,p_plug_name=>'CrappyBird Game'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_game.render_crappybird_usr(i_id_usr              => :f_id_usr,',
'                                 i_crappy_home_path    => :crappy_home ||',
'                                                          ''game/'',',
'                                 i_highscore_item_name => ''P9_HIGHSCORE'');',
'END;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26396099956788581)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(26395682643788579)
,p_button_name=>'P9_BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Exit Game'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:&P9_PAGE_FROM.:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26396811911788583)
,p_name=>'P9_HIGHSCORE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(26395682643788579)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26552422943516306)
,p_name=>'P9_PAGE_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26395682643788579)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26552516482516307)
,p_name=>'P9_ID_USR_CHALLENGER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26395682643788579)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26552636665516308)
,p_name=>'P9_ID_USR_RECEIVER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26395682643788579)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26552796431516309)
,p_name=>'P9_ID_USR_BATTLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26395682643788579)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26397682205788589)
,p_name=>'SET_USR_HIGHSCORE'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_HIGHSCORE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26398199914788590)
,p_event_id=>wwv_flow_api.id(26397682205788589)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr_battle.do_set_usr_highscore(i_id_usr        => :f_id_usr,',
'                                      i_id_usr_battle => :p9_id_usr_battle,',
'                                      i_highscore     => :p9_highscore);',
'END;'))
,p_attribute_02=>'P9_HIGHSCORE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33215364667594410)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SEND_NOTIFICATION_EMAIL'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr_battle.do_send_new_battle_mail(i_id_usr_challenger => :f_id_usr,',
'                                         i_id_usr_receiver   => :p9_id_usr_receiver,',
'                                         i_software_url      => :software_url);',
'-- no error raise',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    NULL;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P9_ID_USR_CHALLENGER'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'&F_ID_USR.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26552882379516310)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INSERT_USR_BATTLE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  :p9_id_usr_battle := api_usr_battle.do_insert_usr_battle(i_id_usr_challenger => :p9_id_usr_challenger,',
'                                                           i_id_usr_receiver   => :p9_id_usr_receiver);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P9_ID_USR_BATTLE'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26397238118788589)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_INIT_HIGHSCORE_COOKIE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_game.set_highscore_cookie_battle(i_id_usr        => :f_id_usr,',
'                                       i_id_usr_battle => :p9_id_usr_battle);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'New Password'
,p_page_mode=>'MODAL'
,p_step_title=>'New Password'
,p_step_sub_title=>'New Password'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26371712667010661)
,p_step_template=>wwv_flow_api.id(77381494509098344)
,p_page_template_options=>'#DEFAULT#:modal-fixed-footer'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20150823225722'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26355593358787013)
,p_plug_name=>'New Password'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'.btn {',
'  width: 100%;',
'}',
'</style>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26358704276787021)
,p_plug_name=>'(footer)'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26359151776787021)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26358704276787021)
,p_button_name=>'P10_CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:waves-effect:icon-float-left:btn-flat:waves-red'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Close'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26359569290787021)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(26358704276787021)
,p_button_name=>'P10_SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:waves-effect:icon-float-left:btn-flat:waves-red'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Save'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(26363647757787031)
,p_branch_name=>'SAVE_GOTO_P1'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(26359569290787021)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26347692426512904)
,p_name=>'P10_OLD_PWD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26355593358787013)
,p_prompt=>'Current Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26347710890512905)
,p_name=>'P10_NEW_PWD_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26355593358787013)
,p_prompt=>'New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26347814987512906)
,p_name=>'P10_NEW_PWD_2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26355593358787013)
,p_prompt=>'Repeat Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26348065217512908)
,p_validation_name=>'P10_OLD_PWD_NOT_NULL'
,p_validation_sequence=>10
,p_validation=>'P10_OLD_PWD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26359569290787021)
,p_associated_item=>wwv_flow_api.id(26347692426512904)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26348173630512909)
,p_validation_name=>'P10_NEW_PWD_1_NOT_NULL'
,p_validation_sequence=>20
,p_validation=>'P10_NEW_PWD_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26359569290787021)
,p_associated_item=>wwv_flow_api.id(26347710890512905)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26348223102512910)
,p_validation_name=>'P10_NEW_PWD_2_NOT_NULL'
,p_validation_sequence=>30
,p_validation=>'P10_NEW_PWD_2'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26359569290787021)
,p_associated_item=>wwv_flow_api.id(26347814987512906)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26348557315512913)
,p_validation_name=>'P10_OLD_PWD_CORRECT'
,p_validation_sequence=>40
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_usr.check_usr_pwd_correct(i_id_usr  => :f_id_usr,',
'                                       i_usr_pwd => :p10_old_pwd);',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL# is not correct.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26359569290787021)
,p_associated_item=>wwv_flow_api.id(26347692426512904)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26348344230512911)
,p_validation_name=>'P10_NEW_PWD_1_LENGTH'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF length(:p10_new_pwd_1) < 8 THEN',
'    RETURN FALSE;',
'  ELSE',
'    RETURN TRUE;',
'  END IF;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL# is to short. Enter min. 8 characters.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26359569290787021)
,p_associated_item=>wwv_flow_api.id(26347710890512905)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26348483594512912)
,p_validation_name=>'PASSWORD_REPEAT_EQUAL'
,p_validation_sequence=>60
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF :p10_new_pwd_1 = :p10_new_pwd_2 THEN',
'    RETURN TRUE;',
'  ELSE',
'    RETURN FALSE;',
'  END IF;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Passwords entered are different.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26359569290787021)
,p_associated_item=>wwv_flow_api.id(26347814987512906)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26362209198787029)
,p_name=>'CLOSE_MODAL'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(26359151776787021)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26362775295787029)
,p_event_id=>wwv_flow_api.id(26362209198787029)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26361449324787028)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPDATE_USR_PWD'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_update_usr_pwd(i_id_usr  => :f_id_usr,',
'                            i_usr_pwd => :p10_new_pwd_1);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error updating your password.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(26359569290787021)
,p_process_success_message=>'Successfully updated your password.'
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Global Ranking'
,p_page_mode=>'NORMAL'
,p_step_title=>'Global Ranking'
,p_step_sub_title=>'Global Ranking'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26372131622012720)
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26449853624835556)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151019140250'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(26399576986798203)
,p_name=>'Global Ranking'
,p_template=>wwv_flow_api.id(77384709376098346)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:hide-title'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT iv_usr2.id_usr,',
'       NULL AS display,',
'       iv_usr2.profile_pic_url,',
'       iv_usr2.usr_fullname,',
'       iv_usr2.target,',
'       iv_usr2.badge,',
'       iv_usr2.new_badge',
'  FROM (SELECT iv_usr.id_usr,',
'               nvl(iv_usr.twitter_profile_pic_url,',
'                   ''&CRAPPY_HOME.img/avatar-placeholder.png'') AS profile_pic_url,',
'               rownum || '' - '' || iv_usr.usr_firstname || '' '' ||',
'               iv_usr.usr_lastname AS usr_fullname,',
'               apex_page.get_url(p_application => :app_id,',
'                                 p_page        => 6,',
'                                 p_clear_cache => 6,',
'                                 p_items       => ''P6_PAGE_FROM,P6_ID_USR'',',
'                                 p_values      => ''11,'' || iv_usr.id_usr) AS target,',
'               iv_usr.usr_highscore AS badge,',
'               ''Y'' AS new_badge,',
'               iv_usr.usr_firstname,',
'               iv_usr.usr_lastname',
'          FROM (SELECT usr.id_usr,',
'                       usr.usr_firstname,',
'                       usr.usr_lastname,',
'                       usr.twitter_profile_pic_url,',
'                       nvl(usr.usr_highscore,',
'                           0) AS usr_highscore',
'                  FROM usr',
'                 WHERE usr.acc_active = 1',
'                   AND usr.show_acc_public = 1',
'                   AND usr.id_usr != api_usr.getc_admin_pk',
'                 ORDER BY nvl(usr.usr_highscore,',
'                              0) DESC,',
'                          upper(usr.usr_lastname)) iv_usr) iv_usr2',
' WHERE (upper(iv_usr2.usr_firstname) LIKE upper(''%'' || :p11_search || ''%'') OR',
'       upper(iv_usr2.usr_lastname) LIKE upper(''%'' || :p11_search || ''%''))'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'img {',
'  width: 50px;',
'  height: 50px !important;',
'  border-radius: 50%;',
'  vertical-align:middle;',
'}',
'.material-icons {',
'  line-height: 2;',
'  font-size: 2rem;  ',
'}',
'.materialboxed {',
'    cursor: auto;',
'}',
'span.badge.new:after {',
'  content: " points";',
'}',
'</style>'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P11_SEARCH'
,p_query_row_template=>wwv_flow_api.id(26415682571986712)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Users found.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26401518127798206)
,p_query_column_id=>1
,p_column_alias=>'ID_USR'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26401944922798206)
,p_query_column_id=>2
,p_column_alias=>'DISPLAY'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<img class="initialized materialboxed responsive-img" src="#PROFILE_PIC_URL#"><span>&nbsp;#USR_FULLNAME#</span>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42093530467320012)
,p_query_column_id=>3
,p_column_alias=>'PROFILE_PIC_URL'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42093635448320013)
,p_query_column_id=>4
,p_column_alias=>'USR_FULLNAME'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26386016127692004)
,p_query_column_id=>5
,p_column_alias=>'TARGET'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26386125999692005)
,p_query_column_id=>6
,p_column_alias=>'BADGE'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26751852262299105)
,p_query_column_id=>7
,p_column_alias=>'NEW_BADGE'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26402757787798206)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:container:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26403979796798207)
,p_plug_name=>'(preloader)'
,p_parent_plug_id=>wwv_flow_api.id(26402757787798206)
,p_region_template_options=>'#DEFAULT#:center-align'
,p_plug_template=>wwv_flow_api.id(77384442759098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26945787610647777)
,p_plug_name=>'(items)'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26403125294798206)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(26402757787798206)
,p_button_name=>'P11_RESET'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Reset'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'restore'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26403506926798207)
,p_name=>'P11_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26402757787798206)
,p_prompt=>'Search'
,p_placeholder=>'search'
,p_pre_element_text=>'<i class="material-icons prefix">search</i>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26946080502647777)
,p_name=>'P11_PREVENT_PAGE_SUBMIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26945787610647777)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26948929997657057)
,p_name=>'HIDE_PREVENT_PAGE_SUBMIT'
,p_event_sequence=>5
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26949398982657057)
,p_event_id=>wwv_flow_api.id(26948929997657057)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_PREVENT_PAGE_SUBMIT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26404791821798208)
,p_name=>'SHOW_PRELOADER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26405207759798209)
,p_event_id=>wwv_flow_api.id(26404791821798208)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26403979796798207)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26405689581798209)
,p_name=>'HIDE_PRELOADER'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'unload'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26406160776798210)
,p_event_id=>wwv_flow_api.id(26405689581798209)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26403979796798207)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26946892151653199)
,p_name=>'EMPTY_SEARCH'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(26403125294798206)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26947254664653199)
,p_event_id=>wwv_flow_api.id(26946892151653199)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_SEARCH'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26947683924654951)
,p_name=>'REFRESH_REPORT'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_SEARCH'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26948571506654951)
,p_event_id=>wwv_flow_api.id(26947683924654951)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26399576986798203)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26948059414654951)
,p_event_id=>wwv_flow_api.id(26947683924654951)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#P11_SEARCH").blur();'
,p_stop_execution_on_error=>'Y'
,p_da_action_comment=>'Let virtual Keyboard disappear when no submit happens'
);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Battles'
,p_page_mode=>'NORMAL'
,p_step_title=>'Battles'
,p_step_sub_title=>'Battles'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26372131622012720)
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151019132204'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(26580435253913223)
,p_name=>'Battles'
,p_template=>wwv_flow_api.id(77384709376098346)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:hide-title'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- Received',
'SELECT usr_battle.id_usr_battle,',
'       NULL AS display,',
'       nvl(usr.twitter_profile_pic_url,',
'           ''&CRAPPY_HOME.img/avatar-placeholder.png'') AS profile_pic_url,',
'       usr.usr_firstname || '' '' || usr.usr_lastname AS usr_fullname,',
'       apex_page.get_url(p_application => :app_id,',
'                         p_page        => 13,',
'                         p_clear_cache => 13,',
'                         p_items       => ''P13_PAGE_FROM,P13_ID_USR_BATTLE'',',
'                         p_values      => ''12,'' || usr_battle.id_usr_battle) AS target,',
'       CASE',
'         WHEN usr_battle.highscore_receiver IS NULL THEN',
'          to_char(usr_battle.highscore_challenger)',
'         ELSE',
'          usr_battle.highscore_receiver || '' - '' ||',
'          usr_battle.highscore_challenger',
'       END AS badge,',
'       CASE',
'         WHEN usr_battle.highscore_receiver IS NULL THEN',
'          ''Y''',
'         ELSE',
'          NULL',
'       END AS new_badge',
'  FROM usr,',
'       usr_battle',
' WHERE usr.id_usr = usr_battle.id_usr_challenger',
'   AND usr_battle.id_usr_receiver = :f_id_usr',
'   AND usr.acc_active = 1',
'   AND usr.id_usr != api_usr.getc_admin_pk',
'   AND :p12_battle_type = ''R''',
'UNION',
'-- Challenged',
'SELECT usr_battle.id_usr_battle,',
'       NULL AS display,',
'       nvl(usr.twitter_profile_pic_url,',
'           ''&CRAPPY_HOME.img/avatar-placeholder.png'') AS profile_pic_url,',
'       usr.usr_firstname || '' '' || usr.usr_lastname AS usr_fullname,',
'       apex_page.get_url(p_application => :app_id,',
'                         p_page        => 13,',
'                         p_clear_cache => 13,',
'                         p_items       => ''P13_PAGE_FROM,P13_ID_USR_BATTLE'',',
'                         p_values      => ''12,'' || usr_battle.id_usr_battle) AS target,',
'       CASE',
'         WHEN usr_battle.highscore_receiver IS NULL THEN',
'          to_char(usr_battle.highscore_challenger)',
'         ELSE',
'          usr_battle.highscore_challenger || '' - '' ||',
'          usr_battle.highscore_receiver',
'       END AS badge,',
'       CASE',
'         WHEN usr_battle.highscore_receiver IS NULL THEN',
'          ''Y''',
'         ELSE',
'          NULL',
'       END AS new_badge',
'  FROM usr,',
'       usr_battle',
' WHERE usr.id_usr = usr_battle.id_usr_receiver',
'   AND usr_battle.id_usr_challenger = :f_id_usr',
'   AND usr.acc_active = 1',
'   AND usr.id_usr != api_usr.getc_admin_pk',
'   AND :p12_battle_type = ''C''',
' ORDER BY 1 DESC'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'img {',
'  width: 50px;',
'  height: 50px !important;',
'  border-radius: 50%;',
'  vertical-align:middle;',
'}',
'.material-icons {',
'  line-height: 2;',
'  font-size: 2rem;  ',
'}',
'.materialboxed {',
'    cursor: auto;',
'}',
'span.badge.new:after {',
'  content: " open";',
'}',
'</style>'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P12_BATTLE_TYPE'
,p_query_row_template=>wwv_flow_api.id(26415682571986712)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Battles found.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26553226983516314)
,p_query_column_id=>1
,p_column_alias=>'ID_USR_BATTLE'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26582406491913225)
,p_query_column_id=>2
,p_column_alias=>'DISPLAY'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<img class="initialized materialboxed responsive-img" src="#PROFILE_PIC_URL#"><span>&nbsp;#USR_FULLNAME#</span>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42092787916320004)
,p_query_column_id=>3
,p_column_alias=>'PROFILE_PIC_URL'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42092877022320005)
,p_query_column_id=>4
,p_column_alias=>'USR_FULLNAME'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26552991065516311)
,p_query_column_id=>5
,p_column_alias=>'TARGET'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26553023328516312)
,p_query_column_id=>6
,p_column_alias=>'BADGE'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26553108091516313)
,p_query_column_id=>7
,p_column_alias=>'NEW_BADGE'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26583658539913226)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:container:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26584831250913228)
,p_plug_name=>'(preloader)'
,p_parent_plug_id=>wwv_flow_api.id(26583658539913226)
,p_region_template_options=>'#DEFAULT#:center-align'
,p_plug_template=>wwv_flow_api.id(77384442759098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26584490693913227)
,p_name=>'P12_BATTLE_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26583658539913226)
,p_item_default=>'R'
,p_prompt=>'Type'
,p_pre_element_text=>'<i class="material-icons prefix">search</i>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Received;R,Challenged;C'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26587491699913232)
,p_name=>'SHOW_PRELOADER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26587920246913232)
,p_event_id=>wwv_flow_api.id(26587491699913232)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26584831250913228)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26585680870913231)
,p_name=>'HIDE_PRELOADER'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'unload'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26586108043913232)
,p_event_id=>wwv_flow_api.id(26585680870913231)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26584831250913228)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26911672482213722)
,p_name=>'REFRESH_REPORT'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_BATTLE_TYPE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26911700623213723)
,p_event_id=>wwv_flow_api.id(26911672482213722)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26580435253913223)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Battle Details'
,p_page_mode=>'NORMAL'
,p_step_title=>'Battle Details'
,p_step_sub_title=>'Battle Details'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26372131622012720)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'img {',
'  width: 220px;',
'  height: 220px !important;',
'  box-shadow: 0 0 6px rgba(0, 0, 0, .7);',
'  -webkit-box-shadow: 0 0 6px rgba(0, 0, 0, .7);',
'  -moz-box-shadow: 0 0 6px rgba(0, 0, 0, .7);',
'}'))
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151014153336'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26555380357516335)
,p_plug_name=>'(container)'
,p_region_template_options=>'#DEFAULT#:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26553989080516321)
,p_plug_name=>'Receiver'
,p_parent_plug_id=>wwv_flow_api.id(26555380357516335)
,p_region_template_options=>'#DEFAULT#:apex-materialbox:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26554353546516325)
,p_plug_name=>'Details'
,p_parent_plug_id=>wwv_flow_api.id(26553989080516321)
,p_region_template_options=>'#DEFAULT#:apex-materialbox:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26604345576420545)
,p_plug_name=>'Challenger'
,p_parent_plug_id=>wwv_flow_api.id(26555380357516335)
,p_region_template_options=>'#DEFAULT#:apex-materialbox:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26606397513420547)
,p_plug_name=>'Details'
,p_parent_plug_id=>wwv_flow_api.id(26604345576420545)
,p_region_template_options=>'#DEFAULT#:apex-materialbox:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26605948757420547)
,p_plug_name=>'(preloader)'
,p_parent_plug_id=>wwv_flow_api.id(26555380357516335)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(77384442759098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26554238428516324)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26555380357516335)
,p_button_name=>'P1_BATTLE_PLAY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:waves-effect:green:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Resume Battle'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_PAGE_FROM,P9_ID_USR_BATTLE,P9_ID_USR_CHALLENGER,P9_ID_USR_RECEIVER:13,&P13_ID_USR_BATTLE.,&P13_ID_USR_CHALLENGER.,&P13_ID_USR_RECEIVER.'
,p_icon_css_classes=>'games'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26554099667516322)
,p_name=>'P13_PROFILE_PIC_URL2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26553989080516321)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26554176535516323)
,p_name=>'P13_PROFILE_PIC_TWITTER2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26553989080516321)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Profile Pic'
,p_source=>'P13_PROFILE_PIC_URL2'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-image-circle:item-image-responsive:item-no-label'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26554667468516328)
,p_name=>'P13_NAME2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26554353546516325)
,p_prompt=>'Name'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26554791937516329)
,p_name=>'P13_TWITTER_NAME2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26554353546516325)
,p_prompt=>'Twitter'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26554880892516330)
,p_name=>'P13_HIGHSCORE2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26553989080516321)
,p_prompt=>'Highscore'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26554933165516331)
,p_name=>'P13_ID_USR_CHALLENGER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26606397513420547)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26555010123516332)
,p_name=>'P13_ID_USR_RECEIVER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26554353546516325)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26555179167516333)
,p_name=>'P13_CHALLENGER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26604345576420545)
,p_prompt=>'Challenger'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26555292520516334)
,p_name=>'P13_RECEIVER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26553989080516321)
,p_prompt=>'Receiver'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26605159480420545)
,p_name=>'P13_PROFILE_PIC_URL1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26604345576420545)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26605505224420547)
,p_name=>'P13_PROFILE_PIC_TWITTER1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(26604345576420545)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Profile Pic'
,p_source=>'P13_PROFILE_PIC_URL1'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-image-circle:item-image-responsive:item-no-label'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26606724741420547)
,p_name=>'P13_ID_USR_BATTLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26604345576420545)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26607175863420547)
,p_name=>'P13_PAGE_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26604345576420545)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26607580860420547)
,p_name=>'P13_NAME1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(26606397513420547)
,p_prompt=>'Name'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26607997971420547)
,p_name=>'P13_TWITTER_NAME1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(26606397513420547)
,p_prompt=>'Twitter'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26608325524420547)
,p_name=>'P13_HIGHSCORE1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(26604345576420545)
,p_prompt=>'Highscore'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26610470947420548)
,p_name=>'SHOW_PRELOADER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26610932442420548)
,p_event_id=>wwv_flow_api.id(26610470947420548)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26605948757420547)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26609520647420548)
,p_name=>'HIDE_PRELOADER'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'unload'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26610087025420548)
,p_event_id=>wwv_flow_api.id(26609520647420548)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26605948757420547)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26763123213699588)
,p_name=>'TOAST_USR_BETTER'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'FUNCTION_BODY'
,p_display_when_cond=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'    RETURN api_usr_battle.check_better_highscore(i_id_usr        => :f_id_usr,',
'                                i_id_usr_battle => :p13_id_usr_battle);',
'END;'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26763570395699589)
,p_event_id=>wwv_flow_api.id(26763123213699588)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Materialize.toast(''You won! Keep it up!'', 4000);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26751681598299103)
,p_name=>'TOAST_USR_WORSE'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'FUNCTION_BODY'
,p_display_when_cond=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  -- opposite of function',
'  IF api_usr_battle.check_better_highscore(i_id_usr        => :f_id_usr,',
'                                           i_id_usr_battle => :p13_id_usr_battle) THEN',
'    RETURN FALSE;',
'  ELSE',
'    RETURN TRUE;',
'  END IF;',
'END;'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26751711753299104)
,p_event_id=>wwv_flow_api.id(26751681598299103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Materialize.toast(''You lose! Come on!'', 4000);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26609173545420548)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_BACK_BUTTON'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
' :P0_SHOW_BACK_BTN := 1;',
' :P0_PAGE_FROM := :P13_PAGE_FROM;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26608746152420548)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FILL_BATTLE_DETAILS'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr_battle.do_fill_battle_details(i_id_usr_battle         => :p13_id_usr_battle,',
'                                        o_id_usr_challenger     => :p13_id_usr_challenger,',
'                                        o_id_usr_receiver       => :p13_id_usr_receiver,',
'                                        o_name_chall            => :p13_name1,',
'                                        o_name_rec              => :p13_name2,',
'                                        o_twitter_name_chall    => :p13_twitter_name1,',
'                                        o_twitter_name_rec      => :p13_twitter_name2,',
'                                        o_profile_pic_url_chall => :p13_profile_pic_url1,',
'                                        o_profile_pic_url_rec   => :p13_profile_pic_url2,',
'                                        o_highscore_challenger  => :p13_highscore1,',
'                                        o_highscore_receiver    => :p13_highscore2);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Nearby Users Map'
,p_page_mode=>'NORMAL'
,p_step_title=>'Nearby Users Map'
,p_step_sub_title=>'Nearby Users Map'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26372131622012720)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.btn {',
'    margin-bottom: 0em;',
'}'))
,p_step_template=>wwv_flow_api.id(77381301645098344)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26559138998757238)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_browser_cache=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20150918225142'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26857045280304046)
,p_plug_name=>'Nearby Users Map'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr_location.render_nearby_usr_gmaps(i_id_usr           => :f_id_usr,',
'                                           i_distance         => :p14_distance,',
'                                           i_crappy_home_path => :crappy_home);',
'END;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26857474353304047)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(26857045280304046)
,p_button_name=>'P14_BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Exit Map'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:&P14_PAGE_FROM.:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26857842198304047)
,p_name=>'P14_PAGE_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26857045280304046)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26865056923957462)
,p_name=>'P14_DISTANCE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(26857045280304046)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  return nvl(apex_util.get_session_state(''P5_DISTANCE''),',
'             200);',
'END;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Distance'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:50 Miles;50,100 Miles;100,200 Miles;200,300 Miles;300,500 Miles;500,1000 Miles;1000'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26859042116304051)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_INIT_HIGHSCORE_COOKIE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_game.set_highscore_cookie_usr(i_id_usr => :f_id_usr);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'System'
,p_page_mode=>'NORMAL'
,p_step_title=>'System'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26456229815732840)
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26449655403829591)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20150916233826'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26387970341692023)
,p_plug_name=>'System'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26800075685918401)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(26387970341692023)
,p_button_name=>'P15_NEW_TWITTER_BEARER'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Get new Twitter Bearer Token'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Normally you get one token for app lifetime! Only use when problems with twitter occur! Go on?'',''P15_NEW_TWITTER_BEARER'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'cached'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26526963809359103)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26387970341692023)
,p_button_name=>'P15_SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:fixed-action-btn:waves-effect:green:icon-float-left:z-depth-5:btn-large:btn-floating:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_icon_css_classes=>'save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26388049731692024)
,p_name=>'P15_TWITTER_CONSUMER_KEY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26387970341692023)
,p_prompt=>'Twitter API Consumer Key'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26388190945692025)
,p_name=>'P15_TWITTER_CONSUMER_SECRET'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26387970341692023)
,p_prompt=>'Twitter API Consumer Secret'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26388286219692026)
,p_name=>'P15_TWITTER_WALLET_PATH'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26387970341692023)
,p_prompt=>'Twitter SSL Wallet Path'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26388302388692027)
,p_name=>'P15_EMAIL_FROM'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(26387970341692023)
,p_prompt=>'Default Email Sending Address'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26388458782692028)
,p_name=>'P15_TWITTER_WALLET_PWD'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26387970341692023)
,p_prompt=>'Twitter SSL Wallet Password'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26552310361516305)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPDATE_SYSTEM'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_system.do_update_system(i_twitter_consumer_key    => :p15_twitter_consumer_key,',
'                              i_twitter_consumer_secret => :p15_twitter_consumer_secret,',
'                              i_twitter_ssl_wallet_path => :p15_twitter_wallet_path,',
'                              i_twitter_ssl_wallet_pwd  => :p15_twitter_wallet_pwd,',
'                              i_email_from              => :p15_email_from);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error while saving system settings.',
'#SQLERRM# '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(26526963809359103)
,p_process_success_message=>'Successfully saved system settings.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26800111082918402)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RESET_TWITTER_BEARER_TOKEN'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_twitter.reset_twitter_bearer_token;',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error during reset of twitter bearer.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(26800075685918401)
,p_process_success_message=>'Successfully reset twitter bearer to a new value.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26552229916516304)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FILL_SYSTEM_ITEMS'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_system.do_fill_system(o_twitter_consumer_key    => :p15_twitter_consumer_key,',
'                            o_twitter_consumer_secret => :p15_twitter_consumer_secret,',
'                            o_twitter_ssl_wallet_path => :p15_twitter_wallet_path,',
'                            o_twitter_ssl_wallet_pwd  => :p15_twitter_wallet_pwd,',
'                            o_email_from              => :p15_email_from);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Error Log'
,p_page_mode=>'NORMAL'
,p_step_title=>'Error Log'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26456229815732840)
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26449655403829591)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20150916233840'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26388683761692030)
,p_plug_name=>'Error Log'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:center-align:hide-title'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT err_log.err_log_date,',
'       err_log.err_log_function,',
'       err_log.err_log_text,',
'       err_log.app_page_id',
'  FROM err_log',
' WHERE err_log.app_id = :app_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(26388770631692031)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DH'
,p_internal_uid=>26388770631692031
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26388830331692032)
,p_db_column_name=>'ERR_LOG_DATE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26388924719692033)
,p_db_column_name=>'ERR_LOG_FUNCTION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Function'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26389026496692034)
,p_db_column_name=>'ERR_LOG_TEXT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Text'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26389180989692035)
,p_db_column_name=>'APP_PAGE_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Page-ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(26464021859827358)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'264641'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ERR_LOG_DATE:ERR_LOG_FUNCTION:ERR_LOG_TEXT:APP_PAGE_ID'
,p_sort_column_1=>'ERR_LOG_DATE'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Users'
,p_page_mode=>'NORMAL'
,p_step_title=>'Users'
,p_step_sub_title=>'Users'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26456229815732840)
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26449655403829591)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151019134741'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(26476208068872155)
,p_name=>'Users'
,p_template=>wwv_flow_api.id(77384709376098346)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:hide-title'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT usr.id_usr,',
'       NULL AS display,',
'       nvl(usr.twitter_profile_pic_url,',
'           ''&CRAPPY_HOME.img/avatar-placeholder.png'') AS profile_pic_url,',
'       usr.usr_firstname || '' '' || usr.usr_lastname AS usr_fullname,',
'       apex_page.get_url(p_application => :app_id,',
'                         p_page        => 18,',
'                         p_clear_cache => 18,',
'                         p_items       => ''P18_ID_USR'',',
'                         p_values      => usr.id_usr) AS target,',
'       decode(usr.acc_active,',
'              1,',
'              ''active'',',
'              0,',
'              ''inactive'') AS badge',
'  FROM usr',
' WHERE usr.id_usr != api_usr.getc_admin_pk',
'   AND (upper(usr.usr_firstname) LIKE upper(''%'' || :p17_search || ''%'') OR',
'       upper(usr.usr_lastname) LIKE upper(''%'' || :p17_search || ''%''))',
' ORDER BY upper(usr.usr_lastname),',
'          upper(usr.usr_firstname)'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'img {',
'  width: 50px;',
'  height: 50px !important;',
'  border-radius: 50%;',
'  vertical-align:middle;',
'}',
'.material-icons {',
'  line-height: 2;',
'  font-size: 2rem;  ',
'}',
'.materialboxed {',
'    cursor: auto;',
'}',
'</style>'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P17_SEARCH'
,p_query_row_template=>wwv_flow_api.id(26415682571986712)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Users found.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26476609595872155)
,p_query_column_id=>1
,p_column_alias=>'ID_USR'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26477025022872155)
,p_query_column_id=>2
,p_column_alias=>'DISPLAY'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<img class="initialized materialboxed responsive-img" src="#PROFILE_PIC_URL#"><span>&nbsp;#USR_FULLNAME#</span>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42093761938320014)
,p_query_column_id=>3
,p_column_alias=>'PROFILE_PIC_URL'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42093812181320015)
,p_query_column_id=>4
,p_column_alias=>'USR_FULLNAME'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26477438414872155)
,p_query_column_id=>5
,p_column_alias=>'TARGET'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26477891079872156)
,p_query_column_id=>6
,p_column_alias=>'BADGE'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26478212285872156)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:container:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26479434711872157)
,p_plug_name=>'(preloader)'
,p_parent_plug_id=>wwv_flow_api.id(26478212285872156)
,p_region_template_options=>'#DEFAULT#:center-align'
,p_plug_template=>wwv_flow_api.id(77384442759098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26953906763690628)
,p_plug_name=>'(items)'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26478636959872156)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(26478212285872156)
,p_button_name=>'P17_RESET'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Reset'
,p_button_position=>'BODY'
,p_icon_css_classes=>'restore'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27092547357101303)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(26478212285872156)
,p_button_name=>'P17_USR_COUNTER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:waves-effect:blue:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'&P17_COUNT_LABEL. total users'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_button_css_classes=>'disabled'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26479065404872156)
,p_name=>'P17_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26478212285872156)
,p_prompt=>'Search'
,p_placeholder=>'search'
,p_pre_element_text=>'<i class="material-icons prefix">search</i>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26954216922690628)
,p_name=>'P17_PREVENT_PAGE_SUBMIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26953906763690628)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27092651041101304)
,p_name=>'P17_COUNT_LABEL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26478212285872156)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26956727632696666)
,p_name=>'HIDE_PREVENT_PAGE_SUBMIT'
,p_event_sequence=>5
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26957161620696666)
,p_event_id=>wwv_flow_api.id(26956727632696666)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_PREVENT_PAGE_SUBMIT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26480254245872157)
,p_name=>'SHOW_PRELOADER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26480771144872157)
,p_event_id=>wwv_flow_api.id(26480254245872157)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26479434711872157)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26481138890872157)
,p_name=>'HIDE_PRELOADER'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'unload'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26481660745872158)
,p_event_id=>wwv_flow_api.id(26481138890872157)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26479434711872157)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26954659938692779)
,p_name=>'EMPTY_SEARCH'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(26478636959872156)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26955011165692779)
,p_event_id=>wwv_flow_api.id(26954659938692779)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_SEARCH'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26955448215694775)
,p_name=>'REFRESH_REPORT'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_SEARCH'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26956336935694775)
,p_event_id=>wwv_flow_api.id(26955448215694775)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26476208068872155)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26955858493694775)
,p_event_id=>wwv_flow_api.id(26955448215694775)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#P17_SEARCH").blur();'
,p_stop_execution_on_error=>'Y'
,p_da_action_comment=>'Let virtual Keyboard disappear when no submit happens'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27092756436101305)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DO_FILL_USR_COUNTER'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  :p17_count_label := api_usr.count_all_usr;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'User Profile (Admin)'
,p_page_mode=>'NORMAL'
,p_step_title=>'User Profile (Admin)'
,p_step_sub_title=>'User Profile (Admin)'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26456229815732840)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'img {',
'  width: 220px;',
'  box-shadow: 0 0 6px rgba(0, 0, 0, .7);',
'  -webkit-box-shadow: 0 0 6px rgba(0, 0, 0, .7);',
'  -moz-box-shadow: 0 0 6px rgba(0, 0, 0, .7);',
'}'))
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26449655403829591)
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151014145550'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26485739193939758)
,p_plug_name=>'Profile'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26486988691939759)
,p_plug_name=>'(preloader)'
,p_parent_plug_id=>wwv_flow_api.id(26485739193939758)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(77384442759098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26487308533939759)
,p_plug_name=>'Details'
,p_parent_plug_id=>wwv_flow_api.id(26485739193939758)
,p_region_template_options=>'#DEFAULT#:apex-materialbox:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26389329554692037)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(26487308533939759)
,p_button_name=>'P18_SET_ACTIVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:waves-effect:blue:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Set active'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_usr.check_usr_active(i_id_usr => :p18_id_usr);',
'END;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'keyboard_arrow_up'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26389411283692038)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(26487308533939759)
,p_button_name=>'P18_SET_INACTIVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:waves-effect:blue:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Set inactive'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_usr.check_usr_inactive(i_id_usr => :p18_id_usr);',
'END;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'keyboard_arrow_down'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26389535180692039)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(26487308533939759)
,p_button_name=>'P18_DELETE_USR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Delete User'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Do you really want to delete this user?'',''P18_DELETE_USR'');'
,p_icon_css_classes=>'delete'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(26390152450692045)
,p_branch_name=>'GOTO_P17'
,p_branch_action=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(26389535180692039)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26389217307692036)
,p_name=>'P18_EMAIL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26487308533939759)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26486117029939758)
,p_name=>'P18_PROFILE_PIC_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26485739193939758)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26486542396939759)
,p_name=>'P18_PROFILE_PIC_TWITTER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26485739193939758)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Profile pic twitter'
,p_source=>'P18_PROFILE_PIC_URL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-image-circle:item-image-responsive:item-no-label'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26487774277939759)
,p_name=>'P18_ID_USR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26487308533939759)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26488505194939760)
,p_name=>'P18_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26487308533939759)
,p_prompt=>'Name'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26488924321939760)
,p_name=>'P18_TWITTER_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(26487308533939759)
,p_prompt=>'Twitter'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26491074082939761)
,p_name=>'SHOW_PRELOADER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26491586378939761)
,p_event_id=>wwv_flow_api.id(26491074082939761)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26486988691939759)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26490195762939761)
,p_name=>'HIDE_PRELOADER'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'unload'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26490634248939761)
,p_event_id=>wwv_flow_api.id(26490195762939761)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26486988691939759)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26389608123692040)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_USR'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.del_usr(i_id_usr => :p18_id_usr);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error while deleting user.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(26389535180692039)
,p_process_success_message=>'Successfully deleted user.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26389700729692041)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_USR_ACTIVE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_change_usr_acc_status(i_id_usr     => :p18_id_usr,',
'                                   i_acc_active => 1);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error while changing status.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(26389329554692037)
,p_process_success_message=>'Successfully set user to active.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26389863444692042)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_USR_INACTIVE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_change_usr_acc_status(i_id_usr     => :p18_id_usr,',
'                                   i_acc_active => 0);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error while changing status.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(26389411283692038)
,p_process_success_message=>'Successfully set user to inactive.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26526054961330337)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_BACK_BUTTON'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
' :P0_SHOW_BACK_BTN := 1;',
' :P0_PAGE_FROM := 17;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26489737238939760)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FILL_USR_PROFILE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_usr_highscore usr.usr_highscore%TYPE;',
'BEGIN',
'  api_usr.do_fill_usr_profile(i_id_usr                  => :p18_id_usr,',
'                              o_usr_email               => :p18_email,',
'                              o_usr_name                => :p18_name,',
'                              o_twitter_name            => :p18_twitter_name,',
'                              o_usr_highscore           => l_usr_highscore,',
'                              o_twitter_profile_pic_url => :p18_profile_pic_url);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00019
begin
wwv_flow_api.create_page(
 p_id=>19
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Game Screenshot'
,p_page_mode=>'NORMAL'
,p_step_title=>'Game Screenshot'
,p_step_sub_title=>'Test Screenshot'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26372213871014189)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.btn {',
'    margin-bottom: 0em;',
'}'))
,p_step_template=>wwv_flow_api.id(77381301645098344)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26449853624835556)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_browser_cache=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20150918225123'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26961030275792100)
,p_plug_name=>'CrappyBird Game'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_game.render_crappybird_usr(i_id_usr              => :f_id_usr,',
'                                 i_crappy_home_path    => :crappy_home ||',
'                                                          ''game/'',',
'                                 i_highscore_item_name => ''P19_HIGHSCORE'');',
'END;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26961495087792101)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(26961030275792100)
,p_button_name=>'P19_BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Exit Game'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:&P19_PAGE_FROM.:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26912597553213731)
,p_name=>'P19_PREVIEW_IMAGE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(26961030275792100)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26912853223213734)
,p_name=>'P19_THEME_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(26961030275792100)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26913190174213737)
,p_name=>'P19_THEME_URL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(26961030275792100)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26961800405792101)
,p_name=>'P19_PAGE_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26961030275792100)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26962620379792101)
,p_name=>'P19_HIGHSCORE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26961030275792100)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26963417979792105)
,p_name=>'SET_USR_HIGHSCORE'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_HIGHSCORE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26963963951792105)
,p_event_id=>wwv_flow_api.id(26963417979792105)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_set_usr_highscore(i_id_usr        => :f_id_usr,',
'                               i_usr_highscore => :p19_highscore);',
'END;'))
,p_attribute_02=>'P19_HIGHSCORE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26912618978213732)
,p_name=>'TAKE_GAME_SCREENSHOT'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26912722238213733)
,p_event_id=>wwv_flow_api.id(26912618978213732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'wait_take_screenshot(12000,"P19_PREVIEW_IMAGE","crappy_canvas");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26913366993213739)
,p_name=>'INSERT_PUBLIC_THEME'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_PREVIEW_IMAGE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26913463980213740)
,p_event_id=>wwv_flow_api.id(26913366993213739)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_url VARCHAR2(500);',
'BEGIN',
'  l_url := api_pub_themes.do_insert_pub_theme(i_id_usr      => :f_id_usr,',
'                                              i_theme_name  => :p19_theme_name,',
'                                              i_preview_img => :p19_preview_image);',
'  --',
'  apex_util.set_session_state(''P19_THEME_URL'',',
'                              l_url);',
'END;'))
,p_attribute_02=>'P19_THEME_NAME,P19_PREVIEW_IMAGE'
,p_attribute_03=>'P19_THEME_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26913554133213741)
,p_name=>'REDIRECT_THEME_DETAIL_PAGE'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_THEME_URL'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26913685259213742)
,p_event_id=>wwv_flow_api.id(26913554133213741)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var url = apex.item("P19_THEME_URL").getValue();',
'apex.navigation.redirect(url);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27034301363069398)
,p_name=>'TOAST'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27034714462069398)
,p_event_id=>wwv_flow_api.id(27034301363069398)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Materialize.toast(''Play 10 seconds!'', 3000);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26963012647792104)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_INIT_HIGHSCORE_COOKIE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_game.set_highscore_cookie_usr(i_id_usr => :f_id_usr);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Share Theme'
,p_page_mode=>'NORMAL'
,p_step_title=>'Share Theme'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26981688303505812)
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26449853624835556)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20150916234320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26912105058213727)
,p_plug_name=>'Theme Name'
,p_region_template_options=>'#DEFAULT#:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>11
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26972863373142228)
,p_plug_name=>'Info'
,p_region_template_options=>'#DEFAULT#:flow-text-region:center-align:amber:red-text'
,p_plug_template=>wwv_flow_api.id(77383167968098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>To share your customized theme with others, give it a name and click <strong>"Publish & take Screenshot"</strong>.</p>',
'<p><strong>Play the game about 10 seconds to gain a cool screenshot, after that you will be redirected to your published theme!</strong></p>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26912364749213729)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(26912105058213727)
,p_button_name=>'P20_GOTO_GAME_SCREENSHOT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:waves-effect:green:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Publish & take Screenshot'
,p_button_position=>'BODY'
,p_icon_css_classes=>'perm_media'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(26913002864213736)
,p_branch_name=>'GOTO_P19'
,p_branch_action=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19:P19_PAGE_FROM,P19_THEME_NAME:20,&P20_THEME_NAME.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(26912364749213729)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26912227952213728)
,p_name=>'P20_THEME_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26912105058213727)
,p_prompt=>'Theme name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_field_template=>wwv_flow_api.id(77389017413098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26912456634213730)
,p_name=>'P20_PAGE_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26912105058213727)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26912950713213735)
,p_validation_name=>'P20_THEME_NAME_NOT_NULL'
,p_validation_sequence=>10
,p_validation=>'P20_THEME_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26912364749213729)
,p_associated_item=>wwv_flow_api.id(26912227952213728)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27029562425055620)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_BACK_BUTTON'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
' :P0_SHOW_BACK_BTN := 1;',
' :P0_PAGE_FROM := :P20_PAGE_FROM;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Public Themes'
,p_page_mode=>'NORMAL'
,p_step_title=>'Public Themes'
,p_step_sub_title=>'Public Themes'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26981688303505812)
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26449853624835556)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151019133047'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26992294133592003)
,p_plug_name=>'(items)'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(26993049961592004)
,p_name=>'Public Themes'
,p_template=>wwv_flow_api.id(77384709376098346)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:apex-materialbox:hide-title'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT pub_themes.id_pub_themes,',
'       NULL AS display,',
'       pub_themes.preview_img,',
'       pub_themes.theme_name,',
'       apex_page.get_url(p_application => :app_id,',
'                         p_page        => 22,',
'                         p_clear_cache => 22,',
'                         p_items       => ''P22_PAGE_FROM,P22_ID_PUB_THEMES'',',
'                         p_values      => ''21,'' || pub_themes.id_pub_themes) AS target,',
'       NULL AS button_css_classes,',
'       ''play_arrow'' AS icon_css_classes',
'  FROM pub_themes',
' WHERE pub_themes.id_usr != api_usr.getc_admin_pk',
'   AND upper(pub_themes.theme_name) LIKE upper(''%'' || :p21_search || ''%'')',
' ORDER BY pub_themes.id_pub_themes DESC'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'img {',
'  width: 60px;',
'  vertical-align:middle;',
'}',
'.material-icons {',
'  line-height: 2;',
'  font-size: 3rem;  ',
'}',
'.materialboxed {',
'    cursor: auto;',
'}',
'</style>'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P21_SEARCH'
,p_query_row_template=>wwv_flow_api.id(42111131538472418)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Themes found.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26913742019213743)
,p_query_column_id=>1
,p_column_alias=>'ID_PUB_THEMES'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26993885495592005)
,p_query_column_id=>2
,p_column_alias=>'DISPLAY'
,p_column_display_sequence=>4
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<img class="initialized materialboxed responsive-img" src="#PREVIEW_IMG#"><span>&nbsp;#THEME_NAME#</span>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42092493905320001)
,p_query_column_id=>3
,p_column_alias=>'PREVIEW_IMG'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(42092503203320002)
,p_query_column_id=>4
,p_column_alias=>'THEME_NAME'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26913837921213744)
,p_query_column_id=>5
,p_column_alias=>'TARGET'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26995045916592005)
,p_query_column_id=>6
,p_column_alias=>'BUTTON_CSS_CLASSES'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26913999026213745)
,p_query_column_id=>7
,p_column_alias=>'ICON_CSS_CLASSES'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26996242214592006)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:container:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26997497564592006)
,p_plug_name=>'(preloader)'
,p_parent_plug_id=>wwv_flow_api.id(26996242214592006)
,p_region_template_options=>'#DEFAULT#:center-align'
,p_plug_template=>wwv_flow_api.id(77384442759098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26996685341592006)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(26996242214592006)
,p_button_name=>'P21_RESET'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Reset'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'restore'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26992667931592004)
,p_name=>'P21_PREVENT_PAGE_SUBMIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26992294133592003)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26997074198592006)
,p_name=>'P21_SEARCH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26996242214592006)
,p_prompt=>'Search'
,p_placeholder=>'search'
,p_pre_element_text=>'<i class="material-icons prefix">search</i>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#:item-no-label'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27001978436592008)
,p_name=>'HIDE_PREVENT_PAGE_SUBMIT'
,p_event_sequence=>5
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27002464528592008)
,p_event_id=>wwv_flow_api.id(27001978436592008)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21_PREVENT_PAGE_SUBMIT'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26997861517592007)
,p_name=>'SHOW_PRELOADER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26998311703592007)
,p_event_id=>wwv_flow_api.id(26997861517592007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26997497564592006)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26998725501592007)
,p_name=>'HIDE_PRELOADER'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'unload'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26999275795592007)
,p_event_id=>wwv_flow_api.id(26998725501592007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26997497564592006)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27000569475592007)
,p_name=>'REFRESH_REPORT'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21_SEARCH'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27001597756592007)
,p_event_id=>wwv_flow_api.id(27000569475592007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(26993049961592004)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27001001863592007)
,p_event_id=>wwv_flow_api.id(27000569475592007)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#P21_SEARCH").blur();'
,p_stop_execution_on_error=>'Y'
,p_da_action_comment=>'Let virtual Keyboard disappear when no submit happens'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27002823635592008)
,p_name=>'EMPTY_SEARCH'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(26996685341592006)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27003367411592008)
,p_event_id=>wwv_flow_api.id(27002823635592008)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21_SEARCH'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27032933487897532)
,p_name=>'TOAST_CREATE_THEME'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27033378267897533)
,p_event_id=>wwv_flow_api.id(27032933487897532)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Materialize.toast(''<a href="f?p=&APP_ID.:7:&APP_SESSION.">Customize & Share!</a>'', 3000);'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Theme Details'
,p_page_mode=>'NORMAL'
,p_step_title=>'Theme Details'
,p_step_sub_title=>'Theme Details'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26981688303505812)
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(26449853624835556)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151019140633'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(26914074126213746)
,p_name=>'Theme Details'
,p_template=>wwv_flow_api.id(77384709376098346)
,p_display_sequence=>11
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:center-align:hide-title'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' SELECT NULL AS column_css_classes,',
'        pub_themes.preview_img AS img,',
'        pub_themes.theme_name AS title,',
'        ''Created by '' || api_usr.get_usr_firstname(pub_themes.id_usr) || '' '' ||',
'        api_usr.get_usr_lastname(pub_themes.id_usr) AS content',
'   FROM pub_themes',
'  WHERE pub_themes.id_pub_themes = :p22_id_pub_themes'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(33240388021852770)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26914191458213747)
,p_query_column_id=>1
,p_column_alias=>'COLUMN_CSS_CLASSES'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26914219806213748)
,p_query_column_id=>2
,p_column_alias=>'IMG'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<img src="#IMG#">'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26914316993213749)
,p_query_column_id=>3
,p_column_alias=>'TITLE'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26914427577213750)
,p_query_column_id=>4
,p_column_alias=>'CONTENT'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27009728807748309)
,p_plug_name=>'(Delete Button)'
,p_region_template_options=>'#DEFAULT#:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(26449655403829591)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33215120951594408)
,p_plug_name=>'(Buttons)'
,p_region_template_options=>'#DEFAULT#:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>21
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27037732263243270)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(27009728807748309)
,p_button_name=>'P18_DELETE_THEME'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Delete Theme'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Do you really want to delete this theme?'',''P18_DELETE_THEME'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'delete'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33215006378594407)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26914074126213746)
,p_button_name=>'P18_SAVE_THEME'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:waves-effect:green:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Set Theme as default'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_icon_css_classes=>'save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(27009692816748308)
,p_branch_name=>'Go To Page 1'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(33215006378594407)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(27009950593748311)
,p_branch_name=>'GOTO Page 21'
,p_branch_action=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(27037732263243270)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27009375853748305)
,p_name=>'P22_ID_PUB_THEMES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26914074126213746)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27009475636748306)
,p_name=>'P22_PAGE_FROM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26914074126213746)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27009559269748307)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_DEFAULT_THEME'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_pub_themes.set_pub_theme_current(i_id_usr        => :f_id_usr,',
'                                       i_id_pub_themes => :p22_id_pub_themes);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error while setting theme.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(33215006378594407)
,p_process_success_message=>'Successfully updated your theme. Free play to check it out.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27009862670748310)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_THEME'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_pub_themes.del_pub_themes(i_id_pub_themes => :p22_id_pub_themes);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error during delete.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(27037732263243270)
,p_process_success_message=>'Successfully deleted theme.'
,p_security_scheme=>wwv_flow_api.id(26449655403829591)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26987337962515324)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_BACK_BUTTON'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  :p0_show_back_btn := 1;',
'  :p0_page_from     := nvl(:p22_page_from,',
'                           21);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_page_mode=>'NORMAL'
,p_step_title=>'CrappyBird'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26371657845008979)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.card, .card-panel {',
'    margin: 0px;',
'}'))
,p_step_template=>wwv_flow_api.id(26258419162616417)
,p_page_template_options=>'page-center-logo:page-navbar-fixed'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151107222316'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26386421878692008)
,p_plug_name=>'(footer)'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(77383924706098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_source=>'<p>Built by <a href="https://twitter.com/Dani3lSun" target="_blank">Daniel Hochleitner</a>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26555456770516336)
,p_plug_name=>'Password lost?'
,p_region_name=>'bottom-sheet-password'
,p_region_template_options=>'#DEFAULT#:bottom-sheet'
,p_plug_template=>wwv_flow_api.id(77383982196098345)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_06'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26714965903570768)
,p_plug_name=>'WebApp Info'
,p_region_template_options=>'#DEFAULT#:center-align:amber:red-text'
,p_plug_template=>wwv_flow_api.id(77383167968098345)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'CrappyBird is mobile optimized! Especially for iOS and Chrome for Android. Just bookmark the page to your homescreen!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77409286195098358)
,p_plug_name=>'Login'
,p_region_name=>'bottom-sheet-login'
,p_region_template_options=>'#DEFAULT#:bottom-sheet'
,p_plug_template=>wwv_flow_api.id(77383982196098345)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_06'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style>',
'.btn {',
'  width: 100%;',
'}',
'</style>'))
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26536706084302302)
,p_plug_name=>'(buttons)'
,p_parent_plug_id=>wwv_flow_api.id(77409286195098358)
,p_region_template_options=>'#DEFAULT#:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77412842173131274)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77413226178131278)
,p_plug_name=>'Parallax Image'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(77384361789098345)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<img src="#IMAGE_PREFIX#crappybird/img/bg1.jpg"',
'width="600px">'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77413303876131279)
,p_plug_name=>'Welcome text'
,p_region_template_options=>'#DEFAULT#:container:flow-text-region:center-align:hide-title'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Register with your email below and the fun begins!</p>',
'<p><strong>The key features are:</strong></p>',
'<p> <i class="material-icons">stay_current_portrait</i> mobile optimized</p>',
'<p> <i class="material-icons">games</i> Play standalone</p>',
'<p> <i class="material-icons">face</i> Play against people around the world</p>',
'<p> <i class="material-icons">favorite</i> Play against your twitter friends</p>',
'<p> <i class="material-icons">location_on</i> Play against people in your local area</p>',
'<p> <i class="material-icons">build</i> Customize your playground</p>',
'<p> <i class="material-icons">photo_library</i> Share your created themes</p>',
'',
'<p>Customization + Social + CrappyBird = CrappyBird on steroids!</p>',
'<p>Fly the bird as far as you can...</p>',
'',
'<p>This game was designed and built to be part of the <a href="http://competition.odtug.com/pls/apex/f?p=AGC2015" target="_blank">ODTUG APEX Gaming Competition 2015</a>.</p>',
'<img src="&CRAPPY_HOME.img/ODTUG-logo.png" alt="ODTUG Logo" style="max-width:250px;" />'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77413528466131281)
,p_plug_name=>'Share this App with your twitter friends!'
,p_region_template_options=>'#DEFAULT#:container:flow-text-region:center-align:h5'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'',
''))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77475263284036073)
,p_plug_name=>'Register'
,p_region_name=>'bottom-sheet-register'
,p_region_template_options=>'#DEFAULT#:bottom-sheet'
,p_plug_template=>wwv_flow_api.id(77383982196098345)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_06'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(77413862975131284)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(26536706084302302)
,p_button_name=>'P100_SHOW_REGISTER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:waves-effect:icon-float-left:red-text:btn-flat:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Register'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26536620410302301)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(26536706084302302)
,p_button_name=>'P100_SHOW_NEW_PWD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:waves-effect:icon-float-left:red-text:btn-flat:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Password lost?'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(77413680431131283)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(77409286195098358)
,p_button_name=>'P100_LOGIN'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:waves-effect:green:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Login'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:javascript:apex.submit(''P101_PASSWORD'');'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26555822924516340)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(26555456770516336)
,p_button_name=>'P101_SEND_PWD_MAIL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:waves-effect:red:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Send restore link'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(77476696277036088)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(77475263284036073)
,p_button_name=>'P101_REGISTER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:waves-effect:blue:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Register'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(77412918364131275)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(77412842173131274)
,p_button_name=>'P101_SHOW_LOGIN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:fixed-action-btn:waves-effect:red:icon-float-left:z-depth-5:btn-large:btn-floating:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Login'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_icon_css_classes=>'input'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(77413662797131282)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(77413528466131281)
,p_button_name=>'P101_SHARE_TWITTER'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:waves-effect:blue:icon-float-left:btn-large:btn-floating:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Twitter'
,p_button_position=>'REGION_TEMPLATE_CREATE2'
,p_button_redirect_url=>'javascript:var x=window.open(''https://twitter.com/home?status=Play%20CrappyBird!%20&SOFTWARE_URL.%20%23orclapex'',''_blank'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'share'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26555781138516339)
,p_name=>'P101_EMAIL_PWD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26555456770516336)
,p_prompt=>'Email'
,p_pre_element_text=>'<i class="material-icons prefix">mail</i>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77409375775098358)
,p_name=>'P101_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(77409286195098358)
,p_prompt=>'Email'
,p_pre_element_text=>'<i class="material-icons prefix">account_circle</i>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77409482565098358)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(77409286195098358)
,p_prompt=>'Password'
,p_pre_element_text=>'<i class="material-icons prefix">vpn_key</i>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77475791957036079)
,p_name=>'P101_FIRSTNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(77475263284036073)
,p_prompt=>'Firstname'
,p_pre_element_text=>'<i class="material-icons prefix">perm_identity</i>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77475878326036080)
,p_name=>'P101_LASTNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(77475263284036073)
,p_prompt=>'Lastname'
,p_pre_element_text=>'<i class="material-icons prefix">perm_identity</i>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77477215529036093)
,p_name=>'P101_EMAIL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(77475263284036073)
,p_prompt=>'Email'
,p_pre_element_text=>'<i class="material-icons prefix">mail</i>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(77476331376036084)
,p_validation_name=>'P101_USERNAME_NOT_NULL'
,p_validation_sequence=>10
,p_validation=>'P101_USERNAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_validation_condition=>'P101_PASSWORD'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(77409375775098358)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(77476444498036085)
,p_validation_name=>'P101_PASSWORD_NOT_NULL'
,p_validation_sequence=>20
,p_validation=>'P101_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_validation_condition=>'P101_PASSWORD'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_associated_item=>wwv_flow_api.id(77409482565098358)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(77476964934036090)
,p_validation_name=>'P101_FIRSTNAME_NOT_NULL'
,p_validation_sequence=>30
,p_validation=>'P101_FIRSTNAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(77476696277036088)
,p_associated_item=>wwv_flow_api.id(77475791957036079)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(77477043449036091)
,p_validation_name=>'P101_LASTNAME_NOT_NULL'
,p_validation_sequence=>40
,p_validation=>'P101_LASTNAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(77476696277036088)
,p_associated_item=>wwv_flow_api.id(77475878326036080)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(77477427674036095)
,p_validation_name=>'P101_EMAIL_NOT_NULL'
,p_validation_sequence=>50
,p_validation=>'P101_EMAIL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(77476696277036088)
,p_associated_item=>wwv_flow_api.id(77477215529036093)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(77477293205036094)
,p_validation_name=>'P101_EMAIL_VALID_ADDRESS'
,p_validation_sequence=>70
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_utils.do_check_email(i_email_adr => :p101_email);',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL# is not a valid email address.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(77476696277036088)
,p_associated_item=>wwv_flow_api.id(77477215529036093)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(51407237019316655)
,p_validation_name=>'P101_EMAIL_UNIQUE'
,p_validation_sequence=>100
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_usr.check_usr_email_unique(i_usr_email => :p101_email);',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'This #LABEL# is already registered. Choose another address.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(77476696277036088)
,p_associated_item=>wwv_flow_api.id(77477215529036093)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26556056499516342)
,p_validation_name=>'P101_EMAIL_PWD_NOT_NULL'
,p_validation_sequence=>110
,p_validation=>'P101_EMAIL_PWD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26555822924516340)
,p_associated_item=>wwv_flow_api.id(26555781138516339)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26555933591516341)
,p_validation_name=>'P101_EMAIL_PWD_VALID_ADDRESS'
,p_validation_sequence=>120
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN api_utils.do_check_email(i_email_adr => :p101_email_pwd);',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL# is not a valid email address.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26555822924516340)
,p_associated_item=>wwv_flow_api.id(26555781138516339)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(77412987753131276)
,p_name=>'OPEN_MODAL_LOGIN'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(77412918364131275)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77413153109131277)
,p_event_id=>wwv_flow_api.id(77412987753131276)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(77409286195098358)
,p_attribute_01=>'$(''#bottom-sheet-login'').openModal();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(77476145451036082)
,p_name=>'OPEN_MODAL_REGISTER'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(77413862975131284)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77476188497036083)
,p_event_id=>wwv_flow_api.id(77476145451036082)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(77409286195098358)
,p_attribute_01=>'$(''#bottom-sheet-register'').openModal();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26556261166516344)
,p_name=>'OPEN_MODAL_PASSWORD'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(26536620410302301)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26556397341516345)
,p_event_id=>wwv_flow_api.id(26556261166516344)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(77409286195098358)
,p_attribute_01=>'$(''#bottom-sheet-password'').openModal();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26269607005712701)
,p_name=>'ADD2HOME'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26269768245712702)
,p_event_id=>wwv_flow_api.id(26269607005712701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.APEX-EVANGELISTS.ADD2HOME'
,p_attribute_01=>'Y'
,p_attribute_02=>'drop'
,p_attribute_03=>'fade'
,p_attribute_04=>'2000'
,p_attribute_05=>'20000'
,p_attribute_06=>'14'
,p_attribute_07=>'0'
,p_attribute_09=>'Y'
,p_attribute_10=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(77409825665098359)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P101_PASSWORD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(77409754723098359)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P101_USERNAME,',
'    p_password => :P101_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P101_PASSWORD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(77476810040036089)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DO_REGISTER_USR'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_register_usr(i_usr_firstname => :p101_firstname,',
'                          i_usr_lastname  => :p101_lastname,',
'                          i_usr_email     => :p101_email,',
'                          i_software_url  => :software_url);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error during registration.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(77476696277036088)
,p_process_success_message=>'Successfully registered. To complete registration follow the email link. '
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26556131236516343)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DO_SEND_MAIL_NEW_PWD'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_send_pwd_lost_mail(i_usr_email    => :p101_email_pwd,',
'                                i_software_url => :software_url);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error sending password email.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(26555822924516340)
,p_process_success_message=>'To complete restoring your password follow the email link. Check your inbox.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(77410015397098359)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26552126323516303)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_USERNAME_LOCAL_STORAGE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.get_username_localstorage(i_item_name => ''P101_USERNAME'');',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(77409891473098359)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
);
end;
/
prompt --application/pages/page_00102
begin
wwv_flow_api.create_page(
 p_id=>102
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Finish Registration'
,p_page_mode=>'NORMAL'
,p_step_title=>'Finish Registration'
,p_step_sub_title=>'Finish Registration'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26371657845008979)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.btn {',
'  width: 100%;',
'}'))
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151014223131'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52187307686545960)
,p_plug_name=>'Finish Registration'
,p_region_template_options=>'#DEFAULT#:h2'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P102_TOKEN_VALID'
,p_plug_display_when_cond2=>'1'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52190034660545963)
,p_plug_name=>'Your link has expired.'
,p_region_template_options=>'#DEFAULT#:h2'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P102_TOKEN_VALID'
,p_plug_display_when_cond2=>'0'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52190505230545963)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(52190034660545963)
,p_button_name=>'P102_NEW_REGISTER_EMAIL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:waves-effect:blue:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Send new registration email'
,p_button_position=>'BODY'
,p_button_condition=>'P102_USR_IS_REGISTERED'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52187680880545960)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(52187307686545960)
,p_button_name=>'P102_FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:waves-effect:green:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Finish'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(52193715951545966)
,p_branch_name=>'GOTO_LOGIN'
,p_branch_action=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26556468674516346)
,p_name=>'P102_USR_IS_REGISTERED'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(52187307686545960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52188099462545961)
,p_name=>'P102_TOKEN_VALID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(52187307686545960)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52188435655545962)
,p_name=>'P102_ID_USR_CRYPT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(52187307686545960)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52188859240545962)
,p_name=>'P102_TOKEN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(52187307686545960)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52189289061545962)
,p_name=>'P102_PASSWORD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(52187307686545960)
,p_prompt=>'Password'
,p_placeholder=>'At least 8 characters'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52189662781545962)
,p_name=>'P102_PASSWORD_REPEAT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(52187307686545960)
,p_prompt=>'Repeat Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52191758569545965)
,p_validation_name=>'P102_PASSWORD_NOT_NULL'
,p_validation_sequence=>5
,p_validation=>'P102_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(52187680880545960)
,p_associated_item=>wwv_flow_api.id(52189289061545962)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52190978129545964)
,p_validation_name=>'P102_PASSWORD_LENGTH'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF length(:p102_password) < 8 THEN',
'    RETURN FALSE;',
'  ELSE',
'    RETURN TRUE;',
'  END IF;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL# is to short. Enter min. 8 characters.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(52187680880545960)
,p_associated_item=>wwv_flow_api.id(52189289061545962)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52192113866545965)
,p_validation_name=>'P102_PASSWORD_REPEAT_NOT_NULL'
,p_validation_sequence=>15
,p_validation=>'P102_PASSWORD_REPEAT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(52187680880545960)
,p_associated_item=>wwv_flow_api.id(52189662781545962)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(52191397074545965)
,p_validation_name=>'PASSWORD_REPEAT_THE_SAME'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF :p102_password = :p102_password_repeat THEN',
'    RETURN TRUE;',
'  ELSE',
'    RETURN FALSE;',
'  END IF;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Passwords entered are different.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(52187680880545960)
,p_associated_item=>wwv_flow_api.id(52189662781545962)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(52192510152545965)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DO_FINISH_REGISTER'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_finish_register_usr(i_id_usr_crypt => :p102_id_usr_crypt,',
'                                 i_token        => :p102_token,',
'                                 i_usr_pwd      => :p102_password);',
'END;',
''))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error during registration.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(52187680880545960)
,p_process_success_message=>'Successfully registered. Use form below to login or switch to your fullscreen webapp.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(52193240808545966)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SEND_NEW_REGISTER_EMAIL'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_gen_new_reg_email(i_id_usr_crypt => :p102_id_usr_crypt,',
'                               i_software_url => :software_url);',
'END;'))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error sending registration email.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(52190505230545963)
,p_process_when=>'P102_TOKEN_VALID'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'0'
,p_process_success_message=>'Registration Link has been sent to your email address. Check your inbox.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(52192838262545965)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_TOKEN_VALID'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_id_usr usr.id_usr%TYPE;',
'BEGIN',
'  -- decrypt id_usr',
'  IF :p102_id_usr_crypt IS NOT NULL THEN',
'    l_id_usr := api_utils.do_decrypt(i_string => :p102_id_usr_crypt);',
'  END IF;',
'  -- check if valid (60mins)',
'  IF api_usr_token.check_token_valid(i_id_usr => l_id_usr,',
'                                     i_token  => :p102_token) THEN',
'    :p102_token_valid := 1;',
'  ELSE',
'    :p102_token_valid := 0;',
'  END IF;',
'  -- check if user is already registered',
'  :p102_usr_is_registered := api_usr.get_acc_active(i_id_usr => l_id_usr);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00103
begin
wwv_flow_api.create_page(
 p_id=>103
,p_user_interface_id=>wwv_flow_api.id(77408808842098354)
,p_name=>'Restore Password'
,p_page_mode=>'NORMAL'
,p_step_title=>'Restore Password'
,p_step_sub_title=>'New Password'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(26371657845008979)
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'.btn {',
'  width: 100%;',
'}'))
,p_step_template=>wwv_flow_api.id(41736985200764756)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DH'
,p_last_upd_yyyymmddhh24miss=>'20151014223015'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26641454467233096)
,p_plug_name=>'Restore password'
,p_region_template_options=>'#DEFAULT#:h2'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P103_TOKEN_VALID'
,p_plug_display_when_cond2=>'1'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26644258335233097)
,p_plug_name=>'Your link has expired.'
,p_region_template_options=>'#DEFAULT#:h2'
,p_plug_template=>wwv_flow_api.id(77384709376098346)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P103_TOKEN_VALID'
,p_plug_display_when_cond2=>'0'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26644674467233097)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26644258335233097)
,p_button_name=>'P103_BACK_LOGIN'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:waves-effect:blue:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Back to login'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101::'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26641802464233096)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(26641454467233096)
,p_button_name=>'P103_SAVE_PWD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:waves-effect:green:icon-float-left:btn:waves-light'
,p_button_template_id=>wwv_flow_api.id(77389617922098347)
,p_button_image_alt=>'Set new password'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(26647907997233098)
,p_branch_name=>'GOTO_LOGIN'
,p_branch_action=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26642294283233097)
,p_name=>'P103_TOKEN_VALID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(26641454467233096)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26642600395233097)
,p_name=>'P103_ID_USR_CRYPT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(26641454467233096)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26643009174233097)
,p_name=>'P103_TOKEN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(26641454467233096)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26643474584233097)
,p_name=>'P103_PASSWORD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(26641454467233096)
,p_prompt=>'Password'
,p_placeholder=>'At least 8 characters'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26643834997233097)
,p_name=>'P103_PASSWORD_REPEAT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(26641454467233096)
,p_prompt=>'Repeat Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(77389129397098347)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26645104692233098)
,p_validation_name=>'P103_PASSWORD_NOT_NULL'
,p_validation_sequence=>5
,p_validation=>'P103_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26641802464233096)
,p_associated_item=>wwv_flow_api.id(26643474584233097)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26645549681233098)
,p_validation_name=>'P103_PASSWORD_LENGTH'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF length(:p103_password) < 8 THEN',
'    RETURN FALSE;',
'  ELSE',
'    RETURN TRUE;',
'  END IF;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'#LABEL# is to short. Enter min. 8 characters.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26641802464233096)
,p_associated_item=>wwv_flow_api.id(26643474584233097)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26645951461233098)
,p_validation_name=>'P103_PASSWORD_REPEAT_NOT_NULL'
,p_validation_sequence=>15
,p_validation=>'P103_PASSWORD_REPEAT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26641802464233096)
,p_associated_item=>wwv_flow_api.id(26643834997233097)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(26646341465233098)
,p_validation_name=>'PASSWORD_REPEAT_THE_SAME'
,p_validation_sequence=>20
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF :p103_password = :p103_password_repeat THEN',
'    RETURN TRUE;',
'  ELSE',
'    RETURN FALSE;',
'  END IF;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Passwords entered are different.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(26641802464233096)
,p_associated_item=>wwv_flow_api.id(26643834997233097)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26646676982233098)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DO_SET_NEW_PASSWORD'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  api_usr.do_finish_password_lost(i_id_usr_crypt => :p103_id_usr_crypt,',
'                                  i_token        => :p103_token,',
'                                  i_usr_pwd      => :p103_password);',
'END;',
''))
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Error during password change.',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(26641802464233096)
,p_process_success_message=>'Successfully changed your password. Use form below to login or switch to your fullscreen webapp.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26647490554233098)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_TOKEN_VALID'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_id_usr usr.id_usr%TYPE;',
'BEGIN',
'  -- decrypt id_usr',
'  IF :p103_id_usr_crypt IS NOT NULL THEN',
'    l_id_usr := api_utils.do_decrypt(i_string => :p103_id_usr_crypt);',
'  END IF;',
'  -- check if valid (60mins)',
'  IF api_usr_token.check_token_valid(i_id_usr => l_id_usr,',
'                                     i_token  => :p103_token) THEN',
'    :p103_token_valid := 1;',
'  ELSE',
'    :p103_token_valid := 0;',
'  END IF;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/deployment/definition
begin
null;
end;
/
prompt --application/deployment/install
begin
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done

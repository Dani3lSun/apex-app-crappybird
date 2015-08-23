CREATE OR REPLACE PACKAGE BODY api_game IS
  --
  priv_package CONSTANT VARCHAR2(30) := 'api_game';
  --
  /****************************************************************************
  * Purpose:  Render CrappyBird Game in Region with DIV/Canvas/JS - htp.p output
  * Author:   Daniel Hochleitner
  * Created:  19.08.2015
  * Changed:
  ****************************************************************************/
  PROCEDURE render_crappybird(i_crappy_home_path     IN VARCHAR2,
                              i_highscore_item_name  IN VARCHAR2,
                              i_game_start_daymode   IN usr_prefs.game_daymode%TYPE,
                              i_game_bird_color      IN usr_prefs.game_bird_color%TYPE,
                              i_game_treetop_color   IN usr_prefs.game_treetop_color%TYPE,
                              i_game_treetrunk_color IN usr_prefs.game_treetrunk_color%TYPE,
                              i_game_bottom_color    IN usr_prefs.game_bottom_color%TYPE,
                              i_game_grass_color     IN usr_prefs.game_grass_color%TYPE,
                              i_game_bar_color       IN usr_prefs.game_bar_color%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'render_crappybird';
    --
    l_crappy_js_string  CLOB;
    l_crappy_css_string CLOB;
    --
    l_crappy_home_path     VARCHAR2(500);
    l_game_start_daymode   usr_prefs.game_daymode%TYPE;
    l_game_bird_color      usr_prefs.game_bird_color%TYPE;
    l_game_treetop_color   usr_prefs.game_treetop_color%TYPE;
    l_game_treetrunk_color usr_prefs.game_treetrunk_color%TYPE;
    l_game_bottom_color    usr_prefs.game_bottom_color%TYPE;
    l_game_grass_color     usr_prefs.game_grass_color%TYPE;
    l_game_bar_color       usr_prefs.game_bar_color%TYPE;
    --
  BEGIN
    --
    -- set defaults of the game
    l_crappy_home_path     := REPLACE(i_crappy_home_path,
                                      '#IMAGE_PREFIX#',
                                      v('IMAGE_PREFIX'));
    l_game_start_daymode   := nvl(i_game_start_daymode,
                                  'day');
    l_game_bird_color      := nvl(i_game_bird_color,
                                  'yellow');
    l_game_treetop_color   := nvl(i_game_treetop_color,
                                  '#008000');
    l_game_treetrunk_color := nvl(i_game_treetrunk_color,
                                  '#A52A2A');
    l_game_bottom_color    := nvl(i_game_bottom_color,
                                  '#D2691E');
    l_game_grass_color     := nvl(i_game_grass_color,
                                  '#050');
    l_game_bar_color       := nvl(i_game_bar_color,
                                  '#8ED6FF');
    --
    -- Build HTML / Canvas / JS structure of the game
    l_crappy_js_string := '<div id="crappy_div"><canvas id="crappy_canvas"></canvas></div>' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '    <script>' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        window.requestAnimFrame = (function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            return window.requestAnimationFrame ||' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                window.webkitRequestAnimationFrame ||' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                window.mozRequestAnimationFrame ||' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                window.oRequestAnimationFrame ||' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                window.msRequestAnimationFrame ||' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                function (callback) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    window.setTimeout(callback, 1000 / 60);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            };' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        })();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        var soundJump = new Audio("' ||
                          l_crappy_home_path || 'wing.ogg");' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        var soundScore = new Audio("' ||
                          l_crappy_home_path || 'point.ogg");' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        var soundHit = new Audio("' ||
                          l_crappy_home_path || 'hit.ogg");' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        var soundDie = new Audio("' ||
                          l_crappy_home_path || 'die.ogg");' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        var soundSwoosh = new Audio("' ||
                          l_crappy_home_path || 'swooshing.ogg");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        var channel_max = 10;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        audiochannels = new Array();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        for (a = 0; a < channel_max; a++) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            audiochannels[a] = new Array();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            audiochannels[a]["channel"] = new Audio();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            audiochannels[a]["finished"] = -1;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '        }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        function play_sound(s) {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            for (a = 0; a < audiochannels.length; a++) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                thistime = new Date();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (audiochannels[a]["finished"] < thistime.getTime()) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    audiochannels[a]["finished"] = thistime.getTime() + s.duration * 1000;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    audiochannels[a]["channel"].src = s.src;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    audiochannels[a]["channel"].load();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    audiochannels[a]["channel"].play();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    break;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '    function getCookie(cname)' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '    {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '       var name = cname + "=";' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '       var ca = document.cookie.split(";");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '       for(var i=0; i<ca.length; i++) ' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '       {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        var c = ca[i].trim();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        if (c.indexOf(name)==0) return c.substring(name.length,c.length);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '       }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '       return "";' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '    }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '    function setCookieAndValue(cname,cvalue,exdays)' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '    {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '       var d = new Date();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '       d.setTime(d.getTime()+(exdays*24*60*60*1000));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '       var expires = "expires="+d.toGMTString();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '       document.cookie = cname + "=" + cvalue + "; " + expires;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '       apex.item("' ||
                          i_highscore_item_name || '").setValue(cvalue);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '    }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        var FB = {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            WIDTH: 320,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            HEIGHT: 480,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            scale: 1,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            offset: {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                top: 0,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                left: 0' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            },' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            entities: [],' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            currentWidth: null,' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            currentHeight: null,' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            canvas: null,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            ctx: null,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            score: {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                taps: 0,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                coins: 0' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            },' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            distance: 0,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '      digits:[],' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '      fonts:[],' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            RATIO: null,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            bg_grad: "day",' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '      game:null,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            currentWidth: null,' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            currentHeight: null,' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            canvas: null,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            ctx: null,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            ua: null,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            android: null,' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            ios: null,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            gradients: {},' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            init: function () {' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '                var grad;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.RATIO = FB.WIDTH / FB.HEIGHT;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.currentWidth = FB.WIDTH;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.currentHeight = FB.HEIGHT;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.canvas = document.getElementById("crappy_canvas");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.canvas.width = FB.WIDTH;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.canvas.height = FB.HEIGHT;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx = FB.canvas.getContext("2d");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ua = navigator.userAgent.toLowerCase();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.android = FB.ua.indexOf("android") > -1 ? true : false;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ios = (FB.ua.indexOf("iphone") > -1 || FB.ua.indexOf("ipad") > -1) ? true : false;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad = FB.ctx.createLinearGradient(0, 0, 0, FB.HEIGHT);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad.addColorStop(0, "#036");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad.addColorStop(0.5, "#69a");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad.addColorStop(1, "yellow");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.gradients.dawn = grad;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad = FB.ctx.createLinearGradient(0, 0, 0, FB.HEIGHT);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad.addColorStop(0, "#69a");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad.addColorStop(0.5, "#9cd");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad.addColorStop(1, "#fff");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.gradients.day = grad;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad = FB.ctx.createLinearGradient(0, 0, 0, FB.HEIGHT);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad.addColorStop(0, "#036");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad.addColorStop(0.3, "#69a");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad.addColorStop(1, "pink");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.gradients.dusk = grad;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad = FB.ctx.createLinearGradient(0, 0, 0, FB.HEIGHT);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad.addColorStop(0, "#036");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                grad.addColorStop(1, "black");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.gradients.night = grad;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                var canvas = document.getElementById("crappy_canvas");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                canvas.addEventListener("click", function (e) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    e.preventDefault();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    FB.Input.set(e);' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                }, false);' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                canvas.addEventListener("touchstart", function (e) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    e.preventDefault();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    FB.Input.set(e.touches[0]);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                }, false);' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                canvas.addEventListener("touchmove", function (e) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    e.preventDefault();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                }, false);' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                canvas.addEventListener("touchend", function (e) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    e.preventDefault();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                }, false);' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.resize();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.changeState("Splash");' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.loop();' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            },' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            resize: function () {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.currentHeight = window.innerHeight;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.currentWidth = FB.currentHeight * FB.RATIO;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (FB.android || FB.ios) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    document.body.style.height = (window.innerHeight + 50) + "px";' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.canvas.style.width = FB.currentWidth + "px";' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.canvas.style.height = FB.currentHeight + "px";' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.scale = FB.currentWidth / FB.WIDTH;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.offset.top = FB.canvas.offsetTop;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.offset.left = FB.canvas.offsetLeft;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                window.setTimeout(function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    window.scrollTo(0, 1);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }, 1);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            },' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            update: function () {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.game.update();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.Input.tapped = false;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            },' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            render: function () {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.Draw.rect(0, 0, FB.WIDTH, FB.HEIGHT, FB.gradients[FB.bg_grad]);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                for (i = 0; i < FB.entities.length; i += 1) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    FB.entities[i].render();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '        FB.game.render();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            },' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            loop: function () {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                requestAnimFrame(FB.loop);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.update();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.render();' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            },' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      changeState: function(state) {             ' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.game = new window[state]();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '        FB.game.init();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        };' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        FB.Draw = {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            clear: function () {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.clearRect(0, 0, FB.WIDTH, FB.HEIGHT);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            },' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            rect: function (x, y, w, h, col) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.fillStyle = col;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.fillRect(x, y, w, h);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            },' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            circle: function (x, y, r, col) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.fillStyle = col;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.beginPath();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.arc(x + 5, y + 5, r, 0, Math.PI * 2, true);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.closePath();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.fill();' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            },' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      Image:function(img,x,y){        ' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.ctx.drawImage(img,x,y);' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '      },' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            Sprite: function (img, srcX, srcY, srcW, srcH, destX, destY, destW, destH, r) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.save();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.translate(destX, destY);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.rotate(r * (Math.PI / 180));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.translate(-(destX + destW / 2), -(destY + destH / 2));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.drawImage(img, srcX, srcY, srcW, srcH, destX, destY, destW, destH);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.restore();' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            },' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            semiCircle: function (x, y, r, col) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.fillStyle = col;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.beginPath();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.arc(x, y, r, 0, Math.PI, false);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.closePath();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.fill();' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            },' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            text: function (string, x, y, size, col) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.font = "bold " + size + "px Monospace";' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.fillStyle = col;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.ctx.fillText(string, x, y);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        };' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        FB.Input = {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            x: 0,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            y: 0,' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            tapped: false,' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            set: function (data) {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.x = (data.pageX - FB.offset.left) / FB.scale;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.y = (data.pageY - FB.offset.top) / FB.scale;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.tapped = true;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        };' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.Cloud = function (x, y) {' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.x = x;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.y = y;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.r = 30;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.col = "rgba(255,255,255,1)";' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.type = "cloud";' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.vx = -0.10;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.remove = false;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.update = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.x += this.vx;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (this.x < (0 - 115)) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    this.respawn();' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            };' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.render = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.Draw.circle(this.x + this.r, (this.y + this.r), this.r, this.col);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.Draw.circle(this.x + 55, (this.y + this.r / 2), this.r / 0.88, this.col);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.Draw.circle(this.x + 55, (this.y + this.r + 15), this.r, this.col);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.Draw.circle(this.x + 85, (this.y + this.r), this.r, this.col);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            };' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.respawn = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.x = ~~ (Math.random() * this.r * 2) + FB.WIDTH;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.y = ~~ (Math.random() * FB.HEIGHT / 2)' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            };' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        };' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.BottomBar = function (x, y, r) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.x = x;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.y = y' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.r = r;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.vx = -1;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.name = "BottomBar";' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.update = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.x += this.vx;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (this.x < (0 - this.r)) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    this.respawn();' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            };' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.render = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.Draw.rect(this.x, this.y, this.r, 100, "' ||
                          l_game_bottom_color || '");' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                for (var i = 0; i < 10; i++) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    FB.Draw.semiCircle(this.x + i * (this.r / 9), this.y, 20, "' ||
                          l_game_grass_color || '");' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.respawn = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.x = FB.WIDTH - 1;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.Tree = function (x, y) {' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.x = x;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.y = y' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.r = 30;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.h = 50;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.w = this.r * 2;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.vx = -1;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.type = "Tree";' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.update = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.x += this.vx;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (this.x < (0 - this.r * 2)) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    this.respawn();' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            };' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.render = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.Draw.circle(this.x + this.r, (this.y + this.r) - 10, this.r, "' ||
                          l_game_treetop_color || '", "#050");' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.Draw.rect(this.x + this.r, this.y + this.r, 10, this.r, "' ||
                          l_game_treetrunk_color || '", "#d20");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.respawn = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.x = FB.WIDTH + this.r;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.Pipe = function (x, w) {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.centerX = x;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.coin = true' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.w = w;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.h = FB.HEIGHT - 150;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.vx = -1;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.type = "pipe";' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.update = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.centerX += this.vx;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (this.centerX == (0 - this.w)) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    this.respawn();' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            };' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.render = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (this.coin) {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    FB.Draw.circle(this.centerX + this.w / 2 - 5, this.centerY - 5, 5, "Gold")' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.Draw.rect(this.centerX, 0, this.w, this.centerY - 50, "' ||
                          l_game_bar_color || '");' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.Draw.rect(this.centerX, this.centerY + 50, this.w, this.h - this.centerY, "' ||
                          l_game_bar_color || '");' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.respawn = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.centerY = this.randomIntFromInterval(70, 220);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.centerX = 320 - this.w + 160;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.coin = true;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.randomIntFromInterval = function (min, max) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                return Math.floor(Math.random() * (max - min + 1) + min);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.centerY = this.randomIntFromInterval(70, 220);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '        }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.Bird = function () {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.img = new Image();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.img.src = "' ||
                          l_crappy_home_path || 'bird_' ||
                          l_game_bird_color || '.png";' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.gravity = 0.25;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.width = 34;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.height = 24;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.ix = 0;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.iy = 0;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.fr = 0;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.vy = 180;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.vx = 70;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.velocity = 0;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.play = false;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.jump = -4.6;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.rotation = 0;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.type = "bird";' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.update = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (this.fr++ > 5) {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    this.fr = 0;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    if (this.iy == this.height * 3) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                        this.iy = 0' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '                    }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    this.iy += this.height;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (this.play) {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    this.velocity += this.gravity;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    this.vy += this.velocity;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    if (this.vy <= 0) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                        this.vy = 0;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '                    }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    if (this.vy >= 370) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                        this.vy = 370;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                    }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    this.rotation = Math.min((this.velocity / 10) * 90, 90);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (FB.Input.tapped) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    this.play = true;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    play_sound(soundJump);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    this.velocity = this.jump;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            };' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.render = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.Draw.Sprite(this.img, this.ix, this.iy, this.width, this.height, this.vx, this.vy, this.width, this.height, this.rotation);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.Particle = function (x, y, r, col, type) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.x = x;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.y = y;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            this.r = r;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.col = col;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.type = type || "circle";' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.name = "particle";' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.dir = (Math.random() * 2 > 1) ? 1 : -1;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.vx = ~~ (Math.random() * 4) * this.dir;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.vy = ~~ (Math.random() * 7);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.remove = false;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.update = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.x += this.vx;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.y -= this.vy;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.vx *= 0.99;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.vy *= 0.99;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                this.vy -= 0.35;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (this.y > FB.HEIGHT) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    this.remove = true;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            };' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            this.render = function () {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (this.type === "star") {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    FB.Draw.star(this.x, this.y, this.col);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                } else {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    FB.Draw.circle(this.x, this.y, this.r, this.col);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            };' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        };' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.Collides = function (bird, pipe) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      if(bird.vy >=370){          ' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '         ' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '         return true;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            if (pipe.coin && bird.vx > pipe.centerX + pipe.w / 2 - 5) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                pipe.coin = false;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.score.coins += 1;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.digits = FB.score.coins.toString().split("");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                play_sound(soundScore);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var bx1 = bird.vx - bird.width / 2;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var by1 = bird.vy - bird.height / 2;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var bx2 = bird.vx + bird.width / 2;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var by2 = bird.vy + bird.height / 2;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var upx1 = pipe.centerX;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '            var upy1 = 0;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var upx2 = pipe.centerX + pipe.w;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var upy2 = pipe.centerY - 50;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var lpx1 = pipe.centerX;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var lpy1 = pipe.centerY + 50;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var lpx2 = upx2;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var lpy2 = pipe.h;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var c1 = !(bx1 > upx2 ||' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                bx2 < upx1 ||' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                by1 > upy2 ||' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                by2 < upy1)' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            var c2 = !(bx1 > lpx2 ||' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                bx2 < lpx1 ||' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                by1 > lpy2 ||' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                by2 < lpy1)' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            return (c1 || c2)' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        };' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '    window.Splash = function(){' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      this.banner = new Image();' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '      this.banner.src = "' ||
                          l_crappy_home_path || 'splash.png";' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      this.init = function(){' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        play_sound(soundSwoosh);' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        FB.distance = 0;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.bg_grad = "' ||
                          l_game_start_daymode || '";' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.entities = [];' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.score.taps = FB.score.coins = 0;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.entities.push(new FB.Cloud(30, ~~ (Math.random() * FB.HEIGHT / 2)));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.entities.push(new FB.Cloud(130, ~~ (Math.random() * FB.HEIGHT / 2)));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.entities.push(new FB.Cloud(230, ~~ (Math.random() * FB.HEIGHT / 2)));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                for (i = 0; i < 2; i += 1) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    FB.entities.push(new FB.BottomBar(FB.WIDTH * i, FB.HEIGHT - 100, FB.WIDTH));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.entities.push(new FB.Tree(~~(Math.random() * FB.WIDTH), FB.HEIGHT - 160));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.entities.push(new FB.Tree(~~(Math.random() * FB.WIDTH + 50), FB.HEIGHT - 160));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.entities.push(new FB.Tree(~~(Math.random() * FB.WIDTH + 100), FB.HEIGHT - 160));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      this.update = function(){' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        for (i = 0; i < FB.entities.length; i += 1) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    FB.entities[i].update();                    ' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        if (FB.Input.tapped) {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          FB.changeState("Play");' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          FB.Input.tapped = false;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      this.render = function(){' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.Draw.Image(this.banner,66,100);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '    }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '    window.Play = function(){' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      this.init = function(){      ' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.entities.push(new FB.Pipe(FB.WIDTH * 2, 50));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.entities.push(new FB.Pipe(FB.WIDTH * 2 + FB.WIDTH / 2, 50));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.entities.push(new FB.Pipe(FB.WIDTH * 3, 50));' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.bird = new FB.Bird();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                FB.entities.push(FB.bird);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        for(var n=0;n<10;n++){' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          var img = new Image();' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '          img.src = "' ||
                          l_crappy_home_path || 'font_small_" + n +".png";' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          FB.fonts.push(img);' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        FB.digits = ["0"];' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      this.update = function() { ' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        FB.distance += 1;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                var levelUp = ((FB.distance % 2048) === 0) ? true : false;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (levelUp) {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    var bg = "day";' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    var gradients = ["day", "dusk", "night", "dawn"];' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    for (var i = 0; i < gradients.length; i++) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                        if (FB.bg_grad === gradients[i]) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                            if (i == gradients.length - 1) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                                bg = "day";' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                            } else {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                                bg = gradients[i + 1];' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                            }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '                        }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                    }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    FB.bg_grad = bg;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                var checkCollision = false;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                if (FB.Input.tapped) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    FB.score.taps += 1;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    checkCollision = true;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                for (i = 0; i < FB.entities.length; i += 1) {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    FB.entities[i].update();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                    if (FB.entities[i].type === "pipe") {' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                        var hit = FB.Collides(FB.bird, FB.entities[i]);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                        if (hit) {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '                            play_sound(soundHit);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '              FB.changeState("GameOver");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '               break;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                        }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                    }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '                }' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      this.render = function() { ' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        var X = (FB.WIDTH/2-(FB.digits.length*14)/2);        ' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        for(var i = 0; i < FB.digits.length; i++)' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '        {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          FB.Draw.Image(FB.fonts[Number(FB.digits[i])],X+(i*14),10);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '        }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '    }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '    window.GameOver = function(){' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      this.getMedal = function()' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '      {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '         var score = FB.score.coins;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '         console.log(score)' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '         if(score <= 10)' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          medal = "bronze";' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '         if(score >= 20)' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          medal = "silver";' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '         if(score >= 30)' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '          medal = "gold";' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '         if(score >= 40)' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          medal = "platinum";' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        return medal;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      this.getHighScore = function(){' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        var savedscore = getCookie("highscore");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          if(savedscore != ""){' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          var hs = parseInt(savedscore) || 0;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          if(hs < FB.score.coins)' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '          {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '           hs = FB.score.coins' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '           setCookieAndValue("highscore", hs, 999);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '          }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '          return hs;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '          }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '          else' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '          {           ' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          setCookieAndValue("highscore", FB.score.coins, 999);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          return  FB.score.coins;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '          }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      this.init = function(){' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          var that = this;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        setTimeout(function() {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          play_sound(soundDie);' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          that.banner = new Image();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          that.banner.src = "' ||
                          l_crappy_home_path || 'scoreboard.png";' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          var m = that.getMedal();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          that.medal =  new Image();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          that.medal.src = "' ||
                          l_crappy_home_path || 'medal_" + m +".png";' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          that.replay = new Image();' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          that.replay.src = "' ||
                          l_crappy_home_path || 'replay.png";' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          that.highscore = that.getHighScore() ;' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '        }, 500);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      this.update = function(){        ' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        if (FB.Input.tapped) {' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          var x = FB.Input.x;' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          var y = FB.Input.y;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '          ' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '           if((x >= 102.5 && x <= 102.5+115) && (y >= 260 && y <= 260+70)){       ' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '            FB.changeState("Splash");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '          }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          FB.Input.tapped = false;' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        FB.bird.update();' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '      this.render = function(){' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '        if(this.banner){' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          FB.Draw.Image(this.banner,42,70);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          FB.Draw.Image(this.medal,75,183);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          FB.Draw.Image(this.replay,102.5,260);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          FB.Draw.text(FB.score.coins, 220, 185, 15, "black");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '          FB.Draw.text(this.highscore, 220, 225, 15, "black");' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '        }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '      }' || chr(10);
    l_crappy_js_string := l_crappy_js_string || '    }' || chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        window.addEventListener("load", FB.init, false);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string ||
                          '        window.addEventListener("resize", FB.resize, false);' ||
                          chr(10);
    l_crappy_js_string := l_crappy_js_string || '    </script>';
    --
    -- build css and http output if css string
    l_crappy_css_string := '<style>' || chr(10);
    l_crappy_css_string := l_crappy_css_string ||
                           'canvas { display: block; margin: 0 auto; background: #fff; max-width:100%; }' ||
                           chr(10);
    l_crappy_css_string := l_crappy_css_string ||
                           'audio { display: none; }' || chr(10);
    l_crappy_css_string := l_crappy_css_string || '</style>';
    --
    htp.p(l_crappy_css_string);
    --
    -- http output of html / js string
    htp.p(l_crappy_js_string);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END render_crappybird;
  --
  /****************************************************************************
  * Purpose:  Render CrappyBird Game for User with User prefs (customization)
  * Author:   Daniel Hochleitner
  * Created:  19.08.2015
  * Changed:
  ****************************************************************************/
  PROCEDURE render_crappybird_usr(i_id_usr              IN usr_prefs.id_usr%TYPE,
                                  i_crappy_home_path    IN VARCHAR2,
                                  i_highscore_item_name IN VARCHAR2) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'render_crappybird_usr';
    --
    l_game_start_daymode   usr_prefs.game_daymode%TYPE;
    l_game_bird_color      usr_prefs.game_bird_color%TYPE;
    l_game_treetop_color   usr_prefs.game_treetop_color%TYPE;
    l_game_treetrunk_color usr_prefs.game_treetrunk_color%TYPE;
    l_game_bottom_color    usr_prefs.game_bottom_color%TYPE;
    l_game_grass_color     usr_prefs.game_grass_color%TYPE;
    l_game_bar_color       usr_prefs.game_bar_color%TYPE;
    -- Cursor user customizations
    CURSOR l_cur_usr_prefs IS
      SELECT usr_prefs.game_daymode,
             usr_prefs.game_bird_color,
             usr_prefs.game_treetop_color,
             usr_prefs.game_treetrunk_color,
             usr_prefs.game_bottom_color,
             usr_prefs.game_grass_color,
             usr_prefs.game_bar_color
        FROM usr_prefs
       WHERE usr_prefs.id_usr = i_id_usr;
    l_rec_usr_prefs l_cur_usr_prefs%ROWTYPE;
    --
  BEGIN
    --
    -- open cursor and fetch into record
    OPEN l_cur_usr_prefs;
    FETCH l_cur_usr_prefs
      INTO l_rec_usr_prefs;
    CLOSE l_cur_usr_prefs;
    --
    -- set vars
    l_game_start_daymode   := l_rec_usr_prefs.game_daymode;
    l_game_bird_color      := l_rec_usr_prefs.game_bird_color;
    l_game_treetop_color   := l_rec_usr_prefs.game_treetop_color;
    l_game_treetrunk_color := l_rec_usr_prefs.game_treetrunk_color;
    l_game_bottom_color    := l_rec_usr_prefs.game_bottom_color;
    l_game_grass_color     := l_rec_usr_prefs.game_grass_color;
    l_game_bar_color       := l_rec_usr_prefs.game_bar_color;
    --
    -- call render game procedure
    api_game.render_crappybird(i_crappy_home_path     => i_crappy_home_path,
                               i_highscore_item_name  => i_highscore_item_name,
                               i_game_start_daymode   => l_game_start_daymode,
                               i_game_bird_color      => l_game_bird_color,
                               i_game_treetop_color   => l_game_treetop_color,
                               i_game_treetrunk_color => l_game_treetrunk_color,
                               i_game_bottom_color    => l_game_bottom_color,
                               i_game_grass_color     => l_game_grass_color,
                               i_game_bar_color       => l_game_bar_color);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END render_crappybird_usr;
  --
  /****************************************************************************
  * Purpose:  Set highscore cookie for CrappyBird (for User)
  * Author:   Daniel Hochleitner
  * Created:  20.08.2015
  * Changed:
  ****************************************************************************/
  PROCEDURE set_highscore_cookie_usr(i_id_usr IN usr.id_usr%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'set_highscore_cookie_usr';
    --
    l_highscore usr.usr_highscore%TYPE;
    --
  BEGIN
    --
    -- get usr highscore
    l_highscore := nvl(api_usr.get_usr_highscore(i_id_usr => i_id_usr),
                       0);
    --
    -- set highscore cookie for game to display proper info
    sys.owa_util.mime_header('text/html',
                             FALSE);
    sys.owa_cookie.send(NAME  => 'highscore',
                        VALUE => l_highscore);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END set_highscore_cookie_usr;
  --
  /****************************************************************************
  * Purpose:  Set highscore cookie for CrappyBird (for Battle)
  * Author:   Daniel Hochleitner
  * Created:  22.08.2015
  * Changed:
  ****************************************************************************/
  PROCEDURE set_highscore_cookie_battle(i_id_usr        IN NUMBER,
                                        i_id_usr_battle IN usr_battle.id_usr_battle%TYPE) IS
    --
    l_function CONSTANT VARCHAR2(30) := 'set_highscore_cookie_battle';
    --
    l_highscore NUMBER;
    l_type      VARCHAR2(10);
    --
  BEGIN
    --
    -- get correct usr type
    l_type := api_usr_battle.check_challenger_receiver(i_id_usr        => i_id_usr,
                                                       i_id_usr_battle => i_id_usr_battle);
    --
    -- get usr highscore
    -- challenger
    IF l_type = 'C' THEN
      l_highscore := nvl(api_usr_battle.get_highscore_challenger(i_id_usr_battle => i_id_usr_battle),
                         0);
      -- receiver
    ELSIF l_type = 'R' THEN
      l_highscore := nvl(api_usr_battle.get_highscore_receiver(i_id_usr_battle => i_id_usr_battle),
                         0);
    END IF;
    --
    -- set highscore cookie for game to display proper info
    sys.owa_util.mime_header('text/html',
                             FALSE);
    sys.owa_cookie.send(NAME  => 'highscore',
                        VALUE => l_highscore);
    --
  EXCEPTION
    WHEN OTHERS THEN
      api_err_log.do_log(i_log_function => priv_package || '.' ||
                                           l_function,
                         i_log_text     => SQLERRM);
      RAISE;
  END set_highscore_cookie_battle;
  --
END api_game;
/

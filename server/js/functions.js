function get_location(lat_item,long_item) {
  navigator.geolocation.getCurrentPosition(function(position) {
    apex.item(lat_item).setValue(position.coords.latitude);
    apex.item(long_item).setValue(position.coords.longitude);
  });
}

function confirm_battle(url) {
  var result = confirm("Want to battle this user?");
  if (result) {
    window.location = url;
  }
}

function take_screenshot(item_name,canvas_id) {
  var canvas = document.getElementById(canvas_id);
  var img    = canvas.toDataURL("image/png");
  apex.item(item_name).setValue(img);
}

function wait_take_screenshot(time,item_name,canvas_id) {
  setTimeout(function() {
   take_screenshot(item_name,canvas_id)
   }, time);
}

function check_webkit_browser() {
  var is_webkit_browser = navigator.userAgent.indexOf('AppleWebKit') > -1;
  if (!(is_webkit_browser)) alert('For best results please use a WebKit Browser like Chrome or Safari!');
}

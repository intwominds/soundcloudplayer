// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-tablesorter
//= require_tree .

$(document).ready(function() {
  $("#player").tablesorter();

  var player = '<object height="81" width="100%"><param name="movie" value="http://player.soundcloud.com/player.swf?show_artwork=false&show_comments=false&auto_play=true&url=XXX"></param><param name="allowscriptaccess" value="always"></param><embed src="http://player.soundcloud.com/player.swf?show_artwork=false&show_comments=false&auto_play=true&url=XXX" allowscriptaccess="always" height="81"  type="application/x-shockwave-flash" width="100%"></embed></object>';

  $('#player').on('click', 'tr', function (event) {
    if ($(event.target).is('a')) return true;
    var uri = $(this).data('uri');
    $('.now-playing').removeClass('now-playing'); // Remove the old Now Playing
    $(this).addClass('now-playing') // Add a new Now Playing
    var trackPlayer = player.replace('XXX', encodeURIComponent(uri));
    $('#player_target').html(trackPlayer);
  });
});

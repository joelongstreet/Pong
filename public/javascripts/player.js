(function() {

  $(function() {
    var player, prev_x;
    if ($('#player_2').length) {
      player = 'player_2';
    } else {
      player = 'player_1';
    }
    prev_x = 0;
    return window.ondeviceorientation = function(e) {
      var x;
      x = Math.round(e.beta * 10 / 10);
      if (x !== prev_x) return socket.emit("" + player + "_change", e.beta);
    };
  });

}).call(this);

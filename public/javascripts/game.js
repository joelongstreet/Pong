(function() {

  $(function() {
    pong.play($('#pong-canvas')[0]);
    socket.on('player_1_update', function(data) {
      return $('#item_1').css('bottom', data * 20);
    });
    return socket.on('player_2_update', function(data) {
      return $('#item_2').css('bottom', data * 20);
    });
  });

}).call(this);

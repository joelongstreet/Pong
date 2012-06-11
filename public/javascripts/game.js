(function() {
  var p1_direction, p2_direction;

  p1_direction = 'up';

  p2_direction = 'down';

  $(function() {
    var h, w;
    w = Math.round($(window).width() * .95);
    h = Math.round($(window).height() * .9);
    $('#pong-canvas').attr('width', w);
    $('#pong-canvas').attr('height', h);
    $('#canvas').width(w);
    $('#canvas').css({
      'margin-top': $(window).height() * .05
    });
    pong.play($('#pong-canvas')[0]);
    socket.on('player_1_update', function(data) {
      RACKETS[0].acceleration = Math.abs(data / 50);
      if (data > 0) {
        return p1_direction = 'up';
      } else {
        return p1_direction = 'down';
      }
    });
    return socket.on('player_2_update', function(data) {
      RACKETS[1].acceleration = Math.abs(data / 50);
      if (data > 0) {
        return p2_direction = 'up';
      } else {
        return p2_direction = 'down';
      }
    });
  });

  window.getSocketContent = function() {
    if (p1_direction === 'up') {
      RACKETS[0].up = function() {
        return true;
      };
      RACKETS[0].down = function() {
        return false;
      };
    } else {
      RACKETS[0].up = function() {
        return false;
      };
      RACKETS[0].down = function() {
        return true;
      };
    }
    if (p2_direction === 'up') {
      RACKETS[1].up = function() {
        return true;
      };
      return RACKETS[1].down = function() {
        return false;
      };
    } else {
      RACKETS[1].up = function() {
        return false;
      };
      return RACKETS[1].down = function() {
        return true;
      };
    }
  };

}).call(this);

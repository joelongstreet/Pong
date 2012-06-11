p1_direction    = 'up'
p2_direction    = 'down'

$ ->
    
    w = Math.round($(window).width()*.95)
    h = Math.round($(window).height()*.9)
    
    $('#pong-canvas').attr 'width', w
    $('#pong-canvas').attr 'height', h
    $('#canvas').width(w)
    $('#canvas').css 'margin-top' : $(window).height()*.05

    pong.play($('#pong-canvas')[0]);

    socket.on 'player_1_update', (data) ->
        RACKETS[0].acceleration = Math.abs(data/50)
        if data > 0 then p1_direction = 'up'
        else p1_direction = 'down'

    socket.on 'player_2_update', (data) ->
        RACKETS[1].acceleration = Math.abs(data/50)
        if data > 0 then p2_direction = 'up'
        else p2_direction = 'down'

window.getSocketContent = ->

    if p1_direction == 'up'
        RACKETS[0].up = -> return true
        RACKETS[0].down = -> return false
    else
        RACKETS[0].up = -> return false
        RACKETS[0].down = -> return true

    if p2_direction == 'up'
        RACKETS[1].up = -> return true
        RACKETS[1].down = -> return false
    else
        RACKETS[1].up = -> return false
        RACKETS[1].down = -> return true
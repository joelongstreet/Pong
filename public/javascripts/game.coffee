$ ->
    pong.play($('#pong-canvas')[0]);

    socket.on 'player_1_update', (data) ->
        #console.log data
        $('#item_1').css 'bottom', data * 20

    socket.on 'player_2_update', (data) ->
        #console.log data
        $('#item_2').css 'bottom', data * 20
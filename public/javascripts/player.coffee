$ ->

    if $('#player_2').length then player = 'player_2'
    else player = 'player_1'

    prev_x = 0

    window.ondeviceorientation = (e) ->
        x = Math.round(e.beta*10/10)
        if x != prev_x
            socket.emit "#{player}_change", (e.beta)
        prev_x = x
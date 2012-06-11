express     = require 'express'
path        = require 'path'
stylus      = require 'stylus'
app         = express.createServer()
port        = process.env.PORT || 3001
env         = process.env.environment || 'development'
io          = require('socket.io').listen app

app.use require('connect-assets')(src : 'public')

app.configure ->
    app.use express.static path.join __dirname, 'public'
    app.use stylus.middleware
        debug: true 
        force: true
        src: "#{__dirname}/public"
        dest: "#{__dirname}/public"
    app.set 'views', path.join __dirname, 'public/views'
    app.set 'view engine', 'jade'

app.get '/', (req, res, next) ->
    res.render 'index'

app.get '/p1', (req, res, next) ->
    res.render 'player', player : 'player_1'

app.get '/p2', (req, res, next) ->
    res.render 'player', player : 'player_2'

io.sockets.on 'connection', (socket) ->
    socket.on 'player_1_change', (data) ->
        console.log 'change'
        socket.broadcast.emit 'player_1_update', data
    socket.on 'player_2_change', (data) ->
        socket.broadcast.emit 'player_2_update', data

app.listen port
console.log "server running on port #{port} in #{env} environment"
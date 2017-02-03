
/**
 * Module dependencies.
 */

var express = require('express')
  , routes = require('./routes')
  , user = require('./routes/user')
  , http = require('http')
  , path = require('path');

var app = express();

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

var redis = require("redis");
var subscriber = redis.createClient(6379,"172.17.17.1");
var publisher = redis.createClient(6379,"172.17.17.1");

var MongoClient = require('mongodb').MongoClient;
var url = 'mongodb://localhost:27017/didimdol';
var dbObj = null;
MongoClient.connect(url, function(err, db) {
	console.log("Connected correctly to server");
	dbObj = db;
	//db.close();
});

app.get('/', routes.index);
app.get('/users', user.list);

var server = http.createServer(app);
var socketio = require('socket.io');
var io = socketio.listen(server);
io.sockets.on('connection',function(socket) {
	console.log('connection');
	//////////////////////////////////////////////////
	var chat_history = dbObj.collection('chat_history');
	chat_history.find({}).toArray(function(err, results) {
		for (var i = 0; i < results.length; i++) {
			socket.emit('message',
					JSON.stringify({message:results[i].message}));
		}
	});
	
	socket.on('message',function(data){
		data = JSON.parse(data);
		var message = data.name+':'+data.message;
		publisher.publish('chat',message);
	});
	subscriber.subscribe('chat');
	subscriber.on('message', function(channel, message) {
		console.log(message);
		socket.emit('message',
				JSON.stringify({message:message}));
		//////////////////////////////////////////////////
		var chat_history = dbObj.collection('chat_history');
		chat_history.save({
				message:message, created_at:new Date()
			},function(err, result) {
				console.log(result);
			});
	});
});
server.listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});

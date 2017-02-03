
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

app.get('/', routes.index);
app.get('/users', user.list);

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'test',
  database : 'didimdol'
}); 
connection.connect();
var server = http.createServer(app);
var socketio = require('socket.io');
var io = socketio.listen(server);
io.sockets.on('connection',function(socket) {
	console.log('connection');
	socket.on('article_list',function(data){
		connection.query('select * from board',
				function(err, results, fields){
			socket.emit('article_list',
					JSON.stringify(results));
		});
	});
	socket.on('article_delete',function(data){
		data = JSON.parse(data);
		connection.query('delete from board where no=?',
				data.no, function(err, result){
			socket.emit('article_delete', JSON.stringify(result));
		});
	});
	socket.on('article_insert',function(data){
		data = JSON.parse(data);
		connection.query('insert into board set ?',
				{title:data.title,content:data.content},
				function(err,result){
			socket.emit('article_insert',JSON.stringify(result));
		});
	});
});
server.listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});

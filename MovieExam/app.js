
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

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'test',
  database : 'didimdol'
}); 
connection.connect();
app.get('/', function(req,res){
	connection.query("select * from movie",
			function(err, results, fields) {
		if (err) res.send(err);
		else res.send(JSON.stringify(results));
	});
});
app.get('/movie',function(req,res){
	connection.query("select * from movie where no=?",
			req.query.no,
			function(err, results, fields) {
		if (err) res.send(err);
		else res.send(JSON.stringify(results));
	});
});
app.post('/', function(req,res){
	connection.query("insert into movie set ?",
			{
				title : req.body.title,
				director : req.body.director
			},
			function(err, result){
				if (err) res.send(err);
				else res.send(JSON.stringify(result));
			});
});
app.delete('/', function(req,res){
	connection.query("delete from movie",
			function(err,result){
		if (err) res.send(err);
		else res.send(JSON.stringify(result));
	});
});
app.delete('/movie', function(req,res) {
	connection.query("delete from movie where no=?",
			req.body.no,
			function(err, result){
		if (err) res.send(err);
		else res.send(JSON.stringify(result));
	});
});
app.put('/',function(req,res){
	connection.query("delete from movie", 
			function(err,result){
		console.log(req.body.movies);
		var movies = JSON.parse(req.body.movies);
		console.log(movies.length);
		for (var i = 0; i < movies.length; i++) {
			connection.query("insert into movie set ?", 
				movies[i],
				function(err,result){
			});
		}
		if (err) res.send(err);
		else res.send(JSON.stringify(result));
	});
});
app.put('/movie',function(req,res) {
	connection.query("update movie set ? where no=?",
			[{
				title:req.body.title,
				director:req.body.director
			}, req.body.no],
			function(err, result) {
		if (err) res.send(err);
		else res.send(JSON.stringify(result));
	});
});
//app.get('/', routes.index);
app.get('/users', user.list);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});

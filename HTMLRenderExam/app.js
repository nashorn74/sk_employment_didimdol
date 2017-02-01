
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
	connection.query('select * from student',
			function(err, results, fields) {
		if (err) res.send(err);
		else res.render('index', 
			{title:'JAVAC반 교육생 명단',students:results});
	});
});
app.post('/insert',function(req,res){
	connection.query('insert into student set ?',
			{
				no:Number(req.body.no),
				name:req.body.name,
				gender:req.body.gender,
				major:Number(req.body.major),
				city:Number(req.body.city),
				team:Number(req.body.team),
				created_at:new Date()
			}, function(err, result) {
				res.redirect('/');
			});
});
app.post('/update',function(req,res){
	connection.query('update student set ? where no=?',
			[
				{
					name:req.body.name,
					gender:req.body.gender,
					major:Number(req.body.major),
					city:Number(req.body.city),
					team:Number(req.body.team)
				},
				Number(req.body.no)
			], function(err, result) {
				res.redirect('/');
			});
});
app.post('/delete',function(req,res){
	connection.query('delete from student where no=?',
			Number(req.body.no),
			function(err,result) {
				res.redirect('/');
			});
});
//app.get('/', routes.index);
app.get('/users', user.list);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});


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
app.get('/',function(req,res){
	connection.query('select * from board',
			function(err, results, fields){
		res.render('index', 
				{title:'게시판 글목록',articles:results});
	});
});
app.get('/write',function(req,res){
	res.render('write', {title:'게시판 글작성'});
});
app.get('/detail/:no',function(req,res){
	connection.query('select * from board where no=?',
			req.params.no,
			function(err, results, fields) {
		if (results.length > 0) {
			res.render('detail',
				{title:'게시판 상세정보',article:results[0]});
		} else {
			res.redirect('/');
		}
	});
});
app.post('/insert',function(req,res){
	connection.query('insert into board set ?',
			{
				title:req.body.title,
				content:req.body.content
			}, function(err, result){
				res.redirect('/');
			});
});
app.post('/delete',function(req,res){
	connection.query('delete from board where no=?',
			Number(req.body.no),
			function(err, result){
				res.redirect('/');
			});
});
//app.get('/', routes.index);
app.get('/users', user.list);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});

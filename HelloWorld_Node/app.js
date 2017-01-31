
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
///////////////////////////////////////////////
var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'test',
  database : 'didimdol'
}); 
connection.connect();
app.get('/', function(req, res) {//학생목록 조회
	connection.query('select * from student',
			function(error,results, fields) {
	  if (error) res.send(error);
	  else res.send(JSON.stringify(results));
	});	 
	//connection.end();
});
app.post('/',function(req,res){//학생정보 추가
	connection.query('INSERT INTO student SET ?', 
			{
				no			:Number(req.body.no),
				name		:req.body.name,
				gender		:req.body.gender,
				major		:Number(req.body.major),
				city		:Number(req.body.city),
				created_at	:new Date(),
				team		:Number(req.body.team)
			}, 
			function (error, result) {
	  if (error) res.send(error);
	  else res.send(JSON.stringify(result));
	});
});
app.put('/student',function(req,res){//학생정보 수정
	connection.query('UPDATE student SET ? WHERE no=?', 
			[{
				name		:req.body.name,
				gender		:req.body.gender,
				major		:Number(req.body.major),
				city		:Number(req.body.city),
				team		:Number(req.body.team)
			}, Number(req.body.no)], 
			function (error, result) {
	  if (error) res.send(error);
	  else res.send(JSON.stringify(result));
	});
});
app.delete('/student',function(req,res){//학생정보 삭제
	connection.query('DELETE FROM student WHERE no=?', 
			Number(req.body.no), 
			function (error, result) {
	  if (error) res.send(error);
	  else res.send(JSON.stringify(result));
	});
});
//app.get('/', routes.index);
app.get('/users', user.list);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});

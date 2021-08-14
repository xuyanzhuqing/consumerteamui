var express = require('express');
var app = express();
var port = 3000;
var path = require('path')
var request = require('./request')

var bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

// 全局 中间件  解决所有路由的 跨域问题
app.all('*',function (req,res,next) {
  res.header('Access-Control-Allow-Origin','*')
  res.header('Access-Control-Allow-Headers','X-Requested-With,Content-Type')
  res.header('Access-Control-Allow-Methods','GET,POST,OPTIONS')
  next()
})

app.use('/', require('./sys/index.js'))

request.forEach(function (item) {
  app.use(item.router, require('./request/' + item.file))
})

var server = app.listen(port, function () {
  var host = server.address().address
  var port = server.address().port
  console.log('Example app listening at http://%s:%s', host, port)
})
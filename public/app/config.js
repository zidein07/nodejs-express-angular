var express = require('express');
var app = express();

var data = {
    title: 'main page'    
};

app.disable('x-powered-by');
app.set('view engine', 'jade');
app.set('views', 'public/views');

app.get('/', function(req, res) {
    res.render('main', data)
});

app.listen(3000, function() {
    console.log('Im listen you');
});

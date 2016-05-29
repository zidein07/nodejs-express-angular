var express = require('express');
var app = express();

var pages = {
    main: {
        title: 'main page'
    },
    about: {
        title: 'about page'
    },
    blog: {
        title: 'blog page'
    }
};

app.disable('x-powered-by');
app.set('view engine', 'jade');
app.set('views', 'public/views');

app.use(function (req, res, next) {
    next()
});

app.use(express.static(__dirname + '/dist'));

app.get('/:page?', function (req, res) {
    var currentPage = req.params.page, data;
    if (!currentPage) currentPage = 'main';
    data = pages[currentPage];
    if (!data) {
        res.redirect('/');
        return;
    }
    console.log('currentPage', currentPage);
    res.render(currentPage, data)
});

app.listen('80', function () {
    console.log('Im listen you');
});

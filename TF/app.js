var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session');
var exphabs = require('express-handlebars');
var dotenv = require('dotenv');
const {verifyAdmin} = require ('./midlewares/auth');
dotenv.config();


//routes

var indexRouter = require('./routes/index');
var loginRouter = require('./routes/login');
var personalRouter = require('./routes/personal_centro');
var menuRouter = require('./routes/menu');
var obrasSocialesRouter = require('./routes/obras');
var cartillaRouter = require('./routes/cartilla');
var consultasRouter = require ('./routes/consultas');
var usuariosRouter = require ('./routes/usuarios');
var especialidadesRouter = require ('./routes/especialidades');
var profesionalesRouter = require('./routes/profesionales');
var AdministradoresRouter = require ('./routes/admin/Administrador')


//initializations

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
  secret: 'pass secreto',
  cookie: {maxAge : null},
  resave: true,
  saveUninitialized: false
}))



app.use('/', indexRouter);
app.use('/login', loginRouter);
app.use('/personal', personalRouter);
app.use('/menu', menuRouter);
app.use('/obras_sociales', obrasSocialesRouter);
app.use('/cartilla', cartillaRouter);
app.use('/consultas', consultasRouter);
app.use('/usuarios', usuariosRouter);
app.use('/especialidades', especialidadesRouter);
app.use('/profesionales', profesionalesRouter);
app.use('/administrador',verifyAdmin, AdministradoresRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;

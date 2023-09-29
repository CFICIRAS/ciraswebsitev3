const express = require('express') ; 
const path = require('path');
const session = require('express-session')
const flash = require('connect-flash')
const fileUpload = require('express-fileupload')
const routes = require('./server/routes/user.routes')
const https = require('https');
const fs = require('fs');
const PORT = process.env.PORT || 443
const app = express()


/** MOTEUR DE RENDU */
app.set('view engine', 'ejs')
const options = {
  key: fs.readFileSync('ssl/private.key'),
  cert: fs.readFileSync('ssl/ssl.crt')
};


/* MIDDLEWARE */
app.use(express.urlencoded({ extended : true}))
app.use(express.json()) ;
//SESSIONS 
app.use(session({
    secret : 'cficiras',
    resave : true,
    saveUninitialized : true, 
    //store: new MySQLStore(connection) , // ajouter le module 'express-mysql-session'
    cookie : { secure : false}
  }))
app.use(flash());
  // Global variables
app.use((req, res, next) => {
res.locals.message = req.flash("message");
res.locals.success = req.flash("success");
next();
}); 
app.use((req, res, next) => {
  if (!req.secure) {
    return res.redirect(`https://${req.headers.host}${req.url}`);
  }
  next();
});

app.use('/css', express.static(path.resolve(__dirname,'assets/styles')))
app.use('/img', express.static(path.resolve(__dirname,'assets/images')))
app.use('/fonts', express.static(path.resolve(__dirname,'assets/fonts')))
app.use('/js', express.static(path.resolve(__dirname,'assets/js')))
app.use('/sjs', express.static(path.resolve(__dirname,'assets/styles/')))
app.use('/pjs', express.static(path.resolve(__dirname,'assets/plugins')))
app.use('/scss', express.static(path.resolve(__dirname,'assets/sass')))
app.use('/upload', express.static(path.resolve(__dirname,'server/uploads')))
app.use('/plugins', express.static(path.resolve(__dirname,'assets/plugins')))
app.use(express.static('public'));
app.use(routes) ; 

const httpsServer = https.createServer(options, app);

httpsServer.listen(PORT, () => {
  console.log(`Serveur HTTPS en cours d'exécution sur le port https://localhost:${PORT}`);
});

// renvoie la PAGE 404 
//app.listen(PORT, ()=> { console.log(`Serveur active sur http://localhost:${PORT}`)});
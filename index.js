const express = require('express') ; 
const path = require('path');
const PORT = process.env.PORT || 3000
const app = express()

const routes = require('./server/routes/routes.users') //liens routes
/** MOTEUR DE RENDU */
app.set('view engine', 'ejs')

/* MIDDLEWARE */
app.use(express.urlencoded({ extended : true}))
app.use(express.json())

app.use('/css', express.static(path.resolve(__dirname,'assets/styles')))
app.use('/img', express.static(path.resolve(__dirname,'assets/images')))
app.use('/fonts', express.static(path.resolve(__dirname,'assets/fonts')))
app.use('/js', express.static(path.resolve(__dirname,'assets/js')))
app.use('/scss', express.static(path.resolve(__dirname,'assets/sass')))
app.use('/upload', express.static(path.resolve(__dirname,'server/uploads')))
app.use(express.static('public'));

app.get('*', function(req, res){
  res.render('404'); 
});

// renvoie la PAGE 404 
app.listen(PORT, ()=> { console.log(`Serveur active sur http://localhost:${PORT}`)});
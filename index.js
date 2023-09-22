const express = require('express') ; 
const path = require('path');
const routes = require('./server/routes/user.routes')
const PORT = process.env.PORT || 3000
const app = express()
/** MOTEUR DE RENDU */
app.set('view engine', 'ejs')

/* MIDDLEWARE */
app.use(express.urlencoded({ extended : true}))
app.use(express.json()) ; 

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

// renvoie la PAGE 404 
app.listen(PORT, ()=> { console.log(`Serveur active sur http://localhost:${PORT}`)});
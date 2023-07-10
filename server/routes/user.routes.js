const express = require('express')

const userRoute = express.Router()
/**
 *  FICHIERS DE ROUTES DU SITE
 **/  
// Routes principales

userRoute.get('/', (req, res) =>{
    res.render('index' , 
                {page_name: 'acceuil'}); 
})
userRoute.get('/inscription', (req,res)=>{
    res.render('inscription', 
                {page_name: 'inscription'})
})
userRoute.get('/formation', (req,res)=>{
    res.render('courses', 
                {page_name: 'formation'})
})
userRoute.get('/contact', (req, res)=>{
    res.render('contact', 
                {page_name: 'contact'})
})
userRoute.get('/decouverte', (req, res)=>{
    res.render('decouverte', 
                {page_name: 'decouverte'})
})
userRoute.get('/activites', (req, res)=>{
    res.render('news', 
                {page_name: 'activites'})
})
userRoute.get('/service', (req, res)=>{
    res.render('service', {page_name: 'service'})
})
userRoute.get('/decret', (req, res)=>{
    res.render('legal/_decret', {page_name: 'service'})
})

userRoute.get('/equipe', (req, res)=>{
    res.render('legal/_team', {page_name: 'service'})
})
userRoute.get('/directeur', (req, res)=>{
    res.render('legal/_directeur', {page_name: 'service'})
})
userRoute.get('/personnel', (req,res)=>{
    res.render('professeur', {page_name: 'service'})
}) ; 


//Les sous-routes 

// rubriques formations
route.get('/formation/infogestion', (req,res)=>{
    res.render('_infogest', {page_name: 'formation'})
}) // Route info de informatique gestion

route.get('/formation/infogenielogiciel', (req,res)=>{
    res.render('_infogl', {page_name: 'formation'})
}) // Route info genie logiciel

route.get('/formation/infosystemer', (req,res)=>{
    res.render('_infosys', {page_name: 'formation'})
}) // Route info genie logiciel

route.get('/formation/adminpublique', (req,res)=>{
    res.render('_adminp', {page_name: 'formation'})
}) // Route info admin publique

route.get('/formation/aum', (req,res)=>{
    res.render('_aum' , {page_name: 'formation'})
}) // Route admin assistant manager 
route.get('/formation/netacad', (req,res)=>{
    res.render('_netacad' , {page_name: 'formation'})
}) // Route admin assistant manager 
route.get('/formation/assistmanage', (req,res)=>{
    res.render('_adminA' , {page_name: 'formation'})
})
route.get('/formation/maintenance', (req,res)=>{
    res.render('_maint' , {page_name: 'formation'})
})

// ROUTE ACTUALITES ET EVENEMENT 
route.get('/activites/news1', (req, res)=>{
    res.render('news/_news1', 
                {page_name: 'activites'})
})
route.get('/activites/news2', (req, res)=>{
    res.render('news/_news2', 
                {page_name: 'activites'})
})
route.get('/activites/news3', (req, res)=>{
    res.render('news/_news3', 
                {page_name: 'activites'})
})


module.exports = userRoute ; 
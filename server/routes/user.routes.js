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
userRoute.get('/home', (req, res) =>{
    res.render('index1' , 
                {page_name: 'acceuil'}); 
})
userRoute.get('/inscription', (req,res)=>{
    res.render('inscription', 
                {page_name: 'inscription'})
})
userRoute.get('/Calendrier', (req,res)=>{
    res.render('Calendrier', 
                {page_name: 'Calendrier'})
})
userRoute.get('/Cisco', (req,res)=>{
    res.render('Cisco', 
                {page_name: 'Cisco'})
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
    res.render('_team', {page_name: 'service'})
})
userRoute.get('/directeur', (req, res)=>{
    res.render('_directeur', {page_name: 'service'})
})
userRoute.get('/personnel', (req,res)=>{
    res.render('professeur', {page_name: 'service'})
}) ; 


//Les sous-routes 

// rubriques formations
userRoute.get('/formation/infogestion', (req,res)=>{
    res.render('_infogest', {page_name: 'formation'})
}) // Route info de informatique gestion


userRoute.get('/formation/infogenielogiciel', (req,res)=>{
    res.render('_infogl', {page_name: 'formation'})
}) // Route info genie logiciel

userRoute.get('/formation/infosystemer', (req,res)=>{
    res.render('_infosys', {page_name: 'formation'})
}) // Route info genie logiciel

userRoute.get('/formation/adminpublique', (req,res)=>{
    res.render('_adminp3', {page_name: 'formation'})
}) // Route info admin publique

userRoute.get('/formation/aum', (req,res)=>{
    res.render('_aum' , {page_name: 'formation'})
}) // Route admin assistant manager 
userRoute.get('/formation/netacad', (req,res)=>{
    res.render('_netacad' , {page_name: 'formation'})
}) // Route admin assistant manager 
userRoute.get('/formation/assistmanage', (req,res)=>{
    res.render('_adminp' , {page_name: 'formation'})
})
userRoute.get('/formation/maintenance', (req,res)=>{
    res.render('_maint' , {page_name: 'formation'})
})
userRoute.get('/Cisco/iet', (req,res)=>{
    res.render('_iet' , {page_name: 'Cisco'})
})
userRoute.get('/Cisco/ccna', (req,res)=>{
    res.render('_ccna' , {page_name: 'Cisco'})
})
userRoute.get('/Cisco/secu', (req,res)=>{
    res.render('_secu' , {page_name: 'Cisco'})
})
userRoute.get('/Cisco/ccnp', (req,res)=>{
    res.render('_ccnp' , {page_name: 'Cisco'})
})

// ROUTE ACTUALITES ET EVENEMENT 
userRoute.get('/activites/news1', (req, res)=>{
    res.render('news/_news1', 
                {page_name: 'activites'})
})
userRoute.get('/activites/news2', (req, res)=>{
    res.render('news/_news2', 
                {page_name: 'activites'})
})
userRoute.get('/activites/news3', (req, res)=>{
    res.render('news/_news3', 
                {page_name: 'activites'})
})


module.exports = userRoute ; 
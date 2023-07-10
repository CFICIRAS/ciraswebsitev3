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

module.exports = userRoute ; 
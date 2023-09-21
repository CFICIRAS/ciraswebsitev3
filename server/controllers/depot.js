const { json } = require('body-parser');
const pool =require('../config/dbconfig') ; 
const fs = require("fs");

let nom , prenom , tel , bac , filiere , cycle ; 

exports.depotProfile1 = (req, res)=>{
    pool.getConnection( (err, connexion) => {
        if(err)
        {
            console.log('Erreur est survenue au niveau de la base de données ')
        }
        nom = req.body.ins_nom ; 
        prenom = req.body.ins_prenom; 
        tel  = req.body.ins_tel; 
        filiere = req.body.filiere;

        console.log(req.body) ; 
        connexion.release() // fermeture de la connexion 
        res.send(req.body);
         

    })
}

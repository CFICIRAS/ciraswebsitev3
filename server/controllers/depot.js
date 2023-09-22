const { json } = require('body-parser');
const pool =require('../config/dbconfig') ; 
const fs = require("fs");

exports.depotProfile1 = (req, res)=>{
    const 
        {   ins_nom,
            ins_prenom,
            ins_tel,
            ins_email,
            ins_profile,
            ins_bac, 
            ins_filiere, 
            ins_cycle  
        } = req.body ;
    let dos_actenais, 
        dos_diplome , 
        dos_arrete, 
        dos_autorisation, 
        dos_photo  ; // variables de données formulaires
    let uploadPath , chemin ; // variables traitements de fichiers
    let isFileUpload = false ;
    if(ins_nom ==""  || 
        ins_prenom == "" ||
        ins_tel == ""    ||
        ins_bac == ""    ||
        ins_filiere== "" ||
        ins_cycle ==""
        )
        {
            req.flash("message", "Veuillez remplir tout les champs, car ils sont essentiels") 
            return res.redirect('/inscription#ins')
        } 
    pool.getConnection( (err, connexion) => {
        if(err)
        {
            console.log('Erreur est survenue au niveau de la base de données ')
        }
        pool.query(`INSERT INTO cficiras_website.cfi_candidat set 
             ins_nom = ? , 
             ins_prenom =? , 
             ins_tel = ? , 
             ins_bac= ? , 
             ins_statut = ? ,
             ins_filiere= ? , 
             ins_cycle = ? `, 
             [ins_nom,ins_prenom,ins_tel,ins_bac, ins_profile,ins_filiere,ins_cycle]) ;
            connexion.release() ;
            req.flash("success" , "Dossier validé avec succès, Rapprochez-vous de la scolarité du CFI-CIRAS pour la suite") 
            console.log("Données enregistrer avec success sur la base de données")
            res.send(json(req.body));
    })
}

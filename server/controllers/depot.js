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

        const newcandidat = {
            ins_nom,
            ins_prenom,
            ins_email,
            ins_tel,
            ins_profile,
            ins_bac, 
            ins_filiere, 
            ins_cycle
        }
     pool.getConnection(async (err, connexion) =>  {
        if(err)
        {
            console.log('Erreur est survenue au niveau de la base de données ')
        }
        pool.query('INSERT INTO cfi_candidat set ? ', [newcandidat]) ;
        uploadPath = './server/uploads/' +"./"+ins_nom+"__"+ins_prenom+'/' ;
        // creation dossier comportant le nom+prenom du dépositaire
        fs.promises.mkdir(uploadPath, { recursive: true })
        return res.redirect('/inscription#bloc_inscription')
    })
}

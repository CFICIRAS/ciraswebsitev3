const { json } = require('body-parser');
const pool =require('../config/dbconfig') ; 
const fs = require("fs");





exports.depotProfile1 = (req, res)=>{
    const { ins_nom,
            ins_prenom,
            ins_email,
            ins_tel,
            ins_profile,
            ins_bac, 
            ins_filiere, 
            ins_cycle  } = req.body;
    let dos_actenais, 
        dos_diplome , 
        dos_arrete, 
        dos_autorisation, 
        dos_photo  ; // variables de données formulaires
    let uploadPath , chemin ; // variables traitements de fichiers
    let isFileUpload = false ; 
    pool.getConnection( (err, connexion) => {
        if(err)
        {
            console.log('Erreur est survenue au niveau de la base de données ')
        }

        console.log(req.body) ; 
        connexion.release() // fermeture de la connexion 
        res.send(req.body);
         

    })
}

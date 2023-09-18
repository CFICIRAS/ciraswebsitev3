const connection = require('../config/dbconfig')

const fs = require("fs");

exports.smdepot = (req, res)=>{

    const { 
            ins_nom,
            ins_prenom,
            ins_tel,
            ins_profile,
            ins_bac, ins_filiere, ins_cycle  } = req.body;
    const newCandidat = {
    ins_nom,
    ins_prenom,
    ins_tel,
    ins_bac,
    ins_profile, 
    ins_filiere,
    ins_cycle
    };
    let dos_actenais, 
        dos_diplome , 
        dos_arrete, 
        dos_autorisation, 
        dos_photo  ; // variables de données formulaires
    let uploadPath , chemin ; // variables traitements de fichiers
    let isFileUpload = false ; 

        if(ins_nom ==""     || 
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
  connection.getConnection((err, connexion) => 
  {
    if (newCandidat !== null)
    {
          // CHARGEMENT  DE FICHIERS
          if (!req.files || Object.keys(req.files).length === 0) {
            console.log(req.files)
            return res.status(400).render('error400', { error_message : "Un fichier/images n'a pas été selectionner"});
          }
          dos_actenais = req.files.dos_actenais;
          dos_diplome = req.files.dos_diplome ; 
          dos_arrete = req.files.dos_arrete ; 
          dos_autorisation = req.files.dos_autoris
          dos_photo = req.files.dos_photoid ; 
          
          if(dos_actenais == null)
          {
            isFileUpload = false ; 
            req.flash("message", "Votre acte de de naissance doit être envoyer pour valider votre dossier!") 
            return res.redirect('/inscription#ins') 
          }
          if(dos_diplome == null)
          {
            isFileUpload = false ;
            req.flash("message", "votre diplôme doit être envoyer pour valider votre dossier") 
            return res.redirect('/inscription') 
          }
          if(dos_arrete == null)
          {
            isFileUpload = false ;
            req.flash("message", "Un arrete de dernier promotion doit être validé") 
            return res.redirect('/inscription') 
          }
          if(dos_photo == null)
          {
            isFileUpload = false ;
            req.flash("message", "Les photos d'identité sont obligatoires :!") 
            return res.redirect('/inscription') 
          }
          if( dos_autorisation == null)
          {
            isFileUpload = false ;
            req.flash("message", "Une autorisation de concourir doit être envoyer pour valider votre dossier") 
            return res.redirect('/inscription') 
          }
          console.log(req.files); // en dev
          uploadPath = './server/uploads/' +"./"+nom+ins_prenom+'/'; // repertoire de chargements des elements 
          // creation dossier comportant le nom+prenom du dépositaire
          fs.promises.mkdir(uploadPath, { recursive: true })

          if(dos_actenais !== null)
         {
          chemin = uploadPath + dos_actenais.name ;
          dos_actenais.mv(chemin, function (err) {
            if (err) return res.status(500).send(err);
          });
          isFileUpload = true ;
         }
          
         if( dos_diplome !== null)
          {
            chemin = uploadPath + dos_diplome.name ; 
            //deplacer les fichiers selectionner dans le repertoire créé
            dos_diplome.mv(chemin , function(err) {
              if (err) return res.status(500).render('error500', 
                  { error_message : "Un fichier/images n'a pas été selectionner"});
            });
            isFileUpload = true ; 
          }
         if (dos_autorisation !== null ) 
         {
          chemin = uploadPath + dos_autorisation.name
          dos_autorisation.mv(chemin , function(err) {
            if (err) return res.status(500).send(err);
          });
          isFileUpload = true ; 
         }
         if (dos_arrete !== null ) 
         {
          chemin = uploadPath + dos_arrete.name
          dos_arrete.mv(chemin , function(err) {
            if (err) return res.status(500).send(err);
          });
          isFileUpload = true ; 
         }
         if(dos_photo !== null )
         {
          chemin = uploadPath + dos_photo.name
          dos_photo.mv(chemin , function(err) {
            if (err) return res.status(500).send(err);
          });
          isFileUpload = true ;
         }
           // FIN BLOC CHARGEMENT FICHIER
          
          //Insertion des données dans la base de données
          if(isFileUpload)
          {
            connection.query(`INSERT INTO cficiras_website.cfi_candidat set 
             nom = ? , 
             ins_prenom =? , 
             ins_tel = ? , 
             ins_bac= ? , 
             ins_profile = ? , 
             ins_filiere= ? , 
             ins_cycle = ? `, 
             [nom,ins_prenom,ins_tel,ins_bac, ins_profile,ins_filiere,ins_cycle]) ;
             
            connexion.release() ;
            req.flash("success" , "Dossier validé avec succès, Rapprochez-vous de la scolarité du CFI-CIRAS pour la suite")
            return res.redirect('/inscription#ins')
          }    
    }
  })  
}

// AJOUT D'UNE VIEW POUR ERREUR DE FICHIER
// AJOUT des view

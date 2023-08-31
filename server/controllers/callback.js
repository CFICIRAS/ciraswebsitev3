
const express = require("express");
const app = express();

app.post("/callback", (req, res) => {
  // Le corps de la requête HTTP POST est passé à la fonction de rappel en tant qu'argument.
  const body = req.body;

  // Vous pouvez utiliser le corps de la requête pour effectuer des opérations, telles que :
  // * Enregistrer les informations dans une base de données.
  // * Envoyer une notification à un autre serveur.
  // * Traiter une commande.

  // Envoyez une réponse HTTP 200 OK.
  res.status(200).send();
});






/*

const express = require("express");
const app = express();

app.get("/users/:id", (req, res, next) => {
  // Utilisez une fonction de rappel pour traiter la requête HTTP GET.
  (async () => {
    // Récupérez les informations de l'utilisateur à partir de la base de données.
    const user = await User.findById(req.params.id);

    // Envoyez une réponse HTTP 200 OK avec les informations de l'utilisateur.
    res.status(200).json(user);
  })();
});

app.listen(3000);*/


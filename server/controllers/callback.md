Pour construire un callback sur Node.js en utilisant Express.js, vous pouvez utiliser la méthode `app.post()` pour créer une route POST qui acceptera une requête HTTP POST. Le corps de la requête HTTP POST sera passé à la fonction de rappel en tant qu'argument.

Voici un exemple de code qui crée une route POST qui acceptera une requête HTTP POST avec une chaîne de caractères en tant que corps de la requête :

```javascript
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

app.listen(3000);
```

Pour utiliser ce code, vous pouvez envoyer une requête HTTP POST à l'URL `http://localhost:3000/callback` avec une chaîne de caractères en tant que corps de la requête. Par exemple, vous pouvez utiliser la commande suivante :


curl -X POST -H "Content-Type: application/json" -d '{"message": "Hello, world!"}' http://localhost:3000/callback


Cette commande renverra une réponse HTTP 200 OK.

Vous pouvez également utiliser des fonctions de rappel pour traiter des requêtes HTTP asynchrones. Par exemple, vous pouvez utiliser une fonction de rappel pour traiter une requête HTTP GET qui demande les informations d'un utilisateur.

Voici un exemple de code qui utilise une fonction de rappel pour traiter une requête HTTP GET :

```javascript
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

app.listen(3000);
```

Ce code utilisera une fonction de rappel anonyme pour traiter la requête HTTP GET. La fonction de rappel asynchrone utilisera la fonction `findById()` de la classe `User` pour récupérer les informations de l'utilisateur à partir de la base de données. Une fois que les informations de l'utilisateur ont été récupérées, la fonction de rappel renverra une réponse HTTP 200 OK avec les informations de l'utilisateur.

Pour utiliser ce code, vous pouvez envoyer une requête HTTP GET à l'URL `http://localhost:3000/users/1`. Cette commande renverra une réponse HTTP 200 OK avec les informations de l'utilisateur.
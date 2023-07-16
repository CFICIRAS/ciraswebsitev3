// Sélectionnez tous les éléments avec la classe "news_post" et "latest_post"
const newsPosts = document.querySelectorAll('.news_post');
const latestPosts = document.querySelectorAll('.latest_post');

// Fonction pour ajouter la classe "show" aux éléments
function showElement(element) {
  element.classList.add('show');
}

// Fonction pour vérifier si un élément est visible dans la fenêtre
function isElementVisible(element) {
  const rect = element.getBoundingClientRect();
  const windowHeight = window.innerHeight || document.documentElement.clientHeight;
  return rect.top <= windowHeight - 100;
}

// Fonction pour vérifier si un élément est partiellement visible dans la fenêtre
function isElementPartiallyVisible(element) {
  const rect = element.getBoundingClientRect();
  const windowHeight = window.innerHeight || document.documentElement.clientHeight;
  return rect.top <= windowHeight && rect.bottom >= 0;
}

// Fonction pour gérer le scroll de la page
function handleScroll() {
  newsPosts.forEach((post) => {
    if (isElementVisible(post) || isElementPartiallyVisible(post)) {
      showElement(post);
    }
  });

  latestPosts.forEach((post) => {
    if (isElementVisible(post) || isElementPartiallyVisible(post)) {
      showElement(post);
    }
  });
}

// Écoutez l'événement de scroll de la fenêtre
window.addEventListener('scroll', handleScroll);

// Appeler la fonction handleScroll au chargement de la page pour afficher les éléments visibles initialement
handleScroll();

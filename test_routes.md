#  Documentation et Test des Routes

Ce fichier répertorie toutes les URLs (routes) disponibles dans cette application MVC pour gérer les étudiants. 
Pour tester le projet, démarrez le serveur PHP via la commande `php -S localhost:8000 -t public` et utilisez les liens ci-dessous.

##  Gestion des Étudiants (CRUD)

| Méthode HTTP | URL / Route | Description de l'action |
| :--- | :--- | :--- |
| **GET** | `http://localhost:8000/etudiants` | Affiche la liste complète de tous les étudiants. |
| **GET** | `http://localhost:8000/etudiants/create` | Ouvre le formulaire pour ajouter un nouvel étudiant. |
| **POST** | `http://localhost:8000/etudiants/store` | *Route interne :* Reçoit et sauvegarde les données du nouveau formulaire. |
| **GET** | `http://localhost:8000/etudiants/{id}` | Affiche la fiche détaillée d'un étudiant (Exemple: `/etudiants/68`). |
| **GET** | `http://localhost:8000/etudiants/{id}/edit` | Ouvre le formulaire pré-rempli pour modifier un étudiant. |
| **POST** | `http://localhost:8000/etudiants/{id}/update` | *Route interne :* Enregistre les modifications de l'étudiant. |
| **POST** | `http://localhost:8000/etudiants/{id}/delete` | *Route interne :* Supprime définitivement un étudiant de la base de données. |

---
**Note :** Remplacer `{id}` par un numéro d'étudiant existant dans la base de données (ex: 68, 69, etc.).

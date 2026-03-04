# 🎓 Mini-Projet MVC : Gestion des Étudiants (Lab 7)

Ce projet est une application web développée en **PHP pur** (sans framework externe) respectant strictement l'architecture **MVC (Modèle-Vue-Contrôleur)**. Il a pour but de gérer un annuaire d'étudiants (opérations CRUD) en reliant chaque étudiant à sa filière respective.

---

## 🚀 Fonctionnalités Principales

* **Architecture MVC Native :** Implémentation complète d'un routeur (`Router.php`), d'un gestionnaire de requêtes/réponses, et de contrôleurs de base.
* **Opérations CRUD Complètes :**
  * **C**réation d'un nouvel étudiant avec validation des données (CNE, Email, etc.).
  * **R**ecture (Affichage) sous forme de liste paginée et affichage détaillé d'une fiche étudiant.
  * **U**pdate (Modification) des informations d'un étudiant existant.
  * **D**elete (Suppression) sécurisée avec demande de confirmation.
* **Sécurité :** Protection contre les failles XSS (via `htmlspecialchars`) et utilisation de requêtes préparées via **PDO** pour contrer les injections SQL.
* **Design Responsive :** Interface utilisateur épurée et moderne.

---

## 🛠️ Technologies Utilisées

* **Back-End :** PHP 8+
* **Base de données :** MySQL (via l'extension PDO)
* **Front-End :** HTML5, CSS3 

---

## 📂 Architecture du Projet

Le projet est structuré de manière modulaire pour séparer la logique métier de l'affichage :

```text
PhpProject7/
│
├── public/                 # Dossier public (Point d'entrée de l'application)
│   └── index.php           # Front Controller interceptant toutes les requêtes
│
├── src/                    # Code source de l'application
│   ├── Container/          # Injection de dépendances (AppFactory.php)
│   ├── Controller/         # Logique applicative (EtudiantController.php)
│   ├── Core/               # Cœur du framework MVC (Router, Request, View...)
│   └── Dao/                # Modèles et accès aux données (EtudiantDao, FiliereDao...)
│
├── views/                  # Fichiers de présentation (Vues)
│   ├── layout.php          # Gabarit principal de l'application
│   └── etudiant/           # Vues spécifiques aux étudiants (index, create, edit, show)
│
├── gestionetudiant.sql     # Script SQL pour recréer la base de données
├── test_routes.md          # Documentation des routes de l'application
└── README.md               # Le présent fichier

```
 ##  Aperçu de l'application (Captures d'écran)

Voici un aperçu des différentes interfaces réalisées pour les opérations CRUD :

### 1. Liste des étudiants (avec pagination)

<img width="863" height="749" alt="image" src="https://github.com/user-attachments/assets/c03f1c63-7a5c-4e0a-9697-1a5c1ec9865a" />


### 2. Formulaire d'ajout d'un étudiant (Création)


<img width="866" height="779" alt="image" src="https://github.com/user-attachments/assets/f4c67cc7-6509-483f-af3e-4f43622dbd10" />


### 3. Formulaire de modification (Édition)


<img width="848" height="766" alt="image" src="https://github.com/user-attachments/assets/3b50e1b5-4cbb-4324-9ed4-c535cde6453e" />


### 4. Fiche détaillée d'un étudiant (Détail)

<img width="879" height="517" alt="image" src="https://github.com/user-attachments/assets/b25bba41-1d2f-4998-8dcf-879cfd840570" />



-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 03 mars 2026 à 16:51
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `atelier`
--
CREATE DATABASE IF NOT EXISTS `atelier` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `atelier`;

-- --------------------------------------------------------

--
-- Structure de la table `devdata`
--

CREATE TABLE `devdata` (
  `Developpeurs` varchar(32) DEFAULT NULL,
  `Jour` char(11) DEFAULT NULL,
  `NbScripts` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `devdata`
--

INSERT INTO `devdata` (`Developpeurs`, `Jour`, `NbScripts`) VALUES
('ALAMI', 'Lundi', 1),
('WAFI', 'Lundi', 2),
('SLAMI', 'Mardi', 9);
--
-- Base de données : `ateliere`
--
CREATE DATABASE IF NOT EXISTS `ateliere` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `ateliere`;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `poste` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `machine`
--

CREATE TABLE `machine` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `employe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employe_id` (`employe_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `machine`
--
ALTER TABLE `machine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `machine`
--
ALTER TABLE `machine`
  ADD CONSTRAINT `machine_ibfk_1` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de données : `banque_demo`
--
CREATE DATABASE IF NOT EXISTS `banque_demo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `banque_demo`;

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id` int(11) NOT NULL,
  `titulaire` varchar(100) NOT NULL,
  `solde` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `titulaire`, `solde`) VALUES
(1, 'Alice', 800.00),
(2, 'Bob', 700.00);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Base de données : `bibliotheque`
--
CREATE DATABASE IF NOT EXISTS `bibliotheque` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `bibliotheque`;

-- --------------------------------------------------------

--
-- Structure de la table `abonne`
--

CREATE TABLE `abonne` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `abonne`
--

INSERT INTO `abonne` (`id`, `nom`, `email`) VALUES
(1, 'Karim', 'karim.new@mail.com'),
(3, 'Samir', 'samir@mail.com');

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`id`, `nom`) VALUES
(1, 'Victor Hugo'),
(2, 'George Orwell'),
(3, 'Jane Austen');

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE `emprunt` (
  `ouvrage_id` int(11) NOT NULL,
  `abonne_id` int(11) NOT NULL,
  `date_debut` date NOT NULL DEFAULT current_timestamp(),
  `date_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `emprunt`
--

INSERT INTO `emprunt` (`ouvrage_id`, `abonne_id`, `date_debut`, `date_fin`) VALUES
(3, 3, '2025-06-19', NULL),
(2, 1, '2025-06-18', '2025-12-21');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ouvrage`
--

CREATE TABLE `ouvrage` (
  `id` int(11) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT 1,
  `auteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ouvrage`
--

INSERT INTO `ouvrage` (`id`, `titre`, `disponible`, `auteur_id`) VALUES
(1, 'Les Misérables', 0, 1),
(2, '1984', 0, 2),
(3, 'Pride and Prejudice', 1, 3);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_abonnes_actifs_mensuels`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vue_abonnes_actifs_mensuels` (
`annee` int(4)
,`mois` int(2)
,`nb_abonnes_actifs` bigint(21)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_emprunts_mensuels`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vue_emprunts_mensuels` (
`annee` int(4)
,`mois` int(2)
,`total_emprunts` bigint(21)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_emprunts_par_abonne`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vue_emprunts_par_abonne` (
`id` int(11)
,`nom` varchar(100)
,`total_emprunts` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure de la vue `vue_abonnes_actifs_mensuels`
--
DROP TABLE IF EXISTS `vue_abonnes_actifs_mensuels`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_abonnes_actifs_mensuels`  AS SELECT year(`emprunt`.`date_debut`) AS `annee`, month(`emprunt`.`date_debut`) AS `mois`, count(distinct `emprunt`.`abonne_id`) AS `nb_abonnes_actifs` FROM `emprunt` GROUP BY year(`emprunt`.`date_debut`), month(`emprunt`.`date_debut`) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_emprunts_mensuels`
--
DROP TABLE IF EXISTS `vue_emprunts_mensuels`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_emprunts_mensuels`  AS SELECT year(`emprunt`.`date_debut`) AS `annee`, month(`emprunt`.`date_debut`) AS `mois`, count(0) AS `total_emprunts` FROM `emprunt` GROUP BY year(`emprunt`.`date_debut`), month(`emprunt`.`date_debut`) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_emprunts_par_abonne`
--
DROP TABLE IF EXISTS `vue_emprunts_par_abonne`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_emprunts_par_abonne`  AS SELECT `a`.`id` AS `id`, `a`.`nom` AS `nom`, count(`e`.`ouvrage_id`) AS `total_emprunts` FROM (`abonne` `a` left join `emprunt` `e` on(`e`.`abonne_id` = `a`.`id`)) GROUP BY `a`.`id`, `a`.`nom` ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonne`
--
ALTER TABLE `abonne`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`ouvrage_id`,`abonne_id`,`date_debut`),
  ADD KEY `fk_emprunt_abonne` (`abonne_id`),
  ADD KEY `date_fin` (`date_fin`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `ouvrage`
--
ALTER TABLE `ouvrage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ouvrage_auteur` (`auteur_id`),
  ADD KEY `disponible` (`disponible`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonne`
--
ALTER TABLE `abonne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ouvrage`
--
ALTER TABLE `ouvrage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `fk_emprunt_abonne` FOREIGN KEY (`abonne_id`) REFERENCES `abonne` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_emprunt_ouvrage` FOREIGN KEY (`ouvrage_id`) REFERENCES `ouvrage` (`id`);

--
-- Contraintes pour la table `ouvrage`
--
ALTER TABLE `ouvrage`
  ADD CONSTRAINT `fk_ouvrage_auteur` FOREIGN KEY (`auteur_id`) REFERENCES `auteur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de données : `dar_marrakech`
--
CREATE DATABASE IF NOT EXISTS `dar_marrakech` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dar_marrakech`;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`) VALUES
(1, 'Entrées', 'entrees'),
(2, 'Plats Principaux', 'plats'),
(3, 'Desserts', 'desserts'),
(4, 'Boissons', 'boissons');

-- --------------------------------------------------------

--
-- Structure de la table `disponibilites`
--

CREATE TABLE `disponibilites` (
  `id` int(11) NOT NULL,
  `jour` date NOT NULL,
  `heure` time NOT NULL,
  `capacite` int(11) NOT NULL,
  `reserves` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_type` enum('delivery','pickup') NOT NULL,
  `delivery_address` text DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','preparing','ready','delivered','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `reservation_date` date NOT NULL,
  `reservation_time` time NOT NULL,
  `guests` int(11) NOT NULL,
  `special_requests` text DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `table_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `name`, `email`, `phone`, `reservation_date`, `reservation_time`, `guests`, `special_requests`, `status`, `created_at`, `table_number`) VALUES
(26, 3, 'salma lakhal', 'lakhalsalma18@gmail.com', '0654810008', '2025-05-19', '12:30:00', 2, '', 'pending', '2025-05-18 23:02:17', '2'),
(27, 3, 'lakhal samira', 'lakhalsamira17@gmail.com', '0654810008', '2025-11-09', '20:00:00', 2, '', 'pending', '2025-11-05 10:11:18', '2');

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text NOT NULL,
  `is_approved` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('admin','staff','customer') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `created_at`) VALUES
(1, 'el khalifi', '$2y$10$v3X1.EqL2waRqxkeDe/EWOHopb.cIemsfkNYuU9.LJlHN6HzZNg7W', 'khalif@enes.uca', 'customer', '0000-00-00 00:00:00'),
(3, 'majd', '$2y$10$v3X1.EqL2waRqxkeDe/EWOHopb.cIemsfkNYuU9.LJlHN6HzZNg7W', 'khalif@eses.uca', 'admin', '0000-00-00 00:00:00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Index pour la table `disponibilites`
--
ALTER TABLE `disponibilites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jour` (`jour`,`heure`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `menu_item_id` (`menu_item_id`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `disponibilites`
--
ALTER TABLE `disponibilites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`);

--
-- Contraintes pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Base de données : `db`
--
CREATE DATABASE IF NOT EXISTS `db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db`;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `dateNaissance` date NOT NULL,
  `filiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `dateNaissance`, `filiere`) VALUES
(2, 'safi', 'Ali', '2020-11-12', 3),
(3, 'Rami', 'Ali', '2025-11-12', 3),
(4, 'Rami', 'Ali', '2025-11-12', 3),
(5, 'Rami', 'Ali', '2025-11-12', 3);

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `libelle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`id`, `code`, `libelle`) VALUES
(3, 'cc', 'cc'),
(4, 'cc', 'cc'),
(5, 'cc', 'cc'),
(6, 'cc', 'cc'),
(7, 'sal1234lakal', 'asdfgh'),
(8, 'sal1234lakal', 'asdfgh'),
(9, 'sal1234lakal', 'asdfgh'),
(10, 'sal1234lakal', 'asdfgh'),
(11, '', ''),
(12, '', ''),
(13, '', ''),
(14, '', ''),
(15, 'cc', 'cc'),
(16, 'cc', 'cc');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filiere` (`filiere`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`filiere`) REFERENCES `filiere` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de données : `db_agence_immo`
--
CREATE DATABASE IF NOT EXISTS `db_agence_immo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_agence_immo`;

-- --------------------------------------------------------

--
-- Structure de la table `bien`
--

CREATE TABLE `bien` (
  `id_bien` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `surface` decimal(10,2) DEFAULT NULL,
  `prixMensuel` decimal(10,2) NOT NULL,
  `id_prop` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `bien`
--

INSERT INTO `bien` (`id_bien`, `type`, `ville`, `surface`, `prixMensuel`, `id_prop`) VALUES
(9, 'villa', 'casa', 400.00, 1200.00, NULL),
(11, 'appatement', 'Taja', 100.00, 500.00, NULL),
(13, 'Villa', 'Rabat', 300.00, 15000.00, NULL),
(14, 'appatement', 'ifrane', 300.00, 800.00, NULL),
(15, 'villa', 'Marrakech', 300.00, 2000.00, NULL),
(16, 'appatement', 'Casa BLANCA', 100.00, 500.00, 31),
(17, 'Villa', 'Rabat', 300.00, 20000.00, NULL),
(18, 'vstedio', 'casa', 400.00, 1200.00, NULL),
(19, 'Villa', 'Maknasse', 500.00, 20600.00, NULL),
(20, 'appatement', 'Taja', 220.00, 500.00, 20),
(21, 'appartement', 'ifrane', 200.00, 500.00, 20),
(22, 'appatement', 'Taja', 100.00, 500.00, NULL),
(23, 'appatement', 'ifrane', 300.00, 800.00, NULL),
(24, 'appatement', 'Taja', 100.00, 500.00, 28),
(25, 'Villa', 'Maknasse', 500.00, 20600.00, 26),
(26, 'villa', 'fes', 400.00, 1200.00, NULL),
(27, 'Villa', 'saouira', 500.00, 1000.00, NULL),
(28, 'Villa', 'taja', 300.00, 20000.00, NULL),
(29, 'studio', 'SAFI', 100.00, 200.00, 42),
(30, 'studio', 'ifrane', 60.00, 600.00, 27);

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `id_location` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date DEFAULT NULL,
  `loyer` decimal(10,2) NOT NULL,
  `id_bien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `location`
--

INSERT INTO `location` (`id_location`, `dateDebut`, `dateFin`, `loyer`, `id_bien`) VALUES
(29, '2025-08-01', '2025-11-30', 16000.00, 9),
(31, '2025-10-01', '2025-12-30', 2000.00, 9),
(32, '2025-10-01', '2025-12-30', 20020.00, 14),
(33, '2025-08-01', '2025-09-30', 16000.00, 14),
(35, '2025-10-01', '2025-12-30', 20020.00, 13),
(36, '2025-10-01', '2025-11-30', 16000.00, 11),
(37, '2025-10-01', '2025-12-30', 2000.00, 24),
(38, '2025-09-01', '2025-12-30', 1000.00, 26);

-- --------------------------------------------------------

--
-- Structure de la table `proprietaire`
--

CREATE TABLE `proprietaire` (
  `id_prop` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `proprietaire`
--

INSERT INTO `proprietaire` (`id_prop`, `nom`, `contact`, `adresse`) VALUES
(19, 'samir jad', '076543757688', 'Taza'),
(20, 'salma alami', '0765432456', 'casa'),
(26, 'JIhan nadin', '07556677897', 'Taja'),
(27, 'jad lakhal', '0654810006', 'Marrakech'),
(28, 'salma lakhal', '076543234567', 'tata'),
(29, 'Salma salami', 'salmasal@gmail.com', 'Casa blanca'),
(30, 'omar alami', '0666775538', 'Taja'),
(31, 'SALMA alami', '0788556677', 'Tawajtat'),
(32, 'Hayat alami', '0788556677', 'Safi'),
(33, 'samir jad', '076543757688', 'sale'),
(34, 'samir jad', '076543757688', 'sale'),
(35, 'Salma salami', 'salmasal@gmail.com', 'Casa Maariff'),
(36, 'samir jad', '076543757688', 'sale'),
(37, 'Salma salami', 'salmasal@gmail.com', 'Casa Maariff'),
(38, 'jad lakhal', '0654810006', 'Marrakech'),
(39, 'salma lakhal', '076543234567', 'khribga'),
(40, 'kamal', '0654216677', 'fes'),
(41, 'hafssa', '0654235647', 'fes'),
(42, 'AMAL JLALI', '0765432567', 'marrakech'),
(43, 'ali kamal', '0765367897', 'ifrane');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `email`) VALUES
(1, 'admin', '1234', 'lakhalsalma18@gmail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bien`
--
ALTER TABLE `bien`
  ADD PRIMARY KEY (`id_bien`),
  ADD KEY `id_prop` (`id_prop`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`),
  ADD KEY `id_bien` (`id_bien`);

--
-- Index pour la table `proprietaire`
--
ALTER TABLE `proprietaire`
  ADD PRIMARY KEY (`id_prop`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bien`
--
ALTER TABLE `bien`
  MODIFY `id_bien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `location`
--
ALTER TABLE `location`
  MODIFY `id_location` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `proprietaire`
--
ALTER TABLE `proprietaire`
  MODIFY `id_prop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bien`
--
ALTER TABLE `bien`
  ADD CONSTRAINT `bien_ibfk_1` FOREIGN KEY (`id_prop`) REFERENCES `proprietaire` (`id_prop`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`id_bien`) REFERENCES `bien` (`id_bien`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de données : `gestion_etudiant`
--
CREATE DATABASE IF NOT EXISTS `gestion_etudiant` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestion_etudiant`;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `prenom` varchar(60) NOT NULL,
  `ville` varchar(60) NOT NULL,
  `sexe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `ville`, `sexe`) VALUES
(1, 'Lakhal', 'Salma', 'marrakech', 'F'),
(3, 'sami', 'lakhal', 'safi', 'M'),
(4, 'LAKHAL', 'Jad', 'SAFI', 'M');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Base de données : `gestion_etudiants_pdo`
--
CREATE DATABASE IF NOT EXISTS `gestion_etudiants_pdo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `gestion_etudiants_pdo`;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `cne` varchar(20) NOT NULL,
  `nom` varchar(80) NOT NULL,
  `prenom` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL,
  `filiere_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `cne`, `nom`, `prenom`, `email`, `filiere_id`) VALUES
(1, 'CNE112233', 'Alaoui', 'Youssef', 'youssef.alaoui@email.ma', 1),
(3, 'CNE554433', 'Test', 'Test', 'sara.benali@email.com', 1),
(5, 'CNE998877', 'Touimi', 'Omar', 'omar.med@email.ma', 4),
(18, 'CNE1772105029', 'Test', 'Test', 'sara.1772105029@email.com', 1),
(21, 'CNE1772105345', 'Test', 'Test', 'sara.1772105345@email.com', 1),
(23, 'CNE1073', 'Touimi', 'Omar', 'omar.med1772105345@email.ma', 19),
(25, 'CNE1772105589', 'Test', 'Test', 'sara.1772105589@email.com', 1),
(28, 'CNE1772105631', 'Test', 'Test', 'sara.1772105631@email.com', 1),
(30, 'CNE7064', 'Touimi', 'Omar', 'omar.med1772105631@email.ma', 22),
(32, 'CNE1772105816', 'Test', 'Test', 'sara.1772105816@email.com', 1),
(34, 'CNE1434', 'Touimi', 'Omar', 'omar.med1772105816@email.ma', 24),
(36, 'CNE1772105819', 'Test', 'Test', 'sara.1772105819@email.com', 1),
(38, 'CNE4041', 'Touimi', 'Omar', 'omar.med1772105819@email.ma', 26),
(40, 'CNE1772105820', 'Test', 'Test', 'sara.1772105820@email.com', 1),
(42, 'CNE8787', 'Touimi', 'Omar', 'omar.med1772105820@email.ma', 28),
(44, 'CNE1772105835', 'Test', 'Test', 'sara.1772105835@email.com', 1),
(46, 'CNE8519', 'Touimi', 'Omar', 'omar.med1772105835@email.ma', 30),
(48, 'CNE1772105858', 'Test', 'Test', 'sara.1772105858@email.com', 1),
(50, 'CNE9340', 'Touimi', 'Omar', 'omar.med1772105858@email.ma', 32),
(51, 'CNE7777', 'Test', 'Tx', 'test.tx@example.com', 33),
(52, 'CNE8888', 'Test', 'Tx', 'test.math@example.com', 35),
(53, 'CNE5544', 'Alami', 'Youssef', 'y.alami@univ.ma', 36),
(57, 'CNE0001', 'Alami', 'Sara', 'sara.alami@example.com', 54),
(58, 'CNE2026', 'ALAMI', 'Sara', 'sara.alami@test.ma', 55),
(59, 'CNE9911', 'EL ALAMI', 'Sara', 'sara.new@test.ma', 58),
(60, 'CNE1122', 'Bennani', 'Anas', 'anas.web@test.ma', 62),
(63, 'CNE1987', 'EL ALAMI', 'IMANE', 'alamiimane23@gmail.com', 73),
(64, 'CNE7689', 'Tazi', 'Adil', 'adil@example.com', 1),
(65, 'K657896354', 'Alamii', 'salma', 's.alamii@email.com', 1),
(66, 'R998566774', 'Elbenali', 'Fatiha', 'f.elbenali@email.com', 2);

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `id` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `libelle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`id`, `code`, `libelle`) VALUES
(1, 'DEV', 'Développement Informatique'),
(2, 'RESEAU', 'Réseaux et Systèmes'),
(4, 'MED', 'Médecine'),
(19, 'MED1925', 'Médecine'),
(22, 'MED5609', 'Médecine'),
(24, 'MED3722', 'Médecine'),
(26, 'MED3740', 'Médecine'),
(28, 'MED9875', 'Médecine'),
(30, 'MED3872', 'Médecine'),
(32, 'MED786', 'Médecine'),
(33, 'BIO', 'Biologie'),
(35, 'MATH', 'Mathematiques'),
(36, 'GEA', 'Gestion Entreprises'),
(54, 'SMI6', 'Informatique'),
(55, 'INFO_DEV', 'Développement Informatique'),
(58, 'DEV_2026', 'Développement Fullstack'),
(62, 'WEB_303', 'Web Architecture'),
(73, 'DEC_2026', 'Décimologie et evaluation'),
(76, 'GL', 'Génie Logiciel'),
(77, 'RT', 'Réseaux & Télécom'),
(78, 'IIA', 'Informatique Industrielle & Automatique');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cne_etu` (`cne`),
  ADD UNIQUE KEY `unique_email_etu` (`email`),
  ADD KEY `fk_etu_filiere` (`filiere_id`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_code_fil` (`code`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fk_etu_filiere` FOREIGN KEY (`filiere_id`) REFERENCES `filiere` (`id`) ON UPDATE CASCADE;
--
-- Base de données : `projet_pointage`
--
CREATE DATABASE IF NOT EXISTS `projet_pointage` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `projet_pointage`;

-- --------------------------------------------------------

--
-- Structure de la table `absences`
--

CREATE TABLE `absences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `type_absence` enum('Congé payé','Maladie','Congé maternité','Congé paternité','Congé sans solde','Formation','Accident du travail','Mission','P.E.A.S','Autre') NOT NULL,
  `motif` text DEFAULT NULL,
  `statut` enum('En attente','Approuvé','Refusé') NOT NULL DEFAULT 'En attente',
  `justificatif` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `absences`
--

INSERT INTO `absences` (`id`, `user_id`, `date_debut`, `date_fin`, `type_absence`, `motif`, `statut`, `justificatif`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-08-01', '2025-08-02', 'Congé payé', '', 'En attente', NULL, '2025-08-18 15:56:02', NULL),
(2, 2, '2025-08-01', '2025-08-30', 'Mission', 'vbhjnkmkjhrtyui', 'En attente', NULL, '2025-08-20 18:29:45', NULL),
(3, 2, '2025-08-20', '2025-08-20', 'Mission', '', 'En attente', NULL, '2025-08-25 10:27:47', NULL),
(4, 2, '2025-08-20', '2025-08-20', 'Accident du travail', '', 'En attente', NULL, '2025-08-25 10:30:31', NULL),
(5, 4, '2025-08-23', '2025-08-24', 'Formation', 'formation', 'En attente', NULL, '2025-08-27 15:31:44', NULL),
(6, 4, '2025-08-01', '2025-08-31', 'Mission', 'dfghjkvbn', 'En attente', NULL, '2025-08-27 15:32:25', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `pointages_jour`
--

CREATE TABLE `pointages_jour` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `date_jour` date NOT NULL,
  `entree_matin` time DEFAULT NULL,
  `sortie_matin` time DEFAULT NULL,
  `entree_soir` time DEFAULT NULL,
  `sortie_soir` time DEFAULT NULL,
  `total_minutes` int(11) NOT NULL DEFAULT 0,
  `heures_supp_minutes` int(11) NOT NULL DEFAULT 0,
  `absence_minutes` int(11) NOT NULL DEFAULT 0,
  `statut` enum('present','absent') NOT NULL DEFAULT 'absent',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pointages_jour`
--

INSERT INTO `pointages_jour` (`id`, `user_id`, `date_jour`, `entree_matin`, `sortie_matin`, `entree_soir`, `sortie_soir`, `total_minutes`, `heures_supp_minutes`, `absence_minutes`, `statut`, `created_at`, `updated_at`) VALUES
(1, 2, '2025-08-25', '11:25:30', '11:55:14', NULL, NULL, 30, 0, 0, 'present', '2025-08-25 10:25:30', '2025-08-25 10:55:14'),
(3, 3, '2025-08-26', '07:58:19', NULL, NULL, NULL, 0, 0, 0, 'present', '2025-08-26 06:58:19', '2025-08-26 06:58:19'),
(4, 4, '2025-08-26', NULL, '09:20:43', '08:42:02', NULL, 0, 0, 0, 'present', '2025-08-26 07:34:47', '2025-08-26 08:20:43'),
(7, 4, '2025-08-27', NULL, NULL, '15:34:15', '16:01:18', 27, 0, 0, 'present', '2025-08-27 14:34:15', '2025-08-27 15:01:18'),
(9, 4, '2025-11-05', '11:07:17', NULL, NULL, NULL, 0, 0, 0, 'present', '2025-11-05 10:07:17', '2025-11-05 10:07:17');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(190) NOT NULL,
  `matricule` varchar(50) NOT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('employe','admin') NOT NULL DEFAULT 'employe',
  `statut` enum('actif','inactif') NOT NULL DEFAULT 'actif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `email`, `matricule`, `telephone`, `password_hash`, `role`, `statut`, `created_at`, `updated_at`) VALUES
(1, 'jad', 'lakhal', 'lakhaljad17@gmail.com', 'jad12', '0654814567', '$2y$10$8MP0LgAARClX2qjNZV9BmukD4.VfbUoarVXxxiMYn90R1p3FQOSci', 'employe', 'actif', '2025-08-18 15:55:02', NULL),
(2, 'sdiri', 'abdlmalaik', 'lakhafghjmkmira17@gmail.com', 'sdiri12', '065481056', '$2y$10$i8MlrJPe4in4/jG/.CUv6.PzWUHgE8Pl7SFDV/1Kl7taRdIDQHDJS', 'employe', 'actif', '2025-08-20 18:27:31', NULL),
(3, 'hfsa', 'hsdfghjk', 'lsdalsalma18@gmail.com', 'haf12', '0654810008', '$2y$10$QplOncjH22QgGKZZMSl5Te95h0cJ6ocQDtMgmh0yZQ0gAv1ozInF6', 'employe', 'actif', '2025-08-25 11:17:26', NULL),
(4, 'ima', 'jad', 'lakdfghalma18@gmail.com', 'ima12', '0654810008', '$2y$10$elq/rNZgKtMB/pBOPLJIWOwHqLgs0xu3jAF5RkW6J15i4sGPiHlre', 'employe', 'actif', '2025-08-26 07:31:14', NULL),
(5, 'samira', 'lakhal', 'lakhalsamira17@gmail.com', 'sami12', '0654810008', '$2y$10$B9PTd7XtC21DNUAI0tDUAe1IqX8h4t.aQwgfjNwweukF0lGXH0fMi', 'employe', 'actif', '2025-08-26 07:39:13', NULL),
(6, 'lakhal', 'salma', 'lakhalsabnmh18@gmail.com', 'salma12', '0654810008', '$2y$10$RKQyd/96ty5fGhkleVCbdO/s6AJL1zElu9d6iKsl1OrKemNhroqiq', 'employe', 'actif', '2025-08-26 07:40:26', NULL),
(7, 'Lakhal', 'Mohammed', 'lavbnmalsalma18@gmail.com', 'moha12', '0654810008', '$2y$10$hMll1SNNc0sr/HyzE7667.cyyM3naaYd/7HD6SHpqqHXSaUHhtGcq', 'employe', 'actif', '2025-08-27 14:21:22', NULL);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_pointages_hhmm`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_pointages_hhmm` (
`id` bigint(20) unsigned
,`user_id` int(10) unsigned
,`date_jour` date
,`entree_matin` time
,`sortie_matin` time
,`entree_soir` time
,`sortie_soir` time
,`total_heures_hhmm` varchar(15)
,`heures_supp_hhmm` varchar(16)
,`statut` enum('present','absent')
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Structure de la vue `v_pointages_hhmm`
--
DROP TABLE IF EXISTS `v_pointages_hhmm`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pointages_hhmm`  AS SELECT `pj`.`id` AS `id`, `pj`.`user_id` AS `user_id`, `pj`.`date_jour` AS `date_jour`, `pj`.`entree_matin` AS `entree_matin`, `pj`.`sortie_matin` AS `sortie_matin`, `pj`.`entree_soir` AS `entree_soir`, `pj`.`sortie_soir` AS `sortie_soir`, concat(floor(`pj`.`total_minutes` / 60),'h',lpad(`pj`.`total_minutes` MOD 60,2,'0')) AS `total_heures_hhmm`, concat(case when `pj`.`heures_supp_minutes` < 0 then '-' else '' end,floor(abs(`pj`.`heures_supp_minutes`) / 60),'h',lpad(abs(`pj`.`heures_supp_minutes`) MOD 60,2,'0')) AS `heures_supp_hhmm`, `pj`.`statut` AS `statut`, `pj`.`created_at` AS `created_at`, `pj`.`updated_at` AS `updated_at` FROM `pointages_jour` AS `pj` ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_absences_user_dates` (`user_id`,`date_debut`,`date_fin`);

--
-- Index pour la table `pointages_jour`
--
ALTER TABLE `pointages_jour`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_pointage_unique` (`user_id`,`date_jour`),
  ADD UNIQUE KEY `uq_user_date` (`user_id`,`date_jour`),
  ADD KEY `idx_pointages_date` (`date_jour`),
  ADD KEY `idx_pointages_user` (`user_id`),
  ADD KEY `idx_user_date` (`user_id`,`date_jour`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_users_email` (`email`),
  ADD UNIQUE KEY `uk_users_matricule` (`matricule`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `absences`
--
ALTER TABLE `absences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `pointages_jour`
--
ALTER TABLE `pointages_jour`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `fk_absences_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `pointages_jour`
--
ALTER TABLE `pointages_jour`
  ADD CONSTRAINT `fk_pointages_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de données : `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `codeEt` int(11) NOT NULL,
  `NomEt` varchar(11) NOT NULL,
  `PrenomEt` varchar(12) NOT NULL,
  `Datenaiss` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `codeEval` int(11) NOT NULL,
  `note` float NOT NULL,
  `codeEt` int(11) NOT NULL,
  `codeMat` int(11) NOT NULL,
  `date_Evaluation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `codeMat` int(11) NOT NULL,
  `Libelle` varchar(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`codeEt`);

--
-- Index pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`codeEval`),
  ADD KEY `codeEt` (`codeEt`),
  ADD KEY `codeMat` (`codeMat`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`codeMat`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `codeEt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `codeEval` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `codeMat` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`codeEt`) REFERENCES `etudiant` (`codeEt`),
  ADD CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`codeMat`) REFERENCES `matiere` (`codeMat`);
--
-- Base de données : `universite`
--
CREATE DATABASE IF NOT EXISTS `universite` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `universite`;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `credits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `titre`, `code`, `credits`) VALUES
(1, 'Algorithmique', 'CS101', 6),
(2, 'Physique Quantique', 'PH200', 5),
(3, 'Bases de Données', 'BD300', 4),
(4, 'Art et Histoire', 'AH100', 3);

-- --------------------------------------------------------

--
-- Structure de la table `enseignement`
--

CREATE TABLE `enseignement` (
  `id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `professeur_id` int(11) DEFAULT NULL,
  `semestre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `enseignement`
--

INSERT INTO `enseignement` (`id`, `cours_id`, `professeur_id`, `semestre`) VALUES
(1, 1, 1, 'S1-2024'),
(2, 3, 1, 'S1-2024'),
(3, 2, 2, 'S2-2024');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `email`) VALUES
(1, 'Alice', 'alice@student.edu'),
(2, 'Bob', 'bob@student.edu'),
(3, 'Charlie', 'charlie@student.edu');

-- --------------------------------------------------------

--
-- Structure de la table `examen`
--

CREATE TABLE `examen` (
  `id` int(11) NOT NULL,
  `inscription_id` int(11) NOT NULL,
  `date_examen` date NOT NULL,
  `score` decimal(4,2) DEFAULT NULL,
  `commentaire` text DEFAULT NULL
) ;

--
-- Déchargement des données de la table `examen`
--

INSERT INTO `examen` (`id`, `inscription_id`, `date_examen`, `score`, `commentaire`) VALUES
(1, 1, '2025-12-21', 18.50, NULL),
(2, 2, '2025-12-21', 16.00, NULL),
(3, 3, '2025-12-21', 12.00, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `id` int(11) NOT NULL,
  `etudiant_id` int(11) NOT NULL,
  `enseignement_id` int(11) NOT NULL,
  `date_inscription` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `etudiant_id`, `enseignement_id`, `date_inscription`) VALUES
(1, 1, 1, '2024-09-01'),
(2, 1, 2, '2024-09-02'),
(3, 2, 1, '2024-09-05'),
(4, 3, 1, '2024-09-06');

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `departement` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id`, `nom`, `email`, `departement`) VALUES
(1, 'Turing Alan', 'alan@uni.edu', 'Informatique'),
(2, 'Curie Marie', 'marie@uni.edu', 'Physique');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_etudiant_charges`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vue_etudiant_charges` (
`nom` varchar(100)
,`nb_inscriptions` bigint(21)
,`total_credits` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_performances`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vue_performances` (
`id` int(11)
,`nom` varchar(100)
,`moyenne_score` decimal(8,6)
);

-- --------------------------------------------------------

--
-- Structure de la vue `vue_etudiant_charges`
--
DROP TABLE IF EXISTS `vue_etudiant_charges`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_etudiant_charges`  AS SELECT `e`.`nom` AS `nom`, count(`i`.`id`) AS `nb_inscriptions`, sum(`c`.`credits`) AS `total_credits` FROM (((`etudiant` `e` join `inscription` `i` on(`i`.`etudiant_id` = `e`.`id`)) join `enseignement` `ens` on(`ens`.`id` = `i`.`enseignement_id`)) join `cours` `c` on(`c`.`id` = `ens`.`cours_id`)) GROUP BY `e`.`id`, `e`.`nom` ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_performances`
--
DROP TABLE IF EXISTS `vue_performances`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_performances`  AS SELECT `e`.`id` AS `id`, `e`.`nom` AS `nom`, avg(`ex`.`score`) AS `moyenne_score` FROM ((`etudiant` `e` left join `inscription` `i` on(`i`.`etudiant_id` = `e`.`id`)) left join `examen` `ex` on(`ex`.`inscription_id` = `i`.`id`)) GROUP BY `e`.`id`, `e`.`nom` ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Index pour la table `enseignement`
--
ALTER TABLE `enseignement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cours_id` (`cours_id`),
  ADD KEY `professeur_id` (`professeur_id`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inscription_id` (`inscription_id`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `etudiant_id` (`etudiant_id`,`enseignement_id`),
  ADD KEY `enseignement_id` (`enseignement_id`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `enseignement`
--
ALTER TABLE `enseignement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `examen`
--
ALTER TABLE `examen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `enseignement`
--
ALTER TABLE `enseignement`
  ADD CONSTRAINT `enseignement_ibfk_1` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `enseignement_ibfk_2` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `examen`
--
ALTER TABLE `examen`
  ADD CONSTRAINT `examen_ibfk_1` FOREIGN KEY (`inscription_id`) REFERENCES `inscription` (`id`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`enseignement_id`) REFERENCES `enseignement` (`id`);
--
-- Base de données : `universite_dev`
--
CREATE DATABASE IF NOT EXISTS `universite_dev` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `universite_dev`;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` int(11) NOT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `titre`, `credits`) VALUES
(1, 'Bases de données', 4),
(2, 'Algorithmique', 6),
(3, 'Développement Web', 5);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `email`) VALUES
(1, 'Dupont', 'Alice', 'alice@univ.fr'),
(2, 'Martin', 'Bob', 'bob@univ.fr'),
(3, 'Kadir', 'Jamila', 'jamila@univ.fr');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `id` int(11) NOT NULL,
  `etudiant_id` int(11) DEFAULT NULL,
  `cours_id` int(11) DEFAULT NULL,
  `date_inscription` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `etudiant_id`, `cours_id`, `date_inscription`) VALUES
(1, 1, 1, '2024-09-01'),
(2, 1, 2, '2025-01-15'),
(3, 2, 1, '2025-02-01'),
(4, 3, 3, '2024-12-10');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etudiant_id` (`etudiant_id`),
  ADD KEY `cours_id` (`cours_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`);
--
-- Base de données : `universite_prod`
--
CREATE DATABASE IF NOT EXISTS `universite_prod` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `universite_prod`;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` int(11) NOT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `titre`, `credits`) VALUES
(1, 'Bases de donn├®es', 4),
(2, 'Algorithmique', 6),
(3, 'D├®veloppement Web', 5);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `email`) VALUES
(1, 'Dupont', 'Alice', 'alice@univ.fr'),
(2, 'Martin', 'Bob', 'bob@univ.fr'),
(3, 'Kadir', 'Jamila', 'jamila@univ.fr');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `id` int(11) NOT NULL,
  `etudiant_id` int(11) DEFAULT NULL,
  `cours_id` int(11) DEFAULT NULL,
  `date_inscription` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `etudiant_id`, `cours_id`, `date_inscription`) VALUES
(1, 1, 1, '2024-09-01'),
(2, 1, 2, '2025-01-15'),
(3, 2, 1, '2025-02-01'),
(4, 3, 3, '2024-12-10');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etudiant_id` (`etudiant_id`),
  ADD KEY `cours_id` (`cours_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

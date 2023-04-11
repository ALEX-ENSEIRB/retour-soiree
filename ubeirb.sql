-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 27 mars 2023 à 11:13
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ubeirb`
--

-- --------------------------------------------------------

--
-- Structure de la table `commentaires_personnes`
--

CREATE TABLE `commentaires_personnes` (
  `ID_COMMENTAIRE` int(6) NOT NULL,
  `NOTE` int(2) DEFAULT NULL,
  `CONTENU_COMMENTAIRE` varchar(255) DEFAULT NULL,
  `HEURE_COMMENTAIRE` time DEFAULT NULL,
  `NO_ETUDIANT_CIBLE` int(6) DEFAULT NULL,
  `NO_ETUDIANT_SOURCE` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaires_trajets`
--

CREATE TABLE `commentaires_trajets` (
  `ID_COMMENTAIRE` int(6) NOT NULL,
  `NOTE` int(2) DEFAULT NULL,
  `CONTENU_COMMENTAIRE` varchar(255) DEFAULT NULL,
  `HEURE_COMMENTAIRE` time DEFAULT NULL,
  `NO_ETUDIANT` int(6) DEFAULT NULL,
  `ID_TRAJET` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `NO_ETUDIANT` int(6) NOT NULL,
  `NOM_ETUDIANT` varchar(255) DEFAULT NULL,
  `PRENOM_ETUDIANT` varchar(255) DEFAULT NULL,
  `NOTEL_ETUDIANT` int(10) DEFAULT NULL,
  `MAIL_ETUDIANT` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

CREATE TABLE `evenements` (
  `ID_EVENT` int(6) NOT NULL,
  `TYPE_EVENT` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lieux`
--

CREATE TABLE `lieux` (
  `ID_LIEU` int(6) NOT NULL,
  `ADRESSE_LIEU` varchar(255) DEFAULT NULL,
  `ID_ZONE` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `ID_MESSAGE` int(6) NOT NULL,
  `CONTENU_MESSAGE` varchar(255) DEFAULT NULL,
  `HEURE_MESSAGE` time DEFAULT NULL,
  `NO_ETUDIANT` int(6) DEFAULT NULL,
  `ID_TRAJET` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participations`
--

CREATE TABLE `participations` (
  `NO_ETUDIANT` int(6) NOT NULL,
  `ID_TRAJET` int(6) NOT NULL,
  `GESTION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rattachement`
--

CREATE TABLE `rattachement` (
  `ID_TRAJET` int(6) NOT NULL,
  `ID_EVENT` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trajets`
--

CREATE TABLE `trajets` (
  `ID_TRAJET` int(6) NOT NULL,
  `DATE_TRAJET` date DEFAULT NULL,
  `HEURE_TRAJET` time DEFAULT NULL,
  `NB_PLACES` int(6) DEFAULT NULL,
  `ID_DEPART` int(6) DEFAULT NULL,
  `ID_ARRIVEE` int(6) DEFAULT NULL,
  `ID_EVENT` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `zones`
--

CREATE TABLE `zones` (
  `ID_ZONE` int(6) NOT NULL,
  `NOM_ZONE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commentaires_personnes`
--
ALTER TABLE `commentaires_personnes`
  ADD PRIMARY KEY (`ID_COMMENTAIRE`),
  ADD KEY `NO_ETUDIANT_CIBLE` (`NO_ETUDIANT_CIBLE`),
  ADD KEY `NO_ETUDIANT_SOURCE` (`NO_ETUDIANT_SOURCE`);

--
-- Index pour la table `commentaires_trajets`
--
ALTER TABLE `commentaires_trajets`
  ADD PRIMARY KEY (`ID_COMMENTAIRE`),
  ADD KEY `NO_ETUDIANT` (`NO_ETUDIANT`),
  ADD KEY `ID_TRAJET` (`ID_TRAJET`);

--
-- Index pour la table `etudiants`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`NO_ETUDIANT`);

--
-- Index pour la table `evenements`
--
ALTER TABLE `evenements`
  ADD PRIMARY KEY (`ID_EVENT`);

--
-- Index pour la table `lieux`
--
ALTER TABLE `lieux`
  ADD PRIMARY KEY (`ID_LIEU`),
  ADD KEY `ID_ZONE` (`ID_ZONE`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID_MESSAGE`),
  ADD KEY `NO_ETUDIANT` (`NO_ETUDIANT`),
  ADD KEY `ID_TRAJET` (`ID_TRAJET`);

--
-- Index pour la table `participations`
--
ALTER TABLE `participations`
  ADD PRIMARY KEY (`NO_ETUDIANT`,`ID_TRAJET`),
  ADD KEY `ID_TRAJET` (`ID_TRAJET`);

--
-- Index pour la table `rattachement`
--
ALTER TABLE `rattachement`
  ADD PRIMARY KEY (`ID_TRAJET`,`ID_EVENT`),
  ADD KEY `ID_EVENT` (`ID_EVENT`);

--
-- Index pour la table `trajets`
--
ALTER TABLE `trajets`
  ADD PRIMARY KEY (`ID_TRAJET`),
  ADD KEY `ID_DEPART` (`ID_DEPART`),
  ADD KEY `ID_ARRIVEE` (`ID_ARRIVEE`),
  ADD KEY `ID_EVENT` (`ID_EVENT`);

--
-- Index pour la table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`ID_ZONE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commentaires_personnes`
--
ALTER TABLE `commentaires_personnes`
  MODIFY `ID_COMMENTAIRE` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commentaires_trajets`
--
ALTER TABLE `commentaires_trajets`
  MODIFY `ID_COMMENTAIRE` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etudiants`
--
ALTER TABLE `users`
  MODIFY `NO_ETUDIANT` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evenements`
--
ALTER TABLE `evenements`
  MODIFY `ID_EVENT` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lieux`
--
ALTER TABLE `lieux`
  MODIFY `ID_LIEU` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `ID_MESSAGE` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `trajets`
--
ALTER TABLE `trajets`
  MODIFY `ID_TRAJET` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `zones`
--
ALTER TABLE `zones`
  MODIFY `ID_ZONE` int(6) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaires_personnes`
--
ALTER TABLE `commentaires_personnes`
  ADD CONSTRAINT `commentaires_personnes_ibfk_1` FOREIGN KEY (`NO_ETUDIANT_CIBLE`) REFERENCES `users` (`NO_ETUDIANT`),
  ADD CONSTRAINT `commentaires_personnes_ibfk_2` FOREIGN KEY (`NO_ETUDIANT_SOURCE`) REFERENCES `users` (`NO_ETUDIANT`);

--
-- Contraintes pour la table `commentaires_trajets`
--
ALTER TABLE `commentaires_trajets`
  ADD CONSTRAINT `commentaires_trajets_ibfk_1` FOREIGN KEY (`NO_ETUDIANT`) REFERENCES `users` (`NO_ETUDIANT`),
  ADD CONSTRAINT `commentaires_trajets_ibfk_2` FOREIGN KEY (`ID_TRAJET`) REFERENCES `trajets` (`ID_TRAJET`);

--
-- Contraintes pour la table `lieux`
--
ALTER TABLE `lieux`
  ADD CONSTRAINT `lieux_ibfk_1` FOREIGN KEY (`ID_ZONE`) REFERENCES `zones` (`ID_ZONE`);

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`NO_ETUDIANT`) REFERENCES `users` (`NO_ETUDIANT`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`ID_TRAJET`) REFERENCES `trajets` (`ID_TRAJET`);

--
-- Contraintes pour la table `participations`
--
ALTER TABLE `participations`
  ADD CONSTRAINT `participations_ibfk_1` FOREIGN KEY (`NO_ETUDIANT`) REFERENCES `users` (`NO_ETUDIANT`),
  ADD CONSTRAINT `participations_ibfk_2` FOREIGN KEY (`ID_TRAJET`) REFERENCES `trajets` (`ID_TRAJET`);

--
-- Contraintes pour la table `rattachement`
--
ALTER TABLE `rattachement`
  ADD CONSTRAINT `rattachement_ibfk_1` FOREIGN KEY (`ID_TRAJET`) REFERENCES `trajets` (`ID_TRAJET`),
  ADD CONSTRAINT `rattachement_ibfk_2` FOREIGN KEY (`ID_EVENT`) REFERENCES `evenements` (`ID_EVENT`);

--
-- Contraintes pour la table `trajets`
--
ALTER TABLE `trajets`
  ADD CONSTRAINT `trajets_ibfk_1` FOREIGN KEY (`ID_DEPART`) REFERENCES `lieux` (`ID_LIEU`),
  ADD CONSTRAINT `trajets_ibfk_2` FOREIGN KEY (`ID_ARRIVEE`) REFERENCES `lieux` (`ID_LIEU`),
  ADD CONSTRAINT `trajets_ibfk_3` FOREIGN KEY (`ID_EVENT`) REFERENCES `evenements` (`ID_EVENT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

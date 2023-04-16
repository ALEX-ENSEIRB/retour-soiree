SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `retour-soiree`
--

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

CREATE TABLE `evenements` (
  `ID_EVENT` int(6) NOT NULL,
  `TYPE_EVENT` varchar(255) DEFAULT NULL,
  `NOM_EVENT` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evenements`
--

INSERT INTO `evenements` (`ID_EVENT`, `TYPE_EVENT`, `NOM_EVENT`) VALUES
(1, 'Soiree', 'D2A');

-- --------------------------------------------------------

--
-- Structure de la table `lieux`
--

CREATE TABLE `lieux` (
  `ID_LIEU` int(6) NOT NULL,
  `ADRESSE_LIEU` varchar(255) DEFAULT NULL,
  `ID_ZONE` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `lieux`
--

INSERT INTO `lieux` (`ID_LIEU`, `ADRESSE_LIEU`, `ID_ZONE`) VALUES
(17, '17B rue aurelie ducros 33140 Villenave D\'ornon', 2),
(18, '4 rue gabriel fauré 33400 Talence', 1),
(19, '17b rue aurelie ducros 33140', 1),
(20, '17b rue aurelie ducros 33140', 2);

-- --------------------------------------------------------

--
-- Structure de la table `participations`
--

CREATE TABLE `participations` (
  `NO_ETUDIANT` int(6) NOT NULL,
  `ID_TRAJET` int(6) NOT NULL,
  `GESTION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `participations`
--

INSERT INTO `participations` (`NO_ETUDIANT`, `ID_TRAJET`, `GESTION`) VALUES
(11, 8, 'true'),
(19, 7, 'true');

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
  `DATE_TRAJET` datetime NOT NULL DEFAULT current_timestamp(),
  `NB_PLACES` int(6) DEFAULT NULL,
  `ID_DEPART` int(6) DEFAULT NULL,
  `ID_ARRIVEE` int(6) DEFAULT NULL,
  `ID_EVENT` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `trajets`
--

INSERT INTO `trajets` (`ID_TRAJET`, `DATE_TRAJET`, `NB_PLACES`, `ID_DEPART`, `ID_ARRIVEE`, `ID_EVENT`) VALUES
(7, '2023-04-15 15:43:11', 1, 17, 18, NULL),
(8, '2023-04-15 22:50:00', 3, 19, 20, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `NO_ETUDIANT` int(6) NOT NULL,
  `NOM_ETUDIANT` varchar(255) NOT NULL,
  `PRENOM_ETUDIANT` varchar(255) NOT NULL,
  `NOTEL_ETUDIANT` int(10) DEFAULT NULL,
  `MAIL_ETUDIANT` varchar(255) NOT NULL,
  `MOT_DE_PASSE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`NO_ETUDIANT`, `NOM_ETUDIANT`, `PRENOM_ETUDIANT`, `NOTEL_ETUDIANT`, `MAIL_ETUDIANT`, `MOT_DE_PASSE`) VALUES
(11, 'Delaveau', 'Alex', 659439048, 'alex@alex.com', '$2y$10$0Kr3z/n69hpbXZQhLqnEjOM5VWfkaKo4WOEINXhwzbIv9mUkcIBCK'),
(19, 'Delaveau', 'Alex', 659439048, 'alex2@alex.com', '$2y$10$oVoH3NcMyUXkxQ4wtiuTC.sOCSC0sXda6QVW8RtZ804DkJMTvGRgm'),
(29, '', '', 0, '', '$2y$10$.elzqQN3nDywGCQkdJlm6ux9bTBafYKwECUxO9wRFGTP8f6fjjqyu');

-- --------------------------------------------------------

--
-- Structure de la table `zones`
--

CREATE TABLE `zones` (
  `ID_ZONE` int(6) NOT NULL,
  `NOM_ZONE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `zones`
--

INSERT INTO `zones` (`ID_ZONE`, `NOM_ZONE`) VALUES
(1, 'VICTOIRE'),
(2, 'ENSEIRB'),
(3, 'PESSAC'),
(4, 'RIVE-DROITE'),
(5, 'BEGLES'),
(6, 'MERIGNAC'),
(7, 'VILLENAVE-DORNON'),
(8, 'GRADIGNAN'),
(9, 'AUTRES');

--
-- Index pour les tables déchargées
--

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
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`NO_ETUDIANT`),
  ADD UNIQUE KEY `MAIL_ETUDIANT` (`MAIL_ETUDIANT`);

--
-- Index pour la table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`ID_ZONE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `evenements`
--
ALTER TABLE `evenements`
  MODIFY `ID_EVENT` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `lieux`
--
ALTER TABLE `lieux`
  MODIFY `ID_LIEU` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `trajets`
--
ALTER TABLE `trajets`
  MODIFY `ID_TRAJET` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `NO_ETUDIANT` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `zones`
--
ALTER TABLE `zones`
  MODIFY `ID_ZONE` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `lieux`
--
ALTER TABLE `lieux`
  ADD CONSTRAINT `lieux_ibfk_1` FOREIGN KEY (`ID_ZONE`) REFERENCES `zones` (`ID_ZONE`);

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

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 14 mai 2023 à 15:01
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `efrei`
--

-- --------------------------------------------------------

--
-- Structure de la table `administration`
--

DROP TABLE IF EXISTS `administration`;
CREATE TABLE IF NOT EXISTS `administration` (
  `idAdministration` int NOT NULL AUTO_INCREMENT,
  `firstNameAdministration` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastNameAdministration` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idAdministration`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `administration`
--

INSERT INTO `administration` (`idAdministration`, `firstNameAdministration`, `lastNameAdministration`) VALUES
(1, 'Jean', 'JEAN');

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `idClasses` int NOT NULL AUTO_INCREMENT,
  `nameClasses` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idClasses`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classes`
--

INSERT INTO `classes` (`idClasses`, `nameClasses`) VALUES
(3, 'Master Big Data');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `idCours` int NOT NULL AUTO_INCREMENT,
  `idClasses` int NOT NULL,
  `idTeachers` int NOT NULL,
  `idSalles` int NOT NULL,
  `nameCours` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idCours`),
  KEY `idClasses` (`idClasses`),
  KEY `idTeachers` (`idTeachers`),
  KEY `idSalles` (`idSalles`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`idCours`, `idClasses`, `idTeachers`, `idSalles`, `nameCours`) VALUES
(5, 3, 2, 2, 'DEVOPS');

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `idNotes` int NOT NULL AUTO_INCREMENT,
  `idStudents` int NOT NULL,
  `idCours` int NOT NULL,
  `notes` int NOT NULL,
  PRIMARY KEY (`idNotes`),
  KEY `idStudents` (`idStudents`),
  KEY `idCours` (`idCours`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notes`
--

INSERT INTO `notes` (`idNotes`, `idStudents`, `idCours`, `notes`) VALUES
(7, 5, 5, 14);

-- --------------------------------------------------------

--
-- Structure de la table `salles`
--

DROP TABLE IF EXISTS `salles`;
CREATE TABLE IF NOT EXISTS `salles` (
  `idSalles` int NOT NULL AUTO_INCREMENT,
  `numeroSalle` int NOT NULL,
  PRIMARY KEY (`idSalles`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `salles`
--

INSERT INTO `salles` (`idSalles`, `numeroSalle`) VALUES
(1, 205),
(2, 364),
(3, 364);

-- --------------------------------------------------------

--
-- Structure de la table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `idStudents` int NOT NULL AUTO_INCREMENT,
  `firstNameStudents` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastNameStudents` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idClasses` int NOT NULL,
  PRIMARY KEY (`idStudents`),
  KEY `idClasses` (`idClasses`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `students`
--

INSERT INTO `students` (`idStudents`, `firstNameStudents`, `lastNameStudents`, `idClasses`) VALUES
(5, 'Michel', 'GUELIN', 3);

-- --------------------------------------------------------

--
-- Structure de la table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `idTeachers` int NOT NULL AUTO_INCREMENT,
  `firstNameTeachers` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastNameTeachers` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idTeachers`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `teachers`
--

INSERT INTO `teachers` (`idTeachers`, `firstNameTeachers`, `lastNameTeachers`) VALUES
(1, 'Melvin', 'Bissor'),
(2, 'Jean-Claude', 'VAN DANM'),
(3, 'Jean-Claude', 'VAN DANM');

-- --------------------------------------------------------

--
-- Structure de la table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
CREATE TABLE IF NOT EXISTS `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('2efa7e63-8107-4449-be26-0b6939872f7c', '263e91cbe4aa4636c329436c8d7ab1273c0c90775a34115f66efe0d55d26ca25', '2023-05-12 07:56:39.240', '20230512075637_add_cascade_on_students', NULL, NULL, '2023-05-12 07:56:37.260', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`idClasses`) REFERENCES `classes` (`idClasses`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cours_ibfk_2` FOREIGN KEY (`idTeachers`) REFERENCES `teachers` (`idTeachers`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cours_ibfk_3` FOREIGN KEY (`idSalles`) REFERENCES `salles` (`idSalles`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`idStudents`) REFERENCES `students` (`idStudents`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`idCours`) REFERENCES `cours` (`idCours`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`idClasses`) REFERENCES `classes` (`idClasses`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

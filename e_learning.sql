-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 23 jan. 2024 à 12:16
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e_learning`
--

-- --------------------------------------------------------

--
-- Structure de la table `calenderier`
--

CREATE TABLE `calenderier` (
  `id` int(11) NOT NULL,
  `formation_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `calenderier`
--

INSERT INTO `calenderier` (`id`, `formation_id`, `title`, `start`) VALUES
(1, 2, 'tache 1', '2022-06-23 22:18:33'),
(2, 2, 'tache 2', '2022-06-30 22:18:33'),
(3, 2, 'tache specifique', '2022-06-20 06:45:49'),
(4, 2, 'tache 5', '2022-06-23 00:00:00'),
(5, 2, 'tache 6', '2022-06-20 00:00:00'),
(6, 2, 'tache 7', '2022-06-20 00:00:00'),
(7, 1, 'aaaa', '2022-06-22 00:00:00'),
(8, 1, 'aaaa', '2022-07-05 00:00:00'),
(9, 1, 'ACAC', '2022-10-31 00:00:00'),
(10, 1, 'lire', '2023-01-23 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `name`, `description`, `short_description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Développement Web', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis</span>', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, atlas</span>', 'telechargement-2-629e62c1741b5.jpg', '2022-06-06 22:25:37', '2022-06-20 20:11:47'),
(2, 'intelligence artificiel', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis</span>', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elitim veniam, quis</span>', 'telechargement-1-629e64181bcca.png', '2022-06-06 22:31:20', '2022-06-06 22:31:20'),
(3, 'Développement mobile', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, qui&nbsp;</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, qui</span>', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, s</span>', 'telechargement-2-629e6443367cd.png', '2022-06-06 22:32:03', '2022-06-06 22:32:03'),
(4, 'Développement desktop', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">r adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis</span>', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetau</span>', 'about-3d-2x-rtx0nf-629e653abbc1b.png', '2022-06-06 22:36:10', '2022-06-06 22:36:10'),
(5, 'python', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">r adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis</span>', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">r adipisicing elit, sed do eiusmod tempor incididunt ut labore&nbsp;</span>', 'telechargement-2-629e655c0a68f.jpg', '2022-06-06 22:36:44', '2022-06-06 22:36:44'),
(6, 'intelligence artificiel', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do&nbsp;&nbsp;</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do&nbsp;</span>', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do&nbsp;</span>', 'images-2-629e66085fd5e.jpg', '2022-06-06 22:39:36', '2022-06-06 22:39:36'),
(7, 'Dev web', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor&nbsp;</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor</span>', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna&nbsp;</span>', 'online-conference-62a8c4dae77ea.png', '2022-06-14 19:26:50', '2022-06-14 19:26:50');

-- --------------------------------------------------------

--
-- Structure de la table `chapitre`
--

CREATE TABLE `chapitre` (
  `id` int(11) NOT NULL,
  `formation_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chapitre`
--

INSERT INTO `chapitre` (`id`, `formation_id`, `name`) VALUES
(1, 1, 'chapitre 1'),
(2, 1, 'chapitre 2'),
(3, 1, 'chapitre 3'),
(4, 1, 'chapitre 5'),
(5, 1, 'chapitre 6'),
(6, 1, 'chapitre 7'),
(7, 1, 'chaître 8'),
(8, 1, 'chapitre 9'),
(9, 1, 'chapitre 10'),
(10, 4, 'Chapitre 1'),
(11, 4, 'Chapitre 2'),
(12, 4, 'Chapitre 3'),
(13, 4, 'Chapitre 5'),
(14, 1, 'amin');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `status`) VALUES
(37, 'valide'),
(43, 'valide'),
(45, 'invalid');

-- --------------------------------------------------------

--
-- Structure de la table `commande_formation`
--

CREATE TABLE `commande_formation` (
  `commande_id` int(11) NOT NULL,
  `formation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande_formation`
--

INSERT INTO `commande_formation` (`commande_id`, `formation_id`) VALUES
(37, 1),
(43, 4),
(45, 4);

-- --------------------------------------------------------

--
-- Structure de la table `commande_user`
--

CREATE TABLE `commande_user` (
  `commande_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande_user`
--

INSERT INTO `commande_user` (`commande_id`, `user_id`) VALUES
(37, 6),
(43, 6),
(45, 6);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `writer_id` int(11) NOT NULL,
  `chapitre_id` int(11) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `writer_id`, `chapitre_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 'il y a un problème dans ce chapitrea123', '2022-06-20 06:17:16', '2022-12-11 00:52:58'),
(2, 6, 1, '<span style=\"font-size: 20px;\">il y a plusieurs&nbsp;soucis&nbsp;dans &nbsp;se chapitre</span>', '2022-06-20 06:18:48', '2022-06-27 13:37:40'),
(3, 6, 2, 'Il y a quelque soucis dans ce chapitre', '2022-06-23 01:37:14', '2022-06-23 01:37:14'),
(4, 6, 1, 'aaaa', '2022-10-30 13:07:51', '2022-10-30 13:07:51'),
(5, 6, 1, 'afdv', '2022-12-11 00:54:02', '2022-12-11 00:54:02'),
(6, 6, 1, '<ul><li><b>good cours</b><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAB2AAAAdgB+lymcgAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAXmSURBVHic7Zt5bBdVEMc/LYVSNSKtKWJQQJFUPAnG26hBTYzSSIwiGA+CxkSiBs+gBiGm1hhNxCPxD6KIUQzEIEHjwRFQYoxHPWqNQFWsQgWxtoiA0Bb/+L7Nbrf7++29WyrfZEJ/7+3sm5l9b+a9mQckh3qgCzhwENGaBPVnfR9QKDSVJmmBgxGHDJC3AHmjLKdx9wEtQAdQBYwKyPc88F3EMQcBM4GaiPy+COIEPwQmAYe5eCuB6UBjEd7tCch4r/u9JQm81MJ64IICfX8hBZc72iqQ4n8Ce01bKTALhdSBHu95HRkpCsqNDKMi8vui0Az4AxjnEGIW8K2jfz+wFrgKsD7IJLRMsgiFqRqgC7jY9B8PfOMjzGK0VsFjuqZBaS+BhWjaDQE+JZgDWg5MRsuhATjd0deBlkwUDEAfIUmde8BrBpxi+p726HPTl8BEYBkw1fBNd/R3AENjyviEe9w0w2Az0ITW/e0+z74JzAB2A2PN34vRbDiAvlq56dsYUZ4yUnSA0HsGLDXt52E7w/H0XNtdwMP0dH47gX+wfcFm/GdPn3SCL5n2yeb3RuyN12KjaK35XQLMpudpssr0NaSgdCYGeM20X+Zom2fahmCHxgpkELdgmcyANH2ApWADiumDgEeA1cBHyKmNAN4GJrh4vzA8hwPHmrZutHyaIspjjX9+RH5fuGdAF7bwCxztLSgcTQRa8f4ydxu+yY62HSiUxcGD7rHS3gc8DsxB3vdz4OgA72kCzkLb45VoCVn4hOiHocHIycYNpQXhtQ/4GzjB9J+Npn2xNbkJGG2er/V5ts87QYsakNMDGWMp+rrOZ7ahzZL1XA06QKVugKxOg18B1wI/m98VwDnoxNeBjNRp+i5BRvJaLhuAXyPKNwA414ydCvzyAbuAucDwAvynAosonFluww6NUTHb/d6sZoATneg4/D3a+g5DZ4YxAfhuBX6IKF8ZcsqXR+T3xaG0+MGIQwbIW4C8kaQBtiT4rqzwW5JRoAL7ABQVJwFvECxtVQ+8FXO8lpj8qcDraOymZpQh6pcYgTZNxQxQW5C7n2AuhZVfnZ9Y2aEC70xQJ3BafmJli6n0NsBzuUqUA9bR8zBUVfzx/ofx2KfDmWkMEDfHljZ+R6WwZlTV6c5XnH6Ivj4DksQRwI3AFJSL2AXJX5EZC9yBsrrd6HywHdiK8n5b0bS2pnbaKAEuREXW65ARQAmYWkjOANUo2zKD4LPqX2ScLY5/t6FaQSsy1k8oORoWI4GbgVuAEz36R3u0RcIg4H6gnfSyNm2oUrQEeJLCB66BwPXAKorfWN0HTEtC+VpU8MwyhbUHhUYnRgJ1FK4yOWkTqk8EwhhkdXf8rQHezVhxi24zMpSiitESdMcoCO8ibB9QFEcCT6E1egA5q0rTNy3EgElTvZGhDPggBF8bcoCecCYeSpG3rEOpaideAO5Czm4jdgUnKrqQw9uCpu4O5OwKUZt5BmA+dvHUD+uAmwhQTLkI3dEpZMX92Pd97ivyXDFqRNWhsUSLPuXAswHH2oeKIL4RqQR4GRUc/NJQK4ErkOdvRIqEQR3wqKutGjmxYahqa1Glx+/hwFEBxvkRLdXPggr2GMG/opWJuToEj0XtwCvIgTahqlDSfmIJ8mGhUCj54EXOXNx7KSgQlfYC94RV3IkbQgz2gOE5meyusxajzajSHBvO5EMx2old4Z2fs/LLCOYXAmECwf/T0wLDMxSFp6wV3wPcmYTSzjDRijyye6vphTOBd9CFh13AccjBrTXCVZNe3n4DcCWwIo2XH4OmeJCv8DEKnaX0DqFlaG9RD3yNjsZJfPnA29k4eCiEQFMCvrMabUcXoa11WMV3E9PLh0E5CndBBPuF8HduBqD7w/PQFXo/v/M+4TddsXGNj1BOmhNzrCoUhheiDVI7Om+8Clwa892xsAp/5TuBZ/ISMG2Mo/jRdw1wRm7SZYQX6a14C8q3/S9Qib3Rse75Dc5ToKThd17eY2g7cowrsG909gv8Bxv1vtxc5x2QAAAAAElFTkSuQmCC\">&nbsp;amin</li></ul>', '2023-01-15 22:05:28', '2023-01-15 22:06:05');

-- --------------------------------------------------------

--
-- Structure de la table `conversation`
--

CREATE TABLE `conversation` (
  `id` int(11) NOT NULL,
  `groupe_id` int(11) NOT NULL,
  `last_message_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220606182815', '2022-06-06 20:28:19', 1634),
('DoctrineMigrations\\Version20220614184249', '2022-06-14 20:43:01', 607),
('DoctrineMigrations\\Version20220621162309', '2022-06-21 18:23:37', 295),
('DoctrineMigrations\\Version20220718130840', '2022-07-18 15:09:00', 295),
('DoctrineMigrations\\Version20220718141713', '2022-07-18 16:17:25', 109),
('DoctrineMigrations\\Version20220720103346', '2022-07-20 12:34:04', 689),
('DoctrineMigrations\\Version20220720170107', '2022-07-20 19:01:19', 250);

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `chapitre_id` int(11) NOT NULL,
  `text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`id`, `chapitre_id`, `text`) VALUES
(1, 1, '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span><div><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\"><br></span></div><div><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\"><br></span></div><div><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\"><br></span></div>'),
(2, 2, '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span><div><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\"><br></span></div><div><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\"><br></span></div><div><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\"><br></span></div>'),
(3, 3, '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui offv</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui offv</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span>'),
(4, 4, '<p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In posuere felis nec tortor. Pellentesque faucibus. Ut accumsan ultricies elit. Maecenas at justo id velit placerat molestie. Donec dictum lectus non odio. Cras a ante vitae enim iaculis aliquam. Mauris nunc quam, venenatis nec, euismod sit amet, egestas placerat, est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras id elit. Integer quis urna. Ut ante enim, dapibus malesuada, fringilla eu, condimentum quis, tellus. Aenean porttitor eros vel dolor. Donec convallis pede venenatis nibh. Duis quam. Nam eget lacus. Aliquam erat volutpat. Quisque dignissim congue leo.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In iaculis facilisis massa. Etiam eu urna. Sed porta. Suspendisse quam leo, molestie sed, luctus quis, feugiat in, pede. Fusce tellus. Sed metus augue, convallis et, vehicula ut, pulvinar eu, ante. Integer orci tellus, tristique vitae, consequat nec, porta vel, lectus. Nulla sit amet diam. Duis non nunc. Nulla rhoncus dictum metus. Curabitur tristique mi condimentum orci. Phasellus pellentesque aliquam enim. Proin dui lectus, cursus eu, mattis laoreet, viverra sit amet, quam. Curabitur vel dolor ultricesLorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In posuere felis nec tortor. Pellentesque faucibus. Ut accumsan ultricies elit. Maecenas at justo id velit placerat molestie. Donec dictum lectus non odio. Cras a ante vitae enim iaculis aliquam. Mauris nunc quam, venenatis nec, euismod sit amet, egestas placerat, est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras id elit. Integer quis urna. Ut ante enim, dapibus malesuada, fringilla eu, condimentum quis, tellus. Aenean porttitor eros vel dolor. Donec convallis pede venenatis nibh. Duis quam. Nam eget lacus. Aliquam erat volutpat. Quisque dignissim congue leo.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In iaculis facilisis massa. Etiam eu urna. Sed porta. Suspendisse quam leo, molestie sed, luctus quis, feugiat in, pede. Fusce tellus. Sed metus augue, convallis et, vehicula ut, pulvinar eu, ante. Integer orci tellus, tristique vitae, consequat nec, porta vel, lectus. Nulla sit amet diam. Duis non nunc. Nulla rhoncus dictum metus. Curabitur tristique mi condimentum orci. Phasellus pellentesque aliquam enim. Proin dui lectus, cursus eu, mattis laoreet, viverra sit amet, quam. Curabitur vel dolor ultricesLorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In posuere felis nec tortor. Pellentesque faucibus. Ut accumsan ultricies elit. Maecenas at justo id velit placerat molestie. Donec dictum lectus non odio. Cras a ante vitae enim iaculis aliquam. Mauris nunc quam, venenatis nec, euismod sit amet, egestas placerat, est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras id elit. Integer quis urna. Ut ante enim, dapibus malesuada, fringilla eu, condimentum quis, tellus. Aenean porttitor eros vel dolor. Donec convallis pede venenatis nibh. Duis quam. Nam eget lacus. Aliquam erat volutpat. Quisque dignissim congue leo.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In iaculis facilisis massa. Etiam eu urna. Sed porta. Suspendisse quam leo, molestie sed, luctus quis, feugiat in, pede. Fusce tellus. Sed metus augue, convallis et, vehicula ut, pulvinar eu, ante. Integer orci tellus, tristique vitae, consequat nec, porta vel, lectus. Nulla sit amet diam. Duis non nunc. Nulla rhoncus dictum metus. Curabitur tristique mi condimentum orci. Phasellus pellentesque aliquam enim. Proin dui lectus, cursus eu, mattis laoreet, viverra sit amet, quam. Curabitur vel dolor ultricesLorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In posuere felis nec tortor. Pellentesque faucibus. Ut accumsan ultricies elit. Maecenas at justo id velit placerat molestie. Donec dictum lectus non odio. Cras a ante vitae enim iaculis aliquam. Mauris nunc quam, venenatis nec, euismod sit amet, egestas placerat, est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras id elit. Integer quis urna. Ut ante enim, dapibus malesuada, fringilla eu, condimentum quis, tellus. Aenean porttitor eros vel dolor. Donec convallis pede venenatis nibh. Duis quam. Nam eget lacus. Aliquam erat volutpat. Quisque dignissim congue leo.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In iaculis facilisis massa. Etiam eu urna. Sed porta. Suspendisse quam leo, molestie sed, luctus quis, feugiat in, pede. Fusce tellus. Sed metus augue, convallis et, vehicula ut, pulvinar eu, ante. Integer orci tellus, tristique vitae, consequat nec, porta vel, lectus. Nulla sit amet diam. Duis non nunc. Nulla rhoncus dictum metus. Curabitur tristique mi condimentum orci. Phasellus pellentesque aliquam enim. Proin dui lectus, cursus eu, mattis laoreet, viverra sit amet, quam. Curabitur vel dolor ultricesLorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In posuere felis nec tortor. Pellentesque faucibus. Ut accumsan ultricies elit. Maecenas at justo id velit placerat molestie. Donec dictum lectus non odio. Cras a ante vitae enim iaculis aliquam. Mauris nunc quam, venenatis nec, euismod sit amet, egestas placerat, est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras id elit. Integer quis urna. Ut ante enim, dapibus malesuada, fringilla eu, condimentum quis, tellus. Aenean porttitor eros vel dolor. Donec convallis pede venenatis nibh. Duis quam. Nam eget lacus. Aliquam erat volutpat. Quisque dignissim congue leo.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In iaculis facilisis massa. Etiam eu urna. Sed porta. Suspendisse quam leo, molestie sed, luctus quis, feugiat in, pede. Fusce tellus. Sed metus augue, convallis et, vehicula ut, pulvinar eu, ante. Integer orci tellus, tristique vitae, consequat nec, porta vel, lectus. Nulla sit amet diam. Duis non nunc. Nulla rhoncus dictum metus. Curabitur tristique mi condimentum orci. Phasellus pellentesque aliquam enim. Proin dui lectus, cursus eu, mattis laoreet, viverra sit amet, quam. Curabitur vel dolor ultrices</p>'),
(5, 6, '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus</span>'),
(6, 10, '<section class=\"snippet\" id=\"Section\" data-toggle-state=\"content\" style=\"padding: 20px; border-bottom: 1px solid rgba(0, 0, 0, 0.2); color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px;\"><div class=\"content\" style=\"border-radius: 0px 5px 5px; background-color: rgba(0, 0, 0, 0.1); padding: 20px;\"><section style=\"margin-bottom: 0px;\"><p>Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In posuere felis nec tortor. Pellentesque faucibus. Ut accumsan ultricies elit. Maecenas at justo id velit placerat molestie. Donec dictum lectus non odio. Cras a ante vitae enim iaculis aliquam. Mauris nunc quam, venenatis nec, euismod sit amet, egestas placerat, est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras id elit. Integer quis urna. Ut ante enim, dapibus malesuada, fringilla eu, condimentum quis, tellus. Aenean porttitor eros vel dolor. Donec convallis pede venenatis nibh. Duis quam. Nam eget lacus. Aliquam erat volutpat. Quisque dignissim congue leo.</p><p>Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In iaculis facilisis massa. Etiam eu urna. Sed porta. Suspendisse quam leo, molestie sed, luctus quis, feugiat in, pede. Fusce tellus. Sed metus augue, convallis et, vehicula ut, pulvinar eu, ante. Integer orci tellus, tristique vitae, consequat nec, porta vel, lectus. Nulla sit amet diam. Duis non nunc. Nulla rhoncus dictum metus. Curabitur tristique mi condimentum orci. Phasellus pellentesque aliquam enim. Proin dui lectus, cursus eu, mattis laoreet, viverra sit amet, quam. Curabitur vel dolor ultrices ipsum dictum tristique. Praesent vitae lacus. Ut velit enim, vestibulum non, fermentum nec, hendrerit quis, leo. Pellentesque rutrum malesuada neque.</p></section></div></section><section class=\"snippet\" id=\"List\" data-toggle-state=\"content\" style=\"padding: 20px; border-bottom: 1px solid rgba(0, 0, 0, 0.2); border-top: 1px solid rgba(255, 255, 255, 0.2); color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px;\"></section>'),
(7, 2, 'lorem ipsum&nbsp;'),
(8, 2, 'aaa'),
(9, 2, 'aaaa'),
(10, 14, 'amin <b><font face=\"Comic Sans MS\" size=\"7\">melliti</font></b>');

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `id` int(11) NOT NULL,
  `formation_id` int(11) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `comment` longtext DEFAULT NULL,
  `satrs` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`id`, `formation_id`, `candidat_id`, `comment`, `satrs`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 'meilleur formation', 3, '2022-06-10 00:13:00', '2023-01-15 22:07:03'),
(3, 4, 10, 'GOOD', 3, '2022-06-14 19:57:32', '2022-06-14 19:57:32'),
(5, 2, 7, 'meilleurs formation', 5, '2022-06-23 01:31:17', '2022-06-23 01:31:17'),
(6, 5, 6, 'meilleurs', 5, '2022-06-23 01:32:05', '2022-06-23 01:32:05');

-- --------------------------------------------------------

--
-- Structure de la table `evaluation_formateur`
--

CREATE TABLE `evaluation_formateur` (
  `id` int(11) NOT NULL,
  `formateur_id` int(11) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `evaluation_formateur`
--

INSERT INTO `evaluation_formateur` (`id`, `formateur_id`, `candidat_id`, `stars`, `comment`) VALUES
(1, 3, 6, 3, 'best Teacher'),
(2, 5, 9, 4, 'BEST'),
(3, 5, 9, 2, 'BEST'),
(4, 4, 6, 3, 'NICE'),
(5, 4, 10, 2, 'NICE'),
(6, 5, 7, 4, 'GOOOD'),
(7, 3, 6, 3, 'NICE'),
(8, 5, 6, 1, 'best Teacher'),
(9, 41, 6, 4, 'formateur');

-- --------------------------------------------------------

--
-- Structure de la table `fichier`
--

CREATE TABLE `fichier` (
  `id` int(11) NOT NULL,
  `chapitre_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fichier`
--

INSERT INTO `fichier` (`id`, `chapitre_id`, `title`, `description`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'SUPPORT COUR', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span>', 'Modele-RAPPORT-PFE-TI-2020-2021-1-62a26da5424ea.pdf', '2022-06-10 00:01:09', '2022-06-10 00:01:09'),
(2, 2, 'Support cours 2', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span>', 'DSI2103-1-62a26e1c700d6.pdf', '2022-06-10 00:03:08', '2022-06-10 00:03:08'),
(3, 3, 'Support cours 3', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui off</span>', 'Meilleur-Rapport-PFE-EPI-1-62a26e8f990be.pdf', '2022-06-10 00:05:03', '2022-06-10 00:05:03'),
(4, 4, 'fichier 1', '<p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In posuere felis nec tortor. Pellentesque faucibus. Ut accumsan ultricies elit. Maecenas at justo id velit placerat molestie. Donec dictum lectus non odio. Cras a ante vitae enim iaculis aliquam. Mauris nunc quam, venenatis nec, euismod sit amet, egestas placerat, est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras id elit. Integer quis urna. Ut ante enim, dapibus malesuada, fringilla eu, condimentum quis, tellus. Aenean porttitor eros vel dolor. Donec convallis pede venenatis nibh. Duis quam. Nam eget lacus. Aliquam erat volutpat. Quisque dignissim congue leo.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In iaculis facilisis massa. Etiam eu urna. Sed porta. Suspendisse quam leo, molestie sed, luctus quis, feugiat in, pede. Fusce tellus. Sed metus augue, convallis et, vehicula ut, pulvinar eu, ante. Integer orci tellus, tristique vitae, consequat nec, porta vel, lectus. Nulla sit amet diam. Duis non nunc. Nulla rhoncus dictum metus. Curabitur tristique mi condimentum orci. Phasellus pellentesque aliquam enim. Proin dui lectus, cursus eu, mattis laoreet, viverra sit amet, quam. Curabitur vel dolor ultrices</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In posuere felis nec tortor. Pellentesque faucibus. Ut accumsan ultricies elit. Maecenas at justo id velit placerat molestie. Donec dictum lectus non odio. Cras a ante vitae enim iaculis aliquam. Mauris nunc quam, venenatis nec, euismod sit amet, egestas placerat, est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras id elit. Integer quis urna. Ut ante enim, dapibus malesuada, fringilla eu, condimentum quis, tellus. Aenean porttitor eros vel dolor. Donec convallis pede venenatis nibh. Duis quam. Nam eget lacus. Aliquam erat volutpat. Quisque dignissim congue leo.</p><p style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In iaculis facilisis massa. Etiam eu urna. Sed porta. Suspendisse quam leo, molestie sed, luctus quis, feugiat in, pede. Fusce tellus. Sed metus augue, convallis et, vehicula ut, pulvinar eu, ante. Integer orci tellus, tristique vitae, consequat nec, porta vel, lectus. Nulla sit amet diam. Duis non nunc. Nulla rhoncus dictum metus. Curabitur tristique mi condimentum orci. Phasellus pellentesque aliquam enim. Proin dui lectus, cursus eu, mattis laoreet, viverra sit amet, quam. Curabitur vel dolor ultrices</p>', 'rapportPfe-62a8e9a761f01.docx', '2022-06-14 22:03:51', '2022-06-14 22:03:51'),
(5, 6, 'Diagramme de classe', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Mauris vel lacus vitae felis vestibulum volutpat. Etiam est nunc, venenatis in, tristique eu, imperdiet ac, nisl. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus</span>', 'classDiagram-62a8ea7915b68.pdf', '2022-06-14 22:07:21', '2022-06-14 22:07:21'),
(6, 10, 'Fichier source', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur&nbsp;&nbsp;</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur&nbsp;</span>', 'cv-francais-62ba04b9ab627.pdf', '2022-06-27 21:27:53', '2022-06-27 21:27:53');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `id` int(11) NOT NULL,
  `formateur_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `videos_meetings_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `type` varchar(10) NOT NULL,
  `date_start` varchar(255) NOT NULL,
  `session_is_oppen` tinyint(1) NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `periode` varchar(255) NOT NULL,
  `short_description` longtext DEFAULT NULL,
  `nb_chapter` int(11) DEFAULT NULL,
  `specification` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `formateur_id`, `categorie_id`, `videos_meetings_id`, `name`, `description`, `type`, `date_start`, `session_is_oppen`, `is_visible`, `price`, `image`, `periode`, `short_description`, `nb_chapter`, `specification`, `created_at`, `updated_at`) VALUES
(1, 5, 1, NULL, 'symfony', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis&nbsp;</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis</span>', 'enregistre', '2022-06-26', 1, 1, 250, 'telechargement-2-629e66dfa13f7.jpg', '30 heures', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis</span>', 25, '<ol><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis</span><br></li><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis<br></span></li><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis<br></span></li><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis<br></span></li></ol>', '2022-06-06 22:43:11', '2023-01-15 22:14:54'),
(2, 5, 1, NULL, 'Angular', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis&nbsp;</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis</span>', 'enregistre', '2022-06-30', 1, 1, 300, 'images-2-629e671f410c3.jpg', '30 heures', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis</span>', 25, '<ol><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis</span><br></li><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis<br></span></li><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis<br></span></li></ol>', '2022-06-06 22:44:15', '2022-06-06 22:44:15'),
(4, 5, 1, NULL, 'nodejs', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis&nbsp;</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis</span>', 'online', '2022-06-30', 1, 1, 300, 'images-3-629e6851cc47a.png', '30 heures', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis</span>', 20, '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis</span>', '2022-06-06 22:49:21', '2022-06-06 22:49:21'),
(5, 5, 2, NULL, 'BlockChain', 'Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor', 'online', '2021-09-20T14:09:76', 1, 1, 300, 'online-learning-62a8d33a69490.png', '20 heures', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">magna aliqua. Ut enim ad minim veniam, quis</span>', 30, NULL, '2022-06-14 20:28:10', '2022-06-14 20:28:10'),
(6, 5, 1, NULL, 'ReactJs', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididun</span><div><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididun</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\"><br></span></div><div><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididun</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\"><br></span></div>', 'enregistre', '2022-06-24', 1, 1, 30, 'telechargement-2-62b0f5a1a21c2.png', '30 heures', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididun</span>', 25, '<ul><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit</span></li><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">, sed do eiusmod tempor incididun</span></li><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing</span></li><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">&nbsp;elit, sed do eiusmod tempor incididun</span></li></ul>', '2022-06-21 00:33:05', '2022-06-21 00:33:05'),
(7, 4, 1, NULL, 'MongoDB', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididun&nbsp;</span><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididun</span>', 'online', '2022-06-26', 1, 1, 15, 'telechargement-2-62b0fa9db5619.png', '30 heures', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididun</span>', 20, '<ul><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\"><b><i>Lorem ipsum dolor sit amet, consectetaur adipisicing eli</i></b></span></li><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\"><b><i>Lorem ipsum dolor sit amet, consectetaur adipisicing eli</i></b></span></li><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\"><b><i>Lorem ipsum dolor sit amet, consectetaur adipisicing eli</i></b></span></li><li><span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\"><b><i>Lorem ipsum dolor sit amet, consectetaur adipisicing eli</i></b></span></li></ul>', '2022-06-21 00:54:21', '2022-06-21 00:54:21'),
(8, 41, 5, NULL, 'django', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor</span>', 'enregistre', '2022-06-09', 0, 0, 250, 'telechargementaxa-62b3f905ef7b7.jpg', '30 heures', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor</span>', 20, '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor</span>', '2022-06-23 07:24:21', '2022-06-23 07:24:21'),
(9, 3, 4, NULL, 'java', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor</span>', 'online', '2022-06-09', 0, 0, 300, 'telechargementaxa-62b3f99907a1a.jpg', '30 heures', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor</span>', 20, '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor</span>', '2022-06-23 07:26:49', '2022-06-23 07:26:49'),
(10, 3, 1, NULL, 'HTML & CSS', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor</span>', 'enregistre', '2022-06-02', 0, 0, 150, 'telechargementaxa-62b3fb869b809.jpg', '8', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor</span>', 20, '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor</span>', '2022-06-23 07:35:02', '2022-06-23 07:35:02');

-- --------------------------------------------------------

--
-- Structure de la table `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `formation_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `max_size` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `meeting_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `group`
--

INSERT INTO `group` (`id`, `formation_id`, `name`, `max_size`, `created_at`, `updated_at`, `meeting_id`) VALUES
(1, 1, 'Goupe A', 20, '2022-06-21 08:59:32', '2022-06-21 08:59:32', NULL),
(2, 4, 'Group B', 20, '2022-06-21 09:06:39', '2022-06-21 19:57:21', 2);

-- --------------------------------------------------------

--
-- Structure de la table `jwt_refresh_token`
--

CREATE TABLE `jwt_refresh_token` (
  `id` int(11) NOT NULL,
  `refresh_token` varchar(128) NOT NULL,
  `username` varchar(255) NOT NULL,
  `valid` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `emitter_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messsage`
--

CREATE TABLE `messsage` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ordre_id` int(11) NOT NULL,
  `is_payed` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

CREATE TABLE `participant` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `message_read_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `formation_id` int(11) NOT NULL,
  `question` longtext NOT NULL,
  `correct_answer` int(11) NOT NULL,
  `time_per_question` int(11) NOT NULL,
  `choise_one` longtext NOT NULL,
  `choise_two` longtext NOT NULL,
  `choise_three` longtext DEFAULT NULL,
  `choise_for` longtext DEFAULT NULL,
  `choise_five` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `quiz`
--

INSERT INTO `quiz` (`id`, `formation_id`, `question`, `correct_answer`, `time_per_question`, `choise_one`, `choise_two`, `choise_three`, `choise_for`, `choise_five`) VALUES
(1, 1, 'donner la resultat de l\'operation suivante : 2+2+2-8+3 ', 1, 30, '4', '1', '8', '', ''),
(2, 1, 'donner le résultat de l\'équation suivante : 8+3', 3, 30, '12', '15', '11', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `reagit`
--

CREATE TABLE `reagit` (
  `id` int(11) NOT NULL,
  `sondage_id` int(11) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `is_intersted` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reagit`
--

INSERT INTO `reagit` (`id`, `sondage_id`, `candidat_id`, `is_intersted`, `created_at`, `updated_at`) VALUES
(2, 1, 7, 1, '2022-06-14 19:28:13', '2022-06-14 19:28:13'),
(10, 1, 6, 1, '2022-06-20 11:43:30', '2022-06-20 11:43:30'),
(13, 2, 6, 1, '2022-12-11 00:55:51', '2022-12-11 00:55:51'),
(14, 3, 6, 1, '2023-01-15 22:09:00', '2023-01-15 22:09:00');

-- --------------------------------------------------------

--
-- Structure de la table `refresh_tokens`
--

CREATE TABLE `refresh_tokens` (
  `id` int(11) NOT NULL,
  `refresh_token` varchar(128) NOT NULL,
  `username` varchar(255) NOT NULL,
  `valid` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `refresh_tokens`
--

INSERT INTO `refresh_tokens` (`id`, `refresh_token`, `username`, `valid`) VALUES
(1, 'cc635c7e62af1fed0c480aa769f800ef93f29fb52d139b644c2f06f47a36efb50f6728cf5af1dd672bde83ae406eb02f0e26b491336b18a4a5e31182626df1b9', 'admin@test.com', '2022-07-06 22:21:57'),
(2, 'f8d297b09b7bea6bc0b58cae3ec66e5decb2899636e03811ed9b3bea3876bce5b29cb3fab0a9441fd85fb0935c7a8dfcb0c94bc04efb0986806ec39a983e1a42', 'zaidbouraoui995@gmail.com', '2022-07-06 22:50:32'),
(3, '7fb766fccd1d96a57147df1677b205db6009d37571f689666fd0cf500e251e5e32e58da6afd8a980893475f9b5d3c4c59b26285cb8c615f6d665f786a92a4068', 'zaidbouraoui995@gmail.com', '2022-07-07 00:15:08'),
(4, 'db37ebf823ebaec7b456f177eae132a2af88fe7d856d39492d4aef2e454de7d1f2a1b0a0e9593ac7f2b521a81297afa263d1767a3c8eb5c6ab7dec5084a6228a', 'zaidbouraoui995@gmail.com', '2022-07-07 03:04:21'),
(5, 'cb3bea9d391b2450806db202557037fc2b9f42cb4aa7fc62bd4a14afa53ac55d77bf50599dc9699c6815c24992850a4e1a2d5b022025f7581ac77e18a34bb706', 'admin@test.com', '2022-07-08 05:44:31'),
(6, '0bc8abf0679683a128b4ed926450637758cd950fe849855e9c4200541a5b3881cfdd60199d99886be657ab229b2e68174bb93434be4cab39e6f636cfde0deea1', 'admin@test.com', '2022-07-08 05:44:54'),
(7, 'b632c53e0b2f769bcfc06a51b95b9d61ff2d804a8c03fa3c75478e2377511df55a5a2f0333ed50909f225ece867797941f1e8b5334ad5cc36e312e09a687fec6', 'admin@test.com', '2022-07-08 05:47:14'),
(8, '95b2232be3d7fa7241ce3d3a2cabb4ec4513a480e03467a5151509cf43d5a9891517818f7273ada2a274d4a225eeb9bacad3c751a5f25f88e82b419e2fa95060', 'admin@test.com', '2022-07-08 05:50:39'),
(9, 'e062ce3f1986674290e6c2f1aadada69b6e934de721689da7bc33ac7c62ca3049c146f3b78f5942b1e1ff5f86bd35a84b18f51a9d02dfe9a88b48466c55cd15a', 'admin@test.com', '2022-07-08 05:52:52'),
(10, 'ad1e23edf3f3a5e8c01d061f702ae201988a850139efbfbc382311ac87a0d79e0073d75d87fb024c2c97654fea0873e1f7ed9422867bc49ebb7a8ec789c57a82', 'formateur1@test.com', '2022-07-09 23:51:51'),
(11, 'b229bd2d52b40c0b8c56593aa70d295f1302182548ba940db3d4c21400e2574641ca6ad7720f853b220e756560d2a8ce570a2691ecf91e733357700111417727', 'zaidbouraoui995@gmail.com', '2022-07-10 00:06:45'),
(12, 'c75743d9e3f1d7ca66478facfa7b04c879c36414adbce40bf25a2f1be96208d232d1e0d1b18201abdac86d9cdc69929acf45b3586c7ec3bffb0e4f8536ce2107', 'zaidbouraoui995@gmail.com', '2022-07-10 00:07:02'),
(13, '8712c2cba2f42439cac597d74bbde7a8aed8e4125a787c39cdfdc436f7b2372fdba5c962cbaaf35292ce3979e0aa5853b301d7bda99d18de9602b5989b408066', 'admin@test.com', '2022-07-10 00:23:03'),
(14, '9b1cef21e8588590711875b352e1a39c1332b735afce8fa3acab4a72fdafe894eb3d7d393a15164043c8d987259a4b769142148edc2a5af1d59e0a27ec582e89', 'zaidbouraoui995@gmail.com', '2022-07-10 00:26:59'),
(15, '5acd544351da2db9067c4e8d426fb936c1045d35d7644ec5191b98a29b17d49e5aa0b2bf70b93d1605093c2523989392e296e5f2bc856376fda753906fb0cb28', 'zaidbouraoui995@gmail.com', '2022-07-14 09:50:03'),
(16, '79315a3f90774236448bf424754fb1ce05940f2b88619e8cf530424ae6a1e9ccd791d3ecab7be4f940a26623247aedb29226fbe45f903976bb114dfb48a8aeae', 'zaidbouraoui995@gmail.com', '2022-07-14 10:46:29'),
(17, '4dcbb4989b72e3144aba41bf0a47fae6b8dd9c0e3501af9d3b90007d5bcd9072ac2969d3466e0655c40fc4c54630737d3c7acee59230adc77c93bc3b16312d4b', 'admin@test.com', '2022-07-14 18:53:48'),
(18, '8fc7c2135278513f504c8e73c8bd2fc70bb4deaf893e9b5563b6570eebb944b9b5e04c634be9bcdd44932b5fc4a29097b8b2eef25040ae99a7b73396cd7abb7a', 'zaidbouraoui995@gmail.com', '2022-07-14 19:50:51'),
(19, '711e9b1ca8d21df5cadeb3e41f0280cc2068b58e2d28aa56957a13fdb805dd4ef16217fcb0ae148aae16e34350a9c6ef03628cd95c92176934b331f76307d165', 'formateur1@test.com', '2022-07-14 19:52:52'),
(20, '26f80464cd2f766996bcf00f29ccfa1bb1a23f1d67becf2f1dc3ab0bc89bfaa39306539dcb11f37791339d6e7f7e3a2bbd424b1af8d2ec7a2575c43b0bd83ba5', 'admin@test.com', '2022-07-14 20:17:28'),
(21, '1b70b0080b4ff429de4d802629364677888aed9d87bdd68c921730695d99e50f42d11597f570ef757ab63498a88c580921c82fac51b1c5ba07a3de62c8350945', 'admin@test.com', '2022-07-14 21:20:02'),
(22, 'a24eec6384228402cebc75e631cece778a0979a8acf9e7b04e709d8ce6c2bc688b1513debc1e352fb5c903b71887ab965a572ac9af15e8494c3686aeb634e736', 'formateur2@test.com', '2022-07-14 21:58:59'),
(23, '0191c2b7f61bff466b1d6b4e21633c221922cacec2c0f670a32d438c8ba038092d8346e42842b7238d88832d0175e11d26ac60e89144a02494b5e492aefa4d75', 'admin@test.com', '2022-07-15 02:52:59'),
(24, '194db8726de85a0e435ee05dfcf6e039122a6a456a507b2cd13846cc9a9b24217c83ff3a3dcd1f7174bfa0907162e48099a9f243ad7796a31ee5456e23699530', 'formateur1@test.com', '2022-07-15 06:48:49'),
(25, '775dcbf37127fdfd86871b29b2285b490c1cae2f7cbcec17faf23b9a9c7ec6f254aae5024d52deb0e0111dfe8e2b7bc2d18bd59b3c9fdba78709ffe57f83d769', 'zaidbouraoui995@gmail.com', '2022-07-15 13:32:51'),
(26, '74fe6ed26ab7d0657b703ace92b39b98c6843b86de19ffdd06d44b1eade259def5daf1f68a49347b3ae5488f82c3e53a719061ece8035ca4f5c218ae8d3af81c', 'zaidbouraoui995@gmail.com', '2022-07-15 22:04:22'),
(27, 'c8dbce781f0da1df8fa930228a14bc1884f4afa1cf2dd3c1e2e19e363f7ce71eac2bfdc0241ba777bc7d8a11174be5445a8f6adf2cf5a31b49c57d6a30f59e53', 'zaidbouraoui995@gmail.com', '2022-07-15 22:04:25'),
(28, 'cbb47384f7c7f70cdf2c0a4a7ba814535c7d592e5c1b84f597b4e857a387abccecb3711d0dd10ce15f4e4a80cc82afff71d4f90f7f539d2bc4d7f93731996c36', 'zaidbouraoui995@gmail.com', '2022-07-15 22:04:51'),
(29, 'bbb6ed785d8f431cda1aac8aeb3bfa1e101393532b22992329cdc7825afdfcd301b27f5ef8c22ab9a2d17c20b1f1ca1301fff68f60a6f66a3246024794e1efcc', 'zaidbouraoui995@gmail.com', '2022-07-17 02:07:49'),
(30, 'b697cd401482855b2e3d136224adc4a2f111573767acde323a8a370b966d631f098e5838980243596b4a2b4629cb9fd4d3358b3f8829d81dc2ce616ab301172a', 'admin@test.com', '2022-07-17 09:49:34'),
(31, '994cbb093dcd13793b310faa5ea29e272ed5662c2c2e15e8ea83423455ec39b4853813872e020ba24eebb6df773e6230d0fb01b3b2e97057758b29355d0169be', 'zaidbouraoui995@gmail.com', '2022-07-17 12:14:40'),
(32, '2f33094dd44af8c298afd454403c61460059c9dd5464e918cbc082655a9000e966ac61682cdf575ce771b5dbfdc926804e569312a5b42a917b5b20afaba4fbe0', 'zaidbouraoui995@gmail.com', '2022-07-17 12:15:06'),
(33, 'b10f6482ac91ace10b21289b07e1d1c5f09353b3b1985e6f020c8db08e3262cdafadd78be918bcd245a30b833bdae4e4244640f55aaaa9cd7c75acda6a3c22b0', 'admin@test.com', '2022-07-17 12:19:30'),
(34, 'c4ac2e2ee7fdfa240cccae7146c4833fcd2875f5df4001086a6b97e53ee3cc5e242926b55517794106f846e26d27d54a5626ff9a1843302d3ee4d544f981bca9', 'formateur2@test.com', '2022-07-17 12:23:09'),
(35, '3402e3336cbecd4ac479daedc87d454b6d04c93a42e7993d8c8dece52521b68d16fd8d0cf9ff23cfae28affc55f7aae6bb381a98ab2af33e853d825449b383ab', 'formateur3@test.com', '2022-07-17 12:25:03'),
(36, '27ab0196affeee988ec36cdb0fab520272958795579307e010e3ecfeaaad9bd8b42897e63a689556e36b93fef517c4d597958522503e4bc0c799da0bb47084ef', 'zaidbouraoui995@gmail.com', '2022-07-20 05:57:13'),
(37, 'b68cab406b5d7de1cc8489689b5e19d9550a6621a2a57a4f494d1e3e2922ddf10643868a8fe50a6c62360d4118c90d88027c9c673ec58cd7b8c9e0145e4a0902', 'formateur3@test.com', '2022-07-20 06:31:59'),
(38, 'bf8d8db4f8750bd376382fd76a9f4ef16f2caf696cdb3a140222aa55f18f2551150a4d900a37e7158ac5bd2929c3168394502901adb18682c58bae8da304692c', 'formateur2@test.com', '2022-07-20 06:32:00'),
(39, 'c73d9e078999c201e3e59cfc295448ee73d0440ab9ebd06997cd4ca19ae52d762e89225826189206c8f1e5f6b79cfc09a1f376ca9fa4189214ee5238c58d1c04', 'formateur2@test.com', '2022-07-20 06:32:01'),
(40, '9015e21493e83c706f1feb0044b71ada4421ddb424b31ecb9cd5268f37228d440e7b576365969f63fe3b7fe40e7022c5ac81afc0538f081f17d0397fd9183454', 'formateur3@test.com', '2022-07-20 06:32:53'),
(41, 'e3c635769d3cecf242de87c75fd8fd4eb276f1bb2033961e2a82c2826eea08167efda61380ae36fe59d22ad5999702665ee1998f0172471ad175d908015145c9', 'formateur3@test.com', '2022-07-20 06:33:07'),
(42, '880e1c50f6e7d7e89d53c35db8c8aaa08d68988a1280a98a417d267ada8404d05fab5ed94d4e0c2c81109e409772842e6bb3064d99192a89f6b8a25dcd101cfa', 'formateur3@test.com', '2022-07-20 06:34:22'),
(43, '347c8ddfac5e8f5966a2dcd559444a479e367def26f88ba09e4b14f96c8a96378e4ac9610ce62ebd8c63e12e1f12b26df57e8339e9767e36de9d6043e62456ed', 'admin@test.com', '2022-07-20 06:54:59'),
(44, '5d2625162e37263f23bea69ba2bcf69d5636598ec2f8abf6400086795e94f45ef1b63cef45628af868fceefc07c258557c612ca94877f99f820dfc0991a224a3', 'zaidbouraoui995@gmail.com', '2022-07-20 08:24:23'),
(45, '09c807bdf064d8b6ce57e48f3bed6e66aa3d5ded3a22e1ca3a59a4c61c3d31896caf944ddda6bba276ad2d0eee50bca5d2fe66e338c8aee1bebf5f59c05e331c', 'zaidbouraoui995@gmail.com', '2022-07-20 11:17:23'),
(46, '2b583a5b66d73f01bbdfac3393d21fabadaeab7b55d55fa27bb68452b17a44ab3474d1f1e7d8669deb1fd7b35af38e42c2e3bbd75cdc6fe8b4053ed1acf8bdf5', 'ahmeed1@gmail.com', '2022-07-20 13:06:43'),
(47, 'b93cf504820aba61851273ff8bbdb242d0ce89700a9c49f2c8ff407ea34bb1e427e35825749929c4dd461a5d752ce47f0599f58b31b3dbc5668b035da2768e08', 'zaydqs@gmail.com', '2022-07-20 13:27:27'),
(48, '9965355291d8b5b2827b3d54afe7e3df1c283ab3d7d141bf5887fa083ec2dab9f64925678a7dc26c62595d33f069d6c19eae51606ddd8a4a21420228c8b20b52', 'zaidbouraoui995@gmail.com', '2022-07-20 16:21:21'),
(49, 'f861bcc03edcb5c94aa983f7ad777af80eae51a260fe409fb271b7c24a438ad25329f9a7f3d3f786751f65192ab1c7ec4d25fe0ed059eace5c87c921d06d4056', 'zaidbouraoui995@gmail.com', '2022-07-20 16:22:01'),
(50, '8d97663d0bbf21ec4d1de00f0101c79fdd3108d2f395109588dd04aca72c36d99579bd5f042100866701895e1e003538f0a58e904f29b0ad084592a66785d2a9', 'zaidbouraoui995@gmail.com', '2022-07-20 16:34:53'),
(51, 'f422297e8ea60a973dffe049fb2b6e4ce7cea2e9d74dffeae438e3787ec9e9f800a95216970c3a289ff090b468d1eacc247eae8533fd4e7794be61a56bf0bd58', 'zaidbouraoui995@gmail.com', '2022-07-20 16:38:03'),
(52, 'f37b2d367f41fa031be2172d2a2657f5b8326c06c9f63491af871cf4c9a1ab59c2397ab2e207dccfaf99ac45f994104e012422b08630585cc1024f9cf0855f75', 'zaidbouraoui995@gmail.com', '2022-07-20 16:42:50'),
(53, 'ea5cf5d18336ea9030bd3a8270e54899b255085c58228c1322fa28649532e7017ed30ad938fa76925c19d92e75fe6d9cb6a28391eb17ceed7769f4367bd2c238', 'zaidbouraoui995@gmail.com', '2022-07-20 16:44:02'),
(54, '2dc5e8785f1ffb697f5dfd638f0b6bfaeebfcb625d1b2d2a6a45785e089dfd1e50a65c7131c0e10498ea80cc11570c104efb2d08b4cba7e90b686a746f5de81e', 'zaidbouraoui995@gmail.com', '2022-07-20 16:45:54'),
(55, 'b36dbb0e8e5289b407e7efc8c33b9688248fdb376e76d8769e9840275793765c1ef4c1aa32b741c047c5c49d76f0a6333b103fb951c0a2e6966668af1db777b4', 'zaidbouraoui995@gmail.com', '2022-07-20 16:47:32'),
(56, '50c592d13f1332b3b9e773924dd55972e082c00ce2bfef8277d8fa801d738945de94caa812fd24dcf50ee80c10065b247a8c9e6a1d81e2e14627be6233e50c5d', 'zaidbouraoui995@gmail.com', '2022-07-20 16:48:18'),
(57, '444cb91b5b50b92388b4ba725e6c7aecd2dd69509790e887defe3c10f504909e05e25dcd94d9e5a99a33799d0869efcd1d9158f78c3e05e156d0489dedc547ea', 'zaidbouraoui995@gmail.com', '2022-07-20 16:51:43'),
(58, '973afeeb95e2968c25472a5f63405aebcccff4cb1fbe70fae321f2faa7129dc7f5a19c253124700d0c525709539c8cbbeed48800cadbf1a417dc2b5e4e59a0ee', 'zaidbouraoui995@gmail.com', '2022-07-20 16:52:52'),
(59, '9d9c2595d774c49a442cdaef518f3ee9236ff4d8fc69917f91ceb642b440f2f9588c3cf94450bc5907656110922e583275a44e5e8a64f100cf08c5bc32a868b1', 'zaidbouraoui995@gmail.com', '2022-07-20 16:54:16'),
(60, 'aef70fe838e46d2f268c1fba9ea68bf7dcee067e72dde40d806bfca4b33773d151162bae94da22efc7a30144d757a24353e8b8c116614cd441f786ecd4c391f4', 'zaidbouraoui995@gmail.com', '2022-07-20 16:59:01'),
(61, 'e9b93d64032fd11849d39cfcdda7e8f2225baff2f2dc0d2d975b3b22129e9ab05642a4c376cae3b7a829f5180449c616dc5b2d63b766ea5792ea4c6d9cd00e6f', 'zaidbouraoui995@gmail.com', '2022-07-20 17:07:09'),
(62, '7fda78e0495d56b70d27b0c72537999810a73a86312d8ea8af7e15beeada88c00dbe93a8df375cc62c8c30bef0ca60e7abdd0e9f6391ccf33a457793071b27fd', 'zaidbouraoui995@gmail.com', '2022-07-20 17:17:21'),
(63, 'ab09f78129fd7222cd624806200fb3d022122dcfc1414190d9833d7b6d22c3237aa6141e9bd7d85dfb95293f5c7cb93ebf691557b4aa33dbd87c99c184c5c075', 'zaidbouraoui995@gmail.com', '2022-07-20 17:40:24'),
(64, '9c62586399fe1a91b7a80010f059bfe387cc3369d9db8f395dddea1f4381590a6d4a5fcb4524dd831dbdd93398692a10fb5d481958286cbeb29d3c79a61ac6c3', 'zaidbouraoui995@gmail.com', '2022-07-20 17:41:41'),
(65, 'ee42a9d112b35ca4ebbd5523a1b39429bb4e7ea8777d32cdc8555e5298ca8101f434e178b51a872465efffdb9aa604cb6fcd00faf33472fd586001d9a798d9ee', 'zaidbouraoui995@gmail.com', '2022-07-20 17:42:45'),
(66, '8d6288cdf827a90593ac5b2ca24be825cd1c8ceb5de8bd382ea9aab4a4b819ec527de34363e1a4b3f60813c5a56b96f63a4f4490b79ce567735c655e3be5d96a', 'zaidbouraoui995@gmail.com', '2022-07-20 17:46:56'),
(67, 'c270344ffe5e580983cda3f1c798ff98f444d651b09a162960f416836c77e79064c18daaeccccab2c028694b1f79284107eddbdcf721be0c0e10a778d0733a5d', 'zaidbouraoui995@gmail.com', '2022-07-20 17:53:19'),
(68, '16b1786aad11678380bda5699ca79db5ba873e59d7abb2e9da529d3aa120243f31b4b075f1bca31e49463360d3343de74ed837f2cbfdc10b695133069981a1ff', 'zaidbouraoui995@gmail.com', '2022-07-20 17:55:01'),
(69, 'bee9a991c604c3088b72a553519d092fdec4a9e7cfd23155460d3923ce620eca2c3bad0c7d5aeb9b57c67617141a21228a7dec089285246e34fdc689ec372007', 'zaidbouraoui995@gmail.com', '2022-07-20 17:56:10'),
(70, 'cf2dccc86e4b9b24abb07dd612f5058b14a6b78007ed975cc56decddef3ee20a792951d05696ca85be150e274586450fa01e14f62514d669472c6fdc6a0b6183', 'zaidbouraoui995@gmail.com', '2022-07-20 17:58:21'),
(71, 'a9edf9e38b2f3ba984ebf01391a5ad65531a1f37c08479bc17e1faa27c3eb3f16d135c8cd04c15cd09fc35c2ec99325ffbe6b3934555d2662cf3b54ea77a976b', 'zaidbouraoui995@gmail.com', '2022-07-20 17:58:47'),
(72, 'f2c5d27ad3620ff35a3a5228769d9ffdc27df9d4d47a55552c66886cfd639f4ffeff62275ca89a41cac7951192b64f6da2b2abb63e72b186122b827ed2a1b2fd', 'zaidbour@gmail.com', '2022-07-20 18:00:37'),
(73, 'f2db16d5c53bcd81afb65e8cc03ca7083b497b9b3da96d5f144e414249b76590a9ab1fd66087ea33b30c8ff9acef4580c2c39ae9247cf1ef4702f07bcd171f2a', 'jawher@test.com', '2022-07-20 18:01:02'),
(74, '57d3ccff1061cd49b3531ee39e558b16e989cdc0dce65c104a3aef6b5cd9b616e8dd9646e36eb961e617e6ea81deeb15a3b55ae5f12c0875d083f2d1b6720eb1', 'jawher@test.com', '2022-07-20 18:01:18'),
(75, 'e6b5ed207beff22de677cc8852b37af4716880194051fb701c68c85941b099b0085bf2c2937586366931cc8a8164d98e1347f9cb16eaca7a9043a8f979da697a', 'jawher@test.com', '2022-07-20 18:01:27'),
(76, '75fc357e51a53bf39020b2cadc19d222c23f36427f16f60acc8c5abdb31577fc03375696c00ef6bfd3fd1e0967612bf8145c1804abc671b163c8c681d8840a5a', 'hammed@test.com', '2022-07-20 18:02:50'),
(77, 'e6ce08f68d62549be8004dcebf4a1c1432012e8c083d75692f4e2d4b9626082162b890564cd7f1d7158101d101f09452d3b476f79ef6f3f4fbef17899fb279b6', 'zaidbouraoui995@gmail.com', '2022-07-20 18:03:11'),
(78, '20ee7e356ad315aa4b856abade6b9826f2458710acf458ee1eed74178d28f5286850d72dd7be984d3558c9c6aaf139ac9460dd231e7a74c4c138d0fed8cd2651', 'zaidbouraoui995@gmail.com', '2022-07-20 18:03:56'),
(79, 'a2f104363fe24574dd0e7c9a305bf5179565b7b2107112eb3cfae12c59ba5f486cab2adfe470ee94b2f434ace0b0595d2ad09382b7b473a64b86e7cb0d17bc59', 'zaidbouraoui995@gmail.com', '2022-07-20 18:04:27'),
(80, '1ee777438fc80b66cd4ba33b0a2a3100f2d52955e1b4f82251ef7fc4ace663c96dd5ca4058ccda41a10e78267a8236c604f66383875c6d1ed50300441a5c2b35', 'zaidbouraoui995@gmail.com', '2022-07-20 18:04:56'),
(81, '091af454c34e6fcdd2f37f169ccba8720c02785c0c5cd0ae5193bdc2089a2bfdb215db27a17da1e0b0e6b5e77ec98135ad8e45e6f76377c0c5c6a1927df2d64e', 'zaidbouraoui456@gmail.com', '2022-07-20 18:06:28'),
(82, 'ac4e89f7b91e3f0fe9d5455b458e5207f5ac219225dca6028dc369efcb9a7ac58aeb31314173d1168e285334d9f3ec4847f188ac40df4858c74fc247b977c77b', 'zaidbouraoui995@gmail.com', '2022-07-20 18:09:13'),
(83, '69dd68e7b0ebde73b36598339821e221a90d97d6786afac19f9e67a6a602946d007235c8a30d75df2a460c0ef38fda30bfef771d6114cea7ccdf2b488b2406de', 'zaidbouraoui456@gmail.com', '2022-07-20 18:09:28'),
(84, 'f5b4aef53d18197d3caf0ac0678b9609eccc38d834a74c65e543369c4a4b56a225d69d884b1076afbd157a0a1b0b3048867af8b65ab15727f9b9707967bec63a', 'zaidbouraoui995@gmail.com', '2022-07-20 18:10:38'),
(85, 'fa5b652b0e7a18148a5e4679e3cfe2ac52e77885fcf2a33924ab720ef7993cb7a51910a40c4df17a9465d11b0ad307c3aac65cb803fd06d69eab406a5f20aec4', 'zaidbouraoui456@gmail.com', '2022-07-20 18:11:45'),
(86, 'f99e74a9248c81d8395da9c5ace9f37b693cb48b38dfd28babc60d952d14cd70be440c31143b61e35185bb4a501feb18d1bec2a700c1f3c8d2c0529ad0d9931c', 'zaidbouraoui995@gmail.com', '2022-07-20 18:12:43'),
(87, 'fed1ce81e60ddc8133f3f7532a9163ddbc9f51bfc34ca8bf2d89646b85f2900a4f398a9ca0ce521b96629be1daa8f97d4672730d2e02242edb2b3e846ba03110', 'zaidbouraoui456@gmail.com', '2022-07-20 18:13:00'),
(88, 'de8756f3eed4177f0cc580d92e3ffbf294f797f11d0c12f737c4a2705970a4ea5ad8403ebe4037f5eff38a88e0374d95e179490c7e55d6b8fe7d5069f66e8ebd', 'zaidbouraoui456@gmail.com', '2022-07-20 18:14:43'),
(89, 'b4e6a89cfd15b90bbabc8f7c5088aa6dce5120a7b37f39482070107fec8d59d1c2f97dd1f6901596a70cf276789788ecc5a86b6e6a154d076c743fa79bbe5aec', 'zaidbouraoui456@gmail.com', '2022-07-20 18:16:58'),
(90, 'c940a54a7edb162458e7a787859cdc6604009a652962bc16552c5ab484ce0351577e97c414322ba8a200275c3e944da225c579333668d57555a07b56f081a897', 'zaidbouraoui456@gmail.com', '2022-07-20 18:18:04'),
(91, '883ac7b106ae37684f987676a2213d91636724e869e4e7fd09299fef59ed26f61941d532c9881fa0c90dc2f700895d048f36e3546dbe115b12f1f9b17e234813', 'zaidbouraoui995@gmail.com', '2022-07-20 18:29:27'),
(92, '69f559a96820dfbc5da7762773b684e6393b005f93ebad5389c038cd092598d8e838bd50ee892a91b96abc55d546e9f17cb60f3f38966c3678dfe18ef8453975', 'zaidbouraoui995@gmail.com', '2022-07-20 18:33:31'),
(93, '8570248dc527cbe3a58d7fcdd4f00042ac0fce2d1592603951bdda9563014527801cceab2c4670d34a1d7b6ed6d1b40ca9c21974ebde86c673fc9055ea533979', 'zaidbouraoui995@gmail.com', '2022-07-20 18:35:07'),
(94, '79dc2273b11b19488639d82b7b53849605dfe02f909c5b6902a61c5c90dfd2ad2d78531713d6063b5ed6d8cd7849fe8661cb36942d115bc998b485ebb48a06d4', 'zaidbouraoui995@gmail.com', '2022-07-20 18:35:51'),
(95, '262b88d5135bd7b49959bdaf90e2973318a576fb571f3acdfb92b9f55ba91afd7b49584d81f82c71e5279b5945e5e33cf475ba90bf7cc68d8727ee1356ad552c', 'zaidbouraoui995@gmail.com', '2022-07-20 18:36:59'),
(96, 'cc42199be2ef662aa0356646917a583f26bec40edd7131402eb9b5dfa9feec0413d8742ddaef8428cb1adb0128e5368070fcd3ff89d06f635f569462564e15c3', 'zaidbouraoui995@gmail.com', '2022-07-20 18:37:13'),
(97, '44ccde59a5569acf15d2de1d229ec2ab1383999286a8632738bba1ee1fe9adb68bf62a54592e9b8aea1e34108c8062612d449af35c050e13cb72461a99b62de9', 'zaidbouraoui456@gmail.com', '2022-07-20 18:39:09'),
(98, 'ecb673ceafe05a904bf0aa238c2e0ab3b572b404fae54a0fab74ec73f276dcfc9b3822ccd9bbcdbc2aee0b47afe173145f2214cdf0b07d36e2b1615bf0f7ebed', 'zaidbouraoui456@gmail.com', '2022-07-20 18:42:46'),
(99, '61aa6b1f4567342a559f2e17c17ddca587dd6d66d486b2223e50b6190180e0c32a08b110c4218d28c23843b3ff8b605f076739ef704799099404a027c5ae5a22', 'zaidbouraoui456@gmail.com', '2022-07-20 18:46:23'),
(100, 'a905e31c22c30f3166128e29c6f310184a38413c5946b8ceaea16a7f01291d9ded0afa040e1c3ef72c6ba7cb624400023ec4af3bd9fddd42c65c45c78c1cb35e', 'zaidbouraoui456@gmail.com', '2022-07-20 18:49:54'),
(101, 'bad9caf7721361dd9caf66a5eabe4a4cbee298867acea502d6511c1583964a4738d3e4cecfc1dc874d808ca385d15b8a448c0213418ed24de26b039dc729e7d6', 'zaidbouraoui456@gmail.com', '2022-07-20 18:52:00'),
(102, '9a7e41410ee8128258796359c3952e68bdec359df35a5e8166b180b9cf10d358266b5e28bc022aaf3d837d2003d7df79205c267d3a7c1481e31d3154e2e04e9b', 'admin@test.com', '2022-07-20 18:54:32'),
(103, '7f557a7eaa3a41dfbe037108c38bebeda337f77cac9c794d167217c94e5eaf4b7c4fdd1d8162cabf92b960ff186cb8efd55069280eba1cdd453439e807b9ade1', 'admin@test.com', '2022-07-20 18:55:19'),
(104, '0c9d26ab78e3128e0f5b79ae1c8102d20fc4d90482554e6163806620a640ad491573bed357c497a37b65d5f16947eb26b8547604d8035bc35d76e1082a2f6654', 'zaidbouraoui995@gmail.com', '2022-07-20 20:25:51'),
(105, '49f06b7c39ccad2a06e2a52d99daeb7facb7caa0b87527dac71c82dec905d1a97c7602bb79edf7bb442a37b7d0cc5540786532115ba24ee3e7e19c42fd86e293', 'zaidbr@gmail.com', '2022-07-20 20:28:01'),
(106, '811ecc31655adb4c6cd6ff4e1f3659f740a4a4c61feea87fd690ad10da37989a7209b7d94d28ac5cc92425ef096fd79b7a1689c77422309e41794a9429223b7b', 'zaidbr@gmail.com', '2022-07-20 20:32:56'),
(107, '03ba2fe9e8d0657ee84de190c0a9788a8475c5bd8bbdff2580fd8e9432e4aca98ea5671bda56f5c898d9bcf3eb3a390a87a39784a4be248eb7acb5186f471e89', 'zaidbouraoui995@gmail.com', '2022-07-20 20:35:35'),
(108, 'a7f1bb7ca436d2b0d617c68faf6ef5d688df38ad237478fc6aea2c9d82169af22f9de66ac18d85155824ee10fd048cfaa343afa3390c73d27063ae609afe6a3d', 'zaidbouraoui995@gmail.com', '2022-07-20 20:39:20'),
(109, '3bfb2fe100a4452014c6f3539e5157bd6e1ce2afb8debe07ab62e8c7cde76c01b937210334acf0a55c5d68ad0a3a7e12e012e98111e5843023ffdc76b3f176f5', 'zaidbr@gmail.com', '2022-07-20 20:39:48'),
(110, 'c00b255e5bcefb0324a47c5803c84909e4e1be23b78e35d5ebaea55579a1ce73fa431cf6c0839c4f704b57697a1f456902c17314094eb1338f5dd70cbacdc3d9', 'zaidbr@gmail.com', '2022-07-20 20:39:56'),
(111, '41bd07f8acbad1ba923454db2000095d2abff8c7025505d2b64b3f8e6cc23bd681521a20aea7a39278ad04b0f07bd135b2e58cb562e99db8d70507cd46adff83', 'zaidbr@gmail.com', '2022-07-20 20:41:04'),
(112, 'b212ad8445c523555c71c01ccb251740ad6d7775613d062e8ca4b34b8efd5257b1c89adf218facae78b8f05f4585108d10e3578f2c0f3c944d06bfb70fb65105', 'zaidbr@gmail.com', '2022-07-20 20:44:29'),
(113, '9846a10257706e2291ca618800dca3b7cbf914a4fe34f958f7af1ca16e16ded2ed6b7941261078b09589981b1f0c649502f2a3827343eea4b760c8178b6f9f11', 'zaidbr@gmail.com', '2022-07-20 20:45:25'),
(114, '2c96affb4b5193bd8ba7bd8bcc9a65953dadcfd913d2049436d4245a07fe9483007eaf02495552cccca30e3c73faa3a37a664be421f3f36cacbe570e7406435d', 'zaidbr@gmail.com', '2022-07-20 20:46:58'),
(115, 'b1f9539f88bb582924516d8944f14ab0f0dba4a8231152a01d873a24407d65e28f92bc8aea5febe5017a8c4029c7b2c8434a164059899acab628e161ff3a7d9e', 'zaidbr@gmail.com', '2022-07-20 20:48:45'),
(116, '98b04cbbf915781fd0ac9cbb52cb09aba0d2d73fb6359dd73e55b3043dac017f55d67cf774c3df6384b378cc1627b62029e75398508b4a688dec3bfb473f7011', 'zaidbr@gmail.com', '2022-07-20 20:51:02'),
(117, 'da890edefbd1180b78fb5bf5a47d2e5cbd405f704ed9b8fdcd5dc2855b046cc808073d00c074fb70ebbe82c4e8d6cb3903b770e3ffcf223340383f93d58fc32c', 'zaidbr@gmail.com', '2022-07-20 20:51:27'),
(118, 'aa2e1105d857c4b66cadb28745e8d701bcdb42376cecb8538f205638ec569572530519ea5ce3fa7ce905c18b98fc4f0d999072c75f589bdc45aae7f475ece880', 'zaidbouraoui995@gmail.com', '2022-07-20 21:01:17'),
(119, 'fe752ab1ba762ccf6a73dd39d83a5a9e3616a62f436263ac0b6a2f88f092ffeff5ce240ad46ca380af8e4b073a4a1bef030e3efb4500639a0ad8d66531b367d7', 'zaidbouraoui995@gmail.com', '2022-07-20 21:01:42'),
(120, '363f3d979c8104cb52bb62495039fc6bea928014cbee50d305c24d5ff293e55bf182cd6970435cdfd8d9cceaa96792f1a7eca648e34048a15e2efbc2571f8e28', 'zaidbr@gmail.com', '2022-07-20 21:02:00'),
(121, 'f8701e6ad8d1d28bcfbf1cdfbf236e78747d9a49cc1832be20ef0cb26395b738e245d81ee9c557a45f53e554f172cd8baa42681c0c55a04d045e36e24fc6a2af', 'zaidbr@gmail.com', '2022-07-20 21:06:09'),
(122, '31e56968c59a85ce6afe1387e1fc4d54ba3227a4bccd4354cd3b1489e933fc871d785a93b93417a6c014d13caf0e9f46ac6d51896f4bfbe22228da67eae5cccd', 'zaidbr@gmail.com', '2022-07-20 21:08:12'),
(123, '30549c7741b45c487586e5cd44434b4990d2d9e3ba415a5c92055381b43e6793d54b81c7ff14be13a84d74242a8877a37e01a0b3e584d35ba8c90aa31903b90b', 'zaidbouraoui995@gmail.com', '2022-07-20 22:04:47'),
(124, '6578bd5f7cb853f11e2b9bb3c11e17ff6b75d64637b8ebf96068056e97258866b98e48e7884b7e00a128178cbc37abcce7c0eb90f174c8733a76a2b834606017', 'zaidbouraoui995@gmail.com', '2022-07-20 22:51:56'),
(125, 'c9202204582e14ef21242faa3374e7bf7cb778770d3a215e90abc4c10609f62cd7de3d856a3d4d25be427ec8a0404239c373d2e2c3ddb7355f8569ef3f9d91c7', 'zaidbouraoui995@gmail.com', '2022-07-20 22:52:47'),
(126, 'bff3045305191e423d9668c839f907ddd25e4fc29d5c5cee6ca41e784cd0fa39ffa870cb9676240fb8584676b4a4487754d4b5bf033eea12ce3cbea5e70b9933', 'zaidbouraoui995@gmail.com', '2022-07-20 22:52:57'),
(127, '5c70a91a0beb0678db4e6c98cec192e88c6d140949e30cf6b65864841de0990aa2c1415fce88ca01473acf9efe806c0abf924dd28956cef79667baf7f6ae2513', 'admin@test.com', '2022-07-21 00:29:12'),
(128, '6b1b84512b66e59361656fef376879933711c0aab0ca00917479db42c7aeaee1448e174e008908006e7e6ed593b127479206fadde71e821986780d9b124bef05', 'admin@test.com', '2022-07-21 00:29:53'),
(129, '2d5403122aa36a74040d1a5f0f8725837199c77dd7b2a1e4c3742bf03647aad50feeb08e7b0eecb7a36d4b6314cbccd2080dc8fbc2ccdf3e0f656484f3e6cd06', 'admin@test.com', '2022-07-21 00:29:59'),
(130, '6661f17641fce88f47422a66359042129136749e990b178bb0527d864b86e3ee063435e5ae29d4111dc1321f8e7658bda56e6f16875b1bf3fb2616c07fe56c5a', 'admin@test.com', '2022-07-21 02:20:41'),
(131, '81f9598487bc41922fe33feada9753535ac63976aed2140916bde0122b0b53a5b278d8c21c65e76ac99c15d69f30af7af5f457063e38d667f7671f855f53ced9', 'admin@test.com', '2022-07-21 02:20:50'),
(132, '34033d78f2b4f3ab9771027d48009f1a4ca2be6439a7c6ee3c7455e5637b15fb7f71e45ded106733014fbd99097e6df5b3d975737dbd35e1fbfadad3301e2be1', 'admin@test.com', '2022-07-21 08:46:16'),
(133, '40f7d6876505abc465a12dd69bc07bc76525457b946b29d7c84695590f126573e6af668240ca6d0106207aa70d3799d6c4fd8722ab3141e74ed3e42317ff773a', 'admin@test.com', '2022-07-21 08:59:15'),
(134, '25b75683f9418268a8ec2d6e81ff05331909d09ee0a3597cc5b656f84b704ee5a4504fb5923d229536433cc3d91a1a34ea8ecc68eeaa3aee0b9c1aa83e279244', 'zaidbouraoui995@gmail.com', '2022-07-21 09:18:35'),
(135, '3ac6f1bc5d46bad968ce286757f4b2216cf7b663c72d194ca85ed61501c7643f74898d7a9d891eff43f33606e4fa57a602e9439ae0b3fdfc074529bad51b4bd3', 'zaidbouraoui995@gmail.com', '2022-07-21 09:18:40'),
(136, 'c5881fbc24b26ac9c5f75c3b6f5c1d7e9c60772bf263109d9bfd00d3a90e5b520fa50e09224f8be81c22e782714a4bdd775ee142007748879ba81855fcb457e6', 'zaidbouraoui995@gmail.com', '2022-07-21 11:14:02'),
(137, '3433ae1b28e2bfa65c425f65275dbba63772037262aa395dc6279c920044a646b5d5ff0e4bc15cf593c033c90e5e24c2a49ffca287769665e797cbb184a5fa8f', 'zaidbouraoui995@gmail.com', '2022-07-21 12:12:09'),
(138, '09a275a8876e2173ca7a0a10b4896850f8f61b11a54b571ec86f33db0d9c688b1d89ce576d34209bcbbc58fca147f53c764f36c0935d9096614f6857ca59d2ad', 'zaidbouraoui995@gmail.com', '2022-07-21 12:12:12'),
(139, '7656aac0b36790bc2df922e0ab8ff4ee1e02bcc3d8504c4e6db77c1d860862b09d1afb494c35e6e2843a51145ee3b4c3cf4d70d252a674e62891c5e681e79dc1', 'zaidbouraoui995@gmail.com', '2022-07-21 15:08:10'),
(140, 'a1519dcab32dc285f9cc0e38968d833ab1d21a9547f44b1db0e3ab8fde56de0d82ac6987069cdbe22b246d8a70b6fd0f1255735ad4e232e23a7e3dd56a6de9a3', 'zaidbouraoui995@gmail.com', '2022-07-21 15:08:14'),
(141, '0e9b2b8ae3627587f513d20b82424d68449fcd8cf404e08725328c9716b277da428498c666c2e0e5461664012bfd3bdb39ac1932453cde919362a542abecc0af', 'zaidbouraoui995@gmail.com', '2022-07-21 15:08:19'),
(142, 'f5eb5aebb3b3f3eb7656340a65fb4c561871d9a1d4652d65659667900cfb74c0f0bb7bb5e877520db90ede10646b8e67aa319d1ace32d4bc397eb7cb7b2fcb84', 'zaidbouraoui995@gmail.com', '2022-07-21 15:08:22'),
(143, 'e38f1273b19e187845fa2984d7594a93594c23d9c363d86d21a7f0c0517d9366ac6edf3a846e12a7c6cc2c1e1f5e603e372704bf46ed3cac49acb2e0bfb60c21', 'zaidbouraoui995@gmail.com', '2022-07-21 15:14:52'),
(144, 'dcb83669e9cf0367b69f02a11b32f588218b0514a1624482c84bcc9184e4ae2223daec51cb48bf0cc74a3ed0c2d9cea6de686f0213dfa879ed2460f4cf38a1d2', 'zaidbouraoui995@gmail.com', '2022-07-21 15:14:54'),
(145, 'b2c6e8e985dfb60571844621abfa71872ed2c84727dd7c128288c315df153edc3453338f90f85c6024aa665c30c8e3ecc0d513a3150c540fb0575c7a50cf30f1', 'zaidbouraoui995@gmail.com', '2022-07-21 15:38:04'),
(146, '5c71521aae57175a6795ba13fd5cd37a2dccc7b163dd5d2f7d87bb2b83d864e25703d0972540a8bb309071e385d5b32c1dd3af7dad65172c294355779d238caf', 'zaidbouraoui995@gmail.com', '2022-07-21 15:38:45'),
(147, '3e70c7c0b2c90d2096311a2a6113afbf02b79a427b8322a445fdcad123002810e797ceb11e1f7263121c5353272ba56b797bcef3574764d648aa82ecad1ea8ee', 'zaidbouraoui995@gmail.com', '2022-07-21 15:41:19'),
(148, '0ea36bcd1b0c16a8e5ed1eea866a2bd1dcac6f974f7071d35551d43d90727764b58a96cae2a024648da61ccb5da8cb8e30c923ae10ddb720139fa16b1e207dab', 'zaidbouraoui995@gmail.com', '2022-07-21 15:42:17'),
(149, '7015579e1031fd0f8f56b3a1a3ac8998fabf65e7b1798f2a96d8ed2072feb9b315e7a4a61c2a284797ff0036bac764580d113d27b956392133b094dcd8e3353c', 'zaidbouraoui995@gmail.com', '2022-07-21 15:43:32'),
(150, 'c542b12214c4ac9f8d44666c91500178c71ecaff34fddd3c01eafd384831bc6c2eb259e289caea31ccb6112c82f1c7ef1242e3ded812d142b53ccb2836c9900c', 'zaidbouraoui995@gmail.com', '2022-07-21 15:48:59'),
(151, 'b3e8ccbc873b2c217658ecdc7b48e70eb27fc870554397fd6e30553d53805f1e6d2c1ea4ca16ef29da406093048090d50b59936b74e9eaeb6494597a0d15ba13', 'zaidbouraoui995@gmail.com', '2022-07-21 16:09:03'),
(152, 'b560b1ed23c6534e0607bc62cf6af1ba72d00dfd5adb40235aca3a77f6d4b5ef2a1c5ea6b596c640e0bc844d24024bf68b0b69802238afa59ab80bab194f8d85', 'zaidbouraoui995@gmail.com', '2022-07-21 16:13:35'),
(153, 'eabb6d561572bcb0e03bace855e2b5ef65fd27d0ebc9f121e7f1feee25fcb6e0bc1bfec95de30986d522111cd67558d61212f8eaddaec51d0dd6996f86be55c0', 'zaidbouraoui995@gmail.com', '2022-07-21 16:47:40'),
(154, '5df2802f818c5e6c402c8a0a0f4d112c72917dfaed74ef5d4c9d2617242477638e88bbf677e3e0718493477ca2ab9614831c20b1b0b79ef08a5e451b69e8ddac', 'zaidbouraoui995@gmail.com', '2022-07-21 16:47:42'),
(155, '1c9b78a992e9f79de700128215c5a6f5a4fb8d8cb9843f0d0569e8ef3a78eb4cf14cd61f4bd5b81a493abb5aadebce326e711aa79a3778b5678b7fb801c5f49a', 'zaidbouraoui995@gmail.com', '2022-07-21 16:48:15'),
(156, '80aed191b7582867aadf4662c17f8259d0f9f486049c4d80c294de4888107d7518b85bfdfd027c316a429b0cb5174b0b32fa98680c8c5c8a3c299fc71a78d003', 'zaidbouraoui995@gmail.com', '2022-07-21 16:48:18'),
(157, '339bc94b5585eedde7cd3569bdd4a180ad1d8ad10af491922d7340b4ba9588d8711a3f534044857b9b74d8677e0de8a4dcf4f0822d77fa8b6d855bfa49cb1699', 'zaidbouraoui995@gmail.com', '2022-07-21 17:05:18'),
(158, '2f6cf83137dc6d1429c8b0bc1909b7dd10a1c39056ca95104ccde423f60def2e89da468f83b08e893d84dc6e08d80a37d3b112197973217e0ef7481bf65355ee', 'zaidbouraoui995@gmail.com', '2022-07-21 17:05:19'),
(159, 'a776138258b9c6c2411b0cd2e57eb9731a9fdb2595acb9c45d953d9254a79e636b1fe3f14954a0b5dde642b329694bf13cc20c8d2f8527d95bcea69b8a155573', 'formateur2@test.com', '2022-07-21 17:08:09'),
(160, 'b3c92f05be12a495b32da4c3ad53c30453cad98f0bd60c31fb3319bebb6317763313a0794b94b0b4b8eb791f5b08653cf59a533a357588adbd7163062f2b5984', 'formateur2@test.com', '2022-07-21 17:08:13'),
(161, '421b422309d2bcbb0a342451b1711d6e9526c674fb3db4a28a3df6cd2f9fc2eaff486ea37b8fd9d8f32f4da82baccd4916f8b69f16ad7aba51e11476f46ce1fd', 'formateur2@test.com', '2022-07-21 17:08:31'),
(162, '70ae17fd0206056f5a3a0eb651dd9b476b90cf95f7cf557a688262b3436d84c3ce2519142f54cbdc58e1d452e0ebab875f0b80ea3b169a213dc48693375349b3', 'formateur3@test.com', '2022-07-21 17:09:00'),
(163, 'e6660b117853c97fcca49713eaebbecf3199a4fe4dc85d474399dfc55b5f762270183fe954c9f9b2fbdc63fa819e31e5b91fc447f3f588c5a005e712d8b5892b', 'formateur3@test.com', '2022-07-21 17:09:14'),
(164, '7393d21dc3ee7a9499cbf57b9d226fd4ec9fb59724115e3765d9a4aac6d69caa7efc3ee88e2a413689b7bbfff086498d4b80a9edfa645a5d0c15c221beb69530', 'zaidbouraoui995@gmail.com', '2022-07-21 17:45:08'),
(165, '3fffa48a18466f70f680fbeaf2361d96b39c833a9c7b995aeda0238c4a53e428590068905747e6c0d2a1786919fa504d520dd6a398a0fa219588f466b2002242', 'zaidbouraoui995@gmail.com', '2022-07-21 17:45:11'),
(166, 'f72acf2d29321bc0c4f03153f496cd0d2508a58c7851cbadff8717dd64a22a53bd005ecaf642f12601ec2e92b3581c4d1245b2cd82ccac9f23d24f81f5226864', 'admin@test.com', '2022-07-21 18:30:16'),
(167, '6c21780f059a4b1ad6a2f26b86011845c8af92a6c6d42dd88a6fdf90baaebfaa5161fd9580d0c1e76efb266ac12a302f39c75806bc0ae559d468d8582d906ba5', 'admin@test.com', '2022-07-21 18:30:17'),
(168, '8319b1e83d122b75522fbc542b9a43bae0c85b7ba7b7ff0ef0bd420036503992543df04e62ceadc123b70317da2329f0ccb52cc2346ec6bef6435e0004900ead', 'zaidbouraoui995@gmail.com', '2022-07-21 19:39:01'),
(169, '544f46f9e5f5fe041213d684cbbad9aaad7dc3dc9d895e92196f293a9b3ca7f5ac871eae23da6d64045037063740f4f0012ba788bc296c7099d68010032934ef', 'admin@test.com', '2022-07-21 19:39:32'),
(170, '7e744c33569f27055cb043f6d33c6bfed0f4e5e2f68e408e4ef0ae67bbec80900946c092cb5f05b560672450352b8aecb6dc1c5581829101371c49cc0d057d81', 'zaidbouraoui995@gmail.com', '2022-07-22 10:35:48'),
(171, 'd10c4cdbe6dc3c88b80b936582ba3029f59dc25ad414b4cf8ab67aab9385e8236ebca9d50f86895444522a734fce0817b99880572c1b390e1ac3f2732bce7f14', 'admin@test.com', '2022-07-22 11:28:31'),
(172, '79e6fd04a138ac31a4c26c528731210f224a9f7c174d2b6a20427edc21ff0a3c9fba6ae1b51500b9967d445ac4e9fc2d0c5b8feebdbadac5f2ae662854f89bd8', 'admin@test.com', '2022-07-22 11:28:34'),
(173, 'a5a7bb1fdca72805b28e339e98b67bda9a95a7a6b3f3c56327c77c33dc39054d6cc7dad29c4b144f7df8bda95bf59ec84cfde5d0268e44b912a729338bceb830', 'formateur3@test.com', '2022-07-22 12:03:47'),
(174, '70acc9c1ce416fbbcb6225f4fc791d2b66262c4524f25d212f1cc555a9505da49ae51d6bf4874bf0e96f321152638bb94d8425a28d2e87a440202dae3953b573', 'zaidbouraoui995@gmail.com', '2022-07-23 00:31:54'),
(175, '0201beafb377a64c36a92b1bac55aa6387d8f07cf827055dfb83f517f372f494bdd541526476e934bb02cb7337370061279692178fa57dc6a8c4931395e66e4e', 'zaidbouraoui995@gmail.com', '2022-07-23 00:32:00'),
(176, '3adf525a5283f41952716abc2fd9bdbf6b01bd95c3c164a0c120eb81fccf8d2cbed2628332754bb7795df45c9acd44cd7c6b7208efd8d648e749fdac202a3303', 'formateur3@test.com', '2022-07-23 00:50:51'),
(177, 'da31cdbe481291207f8e0d1d8d5764a4659a9edf3fbeb23ec646073ba866c89e81a8b31bd38488b666c83c934a51a158a2cf9bcbd25570f8f5f5d05fa7492a46', 'formateur3@test.com', '2022-07-23 00:50:55'),
(178, '815ab8df3da51f90a929df1ad48db726b08d858cb1fbd9e894bf6675ec1d41f98de53e85b8a91a08e0f07bf78f6c8ead39c47f9f370741d63d25cb5a810de766', 'zaidbouraoui995@gmail.com', '2022-07-23 01:10:47'),
(179, 'b3abfa7708bf2e37951ebc856abd20ee25d230b8ddf2463db93471446a4eaeb28c99aabd8ad3b952705e8563a7ad165e5bfb7e01b72e8d73fa71221dcf12de6e', 'zaidbouraoui995@gmail.com', '2022-07-23 01:34:54'),
(180, '89a6060eee87c5c176f5db18da313c3d7e6a269d2fd9e9fb1293790afd68dd359ca981efd41272f0ff15cdff6d620a14946351e446027f5f6a65960f61713d3a', 'zaidbouraoui995@gmail.com', '2022-07-23 01:34:56'),
(181, '3256e92ccf3f6073c1c9a329384f637f399ac288ec6c55f6054935301a4b6840de0c9b6d3b288f7db5c96ec7d3085b6e9ec55e21ef83d9053a598c25ac7873e6', 'zaidbouraoui995@gmail.com', '2022-07-23 02:20:19'),
(182, 'eb9ebc4b042f8e019f17b7ec2c48166cd0472fca11bf26645d424ac34d8f157cefb4a5deff8384ee24dd3bbfb412e1e860f582e1af2980e9ab84c651bec0cdb2', 'zaidbouraoui995@gmail.com', '2022-07-23 02:20:20'),
(183, '1daf7f2eeb46dd50a928fad9fa5b81ecb946a0c95ccb5daef98ba4a007d9b8df867f96dab1690d20b53a027bab62da1e11385bb61ee16e6034425ca0bb6b4fe7', 'zaidbouraoui995@gmail.com', '2022-07-23 02:39:10'),
(184, '60393bca3f3b06680248e7680e4940bf5a37069f0619ce74f44b21c743bc759bdb82dbc282d103f49d8aebf146659ae35c05345972be07be0f04e901f7de7ee2', 'zaidbouraoui995@gmail.com', '2022-07-23 02:39:12'),
(185, '9ac3cfa09b560a14ae95368ce21ee3ddfc59e9ee25e9a0743fea65eac708c3fc3fca09ce034e6a8ce33edc3e78a11648ab7282440288d0a26583078f0c19e4b5', 'admin@test.com', '2022-07-23 06:51:37'),
(186, '13531f92880f65740ca3ae634be380dfb77eb2a700e3afb30c7510aac9bde5d43f81d3b3697f75b060d985b4cb1152de8cedddaf8d44d067b135a4210d0b07fa', 'formateur3@test.com', '2022-07-23 08:15:23'),
(187, 'adccfbdf9cd2369c3b4d20fe6d19d20008e7934dd7987812b88a5c2c869ada8ae780cde1687f1da5e18e3abaafa698c99c6f6fd17a18db8a151f28e10626820c', 'zaidbouraoui995@gmail.com', '2022-07-23 12:55:33'),
(188, '8412670e394d0d3807bb891b7dcd8d6337143aa204286502bfa5ae461320255173d68e436e03baf0e7f042aec737e3d14f8236be20ec9a86688b5a9430bc8bd8', 'zaidbouraoui995@gmail.com', '2022-07-23 12:55:38'),
(189, '5e5c6d8df35eb9cf9f75fa6027a149c7502ce5311a87c4b4780987abc0ba5b696df1d7e2218f940d3f5b27bd284159a9e88bf845f507af29cdb573cb32dfeba1', 'zaidbouraoui995@gmail.com', '2022-07-27 13:36:34'),
(190, '5a909c80c82bf4e3279993ce47d89d33c19c59772a57cae6abc16d35298daf655aa4c57d183c58f89b96f2ade94fab01f8e6f7b1cfbf8d5bf3d7cdda46a9c988', 'zaidbouraoui995@gmail.com', '2022-07-27 19:26:55'),
(191, 'd2472002109a69b2dce770144785119bb530096225b856cc7279b957fe275afc25de1a723c0017888a1874bcc90b3b77b89caf5c30b6fdb2ab5b8c387b4b7abb', 'zaidbouraoui995@gmail.com', '2022-07-27 19:26:56'),
(192, 'e63d30563923d68e993540490f2b6c195fa0b6cb38831616e53cdc940c14b140748c81a86b904b8ae9bca1450089758e62888b0b6cbadfc8e0186bba59402d54', 'zaidbouraoui995@gmail.com', '2022-07-27 19:28:27'),
(193, '46f3a9c53bb0ba6a88d3e20056d6f162ad51a43bfa285a6aeebc9090b81e41ec4ada45b289335272aba1ed757697cc6b85f78b0a91f59a7154cc068fa77a93d1', 'admin@test.com', '2022-07-27 20:42:58'),
(194, 'd486243d12977cd22523113ed836f0a76d09c7424aa5897f3fd53d5c5bf07010136f3213881dc72cfdede4cb0660f01a078cf658752430de6f59011f42e85f12', 'formateur3@test.com', '2022-07-27 20:43:44'),
(195, '3af0c0ded7cb4f9ca404808952137debe115210ddab5de586b2a3831cdb23df042be03e025a31364bce71d143bf40b4147ea3bc60363de3860d82591dd385990', 'formateur3@test.com', '2022-07-27 20:43:49'),
(196, 'aae8595e2b364c4193f73bc3df02e94a3cb376b9805d569a688378fc866eba319f247644cd12820beb398f08be6ac77ea5b07131912ba8c06cfe9b40ada56a86', 'zaidbouraoui995@gmail.com', '2022-07-27 21:31:21'),
(197, 'eb1e6a1e53283c07ebd019bdaf056d149f4546591229a369e3e79116f40ccb7c440c5e99460d6ba4a07c79de38a5d63e2a06d7e5f0a8fc3ed599853d38cae655', 'zaidbouraoui995@gmail.com', '2022-07-27 21:31:24'),
(198, '3716f40a3c6f92699aa9576af765b66268f471799f8f5dd09cc03a0bd7b9493807d1ecf5e553ab1585accead7b6d6d198dd31e702e755a1613ac2b2ba0925fa0', 'zaidbouraoui995@gmail.com', '2022-07-28 16:32:57'),
(199, '3161a4d3147353d2c221fae3e52f3313052598248841f374586def7d39b94e0b6286ffae2a73b5966246fb92ee17d681d0cf28c2737846c9a35ab5f35738f83f', 'zaidbouraoui995@gmail.com', '2022-07-28 16:47:24'),
(200, '69047b710c8e6e6cd6c0b6d37b490f071f33a79e72c9b40a63d16ff3858d1619e467cc0956d4822aa1703bc6d7d41b430705e96cfd695025d470a8b16ebdd1ad', 'zaidbouraoui995@gmail.com', '2022-07-28 17:56:36'),
(201, 'e96f04a6c2c7872faf491bf7560ef5fb1dc3c2e08696282447b5eab175fedc0c4b809c3fbe04340c9ba2e92da9040ca44fc321c71c6f19c1a6c1ea7ce7fa3ddc', 'zaidbouraoui995@gmail.com', '2022-07-28 17:56:39'),
(202, '3a0015022897c81497f96b0b76e89048f31e5b6f8122234ecfd0a7ac7d039979f4f3dbbb8c8dbf36023cc0671f805931ea6183f703e3f7dd0b6456f7691d491c', 'zaidbouraoui995@gmail.com', '2022-08-03 23:11:51'),
(203, 'ae42b37b63d5dcac492bab196fcd0dc93d550094fc4fe3f458e5ea091ec6c569fd80ab7c7809567534e294c43aa5945e5260983f94c9831dd3d2d931f190e23d', 'formateur3@test.com', '2022-08-03 23:17:15'),
(204, 'e02311817010afd5fa93eb9b0f724ae089a2794e7594c23b83258c19e445f66b888d95a1cf0df7f6c49a00d8ac83ff2a4ef94c0ba8fdde3dfb08abfc2f3a23f1', 'formateur3@test.com', '2022-08-03 23:17:20'),
(205, 'fb4d3a6d760e36232c8f6f7b1313a92ecbc93678deddb8974bb9a2379997b037fbd8c05b74a78e9fb99c058ce14b2562b51039586e0536c5fe3038b4ca9d8a01', 'admin@test.com', '2022-08-03 23:20:41'),
(206, 'edfa54ae67c601537db88a69995e48d6739c7b7a626329e5a2c0ddf4c13c37e4d863afd2c1b4c57fdffd30f6c8eed1e72c316f0ad442d98cc82a343fa0d400c6', 'admin@test.com', '2022-08-03 23:20:44'),
(207, '0539bcd3910c334de62731c898081ddd33120b06412d4dcec03e5655fba38d44f5f774f027d9b4418ee3cc7bf4f1c1d19904aa5e0ab6135d90a072b805355499', 'zaidbouraoui995@gmail.com', '2022-08-11 21:31:37'),
(208, '759fafa945f73da8fe3dc496a01c3cc89b7df3b815164f48c794c2867266fd345ab8650388ecd13202fb6b9b700059ff5c32172f6067e6ce43376fea847c3c55', 'zaidbouraoui995@gmail.com', '2022-08-11 21:31:42'),
(209, 'a9064a1f62915109a11c72a64da084565ed775f639cba5759e4758e4bf2da1527035210489f61b4f4b931f0a255e3887f4557880eb4eaa17be86efb1b7b39649', 'zaidbouraoui995@gmail.com', '2022-08-18 19:19:03'),
(210, '854bc69c91d4361a22805098941f8bf81ba56cab0633356b25a9ec2cb2ed9dd47e1107c28ab0ab95de1cd34b32324c5874070c35e9f9e0f98de893726286c5c0', 'formateur3@test.com', '2022-08-18 20:28:13'),
(211, '66aa83603788d39857c4c3760cdf318da600a2d4f35e65a22f8e18e61a8f0e33ec68304ce553c14c74693700b0221477223167b96093685bdb4e6c7aa231ce63', 'formateur3@test.com', '2022-08-18 20:29:53'),
(212, 'b997b37b7a2d7da1b9875ee79d1e9291b072b67699fb1843fe453411c2da810b2c1b5bd6b8547ea280d8570f3f75494dab72c9a0cc7977f7549f1ae3329edd8e', 'formateur3@test.com', '2022-08-18 20:29:56'),
(213, '12f52b26a190d78716629ad4976d4c97b6710a29d463eabf878354077370a9b31aa65ae5c09fa8df8b6ee877362af4b391d6fbc892a0be4e6fa68b837eacd6b4', 'formateur3@test.com', '2022-08-19 01:11:37'),
(214, '740faf29e6f416be276b682582068edb290ff2b1c3df52f2ed7a493adc2563e5cc2e8c2feafff7a239a42bbf541f45bc9b5ee4db8f3bb42b0c6e6e8bdbe06bde', 'formateur3@test.com', '2022-08-19 01:11:41'),
(215, '3bd977d27bbe95d48bbb2e6d1c29df1dbfd28fc5a1281724bf2e9b6282fd84e9fc460d31ab5edbabc432d0473a3f1380a782fa81151481eafa5d0050f66996df', 'zaidbouraoui995@gmail.com', '2022-08-19 12:35:11'),
(216, '23c89151dbc29efa035c2bc9f4fb3496edf80917dcad4c7b7747a700ef9ae7ef47900dde5cd291e553f0dc449d92874930c380681dc2cd9aca49b049baac7570', 'formateur3@test.com', '2022-08-19 12:41:09'),
(217, '176e20f4dbadaa36beebb140e28d4eea89f05a2b9a93558ca0cbd993f1399131b32abcf2926b6667aebf9724470353c477ce8deba3dbfd33550aec8408148619', 'formateur3@test.com', '2022-08-19 12:41:13'),
(218, '5ce0bbf6cc00220add9e6b6bde92c977a80a6b1b49689c845f8b614250656daa61bd1659fdb670b496e5b938a41060e1cdae03a55896fe46684bc31684928c2a', 'formateur3@test.com', '2022-08-19 18:29:13'),
(219, 'ebcaa3889d73d2ce147ec3caea3bb88818d11e67f30f6dc88456a47d5348c8d7ec3eae9b03cab06ad8a70f7ed6cbfd92b9f6b31961085581991c1a4f7578b53b', 'formateur3@test.com', '2022-08-19 18:29:30'),
(220, '94e3321f841005d0c0583ff791a8920ef6d58f95a3e4984d808a5d91db4b3d1be4e6a0e1da15ab3d41908dd673841d1b7e97d2b174e9ff20d1ee9dc37189fc42', 'zaidbouraoui995@gmail.com', '2022-08-19 18:38:12'),
(221, 'bd48e3b551f732412b8e312756f9d7190269886757879919e01fee24e734ff82b63e57bae91d6a62e358571b7838f9350f04e8d8b380e6b9e13060059d40ade3', 'formateur3@test.com', '2022-08-19 21:57:48'),
(222, '0798b9b971617fa13c788e6b31010ea2d88d1ef357c022f5b62c2f59dfdc5ca6821222d97d0e7eb2ff349c09f6fea71ac905f2cfeaec0e1eb1d613d84825e7a7', 'formateur3@test.com', '2022-08-19 21:57:51'),
(223, 'ec6bdc5b69c8ca14f1f1f78d8e1025d8f22bd6d37e99fb2f243057c60ed8d0fae5d4fce6601455070b05f553216e1a62e8c5dba54a7e3d4a4dcc52631b08c377', 'formateur3@test.com', '2022-08-22 16:39:35'),
(224, 'be6caabb9cf3fa7fac4be2824e6773eee826fbec177cd5f6ec1afbc5a3010eaef0b6c50d77c8188406e6701b79c45eb8284a0bd3eb0eace8361a98d511e4cacb', 'formateur3@test.com', '2022-08-22 16:39:39'),
(225, 'e159699bbf55f0b8f9a521ba2c61abeb1a61315e1135fef36d45d385de7aaa252abf4d8f8db095cad87ef2bdc3ac1395a52d83bc6a1a18a855c7c39deb0f39eb', 'formateur3@test.com', '2022-08-25 19:07:48'),
(226, 'f6a507f42c4a390f068188dbb1a3a4b071fa2b6598aa6cb10228662c1db8734bb8a97569e01a7fb849836b0d9685c98c610192d7d8ef9b2c2442e0e01e4da083', 'formateur3@test.com', '2022-08-25 19:07:51'),
(227, 'd92dfaeb687c7810b0eb370eaf3b459dcf411e256c673d970d2906086cd759dbb975a13cebad167b148dc0ec6deef101f38f079986841c80e53855c2542e8bd5', 'zaidbouraoui995@gmail.com', '2022-08-26 19:44:36'),
(228, '30c51360e970399eda5ffacd3a0c078f82ec2df84bdcb252285aba74d50d0c0bcf73b22da66d3feabdba79e5671a49e8393d4dbcb7e1c54297a12e08deca9385', 'zaidbouraoui995@gmail.com', '2022-08-26 19:45:20'),
(229, '468cc93f6ee864a24bce81455925135cbbddb1f8857e0aadcc76acd26f5ef3efd9efca7261dba49a9b16241ea320df77a0614b04aecaaff721aefe8397ffd2c7', 'zaidbouraoui995@gmail.com', '2022-08-31 12:41:27'),
(230, 'd874677f42c08c30b6d2468fecdd5bb989f425c65c6d303abd1195ea7f50a7ee5658ff1586e913c3cd9fb6d43875a44393610fa0646c25c96af88a42745b1317', 'zaidbouraoui995@gmail.com', '2022-08-31 18:36:43'),
(231, 'fbf9fa4fdcee5a9256b18016f703d351015f69b955c419ac3b17ae4cb558a8b30137f32f7f945c6c56a108ee3b598d43d7305976905637e4d4c4926084596d7a', 'zaidbouraoui995@gmail.com', '2022-09-06 19:07:18'),
(232, '1215173e010e655e253e433631d97aa24450a2df2c90704b8b5ebeffb7a914487d10184ef4d1f4df85e627f9bd8994818a5050209515451c513f7296277ce2ac', 'zaidbouraoui995@gmail.com', '2022-09-06 19:07:37'),
(233, 'ebeab3c20ec66e855c0e877a530142476068f5fc47791c7cc6772e0e86de195b6232fdc2245ca608ffc1e8b37ce17f21698670902a16e8be7347fe8cb04c7560', 'zaidbouraoui995@gmail.com', '2022-11-29 13:05:45'),
(234, '9dae35da0e27fc9f09ef2d4073eec5ff185748cc46a9bc97ee54c488c6d258b46ae5c1a6b7b0540539f43826f49fe2a2032a84d529d542f22b783da02754cfae', 'zaidbouraoui995@gmail.com', '2022-11-29 13:05:47'),
(235, 'eec26eb8f8ea13713963604b9961cb8d970012c4cfa07a1610fe3b984cf95ae7dc2bbe0e56adb5bca00cc1dc65cb4fc0f65c5b3fe48131eb50c971da7e49c43c', 'zaidbouraoui995@gmail.com', '2022-11-29 13:05:48'),
(236, '8e32104b12b23ee112e24546e09ff574bc2c27a8d676104aa98e18fe42b8b9d610a705a811ba6ee0280330e5c9237e2d2158b98e94460cc2a59bd228a02cb983', 'zaidbouraoui995@gmail.com', '2022-11-29 13:05:49'),
(237, '1da49d65e127711e053671a11a226861a05b4422681f0582e325ac8af142890b7b01486ad4a5f4e65b28837ea601723e262cc6b4888ba7802c6b9dc2d79aae56', 'zaidbouraoui995@gmail.com', '2022-11-29 13:05:50'),
(238, '669a7d7853a2519925a1da6b2bdf2ee695257479ab55277b5fd824925ea3bec411b5e48d025aaedef730b2e22eabe05e312bbe2decabc6839505c83895559e93', 'zaidbouraoui995@gmail.com', '2022-11-29 13:05:51'),
(239, '54727104fbd6ddfeedc1ab45fafb14e114e4de28621bb185be8377fcd74608d94b2d57ca927ff3f5156c2ee1a9986563aee1977cf4043cabf73f192f4415ce87', 'zaidbouraoui995@gmail.com', '2022-11-29 13:05:53'),
(240, '86c2bbc99c0df67d19c19c3f71ce335ba9140623c3f1fe1a29e3c4b2b238c63f0289d98fe04c03c1600e61c3dda608730dfa207b1b324a49df36992e987a4e49', 'formateu13@test.com', '2022-11-29 13:14:51'),
(241, 'b418881ffdc58a356e4cc8b673b085a2abd33755ba00c31788e37b28fe189e7a6fc6791c2dda3f496ab4e31a7db2b386b3fd3b0333cd20f06e796d788809acea', 'formateu13@test.com', '2022-11-29 13:14:54'),
(242, 'a334029fa08f4f627fc98aba9b11cbe51b8fa1728010a7357d8b8c51798f8ac8aa9267d77033c940ea8d841e9b0a031655261c5e935d9fc81a14dbb0f72c061d', 'formateu13@test.com', '2022-11-29 13:14:57'),
(243, '294b02b611e8c3c6865a0997cecee120b7125cb7a0d136d2dd2df77fceaf1ae5a0233e9f266ebe78e50ed1b2fbc936ddc1e40cae2d216b3b182e2d5ebe160efc', 'formateur12a@test.com', '2022-11-29 13:15:28'),
(244, '0c163249d758db9dc4afba0762f11746b360191a47e5f6a367f0cd09952695b130d8b8cf445208a83b01c61be221195c81b77809f7f600c80c917de51a658834', 'formateur12a@test.com', '2022-11-29 13:15:31'),
(245, '590cc207eeaecf74c6f8f4f9a9fc8dbcded46f1adf33a5cac052508381ae5fed7b650eff612328b80468c31101acec8126c0fa3921ddc128f4affcde04c17389', 'formateur12a@test.com', '2022-11-29 13:15:48'),
(246, '700abd4bdaed9e3a2d4785b35b7c4d58c0ec055caf1e24785439cac4867087c8b93bac664fa1df7b7fe941caa08cc8ef0a7f340c72c6d7cf3f3d0e33ba0e88f2', 'formateur12a@test.com', '2022-11-29 13:15:50'),
(247, '870e49269e64660d58056b2cb962538124bad49763f4a5c53e421ae126d1f00daa6eff338aad2d8b09789c63a515d7e911fc3e80122f6a21f856a582ab3d2f4b', 'formateur12a@test.com', '2022-11-29 13:16:23'),
(248, '54f344beec0dcc83c578fce21345956045b6922f7d1d043c4daae5edc0b8c4510ce769e59cbbc2160e38b5d4387057940659b3527e3d8b77d1836448aee1d5e1', 'formateur12a@test.com', '2022-11-29 13:16:27'),
(249, 'd8c4af219e2bc93ad7c99bac4c9312d69055077029bb7c329f08c05c5315caa6aec8322572c94c7b4160489af76812c04445c4b261fc9392bf7b2dc0ae82736e', 'formateur1@test.com', '2022-11-29 13:16:57'),
(250, 'f5759e892163bc1e332baee2258cda651edfc21adcd041948325948586c36d3113a9cfc056c9c2ca25e083def1c771005998a431da4cb3bfeaafeb2ecd9b8da0', 'formateur1@test.com', '2022-11-29 13:16:59'),
(251, '75e3b784d53aece2e50816369e4b9e9305bf69f292365dbac6f9c344ca8f4df090c5e4d566e26330791ece159a37f2ca0e760544badf073598fc33e4f9cb2b70', 'formateur1@test.com', '2022-11-29 13:17:02'),
(252, '67021859c9d65e725598d21879e7a704b9ad2dc9d240cdfe5d482f06135085163beb084ff8b5c92b5e5c3196c399acf79c0f711539283644cc59c449f41a0066', 'formateur1@test.com', '2022-11-29 13:17:07'),
(253, '8ad58529c18041532f5f491a6cd5e3176c29b698543449399e47d9af77c77cad5c97fc9655bacbf9b9c100ceca10967afd47068818fad9d7a6735f7fd649142d', 'formateur1@test.com', '2022-11-29 13:17:37'),
(254, '36799a0648e4bbe85f43d07d0e0aa7ac3f3ae777ad7bc6731965841a2f66b58343e46bdaf6825297ba2beea08843cedc89e01c6a8750008ec705e0f2db4442c2', 'formateur1@test.com', '2022-11-29 13:17:42'),
(255, '98444d13009acafd103b72e10deebf9a55febe1d4cfa78d367967d9c7e7a2818e919006b7f1665706c67f84db1e1b1e0b2b48ad1d1bfe68120589415e4fe3b5c', 'formateur1@test.com', '2022-11-29 13:17:45'),
(256, 'f55856d854cd1d2e3b6b4221cbabeede0394d4fbd5c072748459cb6174f7a157d8d437c27368cb517d72f73cdffb9b658fa33fc55bdcd9740cb49f511f343c73', 'formateur1@test.com', '2022-11-29 13:18:03'),
(257, '7876a3340ab9f020e88847fe2d65d66af9c987782b79c61e9184f6fd4a3306f2e0ba5153407e7d74849299185e0768c981d9fdc45b88d30626594ed1244caaab', 'formateur1@test.com', '2022-11-29 13:18:04'),
(258, 'b9a0111425e20ee3221e3dba9c556114ece4f8d9b2b9ab68587492c99ccaa55446c1227a06763ecdf2d3f9a201d9d179171eaec650499d0805784ec59f88f015', 'formateur1@test.com', '2022-11-29 13:18:06'),
(259, '2901baeda2581d16fe552bacf521efaaec9f7f8ed5d3ba5032e4e3507284542ca5c96b056efd4af868f098201a3e61d520e11724e756a86cfa4b22e4eaeee550', 'formateur3@test.com', '2022-11-29 13:18:49'),
(260, '22ded3f98411172d3f293001fb68b2d89d3d24a452b5682f8997b1b5bd0076330271465ee1c8617e26d7db037ef7c451148d38e95645d91ec4e2844e9e929a43', 'formateur3@test.com', '2022-11-29 13:18:51'),
(261, '1a3bf722be7972f0f278302513df356181013d184207b4fef6cf4d78ae6e0d7189a1a5119653d130b2492a297dd2d194bbd6e4c3384c0ac7e539c4f1537454b8', 'zaidbouraoui995@gmail.com', '2023-01-10 00:50:14'),
(262, '299740b6b8b51ff04c515f46f5f9163b2ccd409c83337aa3628c094487fc720ec9de3261d7c8fd0c496b737d6c584773cf1cd539090109713e8a2bd80501dd0a', 'admin@test.com', '2023-01-10 00:56:54'),
(263, '2149ad7a81f4d818ffa38cd50dae40a2b38af8c18c13bd86c3c70edd5ed02a6b532ca3b12e6479e69ffe56fbac7b9938b1e7767fb30db3e493f2e21c2bac256c', 'admin@test.com', '2023-01-10 00:56:58'),
(264, '017aef716b3229216327968ccee69d839153bb6344f16d9c8a674adfff586521be26678a6804f6afc27b177bbc05c02b7e9c7ec4b0ce88f02f0d3cf8404a15d6', 'formateur3@test.com', '2023-01-10 01:06:10'),
(265, '8f1302294e6b1c8f6afcb09de53b68f7ac81b4b55076f637a6b7bc6c75d8be42a3ea172efe45c76e26a7f410825d255f4aee0789077cc9f9642aa13100526de1', 'formateur3@test.com', '2023-01-10 01:06:12'),
(266, 'd74068063de1ff6384904bcd0b95807fe6a894d6d0c85d1842a3a516cc04b74e5393c0391b3a0b1ef5b8eb8ca10571cd40eb598b556c914370d3dd193f7fba8d', 'formateur3@test.com', '2023-01-10 01:06:18'),
(267, '29e34a5ba81fb1333403c341919ce8d6ff7f70991afd0c85f382887e1329a73d8744ba0729a726497bcc399a636609023f63ee0de5d66c91b0c318182906861c', 'formateur3@test.com', '2023-01-10 01:06:21'),
(268, '82eb491ecb690c248ae7973f42a98c54eb27ea822753a25b0ed250470046bcac210b0cffb84e96835dd116a238fdd88dabfc3771757b64d9fcab7b594860efe9', 'zaidbouraoui995@gmail.com', '2023-02-14 21:58:02'),
(269, '37435da94198d7db6112143f202583ca0880719d62affa5eb7e1217febd65a1a651d5bde923b20b9335902a24e45218ee52eed756c926f901e8464a5068586db', 'zaidbouraoui995@gmail.com', '2023-02-14 22:01:57');
INSERT INTO `refresh_tokens` (`id`, `refresh_token`, `username`, `valid`) VALUES
(270, 'f1b174b5b6e15b5af22d7ce0b4e6cb7596d4e56e4081d5ba8d0e545001dc4c4b514e4b28c5d0130fdfce311d23b47ddf186d111769efc989804c3d7aea85c761', 'zaidbouraoui995@gmail.com', '2023-02-14 22:02:01'),
(271, 'f27abe74343fa7f3e9b528031ce06a01f7153fc0454d05f997316d294db05a916eecd5a5aef8233a7f91ea643670dd7eff9ce71691c8f02487a6447c85bf18de', 'zaidbouraoui995@gmail.com', '2023-02-14 22:09:58'),
(272, '71c646ed6467e446e469be00004e4171be8942ec833d29ed716ca704ec7b6fb5e0b90dca89a4efc1ebd8e6cfa0cb0da43b77267cb1c1c5a567029b63c969077e', 'formateur3@test.com', '2023-02-14 22:13:40'),
(273, '649414f06eb0a9764a98a33f36e0f8d3f7f6c74930e6984983e4c5812cef5ea0533020c5264e22c70f7f272d35dafd5a8140c343e2837e8a064d0f41e591c7d3', 'formateur3@test.com', '2023-02-14 22:13:44'),
(274, '998d78281261277fbcf74a190f6356cf6663cf5a6123f1235124d63964166946d857625c11fb50d063f44ac4df53c34cb6fd42d950ceaa1fe2f40242f22a2f05', 'admin@test.com', '2023-02-14 22:31:07'),
(275, '3bea0bc47d53425554217e8339e31d2681928e5408f80c8d3a2dfca823d332f675ffc4d33f1914b413e82d93c7c3688da55f9d0807ceae0dbe509421e6fba245', 'admin@test.com', '2023-02-14 22:31:09');

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) NOT NULL,
  `hashed_token` varchar(100) NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sondage`
--

CREATE TABLE `sondage` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sondage`
--

INSERT INTO `sondage` (`id`, `admin_id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, 'proposition d\'une formation Angular a fait', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor.</span>', '2022-06-14 19:25:31', '2022-06-14 19:25:31'),
(2, 1, 'Symfony', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor</span>', '2022-06-14 19:25:50', '2022-06-14 19:25:50'),
(3, 1, 'Typescrip', '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.</span>', '2022-06-14 19:32:37', '2022-06-14 19:32:37');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `cin` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `phone_nbre` int(11) DEFAULT NULL,
  `is_payed` tinyint(1) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `last_name`, `cin`, `location`, `phone_nbre`, `is_payed`, `age`, `is_verified`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'admin@test.com', '[\"ROLE_ADMIN\"]', '$2y$13$ezyMR8puwMtakHS11X4kXulx4cRdSmzWDBSrrkRYjIVYWNovn./Ra', 'admin', 'admin', NULL, NULL, NULL, 0, NULL, 1, NULL, 'userDefault.png', '2022-06-06 22:18:42', '2022-06-06 22:18:42'),
(3, 'formateur1@test.com', '[\"ROLE_FORMATEUR\"]', '$2y$13$3G.Ba5yn6SeahNRq6bkeFuZip5q2RZqiTZvp7nQAlgiQck.s1JhGu', 'formateur1', 'formateur1', NULL, NULL, 97542160, 0, NULL, 0, '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit,</span>', 'telechargement-1-629e6225d5c24.jpg', '2022-06-06 22:23:02', '2022-06-06 22:23:02'),
(4, 'formateur2@test.com', '[\"ROLE_FORMATEUR\"]', '$2y$13$K1x7bae.VYnC9WjeItu/Je8fCUIJ4FmG62pklD4ZR3BOtb67fMVqa', 'formateur2', 'formateur2', NULL, NULL, 21212121, 0, NULL, 1, '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit,</span>', 'avatarMan-629e625c34e38.png', '2022-06-06 22:23:56', '2022-06-06 22:23:56'),
(5, 'formateur3@test.com', '[\"ROLE_FORMATEUR\"]', '$2y$13$tSMaJyFlQfpQng8V4Cr0Getxmh5xXKWdOzxMy6k3M5XI/GeNvP94S', 'formateur3', 'formateur3', NULL, NULL, 21252149, 0, NULL, 1, '<span style=\"color: rgba(0, 0, 0, 0.7); font-family: Rokkitt, serif; font-size: 18.6667px; background-color: rgba(0, 0, 0, 0.1);\">Lorem ipsum dolor sit amet, consectetaur adipisicing elit, s</span>', 'telechargement-629e628129ce4.png', '2022-06-06 22:24:33', '2022-06-06 22:24:33'),
(6, 'zaidbouraoui995@gmail.com', '[\"ROLE_USER\"]', '$2y$13$zVYQgVmFARNuaVqL4NmKBuSvm6q0eZ8PD9Op9yuIZI/2DTJmjJEjK', 'Zaid', 'Bouraoui', 11985865, 'Kairouan', 21213154, 0, 22, 1, NULL, 'userDefault.png', '2022-06-06 22:50:22', '2022-06-27 20:27:01'),
(7, 'zaidbouraoui2@gmail.com', '[\"ROLE_USER\"]', '$2y$13$yj2W0elJ0VG3SFTsgnpjwuw5up0EhFgrAZBY4034volqjvsJElz7S', 'Bouraoui', 'Zaid', NULL, NULL, NULL, 0, NULL, 0, NULL, 'userDefault.png', '2022-06-14 10:02:01', '2022-06-14 10:02:01'),
(9, 'zaiedbouraoui@gmail.com', '[\"ROLE_USER\"]', '$2y$13$qCuCWws229MvSBYcsPZYBu/AclBwMnnxhGpT6bRvxI/j.2F0voC7a', 'Bouraoui', 'Zaid', NULL, NULL, NULL, 0, NULL, 0, NULL, 'userDefault.png', '2022-06-14 10:12:14', '2022-06-14 10:12:14'),
(10, 'zaiedbouraouii@gmail.com', '[\"ROLE_USER\"]', '$2y$13$TewlVGyxT5Ngt5Dxn1o0jOHf6s80F9o1nVh3f3.HB2mb47X/0./zK', 'Bouraoui', 'Zaid', NULL, NULL, NULL, 0, NULL, 0, NULL, 'userDefault.png', '2022-06-14 10:19:33', '2022-06-14 10:19:33'),
(41, 'formateu13@test.com', '[\"ROLE_FORMATEUR\"]', '$2y$13$8LEVJ1g2j535CW2MKTaYvuRmsrjY5iAZ.1DdiVEc2n9TDN4WtlLsC', 'formateu13', 'formateu13', NULL, NULL, 21212121, 0, NULL, 0, 'formateu13@test.com&nbsp;formateu13@test.com&nbsp;formateu13@test.com', 'ideas-62b0a6ad9fa36.png', '2022-06-20 18:56:14', '2022-06-20 18:56:14'),
(49, 'zaidbr@gmail.com', '[\"ROLE_USER\"]', '$2y$13$HuOWb/krvtwMU1vuWCUXmeoeRSrRUCHD.t8XXupMSD29mPwqr3lHi', 'zaidbr', 'brr', NULL, NULL, NULL, 0, NULL, 1, NULL, 'userDefault.png', '2022-06-20 20:26:54', '2022-06-20 20:27:10'),
(50, 'amalmaalaoui6@gmail.com', '[\"ROLE_USER\"]', '$2y$13$ZN/KG5Wma4EWFhmw4dj8h.ieTJAW2Mh6zNpY5WtyHS4wEF58A6CHG', 'AMAL', 'MAALAOUI', NULL, NULL, NULL, 0, NULL, 1, NULL, 'userDefault.png', '2024-01-20 13:16:26', '2024-01-20 13:16:26'),
(51, 'amalmaalaoui689@gmail.com', '[\"ROLE_USER\"]', '$2y$13$/eujQ0mKnUd2/J0xHUF59OiOcT7VqecPb3bc7fpQi9LxYQztcrOc2', 'AMAL', 'MAALAOUI 2', NULL, NULL, NULL, 0, NULL, 1, NULL, 'userDefault.png', '2024-01-20 13:22:42', '2024-01-20 13:22:42'),
(52, 'test@test.com', '[\"ROLE_USER\"]', '$2y$13$baprTA7efMVrbSTwuQuvLeRR.lCWoYEveQXApjHvR/Ain7SvLidSC', 'usertest', 'test', NULL, NULL, NULL, 0, NULL, 0, NULL, 'userDefault.png', '2024-01-21 14:58:28', '2024-01-21 14:58:28');

-- --------------------------------------------------------

--
-- Structure de la table `user_group`
--

CREATE TABLE `user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_group`
--

INSERT INTO `user_group` (`user_id`, `group_id`) VALUES
(6, 2);

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `chapitre_id` int(11) NOT NULL,
  `url_video` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `video`
--

INSERT INTO `video` (`id`, `chapitre_id`, `url_video`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'VID-20220322-123634-62a26d703cb61.mp4', 'tutoriel 1', '2022-06-10 00:00:16', '2022-06-10 00:00:16'),
(2, 2, 'Angular-Tutorial-1-Introduction-HD-628d7ce82dce9-62a26dfe95163.mp4', 'Tutoriel 2', '2022-06-10 00:02:38', '2022-06-10 00:02:38'),
(3, 3, 'DSI2103-2-62a26e6a31d28.pdf', 'Tutoriel 3', '2022-06-10 00:04:26', '2022-06-10 00:04:26'),
(4, 4, 'VID-20220322-123634-62a8e97880824.mp4', 'chapitre 5', '2022-06-14 22:03:04', '2022-06-14 22:03:04'),
(5, 6, 'Angular-Tutorial-1-Introduction-HD-62a8ea414ad3d.mp4', 'CHAPITRE7', '2022-06-14 22:06:25', '2022-06-14 22:06:25'),
(6, 10, 'Angular-Tutorial-1-Introduction-HD-62b9fb2a7d6c8.mp4', 'Introduction Angular', '2022-06-27 20:47:06', '2022-06-27 20:47:06');

-- --------------------------------------------------------

--
-- Structure de la table `video_confernce`
--

CREATE TABLE `video_confernce` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url_meeting` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `video_confernce`
--

INSERT INTO `video_confernce` (`id`, `title`, `url_meeting`, `created_at`, `updated_at`) VALUES
(2, 'test2', 'http://127.0.0.1:4200/admin-dashboard/cours', '2022-06-21 19:57:21', '2022-06-21 19:57:21');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `calenderier`
--
ALTER TABLE `calenderier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_874767775200282E` (`formation_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chapitre`
--
ALTER TABLE `chapitre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8C62B0255200282E` (`formation_id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande_formation`
--
ALTER TABLE `commande_formation`
  ADD PRIMARY KEY (`commande_id`,`formation_id`),
  ADD KEY `IDX_504C7BFD82EA2E54` (`commande_id`),
  ADD KEY `IDX_504C7BFD5200282E` (`formation_id`);

--
-- Index pour la table `commande_user`
--
ALTER TABLE `commande_user`
  ADD PRIMARY KEY (`commande_id`,`user_id`),
  ADD KEY `IDX_E6FFD7AA82EA2E54` (`commande_id`),
  ADD KEY `IDX_E6FFD7AAA76ED395` (`user_id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BC1BC7E6B6` (`writer_id`),
  ADD KEY `IDX_67F068BC1FBEEF7B` (`chapitre_id`);

--
-- Index pour la table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8A8E26E97A45358C` (`groupe_id`),
  ADD UNIQUE KEY `UNIQ_8A8E26E9BA0E79C3` (`last_message_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D8698A761FBEEF7B` (`chapitre_id`);

--
-- Index pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1323A5755200282E` (`formation_id`),
  ADD KEY `IDX_1323A5758D0EB82` (`candidat_id`);

--
-- Index pour la table `evaluation_formateur`
--
ALTER TABLE `evaluation_formateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3F76B5CB155D8F51` (`formateur_id`),
  ADD KEY `IDX_3F76B5CB8D0EB82` (`candidat_id`);

--
-- Index pour la table `fichier`
--
ALTER TABLE `fichier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9B76551F1FBEEF7B` (`chapitre_id`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_404021BFC8257048` (`videos_meetings_id`),
  ADD KEY `IDX_404021BF155D8F51` (`formateur_id`),
  ADD KEY `IDX_404021BFBCF5E72D` (`categorie_id`);

--
-- Index pour la table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6DC044C567433D9C` (`meeting_id`),
  ADD KEY `IDX_6DC044C55200282E` (`formation_id`);

--
-- Index pour la table `jwt_refresh_token`
--
ALTER TABLE `jwt_refresh_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9F3D9535C74F2195` (`refresh_token`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B6BD307FCD53EDB6` (`receiver_id`),
  ADD KEY `IDX_B6BD307F37BC4DC6` (`emitter_id`);

--
-- Index pour la table `messsage`
--
ALTER TABLE `messsage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E37D2AE39AC0396` (`conversation_id`),
  ADD KEY `IDX_E37D2AE3A76ED395` (`user_id`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B1DC7A1E9395C3F3` (`customer_id`),
  ADD KEY `IDX_B1DC7A1E9291498C` (`ordre_id`);

--
-- Index pour la table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D79F6B11A76ED395` (`user_id`),
  ADD KEY `IDX_D79F6B119AC0396` (`conversation_id`);

--
-- Index pour la table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A412FA925200282E` (`formation_id`);

--
-- Index pour la table `reagit`
--
ALTER TABLE `reagit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8BAFDD5CBAF4AE56` (`sondage_id`),
  ADD KEY `IDX_8BAFDD5C8D0EB82` (`candidat_id`);

--
-- Index pour la table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9BACE7E1C74F2195` (`refresh_token`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `sondage`
--
ALTER TABLE `sondage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7579C89F642B8210` (`admin_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `IDX_8F02BF9DA76ED395` (`user_id`),
  ADD KEY `IDX_8F02BF9DFE54D947` (`group_id`);

--
-- Index pour la table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CC7DA2C1FBEEF7B` (`chapitre_id`);

--
-- Index pour la table `video_confernce`
--
ALTER TABLE `video_confernce`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `calenderier`
--
ALTER TABLE `calenderier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `chapitre`
--
ALTER TABLE `chapitre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `evaluation_formateur`
--
ALTER TABLE `evaluation_formateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `fichier`
--
ALTER TABLE `fichier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `jwt_refresh_token`
--
ALTER TABLE `jwt_refresh_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messsage`
--
ALTER TABLE `messsage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `reagit`
--
ALTER TABLE `reagit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sondage`
--
ALTER TABLE `sondage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `video_confernce`
--
ALTER TABLE `video_confernce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `calenderier`
--
ALTER TABLE `calenderier`
  ADD CONSTRAINT `FK_874767775200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`);

--
-- Contraintes pour la table `chapitre`
--
ALTER TABLE `chapitre`
  ADD CONSTRAINT `FK_8C62B0255200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`);

--
-- Contraintes pour la table `commande_formation`
--
ALTER TABLE `commande_formation`
  ADD CONSTRAINT `FK_504C7BFD5200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_504C7BFD82EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commande_user`
--
ALTER TABLE `commande_user`
  ADD CONSTRAINT `FK_E6FFD7AA82EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E6FFD7AAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BC1BC7E6B6` FOREIGN KEY (`writer_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_67F068BC1FBEEF7B` FOREIGN KEY (`chapitre_id`) REFERENCES `chapitre` (`id`);

--
-- Contraintes pour la table `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `FK_8A8E26E97A45358C` FOREIGN KEY (`groupe_id`) REFERENCES `group` (`id`),
  ADD CONSTRAINT `FK_8A8E26E9BA0E79C3` FOREIGN KEY (`last_message_id`) REFERENCES `messsage` (`id`);

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `FK_D8698A761FBEEF7B` FOREIGN KEY (`chapitre_id`) REFERENCES `chapitre` (`id`);

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `FK_1323A5755200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`),
  ADD CONSTRAINT `FK_1323A5758D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `evaluation_formateur`
--
ALTER TABLE `evaluation_formateur`
  ADD CONSTRAINT `FK_3F76B5CB155D8F51` FOREIGN KEY (`formateur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_3F76B5CB8D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `fichier`
--
ALTER TABLE `fichier`
  ADD CONSTRAINT `FK_9B76551F1FBEEF7B` FOREIGN KEY (`chapitre_id`) REFERENCES `chapitre` (`id`);

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_404021BF155D8F51` FOREIGN KEY (`formateur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_404021BFBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `FK_404021BFC8257048` FOREIGN KEY (`videos_meetings_id`) REFERENCES `video_confernce` (`id`);

--
-- Contraintes pour la table `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `FK_6DC044C55200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`),
  ADD CONSTRAINT `FK_6DC044C567433D9C` FOREIGN KEY (`meeting_id`) REFERENCES `video_confernce` (`id`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_B6BD307F37BC4DC6` FOREIGN KEY (`emitter_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_B6BD307FCD53EDB6` FOREIGN KEY (`receiver_id`) REFERENCES `group` (`id`);

--
-- Contraintes pour la table `messsage`
--
ALTER TABLE `messsage`
  ADD CONSTRAINT `FK_E37D2AE39AC0396` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`id`),
  ADD CONSTRAINT `FK_E37D2AE3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `FK_B1DC7A1E9291498C` FOREIGN KEY (`ordre_id`) REFERENCES `formation` (`id`),
  ADD CONSTRAINT `FK_B1DC7A1E9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FK_D79F6B119AC0396` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`id`),
  ADD CONSTRAINT `FK_D79F6B11A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `FK_A412FA925200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`);

--
-- Contraintes pour la table `reagit`
--
ALTER TABLE `reagit`
  ADD CONSTRAINT `FK_8BAFDD5C8D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_8BAFDD5CBAF4AE56` FOREIGN KEY (`sondage_id`) REFERENCES `sondage` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `sondage`
--
ALTER TABLE `sondage`
  ADD CONSTRAINT `FK_7579C89F642B8210` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `FK_8F02BF9DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8F02BF9DFE54D947` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `FK_7CC7DA2C1FBEEF7B` FOREIGN KEY (`chapitre_id`) REFERENCES `chapitre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

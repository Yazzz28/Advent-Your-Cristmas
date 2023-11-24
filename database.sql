-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 26 Octobre 2017 à 13:53
-- Version du serveur :  5.7.19-0ubuntu0.16.04.1
-- Version de PHP :  7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `simple-mvc`
--

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`id`, `title`) VALUES
(1, 'Stuff'),
(2, 'Doodads');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE hackathon1;

USE hackathon1;

CREATE TABLE 'user' (
  'id'INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  'prénom' VARCHAR(50) NOT NULL,
  'mail' VARCHAR(50) NOT NULL
);

CREATE TABLE blague (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  story VARCHAR(200) NOT NULL
);

CREATE TABLE recette (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  title VARCHAR(50) NOT NULL,
  description VARCHAR(3000) NOT NULL
);

CREATE TABLE cadeau (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  idea VARCHAR(50) NOT NULL
);

CREATE TABLE image (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  photo VARCHAR(255) NOT NULL
);

CREATE TABLE film (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  movie_title VARCHAR(255) NOT NULL
);

CREATE TABLE contenu (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  day date,
  user_id INT NOT NULL, 
  FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
  blague_id INT NOT NULL,
  FOREIGN KEY (blague_id) REFERENCES blague(id) ON DELETE CASCADE,
  recette_id INT NOT NULL,
  FOREIGN KEY (recette_id) REFERENCES recette(id) ON DELETE CASCADE,
  cadeau_id INT NOT NULL,
  FOREIGN KEY (cadeau_id) REFERENCES cadeau(id) ON DELETE CASCADE,
  image_id INT NOT NULL,
  FOREIGN KEY (image_id) REFERENCES image(id) ON DELETE CASCADE
  FOREIGN KEY (image_id) REFERENCES image(id) ON DELETE CASCADE,
  film_id INT NOT NULL,
  FOREIGN KEY (film_id) REFERENCES film(id) ON DELETE CASCADE
);
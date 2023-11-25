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

CREATE TABLE `user` (
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `firstname` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(255) NOT NULL
);

CREATE TABLE blague (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  story TEXT NOT NULL
);

CREATE TABLE recette (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  title TEXT NOT NULL 
);

CREATE TABLE cadeau (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  idea VARCHAR(200) NOT NULL
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
  film_id INT NOT NULL,
  FOREIGN KEY (film_id) REFERENCES film(id) ON DELETE CASCADE
);

INSERT INTO `cadeau` (`idea`) VALUES ('Un week-end avec sa belle-mère');

INSERT INTO `cadeau` (`idea`) VALUES ('Un livre \'Comment se débarasser de la mauvaise haleine\'');
INSERT INTO `cadeau` (`idea`) VALUES ('Une boîte de mouchoire avec message \'pour les larmes que tu verseras car je n\'ai pas eu d\'idées cadeau');
INSERT INTO `cadeau` (`idea`) VALUES ('Des instruments de musiques bruyant pour les enfants, pour la grande joie des parents');
INSERT INTO `cadeau` (`idea`) VALUES ('Des cadeaux usagées ou périmées'); 
INSERT INTO `cadeau` (`idea`) VALUES ('Un cadeau reçu l\'année passé');
INSERT INTO `cadeau` (`idea`) VALUES ('Un abonnement financier très chiant');
INSERT INTO `cadeau` (`idea`) VALUES ('un gel douche');
INSERT INTO `cadeau` (`idea`) VALUES ('Des piles');
INSERT INTO `cadeau` (`idea`) VALUES ('Un puzzle 5000 pièces');
INSERT INTO `cadeau` (`idea`) VALUES ('Un bon pour un massage mais la date est déjà passé');
INSERT INTO `cadeau` (`idea`) VALUES ('Un cadeau nourriture pour qui la personne est allergique');
INSERT INTO `cadeau` (`idea`) VALUES ('Un peigne et du shampoing pour une personne chauve');
INSERT INTO `cadeau` (`idea`) VALUES ('Un livre chinois ou russe pour une personne qui ne sait pas parler la langue');
INSERT INTO `cadeau` (`idea`) VALUES ('Une brosse à chiotte');
INSERT INTO `cadeau` (`idea`) VALUES ('Un paillasson moche');
INSERT INTO `cadeau` (`idea`) VALUES ('Un mug avec une photo très pixelise');
INSERT INTO `cadeau` (`idea`) VALUES ('Des gants ou autres mais dépareilles');
INSERT INTO `cadeau` (`idea`) VALUES ('Pour un enfant, offrir une boite de ps5 sans la ps5 dedans');
INSERT INTO `cadeau` (`idea`) VALUES ('Un dictionnaire');
INSERT INTO `cadeau` (`idea`) VALUES ('Des posts It');
INSERT INTO `cadeau` (`idea`) VALUES ('Coffret Scorpio');
INSERT INTO `cadeau` (`idea`) VALUES ('Le plug de mamie');
INSERT INTO `cadeau` (`idea`) VALUES ('Brassard rouge de papy');
INSERT INTO `cadeau` (`idea`) VALUES ('Un pc pour un aveugle');
INSERT INTO `cadeau` (`idea`) VALUES ('Des rackettes pour un manchot');
INSERT INTO `cadeau` (`idea`) VALUES ('Des parents pour un orphelin');
INSERT INTO `cadeau` (`idea`) VALUES ('Un bon pour etre adopter');

INSERT INTO `recette` (`title`) VALUES ("Rilettes de confit de canard");
INSERT INTO `recette` (`title`) VALUES ("Foie du chapon");
INSERT INTO `recette` (`title`) VALUES ("Rouelle de porc de Noël");
INSERT INTO `recette` (`title`) VALUES ("Cuisse de rêne au barbecue");
INSERT INTO `recette` (`title`) VALUES ("Mère Noël farcie à la bûche");
INSERT INTO `recette` (`title`) VALUES ("Lutins à la broche");
INSERT INTO `recette` (`title`) VALUES ("Salade de billes de chèvre");
INSERT INTO `recette` (`title`) VALUES ("Enfant pas sage en saucisson");
INSERT INTO `recette` (`title`) VALUES ("Mère Noël à la morue");
INSERT INTO `recette` (`title`) VALUES ("Fois gras de parent");
INSERT INTO `recette` (`title`) VALUES ("Foie gras pur canard vegan");
INSERT INTO `recette` (`title`) VALUES ("Tofu de viande de boeuf");
INSERT INTO `recette` (`title`) VALUES ("Carpaccio de chient Tching Tchong");
INSERT INTO `recette` (`title`) VALUES ("Boudin de mioche casse burne");
INSERT INTO `recette` (`title`) VALUES ("Eau parce que papa est sortie chercher du lait");
INSERT INTO `recette` (`title`) VALUES ("Grosse grosse bûche à la viande de Noël");
INSERT INTO `recette` (`title`) VALUES ("Smegma de Lutin");
INSERT INTO `recette` (`title`) VALUES ("Jus de rêne façon savoyarde");
INSERT INTO `recette` (`title`) VALUES ("Prompte juteux de la Mère Noël");
INSERT INTO `recette` (`title`) VALUES ("Larmes d'enfants pas sage");
INSERT INTO `recette` (`title`) VALUES ("Enfant farcie à la sauce Père Noël");
INSERT INTO `recette` (`title`) VALUES ("Pain d'enfant perdu sucre canelle");
INSERT INTO `recette` (`title`) VALUES ("Terrine de Somalien obèse");
INSERT INTO `recette` (`title`) VALUES ("Huitre de mamie au four");
INSERT INTO `recette` (`title`) VALUES ("Coquille Saint-Jacque de compostel");

INSERT INTO `film` (`movie_title`) VALUES ("La famille Claus");
INSERT INTO `film` (`movie_title`) VALUES ("The Noël diary");
INSERT INTO `film` (`movie_title`) VALUES ("Les chroniques de Noël");
INSERT INTO `film` (`movie_title`) VALUES ("Les 12 cadeaux de Noël");
INSERT INTO `film` (`movie_title`) VALUES ("Le grinch");
INSERT INTO `film` (`movie_title`) VALUES ("Le Noël de Mr Schroudge");
INSERT INTO `film` (`movie_title`) VALUES ("Noël est servi");
INSERT INTO `film` (`movie_title`) VALUES ("Il croit au pere noel");
INSERT INTO `film` (`movie_title`) VALUES ("L’alchimie de Noël");
INSERT INTO `film` (`movie_title`) VALUES ("Comme cendrillon, un vœu pour Noël");
INSERT INTO `film` (`movie_title`) VALUES ("Un château pour Noël");
INSERT INTO `film` (`movie_title`) VALUES ("The hollyday");
INSERT INTO `film` (`movie_title`) VALUES ("Noël au grand cœur");
INSERT INTO `film` (`movie_title`) VALUES ("Noël sous son aile");
INSERT INTO `film` (`movie_title`) VALUES ("A christmas prince");
INSERT INTO `film` (`movie_title`) VALUES ("Livre avant Noël");
INSERT INTO `film` (`movie_title`) VALUES ("The holiday calendar");
INSERT INTO `film` (`movie_title`) VALUES ("Ma belle famille Noël et moi");
INSERT INTO `film` (`movie_title`) VALUES ("L’ambassadrice de Noël");
INSERT INTO `film` (`movie_title`) VALUES ("Noël grâce à elle");
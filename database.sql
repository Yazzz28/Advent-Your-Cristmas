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
CREATE DATABASE hackathon1;

USE hackathon1;

CREATE TABLE 'user' (
  'id'INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  'prénom' VARCHAR(50) NOT NULL,
  'mail' VARCHAR(50) NOT NULL
);

CREATE TABLE 'blague' (
  'id' INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  'histoire' VARCHAR(200) NOT NULL
);

CREATE TABLE 'recette' (
  'id' INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  'titre' VARCHAR(50) NOT NULL,
  'description' VARCHAR(3000) NOT NULL
);

CREATE TABLE 'cadeau' (
  'id' INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  'idée' VARCHAR(50) NOT NULL
);

CREATE TABLE 'image' (
  'id' INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  'photo' VARCHAR(255) NOT NULL
);

CREATE TABLE 'contenu' (
  'id' INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  'jour' date,
  'user_id' INT NOT NULL, 
  FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
  'blague_id' INT NOT NULL,
  FOREIGN KEY (blague_id) REFERENCES blague(id) ON DELETE CASCADE,
  'recette_id' INT NOT NULL,
  FOREIGN KEY (recette_id) REFERENCES recette(id) ON DELETE CASCADE,
  'cadeau_id' INT NOT NULL,
  FOREIGN KEY (cadeau_id) REFERENCES cadeau(id) ON DELETE CASCADE,
  'image_id' INT NOT NULL,
  FOREIGN KEY (image_id) REFERENCES image(id) ON DELETE CASCADE
);
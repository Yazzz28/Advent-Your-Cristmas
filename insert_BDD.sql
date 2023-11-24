use hackathon1
-- SET NAMES utf8; --

ALTER TABLE cadeau MODIFY idea VARCHAR(200);
ALTER TABLE `hackathon1`.`recette` 
DROP COLUMN `description`;

ALTER TABLE `hackathon1`.`contenu` 
DROP FOREIGN KEY `contenu_ibfk_5`;
ALTER TABLE `hackathon1`.`contenu` 
DROP INDEX `image_id` ;
;

ALTER TABLE `hackathon1`.`contenu` 
DROP COLUMN `image_id`;



/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `recette` (`title`) VALUES ("Eau parce que papa est sortie chercher du lait de poule");
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
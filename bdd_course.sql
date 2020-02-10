START TRANSACTION;

DROP DATABASE IF EXISTS app_course;
CREATE DATABASE app_course;
USE app_course;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
    `id_users` int(10) NOT NULL AUTO_INCREMENT,
    `nom` varchar(255) NOT NULL,
    `prenom` varchar(255) NOT NULL,
    `adresse` varchar(255) NOT NULL,
    `code_postal` int NOT NULL,
    `ville` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `password` varchar(255),
    `date_inscription` DATETIME DEFAULT CURRENT_DATE,
    `date_update` DATETIME DEFAULT CURRENT_DATE,
    `date_delete` DATETIME DEFAULT CURRENT_DATE,
    `activate` BOOLEAN DEFAULT 1,
    PRIMARY KEY (`id_users`)
)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `liste_course`;
CREATE TABLE `liste_course` (
    `id_liste_course` int(10) NOT NULL AUTO_INCREMENT,
    `nom` varchar(255) NOT NULL,
    `prix_total` float,
    `date_add` DATETIME DEFAULT CURRENT_DATE,
    `date_update` DATETIME DEFAULT CURRENT_DATE,
    `date_delete` DATETIME DEFAULT CURRENT_DATE,
    `activate` BOOLEAN DEFAULT 1,
    `id_users` int,
    PRIMARY KEY (`id_liste_course`),
    FOREIGN KEY (`id_users`) references users(id_users)
)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE `categorie` (
    `id_categorie` int(10) NOT NULL AUTO_INCREMENT,
    `nom` varchar(255) NOT NULL,
    `date_add` DATETIME DEFAULT CURRENT_DATE,
    `date_update` DATETIME DEFAULT CURRENT_DATE,
    `date_delete` DATETIME DEFAULT CURRENT_DATE,
    `activate` BOOLEAN DEFAULT 1,
    PRIMARY KEY (`id_categorie`)
)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
    `id_article` int(10) NOT NULL AUTO_INCREMENT,
    `nom` varchar(255) NOT NULL,
    `prix` FLOAT NOT NULL,
    `date_add` DATETIME DEFAULT CURRENT_DATE,
    `date_update` DATETIME DEFAULT CURRENT_DATE,
    `date_delete` DATETIME DEFAULT CURRENT_DATE,
    `activate` BOOLEAN DEFAULT 1,
    `id_cat` int,
    PRIMARY KEY (`id_article`),
    FOREIGN KEY (`id_cat`) references categorie(id_categorie)
)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `liste_article`;
CREATE TABLE `liste_article` (
    `id_liste_article` int(10) NOT NULL AUTO_INCREMENT,
    `date_add` DATETIME DEFAULT CURRENT_DATE,
    `date_update` DATETIME DEFAULT CURRENT_DATE,
    `date_delete` DATETIME DEFAULT CURRENT_DATE,
    `quantite` int,
    `activate` BOOLEAN DEFAULT 1,
    `id_liste_course` int,
    `id_article` int,
    PRIMARY KEY (`id_liste_article`),
    FOREIGN KEY (`id_liste_course`) references liste_course(id_liste_course),
    FOREIGN KEY (`id_article`) references article(id_article)
)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

COMMIT;
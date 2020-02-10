START TRANSACTION;

DROP DATABASE app_course;
CREATE DATABASE app_course;
USE app_course;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
    `id_users` int(10) NOT NULL AUTO_INCREMENT,
    `nom` varchar(255) NOT NULL,
    `prenom` varchar(255) NOT NULL,
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
    `date_add` DATETIME DEFAULT CURRENT_DATE,
    `date_update` DATETIME DEFAULT CURRENT_DATE,
    `date_delete` DATETIME DEFAULT CURRENT_DATE,
    `activate` BOOLEAN DEFAULT 1,
    `id_users` int,
    PRIMARY KEY (`id_liste_course`),
    FOREIGN KEY (`id_users`) references users(id_users)
)ENGINE=innoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;







COMMIT;
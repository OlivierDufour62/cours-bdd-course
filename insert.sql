START TRANSACTION;
USE app_course;


INSERT INTO `users`(`nom`, `prenom`, `adresse`, `code_postal`, `ville`, `email`, `password`) 
VALUES ('Dufour','Olivier','224 rue rosa luxemburg',62320,'Rouvroy','olivier.dufour62@yahoo.com','020988'),
('Laslaa','Mohamed','12 rue lamendin',62950,'Noyelles-Godault','mohamed.laslaa@yahoo.com','031214'), 
('Devise','Theo','24 rue rosa',62000,'Arras','theo.devise@yahoo.com','040704');

set @olivier := last_insert_id();
set @momo := last_insert_id()+1;
set @theo := last_insert_id()+2;


INSERT INTO `liste_course`(`nom`, `prix_total`, `id_users`) 
VALUES ('high-tech',1000,@olivier),
('casque', 129,@momo),
('PC', 700,@theo),
('nourriture', 15,@olivier),
('maison', 19,@momo),
('maison', 19,@theo);

set @pc_composant_liste := last_insert_id();
set @casque_momo_liste := last_insert_id()+1;
set @pc_theo_liste := last_insert_id()+2;
set @oli_liste := last_insert_id()+3;
set @momo_liste := last_insert_id()+4;
set @theo_liste := last_insert_id()+5;


INSERT INTO `categorie`(`nom`) 
VALUES ('high-tech'),
('nourriture'),
('hygiéne');

set @high_tech := last_insert_id();
set @nourriture := last_insert_id()+1;
set @hygiene := last_insert_id()+2;

INSERT INTO `article`(`nom`, `prix`,`id_cat`) 
VALUES ('Boitier PC',200,@high_tech),
('Carte grapique',200,@high_tech),
('Carte mère',200,@high_tech),
('Mémoire vive',200,@high_tech),
('Alimentation',200,@high_tech),
('Casque audio',129,@high_tech),
('PC',700,@high_tech),
('pain', 2, @nourriture),
('blanc de poulet', 4, @nourriture),
('Pate', 2, @nourriture),
('Micro fibre', 2, @hygiene),
('Balais', 5, @hygiene),
('Sol', 4, @hygiene);

set @compasant := last_insert_id();
set @compasant1 := last_insert_id()+1;
set @compasant2 := last_insert_id()+2;
set @compasant3 := last_insert_id()+3;
set @compasant4 := last_insert_id()+4;
set @casque := last_insert_id()+5;
set @pc := last_insert_id()+6;
set @pain := last_insert_id()+7;
set @blanc := last_insert_id()+8;
set @pate := last_insert_id()+9;
set @micro_fibre := last_insert_id()+10;
set @balais := last_insert_id()+11;
set @sol := last_insert_id()+12;


INSERT INTO `liste_article`(`quantite`, `id_liste_course`, `id_article`) 
VALUES (1,@pc_composant_liste,@compasant),
(1,@pc_composant_liste,@compasant1),
(1,@pc_composant_liste,@compasant2),
(1,@pc_composant_liste,@compasant3),
(1,@pc_composant_liste,@compasant4),
(1,@casque_momo_liste,@casque),
(1,@pc_theo_liste,@pc),
(1,@oli_liste,@pain),
(1,@oli_liste,@blanc),
(1,@oli_liste,@balais),
(1,@oli_liste,@sol),
(1,@momo_liste,@sol),
(1,@momo_liste,@balais),
(1,@momo_liste,@micro_fibre),
(1,@momo_liste,@pate),
(1,@momo_liste,@blanc),
(1,@momo_liste,@pain),
(1,@theo_liste,@sol),
(1,@theo_liste,@balais),
(1,@theo_liste,@micro_fibre),
(1,@theo_liste,@pate),
(1,@theo_liste,@blanc),
(1,@theo_liste,@pain);
COMMIT;
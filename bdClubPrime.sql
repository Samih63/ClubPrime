-- Supprimer la base de données si elle existe déjà
DROP DATABASE IF EXISTS bdClubPrime;

-- Créer la base de données
CREATE DATABASE bdClubPrime;

-- Utiliser la base de données
USE bdClubPrime;

-- Création de la table Club
CREATE TABLE IF NOT EXISTS Club (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    stade VARCHAR(277),
    descr VARCHAR(277),
    dateCrea DATE,
    idLigue INT,
    descrStade VARCHAR(277),
    photoStade BLOB,
    entraineur VARCHAR(277),
    photoEntraineur BLOB,
    FOREIGN KEY (idLigue) REFERENCES Ligue(id)
);

-- Création de la table Pays
CREATE TABLE IF NOT EXISTS Pays (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL
);

-- Création de la table Ligue
CREATE TABLE IF NOT EXISTS Ligue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    idPays INT,
    photoLigue BLOB,
    FOREIGN KEY (idPays) REFERENCES Pays(id)
);

-- Création de la table Joueur
CREATE TABLE IF NOT EXISTS Joueur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    prenom VARCHAR(277) NOT NULL,
    photo BLOB,
    poste VARCHAR(277),
    idClub INT,
    FOREIGN KEY (idClub) REFERENCES Club(id)
);

-- Création de la table Trophee
CREATE TABLE IF NOT EXISTS Trophee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL
    photoTrophee BLOB,
);

-- Création de la table Classement
CREATE TABLE IF NOT EXISTS Classement (
    annee INT,
    position INT,
    idClub INT,
    FOREIGN KEY (idClub) REFERENCES Club(id),
    PRIMARY KEY (annee, idClub)
);

-- Création de la table Tag
CREATE TABLE IF NOT EXISTS Tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lib VARCHAR(277) NOT NULL
);

-- Création de la table Obtenir (association entre Clubs et Trophées)
CREATE TABLE IF NOT EXISTS Obtenir (
    idClub INT,
    nombre INT,
    idTrophee INT,
    PRIMARY KEY (idClub, idTrophee),
    FOREIGN KEY (idClub) REFERENCES Club(id),
    FOREIGN KEY (idTrophee) REFERENCES Trophee(id)
);

-- Création de la table Taguer (association entre Clubs et Tags)
CREATE TABLE IF NOT EXISTS Taguer (
    idClub INT,
    idTag INT,
    PRIMARY KEY (idClub, idTag),
    FOREIGN KEY (idClub) REFERENCES Club(id),
    FOREIGN KEY (idTag) REFERENCES Tag(id)
);

-- Création de la table Logo
CREATE TABLE IF NOT EXISTS Logo (
   dateCreat DATE,
   nom VARCHAR(277) NOT NULL,
   idClub INT,
   FOREIGN KEY (idClub) REFERENCES Club(id),
   PRIMARY KEY (dateCreat, idClub)
);

-- Insertion de données dans la table Pays
INSERT INTO Pays (nom) VALUES
('Allemagne'),
('Angleterre'),
('Espagne'),
('France'),
('Italie');

-- Insertion de données dans la table Ligue
INSERT INTO Ligue (nom, idPays, photoLigue) VALUES
('Bundesliga', 1),
('Premier League', 2),
('La Liga', 3),
('Ligue 1', 4),
('Serie A', 7);

-- Insertion de données dans la table Club
INSERT INTO Club (nom, stade, descr, dateCrea, idLigue, descrStade, photoStade, entraineur, photoEntraineur) VALUES
('Bayern', 'Allianz Arena', 'Club de football basé à Munich, Allemagne', '1900-02-27', 1, "L'Allianz Arena ou Fußball Arena München, surnommée le « Schlauchboot » en raison de son aspect, est un stade de football situé au nord de Munich, la capitale du Land de Bavière en Allemagne. Le stade a une capacité de 75 000 spectateurs pour les matchs de Bundesliga, et 70 000 places en configuration internationale.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\Stade.jpg" ,"Thomas Tuchel", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\Entraineur.jpg" ),
('Liverpool', 'Anfield', 'Club de football historique de la Premier League anglaise', '1892-03-17', 2, "Anfield, situé à Liverpool, est un stade de football légendaire, surnommé le « Théâtre des rêves rouges ». Construit au nord de la ville, il est le sanctuaire du Liverpool Football Club. Doté d'une atmosphère électrique, Anfield offre une capacité de 53 394 places en configuration de matchs de la Premier League. Le stade emblématique a été le témoin de moments historiques du football, de chants passionnés et de célébrations inoubliables.","E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\Stade.jpg" ,"Jürgen Klopp", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\Entraineur.jpg"),
('Man City', 'Etihad Stadium', 'Club de football de Manchester jouant en Premier League', '1880-04-16', 2, "L'Etihad Stadium, niché à Manchester, est le foyer éclatant du Manchester City FC. Surnommé le City of Manchester Stadium, il se dresse fièrement au cœur de l'action. Avec une capacité de plus de 53 000 places, ce stade moderne est le théâtre de performances époustouflantes de l'équipe des Ciel et Blanc, illuminant les rêves des supporters.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\Stade.jpg" ,"Pep Guardiola", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\Entraineur.jpg" ),
('Real Madrid', 'Santiago Bernabéu', 'Club de football espagnol de la ville de Madrid', '1902-03-06', 3; "Le Santiago Bernabéu, légende du football basé à Madrid, est le temple sacré du Real Madrid. Renommé pour son histoire glorieuse, il peut accueillir plus de 80 000 fans passionnés. Ce stade emblématique est imprégné d'une atmosphère magique lors des matchs, offrant une expérience incomparable aux aficionados madrilènes.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\Stade.webp" ,"Carlo Ancelotti", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\Entraineur.jpg"),
('Chelsea', 'Stamford Bridge', 'Club de football londonien de Premier League', '1905-03-10', 2, "Stamford Bridge, résidence du Chelsea FC, se dresse avec élégance à Londres. Avec une capacité de plus de 40 000 sièges, ce stade empreint de tradition est le lieu où les Blues de Chelsea forgent leur histoire. L'atmosphère vibrante de Stamford Bridge fait de chaque match une aventure captivante.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\Stade.jpg" ,"Mauricio Pochettino", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\Entraineur.jpg"),
('Barcelone', 'Camp Nou', 'Club de football de Barcelone un des plus reconnus au monde', '1899-11-29', 3, "Le Camp Nou, situé à Barcelone, est le géant catalan où le FC Barcelone écrit son histoire. Avec une capacité de plus de 99 000 spectateurs, il est le plus grand stade d'Europe. L'ambiance électrique, et les prouesses de génies du ballon rond font du Camp Nou un lieu mythique.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\Stade.jpg" ,"Xavi Hernández", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\Entraineur.jpg"),
('PSG', 'Parc des Princes', 'Club de football français basé à Paris', '1970-08-12', 4, "Le Parc des Princes, joyau parisien, est l'antre du Paris Saint-Germain. Avec une capacité de plus de 48 000 places, ce stade moderne vibre au rythme des exploits des stars du PSG. L'élégance et le dynamisme du Parc des Princes en font un lieu emblématique du football français.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\Stade.jpg" ,"Luis Enrique", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\Entraineur.jpg"),
('Juventus', 'Allianz Stadium', 'Club de football italien situé à Turin', '1897-11-01', 5, "L'Allianz Stadium, situé à Turin, est le repaire de la Juventus. Avec une capacité de plus de 41 000 sièges, ce stade moderne offre une expérience immersive aux fans bianconeri. L'Allianz Stadium est le théâtre des triomphes de la Vecchia Signora, avec une ambiance électrisante à chaque rencontre.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\Stade.jpg" ,"Massimiliano Allegri", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\Entraineur.jpg"),
('Atlético de Madrid', 'Wanda Metropolitano', 'Club de football basé à Madrid, Espagne', '1903-04-26', 3, "Le Wanda Metropolitano, situé à Madrid, est le nouveau sanctuaire de l'Atlético de Madrid. Avec une capacité de plus de 68 000 places, il incarne la passion et la détermination des Colchoneros. Ce stade moderne est le témoin de la lutte incessante de l'Atlético sur le terrain.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\Stade.jpg" ,"Diego Simeone", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Marid\Entraineur.jpg" ),
('Man United', 'Old Trafford', 'Club de football anglais basé à Manchester, très populaire mondialement', '1878-01-01', 2, "Old Trafford, trésor de Manchester, est l'icône du Manchester United. Avec une capacité de plus de 74 000 sièges, il résonne de l'histoire glorieuse du club. Surnommé le Théâtre des Rêves, Old Trafford est le lieu où les Red Devils forgent leur légende, avec une atmosphère incomparable.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\Stade.jpg" ,"Erik ten Hag", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\Entraineur.jpg"),
('Roma', 'Stadio Olimpico', 'Club de football basé à Rome, Italie', '1927-07-22', 5, "Le Stadio Olimpico, situé à Rome, est le temple de l'AS Roma. Avec une capacité de plus de 70 000 places, ce stade historique a été le témoin de moments inoubliables de la Roma. L'atmosphère passionnée du Stadio Olimpico rend chaque match mémorable pour les supporters giallorossi.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\Stade.jpg" ,"José Mourinho", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\Entraineur.jpg");

-- Insertion de données dans la table Trophee
INSERT INTO Trophee (nom, photoTrophee) VALUES
('Ligue 1'),
('Coupe de France'),
('Trophée des Champions (France)'),
('Serie A'),
('Coppa Italia'),
('Supercoppa Italiana'),
('Premier League'),
('FA Cup'),
('Carabao Cup'),
('Community Shield (Angleterre)'),
('Bundesliga'),
('DFB-Pokal'),
('DFL-Supercup'),
('La Liga'),
('Copa del Rey'),
('Supercopa de España'),
('Ligue des champions de l''UEFA'),
('Ligue Europa de l''UEFA'),
('Supercoupe de l''UEFA'),
('Fifa Club World Cup'),
('Audi Cup'),
('Premier League Asia Trophy'),
('International Champions Cup'),
('Trophée Joan Gamper'),
('UEFA Europa Conference League');

-- Insertion de données dans la table Classement
INSERT INTO Classement (annee, position, idClub) VALUES
('2022', 1, 1),
('2022', 2, 2),
('2022', 3, 3),
('2022', 4, 4),
('2022', 7, 7),
('2022', 7, 7),
('2022', 7, 7),
('2022', 8, 8),
('2022', 9, 9),
('2022', 10, 10);



INSERT INTO Classement (annee, position, idClub) VALUES
('2023', 2, 1),  -- Bayern
('2023', 4, 2),  -- Liverpool
('2023', 1, 3),  -- Man City
('2023', 7, 4),  -- Man City
('2023', 3, 7),  -- Chelsea
('2023', 9, 7),  -- Barcelona
('2023', 7, 7),  -- Paris
('2023', 8, 8),  -- Atletico Madrid
('2023', 7, 9),  -- Man United
('2023', 10, 11); -- Roma


-- Insertion de données dans la table Obtenir (association entre Clubs et Trophées)
INSERT INTO Obtenir (idClub, nombre, idTrophee) VALUES
-- Bayern Munich
(1, 7, 17), -- Ligue des Champions
(1, 1, 18), -- UEFA Europa League
(1, 33, 11), -- Bundesliga
(1, 20, 12), -- DFB Pokal
(1, 2, 19), -- Super Coupe UEFA
(1, 10, 9), -- Super Cup (Community Shield)
(1, 2, 20), -- FIFA Club World Cup (CM Clubs)
(1, 3, 21), -- Audi Cup

-- Liverpool
(2, 7, 17), -- Ligue des Champions
(2, 3, 18), -- UEFA Europa League
(2, 19, 7), -- Premier League
(2, 8, 8), -- FA Cup
(2, 4, 7), -- League Championship
(2, 9, 7), -- League Cup
(2, 17, 10), -- Community Shield (Angleterre)
(2, 4, 19), -- Super Coupe UEFA
(2, 1, 20), -- Cdm club
(2, 1, 22), -- Premier League asia trophy

-- Manchester City
(3, 1, 17), -- Ligue des Champions
(3, 9, 7), -- Premier League
(3, 7, 8), -- FA Cup
(3, 7, 7), -- League Championship
(3, 8, 9), -- League Cup
(3, 7, 10), -- Community Shield (Angleterre)

-- Man City
(4, 14, 17), -- Ligue des Champions
(4, 2, 18), -- UEFA Europa League
(4, 37, 14), -- Liga
(4, 20, 17), -- Coupe du Roi
(4, 10, 17), -- Supercopa de España
(4, 4, 19), -- Super Coupe UEFA
(4, 7, 20), -- CM Clubs
(4, 1, 23), -- International Champions Cup

-- Chelsea
(7, 2, 17), -- Ligue des Champions
(7, 2, 18), -- UEFA Europa League
(7, 7, 7), -- Premier League
(7, 8, 8), -- FA Cup
(7, 2, 7), -- League Championship
(7, 7, 7), -- League Cup
(7, 4, 10), -- Community Shield (Angleterre)
(7, 2, 19), -- Super Coupe UEFA
(7, 1, 20), -- CM Clubs

-- FC Barcelone
(7, 7, 17), -- Ligue des Champions
(7, 27, 14), -- Liga
(7, 31, 17), -- Coupe du Roi
(7, 14, 17), -- Supercopa de España
(7, 7, 19), -- Super Coupe UEFA
(7, 3, 20), -- CM Clubs
(7, 1, 21), -- Audi Cup
(7, 7, 24), -- Trophée Joan Gamper

-- Paris Saint-Germain (PSG)
(7, 11, 1), -- Ligue 1
(7, 14, 2), -- Coupe de France
(7, 11, 3), -- Trophée des Champions (France)
(7, 9, 12), -- Coupe de la Ligue
(7, 1, 17), -- Ligue des Champions

-- Atletico Madrid
(8, 2, 17), -- UEFA Champions League
(8, 3, 18), -- UEFA Europa League
(8, 9, 7), -- Supercoppa Italiana
(8, 37, 4), -- Serie A
(8, 14, 7), -- Coppa Italia

-- Atlético Madrid
(9, 3, 18), -- UEFA Europa League
(9, 11, 14), -- La Liga
(9, 10, 17), -- Copa del Rey
(9, 1, 17), -- UEFA Champions League
(9, 4, 17), -- Supercopa de España
(9, 3, 19), -- UEFA Super Cup
(9, 1, 21), -- Audi Cup

-- Manchester United
(10, 3, 17), -- UEFA Champions League
(10, 1, 18), -- UEFA Europa League
(10, 20, 7), -- Premier League
(10, 12, 8), -- FA Cup
(10, 2, 13), -- DFL-Supercup
(10, 7, 9), -- League Cup
(10, 21, 10), -- Community Shield (Angleterre)
(10, 1, 19), -- UEFA Super Cup
(10, 1, 20), -- FIFA Club World Cup
(10, 1, 23), -- International Champions Cup

-- AS Roma
(11, 1, 27), -- UEFA Europa Conference League
(11, 2, 7), -- Supercoppa Italiana
(11, 3, 4), -- Serie A
(11, 9, 7), -- Coppa Italia
(11, 1, 12); -- Serie B
     
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Ulreich', 'Sven', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\SU.webp', 'G', 1),
  ('Davies', 'Alphonso', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\AD.webp', 'D', 1),
  ('Kim', 'Min-Jae', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\MJK.webp', 'D', 1),
  ('Upamecano', 'Dayot', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\DU.webp', 'D', 1),
  ('Mazraoui', 'Noussair', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\MN.webp', 'D', 1),
  ('Kimmich', 'Joshua', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\JK.webp', 'M', 1),
  ('Goretzka', 'Leon', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\LG.webp', 'M', 1),
  ('Coman', 'Kingsley', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\KC.webp', 'AT', 1),
  ('Musiala', 'Jamal', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\JM.webp', 'M', 1),
  ('Sané', 'Leroy', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\LS.webp', 'AT', 1),
  ('Kane', 'Harry', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\HK.webp', 'AT', 1);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Díaz', 'Luis', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\LD.webp', 'AT', 2),
  ('Núñez', 'Darwin', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\DN.webp', 'AT', 2),
  ('Salah', 'Mohamed', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\MS.webp', 'AT', 2),
  ('Jones', 'Curtis', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\CJ.webp', 'M', 2),
  ('Mac Allister', 'Alexis', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\AM.webp', 'M', 2),
  ('Szoboszlai', 'Dominik', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\DS.webp', 'M', 2),
  ('Robertson', 'Andrew', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\AR.webp', 'D', 2),
  ('van Dijk', 'Virgil', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\VV.webp', 'D', 2),
  ('Matip', 'Joel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\JM.webp', 'D', 2),
  ('Alexander-Arnold', 'Trent', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\TA.webp', 'D', 2),
  ('Becker', 'Alisson', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\AB.webp', 'G', 2);
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES 
  ('Haaland', 'Erling', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\EH.webp', 'AT', 3),
  ('Grealish', 'Jack', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\JG1.webp', 'M', 3),
  ('Alvarez', 'Julian', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\JA.webp', 'AT', 3),
  ('Foden', 'Phil', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\PF.webp', 'M', 3),
  ('Kovačić', 'Mateo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\MK.webp', 'M', 3),
  ('Rodri', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\HR.webp', 'M', 3),
  ('Gvardiol', 'Josko', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\JG2.webp', 'D', 3),
  ('Dias', 'Rúben', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\RD.webp', 'D', 3),
  ('Akanji', 'Manuel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\MA.webp', 'D', 3),
  ('Walker', 'Kyle', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\KW.webp', 'D', 3),
  ('Ederson', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\E.webp', 'G', 3);


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Vinicius', 'Junior', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\VJ.webp', 'AT', 4),
    ('Joselu', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\J.webp', 'AT', 4),
    ('Bellingham', 'Jude', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\JB.webp', 'M', 4),
    ('Camavinga', 'Eduardo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\EC.webp', 'M', 4),
    ('Tchouameni', 'Aurélien', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\AT.webp', 'M', 4),
    ('Valverde', 'Federico', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\FV.webp', 'M', 4),
    ('Garcia', 'Fran', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\FG.webp', 'D', 4),
    ('Alaba', 'David', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\DA.webp', 'D', 4),
    ('Rudiger', 'Antonio', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\AR.webp', 'D', 4),
    ('Carvajal', 'Dani', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\DC.webp', 'D', 4),
    ('Kepa', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\AK.webp', 'G', 4);


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Mudryk', 'Mykhailo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\MM.webp', 'AT', 5),
    ('Fernández', 'Enzo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\EF.webp', 'M', 5),
    ('Sterling', 'Raheem', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\RS.webp', 'AT', 5),
    ('Jackson', 'Nicolas', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\NJ.webp', 'AT', 5),
    ('Caicedo', 'Moisés', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\MC.webp', 'M', 5),
    ('Gallagher', 'Conor', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\CG.webp', 'M', 5),
    ('Cucurella', 'Marc', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\CM.webp', 'D', 5),
    ('Colwill', 'Levi', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\LC.webp', 'D', 5),
    ('Silva', 'Thiago', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\TS.webp', 'D', 5),
    ('Gusto', 'Malo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\GM.webp', 'D', 5),
    ('Sánchez', 'Robert', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\RS.webp', 'G', 5);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Félix', 'João', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\JF.webp', 'AT', 6),
  ('Lewandowski', 'Robert', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\RL.webp', 'AT', 6),
  ('Yamal', 'Lamine', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\LY.webp', 'AT', 6),
  ('Gündoğan', 'İlkay', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\IG.webp', 'M', 6),
  ('Romeu', 'Oriol', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\OR.webp', 'M', 6),
  ('Gavi', '', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\PMPG.webp', 'M', 6),
  ('Baldé', '', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\ABM.webp', 'D', 6),
  ('Christensen', 'Andreas', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\AC.webp', 'D', 6),
  ('Koundé', 'Jules', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\JK.webp', 'D', 6),
  ('Cancelo', 'João', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\JC.webp', 'D', 6),
  ('ter Stegen', 'Marc-André', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\MAT.webp', 'G', 6);


  
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Mbappé', 'Kylian', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\KM.webp', 'AT', 7),
  ('Ramos', 'Goncalo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\GR.webp', 'AT', 7),
  ('Dembélé', 'Ousmane', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\OD.webp', 'AT', 7),
  ('Vitinha', '', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\V.webp', 'M', 7),
  ('Ugarte', 'Manuel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\MU.webp', 'M', 7),
  ('Zaire-Emery', 'Warren', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\WZE.webp', 'M', 7),
  ('Hernández', 'Lucas', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\LH.webp', 'D', 7),
  ('Skriniar', 'Milan', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\MS.webp', 'D', 7),
  ('Marquinhos', '', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\M.webp', 'D', 7),
  ('Hakimi', 'Achraf', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\AH.webp', 'D', 7),
  ('Donnarumma', 'Gianluigi', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\GD.webp', 'G', 7);
q


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Chiesa', 'Federico', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\CF.webp', 'AT', 8),
    ('Kostić', 'Filip', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\FK.webp', 'M', 8),
    ('Rabiot', 'Adrien', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\AR.webp', 'M', 8),
    ('Locatelli', 'Manuel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\ML.webp', 'M', 8),
    ('Miretti', 'Fabio', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\FM.webp', 'M', 8),
    ('McKennie', 'Weston', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\WM.webp', 'M', 8),
    ('Danilo', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\D.webp', 'D', 8),
    ('Bremer', 'Gleison', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\BG.webp', 'D', 8),
    ('Gatti', 'Federico', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\FG.webp', 'D', 8),
    ('Vlahović', 'Dušan', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\DV.webp', 'AT', 8),


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Morata', 'Álvaro', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\MA.webp', 'AT', 9),
    ('Ñíguez', 'Saúl', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\NS.webp', 'M', 9),
    ('Koke', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\K.webp', 'M', 9),
    ('Griezmann', 'Antoine', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\GA.webp', 'AT', 9),
    ('Llorente', 'Marcos', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\LM.webp', 'M', 9),
    ('Riquelme', 'Rodrigo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\RR.webp', 'M', 9),
    ('Molina', 'Nahuel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\MN.webp', 'D', 9),
    ('Hermoso', 'Mario', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\HM.webp', 'D', 9),
    ('Witsel', 'Axel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\WA.webp', 'M', 9),
    ('Savić', 'Stefan', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\SS.webp', 'D', 9),
    ('Oblak', 'Jan', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\JO.webp', 'G', 9);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Rashford', 'Marcus', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\RM.webp', 'AT', 10),
    ('Fernandes', 'Bruno', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\FB.webp', 'M', 10),
    ('Antony', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\A.webp', 'AT', 10),
    ('Eriksen', 'Christian', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\CE.webp', 'M', 10),
    ('Casemiro', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\C.webp', 'M', 10),
    ('Dalot', 'Diogo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\DD.webp', 'D', 10),
    ('Evans', 'Jonny', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\JE.webp', 'D', 10),
    ('Maguire', 'Harry', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\HM.webp', 'D', 10),
    ('Wan-Bissaka', 'Aaron', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\WA.webp', 'D', 10),
    ('Onana', 'André', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\AO.webp', 'G', 10),
    ('Højlund', 'Rasmus', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\HR.webp', 'AT', 10);


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Lukaku', 'Romelu', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\LR.webp', 'AT', 11),
    ('Dybala', 'Paulo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\DP.webp', 'AT', 11),
    ('Zalewski', 'Nicola', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\NZ.webp', 'M', 11),
    ('Aouar', 'Houssem', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\HA.webp', 'M', 11),
    ('Paredes', 'Leandro', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\LP.webp', 'M', 11),
    ('Cristante', 'Bryan', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\BC.webp', 'M', 11),
    ('Kristensen', 'Rasmus', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\RK.webp', 'D', 11),
    ('Nidcka', 'Emil', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\NE.webp', 'D', 11),
    ('Llorente', 'Diego', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\DL.webp', 'D', 11),
    ('Mancini', 'Gianluca', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\MG.webp', 'D', 11),
    ('Patricio', 'Rui', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\PR.webp', 'G', 11);


-- Sélectionnez tous les enregistrements de la table Club
SELECT * FROM Club;

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
    entraineur VARCHAR(255),
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
    FOREIGN KEY (idPays) REFERENCES Pays(id)
);

-- Création de la table Joueur
CREATE TABLE IF NOT EXISTS Joueur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    prenom VARCHAR(277) NOT NULL,
    photo BLOB,
    dateNais DATE,
    poste VARCHAR(277),
    idClub INT,
    FOREIGN KEY (idClub) REFERENCES Club(id)
);

-- Création de la table Trophee
CREATE TABLE IF NOT EXISTS Trophee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL
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
INSERT INTO Ligue (nom, idPays) VALUES
('Bundesliga', 1),
('Premier League', 2),
('La Liga', 3),
('Ligue 1', 4),
('Serie A', 5);

-- Insertion de données dans la table Club
INSERT INTO Club (nom, stade, descr, dateCrea, idLigue, descrStade, photoStade, entraineur, photoEntraineur) VALUES
('Bayern', 'Allianz Arena', 'Club de football basé à Munich, Allemagne', '1900-02-27', 1, ),
('Liverpool', 'Anfield', 'Club de football historique de la Premier League anglaise', '1892-03-17', 2),
('Man City', 'Etihad Stadium', 'Club de football de Manchester jouant en Premier League', '1880-04-16', 2),
('Real Madrid', 'Santiago Bernabéu', 'Club de football espagnol de la ville de Madrid', '1902-03-06', 3),
('Chelsea', 'Stamford Bridge', 'Club de football londonien de Premier League', '1905-03-10', 2),
('Barcelona', 'Camp Nou', 'Club de football de Barcelone un des plus reconnus au monde', '1899-11-29', 3),
('PSG', 'Parc des Princes', 'Club de football français basé à Paris', '1970-08-12', 4),
('Juventus', 'Allianz Stadium', 'Club de football italien situé à Turin', '1897-11-01', 5),
('Atlético de Madrid', 'Wanda Metropolitano', 'Club de football basé à Madrid, Espagne', '1903-04-26', 3),
('Man United', 'Old Trafford', 'Club de football anglais basé à Manchester, très populaire mondialement', '1878-01-01', 2),
('Roma', 'Stadio Olimpico', 'Club de football basé à Rome, Italie', '1927-07-22', 5);

-- Insertion de données dans la table Trophee
INSERT INTO Trophee (nom) VALUES
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
('2022', 6, 6),
('2022', 7, 7),
('2022', 8, 8),
('2022', 9, 9),
('2022', 10, 10);



INSERT INTO Classement (club_id, annee, position) VALUES
('2023', 2, 1),  -- Bayern
('2023', 4, 2),  -- Liverpool
('2023', 1, 3),  -- Man City
('2023', 7, 4),  -- Man City
('2023', 3, 7),  -- Chelsea
('2023', 9, 6),  -- Barcelona
('2023', 6, 7),  -- Paris
('2023', 8, 8),  -- Juventus
('2023', 7, 9),  -- Man United
('2023', 10, 11); -- Roma


-- Insertion de données dans la table Obtenir (association entre Clubs et Trophées)
INSERT INTO Obtenir (idClub, nombre, idTrophee) VALUES
-- Bayern Munich
(1, 6, 17), -- Ligue des Champions
(1, 1, 18), -- UEFA Europa League
(1, 33, 11), -- Bundesliga
(1, 20, 12), -- DFB Pokal
(1, 2, 19), -- Super Coupe UEFA
(1, 10, 9), -- Super Cup (Community Shield)
(1, 2, 20), -- FIFA Club World Cup (CM Clubs)
(1, 3, 21), -- Audi Cup

-- Liverpool
(2, 6, 17), -- Ligue des Champions
(2, 3, 18), -- UEFA Europa League
(2, 19, 7), -- Premier League
(2, 8, 8), -- FA Cup
(2, 4, 7), -- League Championship
(2, 9, 6), -- League Cup
(2, 16, 10), -- Community Shield (Angleterre)
(2, 4, 19), -- Super Coupe UEFA
(2, 1, 20), -- Cdm club
(2, 1, 22), -- Premier League asia trophy

-- Manchester City
(3, 1, 17), -- Ligue des Champions
(3, 9, 7), -- Premier League
(3, 7, 8), -- FA Cup
(3, 7, 6), -- League Championship
(3, 8, 9), -- League Cup
(3, 6, 10), -- Community Shield (Angleterre)

-- Man City
(4, 14, 17), -- Ligue des Champions
(4, 2, 18), -- UEFA Europa League
(4, 37, 14), -- Liga
(4, 20, 17), -- Coupe du Roi
(4, 10, 16), -- Supercopa de España
(4, 4, 19), -- Super Coupe UEFA
(4, 7, 20), -- CM Clubs
(4, 1, 23), -- International Champions Cup

-- Chelsea
(7, 2, 17), -- Ligue des Champions
(7, 2, 18), -- UEFA Europa League
(7, 6, 7), -- Premier League
(7, 8, 8), -- FA Cup
(7, 2, 7), -- League Championship
(7, 7, 6), -- League Cup
(7, 4, 10), -- Community Shield (Angleterre)
(7, 2, 19), -- Super Coupe UEFA
(7, 1, 20), -- CM Clubs

-- FC Barcelone
(6, 7, 17), -- Ligue des Champions
(6, 27, 14), -- Liga
(6, 31, 17), -- Coupe du Roi
(6, 14, 16), -- Supercopa de España
(6, 7, 19), -- Super Coupe UEFA
(6, 3, 20), -- CM Clubs
(6, 1, 21), -- Audi Cup
(6, 6, 24), -- Trophée Joan Gamper

-- Paris Saint-Germain (PSG)
(7, 11, 1), -- Ligue 1
(7, 14, 2), -- Coupe de France
(7, 11, 3), -- Trophée des Champions (France)
(7, 9, 12), -- Coupe de la Ligue
(7, 1, 17), -- Ligue des Champions

-- Juventus
(8, 2, 17), -- UEFA Champions League
(8, 3, 18), -- UEFA Europa League
(8, 9, 6), -- Supercoppa Italiana
(8, 36, 4), -- Serie A
(8, 14, 7), -- Coppa Italia

-- Atlético Madrid
(9, 3, 18), -- UEFA Europa League
(9, 11, 14), -- La Liga
(9, 10, 17), -- Copa del Rey
(9, 1, 17), -- UEFA Champions League
(9, 4, 16), -- Supercopa de España
(9, 3, 19), -- UEFA Super Cup
(9, 1, 21), -- Audi Cup

-- Manchester United
(10, 3, 17), -- UEFA Champions League
(10, 1, 18), -- UEFA Europa League
(10, 20, 7), -- Premier League
(10, 12, 8), -- FA Cup
(10, 2, 13), -- DFL-Supercup
(10, 6, 9), -- League Cup
(10, 21, 10), -- Community Shield (Angleterre)
(10, 1, 19), -- UEFA Super Cup
(10, 1, 20), -- FIFA Club World Cup
(10, 1, 23), -- International Champions Cup

-- AS Roma
(11, 1, 27), -- UEFA Europa Conference League
(11, 2, 6), -- Supercoppa Italiana
(11, 3, 4), -- Serie A
(11, 9, 7), -- Coppa Italia
(11, 1, 12); -- Serie B
     
INSERT INTO Joueur (nom, prenom, photo, dateNais, poste, idClub)
VALUES
  ('Ulreich', 'Sven', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\SU.webp', '1988-08-03', 'Gardien', 1),
  ('Davies', 'Alphonso', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\AD.webp', '2000-11-02', 'Défenseur', 1),
  ('Kim', 'Min-Jae', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\MJK.webp', '1996-11-17', 'Défenseur', 1),
  ('Upamecano', 'Dayot', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\DU.webp', '1998-10-27', 'Défenseur', 1),
  ('Mazraoui', 'Noussair', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\MN.webp', '1997-11-14', 'Défenseur', 1),
  ('Kimmich', 'Joshua', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\JK.webp', '1997-02-08', 'Milieu', 1),
  ('Goretzka', 'Leon', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\LG.webp', '1997-02-06', 'Milieu', 1),
  ('Coman', 'Kingsley', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\KC.webp', '1996-06-13', 'Attaquant', 1),
  ('Musiala', 'Jamal', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\JM.webp', '2003-02-26', 'Milieu', 1),
  ('Sané', 'Leroy', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\LS.webp', '1996-01-11', 'Attaquant', 1),
  ('Kane', 'Harry', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\HK.webp', '1993-07-28', 'Attaquant', 1);

INSERT INTO Joueur (nom, prenom, photo, dateNais, poste, idClub)
VALUES
  ('Díaz', 'Luis', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\LD.webp', '1997-01-13', 'Attaquant', 2),
  ('Núñez', 'Darwin', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\DN.webp', '1999-06-24', 'Attaquant', 2),
  ('Salah', 'Mohamed', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\MS.webp', '1992-06-17', 'Attaquant', 2),
  ('Jones', 'Curtis', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\CJ.webp', '2001-01-30', 'Milieu', 2),
  ('Mac Allister', 'Alexis', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\AM.webp', '1998-12-24', 'Milieu', 2),
  ('Szoboszlai', 'Dominik', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\DS.webp', '2000-10-27', 'Milieu', 2),
  ('Robertson', 'Andrew', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\AR.webp', '1994-03-11', 'Défenseur', 2),
  ('van Dijk', 'Virgil', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\VV.webp', '1991-07-08', 'Défenseur', 2),
  ('Matip', 'Joel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\JM.webp', '1991-08-08', 'Défenseur', 2),
  ('Alexander-Arnold', 'Trent', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\TA.webp', '1998-10-07', 'Défenseur', 2),
  ('Becker', 'Alisson', 'Gardien','E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\AB.webp','1992-10-02','Gardien' 2);

INSERT INTO Joueur (nom, prenom, photo, poste, dateNaissance, idClub)
VALUES 
  ('Haaland', 'Erling', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\EH.webp', 'Attaquant', '2000-07-21', 3),
  ('Grealish', 'Jack', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\JG1.webp', 'Milieu', '1997-09-10', 3),
  ('Alvarez', 'Julian', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\JA.webp', 'Attaquant', '2000-01-31', 3),
  ('Foden', 'Phil', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\PF.webp', 'Milieu', '2000-07-28', 3),
  ('Kovačić', 'Mateo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\MK.webp', 'Milieu', '1994-07-06', 3),
  ('Rodri', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\HR.webp', 'Milieu', '1996-06-22', 3),
  ('Gvardiol', 'Josko', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\JG2.webp', 'Défenseur', '2002-01-23', 3),4
  ('Dias', 'Rúben', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\RD.webp', 'Défenseur', '1997-07-14', 3),
  ('Akanji', 'Manuel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\MA.webp', 'Défenseur', '1997-07-19', 3),
  ('Walker', 'Kyle', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\KW.webp', 'Défenseur', '1990-07-28', 3),
  ('Ederson', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\E.webp', 'Gardien', '1993-08-17', 3);

INSERT INTO Joueur (nom, prenom, photo, poste, dateNaissance, idClub)
VALUES
    ('Vinicius', 'Junior', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\VJ.webp', 'Attaquant', '2000-07-12', 4),
    ('Joselu', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\J.webp', 'Attaquant', '1990-03-27', 4),
    ('Bellingham', 'Jude', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\JB.webp', 'Milieu', '2003-06-29', 4),
    ('Camavinga', 'Eduardo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\EC.webp', 'Milieu', '2002-11-10', 4),
    ('Tchouameni', 'Aurélien', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\AT.webp', 'Milieu', '2000-01-27', 4),
    ('Valverde', 'Federico', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\FV.webp', 'Milieu', '1998-07-22', 4),
    ('Garcia', 'Fran', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\FG.webp', 'Défenseur', '1999-08-14', 4),
    ('Alaba', 'David', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\DA.webp', 'Défenseur', '1992-06-24', 4),
    ('Rudiger', 'Antonio', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\AR.webp', 'Défenseur', '1993-03-03', 4),
    ('Carvajal', 'Dani', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\DC.webp', 'Défenseur', '1992-01-11', 4),
    ('Kepa', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\AK.webp', 'Gardien', '1994-10-03', 4);

INSERT INTO Joueur (nom, prenom, photo, poste, dateNaissance, idClub)
VALUES
  ('Mbappé', 'Kylian', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\KM.webp', 'Attaquant', '1998-12-20', 7),
  ('Ramos', 'Goncalo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\GR.webp', 'Attaquant', '2001-06-20', 7),
  ('Dembélé', 'Ousmane', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\OD.webp', 'Attaquant', '1997-05-15', 7),
  ('Vitinha', '', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Equipe4\V.webp', 'Milieu', '2000-02-13', 7),
  ('Ugarte', 'Manuel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Equipe5\MU.webp', 'Milieu', '2001-04-11', 7),
  ('Zaire-Emery', 'Warren', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\WZE.webp', 'Milieu', '2006-03-08', 7),
  ('Hernández', 'Lucas', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Equipe7\LH.webp', 'Défenseur', '1996-02-14', 7),
  ('Skriniar', 'Milan', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Equipe8\MS.webp', 'Défenseur', '1995-02-11', 7),
  ('Marquinhos', '', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Equipe9\M.webp', 'Défenseur', '1994-05-14', 7),
  ('Hakimi', 'Achraf', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Equipe10\AH.webp', 'Défenseur', '1998-11-04', 7),
  ('Donnarumma', 'Gianluigi', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Equipe11\GD.webp', 'Gardien', '1999-02-25', 7);

INSERT INTO Joueur (nom, prenom, photo, poste, dateNaissance, idClub)
VALUES
  ('Félix', 'João', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\JF.webp', 'Attaquant', '1999-11-10', 6),
  ('Lewandowski', 'Robert', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\RL.webp', 'Attaquant', '1988-08-21', 6),
  ('Yamal', 'Lamine', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\LY.webp', 'Attaquant', '2007-07-10', 6),
  ('Gündoğan', 'İlkay', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\IG.webp', 'Milieu', '1990-10-24', 6),
  ('Romeu', 'Oriol', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\OR.webp', 'Milieu', '1991-09-24', 6),
  ('Gavi', '', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\PMPG.webp', 'Milieu', '2004-08-05', 6),
  ('Baldé', '', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\ABM.webp', 'Défenseur', '2003-10-18', 6),
  ('Christensen', 'Andreas', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\AC.webp', 'Défenseur', '1996-04-10', 6),
  ('Koundé', 'Jules', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\JK.webp', 'Défenseur', '1998-11-12', 6),
  ('Cancelo', 'João', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\JC.webp', 'Défenseur', '1994-05-27', 6),
  ('ter Stegen', 'Marc-André', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\MAT.webp', 'Gardien', '1992-04-30', 6);

INSERT INTO Joueur (nom, prenom, poste, idClub) VALUES ('Lukaku', 'Romelu', 'Attaquant', 1);
INSERT INTO Joueur (nom, prenom, poste, idClub) VALUES ('Dybala', 'Paulo', 'Attaquant', 1);
INSERT INTO Joueur (nom, prenom, poste, idClub) VALUES ('Zalewski', 'Nicola', 'Milieu', 1);
INSERT INTO Joueur (nom, prenom, poste, idClub) VALUES ('Aouar', 'Houssem', 'Milieu', 1);
INSERT INTO Joueur (nom, prenom, poste, idClub) VALUES ('Paredes', 'Leandro', 'Milieu', 1);
INSERT INTO Joueur (nom, prenom, poste, idClub) VALUES ('Cristante', 'Bryan', 'Milieu', 1);
INSERT INTO Joueur (nom, prenom, poste, idClub) VALUES ('Kristensen', 'Rasmus', 'Défenseur', 1);
INSERT INTO Joueur (nom, prenom, poste, idClub) VALUES ('Nidcka', 'Emil', 'Défenseur', 1);
INSERT INTO Joueur (nom, prenom, poste, idClub) VALUES ('Llorente', 'Diego', 'Défenseur', 1);
INSERT INTO Joueur (nom, prenom, poste, idClub) VALUES ('Mancini', 'Gianluca', 'Défenseur', 1);
INSERT INTO Joueur (nom, prenom, poste, idClub) VALUES ('Patricio', 'Rui', 'Gardien', 1);


-- Sélectionnez tous les enregistrements de la table Club
SELECT * FROM Club;

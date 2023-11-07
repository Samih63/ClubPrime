-- Supprimer la base de données si elle existe déjà
DROP DATABASE IF EXISTS bdClubPrime;

-- Créer la base de données
CREATE DATABASE bdClubPrime;

-- Utiliser la base de données
USE bdClubPrime;

-- Création de la table Club
CREATE TABLE IF NOT EXISTS Club (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    stade VARCHAR(255),
    descr VARCHAR(255),
    dateCrea DATE,
    idLigue INT,
    FOREIGN KEY (idLigue) REFERENCES Ligue(id)
);

-- Création de la table Pays
CREATE TABLE IF NOT EXISTS Pays (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

-- Création de la table Ligue
CREATE TABLE IF NOT EXISTS Ligue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    idPays INT,
    FOREIGN KEY (idPays) REFERENCES Pays(id)
);

-- Création de la table Joueur
CREATE TABLE IF NOT EXISTS Joueur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    photo BLOB,
    dateNais DATE,
    poste VARCHAR(255),
    idClub INT,
    FOREIGN KEY (idClub) REFERENCES Club(id)
);

-- Création de la table Trophee
CREATE TABLE IF NOT EXISTS Trophee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
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
    lib VARCHAR(255) NOT NULL
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
   nom VARCHAR(255) NOT NULL,
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
INSERT INTO Club (nom, stade, descr, dateCrea, idLigue) VALUES
('Bayern', 'Allianz Arena', 'Club de football basé à Munich, Allemagne', '1900-02-27', 1),
('Liverpool', 'Anfield', 'Club de football historique de la Premier League anglaise', '1892-03-15', 2),
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
('2022', 5, 5),
('2022', 6, 6),
('2022', 7, 7),
('2022', 8, 8),
('2022', 9, 9),
('2022', 10, 10);

-- Insertion de données dans la table Obtenir (association entre Clubs et Trophées)
IINSERT INTO Obtenir (idClub, nombre, idTrophee) VALUES
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
(2, 4, 5), -- League Championship
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

-- Real Madrid
(4, 14, 17), -- Ligue des Champions
(4, 2, 18), -- UEFA Europa League
(4, 35, 14), -- Liga
(4, 20, 15), -- Coupe du Roi
(4, 10, 16), -- Supercopa de España
(4, 4, 19), -- Super Coupe UEFA
(4, 5, 20), -- CM Clubs
(4, 1, 23), -- International Champions Cup

-- Chelsea
(5, 2, 17), -- Ligue des Champions
(5, 2, 18), -- UEFA Europa League
(5, 6, 7), -- Premier League
(5, 8, 8), -- FA Cup
(5, 2, 5), -- League Championship
(5, 5, 6), -- League Cup
(5, 4, 10), -- Community Shield (Angleterre)
(5, 2, 19), -- Super Coupe UEFA
(5, 1, 20), -- CM Clubs

-- FC Barcelone
(6, 5, 17), -- Ligue des Champions
(6, 27, 14), -- Liga
(6, 31, 15), -- Coupe du Roi
(6, 14, 16), -- Supercopa de España
(6, 5, 19), -- Super Coupe UEFA
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
(8, 14, 5), -- Coppa Italia

-- Atlético Madrid
(9, 3, 18), -- UEFA Europa League
(9, 11, 14), -- La Liga
(9, 10, 15), -- Copa del Rey
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
(11, 1, 25), -- UEFA Europa Conference League
(11, 2, 6), -- Supercoppa Italiana
(11, 3, 4), -- Serie A
(11, 9, 5), -- Coppa Italia
(11, 1, 12); -- Serie B

-- Sélectionnez tous les enregistrements de la table Club
SELECT * FROM Club;

-- Sélectionnez tous les enregistrements de la table Club
SELECT * FROM Club;
-- dzdzdzdzd--

CREATE DATABASE IF NOT EXISTS bloog_db;
USE bloog_db;

DROP TABLE IF EXISTS Commentaire;
DROP TABLE IF EXISTS Article;
DROP TABLE IF EXISTS Utilisateur;

CREATE TABLE Utilisateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    mot_de_passe VARCHAR(50),
    date_inscription DATE
);

CREATE TABLE Article (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
    contenu TEXT,
    date_pub DATE,
    id_utilisateur INT,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id)
);

CREATE TABLE Commentaire (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contenu TEXT NOT NULL,
    date_commentaire DATE,
    id_article INT,
    FOREIGN KEY (id_article) REFERENCES Article(id)
);

--CHAPITRE 4 :

INSERT INTO Utilisateur (nom, email, mot_de_passe)
VALUES ('Alice', 'alice@test.com', '1234');

INSERT INTO Article (titre, contenu, date_pub, id_utilisateur)
VALUES ('Bienvenue sur le blog', 'Ceci est le premier article.', '2025-07-18', 1);

INSERT INTO Utilisateur (nom, email, mot_de_passe)
VALUES 
  ('Bob', 'bob@test.com', 'passbob'),
  ('Charlie', 'charlie@test.com', 'passcharlie');

SELECT * FROM Utilisateur;
SELECT * FROM Article;

SELECT a.titre, a.date_pub, u.nom
FROM Article a
INNER JOIN Utilisateur u ON a.id_utilisateur = u.id;

SELECT a.titre, u.nom
FROM Article a
INNER JOIN Utilisateur u ON a.id_utilisateur = u.id
WHERE u.nom = 'Alice';

--CHAPITRE 3 :

SELECT a.titre, u.nom
FROM Article a
LEFT JOIN Utilisateur u ON a.id_utilisateur = u.id;

INSERT INTO Commentaire (contenu, date_commentaire, id_article)
VALUES ('Très clair, merci!', '2025-07-19', 1);

SELECT a.titre, u.nom, c.contenu
FROM Article a
INNER JOIN Utilisateur u ON a.id_utilisateur = u.id
INNER JOIN Commentaire c ON a.id = c.id_article;


--CHAPITRE 5:

SET nom = 'Alice Dupont', email = 'alice.dupont@test.com'
WHERE id = 1;

UPDATE Article
SET titre = 'Article mis à jour'
WHERE id_utilisateur = 1;

DELETE FROM Commentaire
WHERE id = 1;

DELETE FROM Article
WHERE date_pub < '2024-01-01';

SELECT * FROM Utilisateur;
SELECT * FROM Article;
SELECT * FROM Commentaire;

--chapitre 6 :

START TRANSACTION;

INSERT INTO Article (titre, contenu, date_pub, id_utilisateur)
VALUES ('Nouveau post', 'Texte exemple', '2025-07-18', 1);

UPDATE Utilisateur
SET email = 'alice.update@test.com'
WHERE id = 1;

DELETE FROM Commentaire
WHERE id = 3;

COMMIT;

SELECT * FROM Article;
SELECT * FROM Utilisateur;
SELECT * FROM Commentaire;

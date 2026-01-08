CREATE DATABASE bloog_db;
use bloog_db;
CREATE TABLE Utilisateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    date_inscription DATE
);
CREATE TABLE Article (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
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

SELECT a.titre, a.date_pub, u.nom
FROM Article a
INNER JOIN Utilisateur u ON a.id_utilisateur = u.id;

SELECT a.titre, u.nom
FROM Article a
INNER JOIN Utilisateur u ON a.id_utilisateur = u.id
WHERE u.nom = 'Alice';

SELECT a.titre, u.nom
FROM Article a
LEFT JOIN Utilisateur u ON a.id_utilisateur = u.id;

SELECT a.titre, u.nom, c.contenu
FROM Article a
INNER JOIN Utilisateur u ON a.id_utilisateur = u.id
INNER JOIN Commentaire c ON a.id = c.id_article;



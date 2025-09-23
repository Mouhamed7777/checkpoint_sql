DROP DATABASE IF EXISTS gestion_employes;
CREATE DATABASE gestion_employes;
USE gestion_employes;
CREATE TABLE Departement (
    Num_S INT PRIMARY KEY,
    Libelle VARCHAR(100) NOT NULL,
    Responsable VARCHAR(100) NOT NULL
);
CREATE TABLE Employe (
    Num_E INT PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    Poste VARCHAR(100) NOT NULL,
    Salaire DECIMAL(12,2) NOT NULL CHECK (Salaire >= 0),
    Num_S INT NOT NULL,
    CONSTRAINT FK_Employe_Dep FOREIGN KEY (Num_S)
        REFERENCES Departement(Num_S)
        ON UPDATE CASCADE 
        ON DELETE RESTRICT
);
CREATE TABLE Projet (
    Num_P INT PRIMARY KEY,
    Titre VARCHAR(150) NOT NULL,
    Date_Debut DATE NOT NULL,
    Date_Fin DATE NOT NULL,
    Num_S INT NOT NULL,
    CONSTRAINT CK_Projet_Dates CHECK (Date_Fin >= Date_Debut),
    CONSTRAINT FK_Projet_Dep FOREIGN KEY (Num_S)
        REFERENCES Departement(Num_S)
        ON UPDATE CASCADE 
        ON DELETE RESTRICT
);
CREATE TABLE Participation (
    Num_E INT NOT NULL,
    Num_P INT NOT NULL,
    Role VARCHAR(100) NOT NULL,
    PRIMARY KEY (Num_E, Num_P),
    CONSTRAINT FK_Part_Emp FOREIGN KEY (Num_E)
        REFERENCES Employe(Num_E)
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
    CONSTRAINT FK_Part_Proj FOREIGN KEY (Num_P)
        REFERENCES Projet(Num_P)
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);
-- Insérer des départements
INSERT INTO Departement (Num_S, Libelle, Responsable) VALUES
(1, 'Informatique', 'Alioune DIOP'),
(2, 'Ressources Humaines', 'Fatou SOW');

-- Insérer des employés
INSERT INTO Employe (Num_E, Nom, Poste, Salaire, Num_S) VALUES
(101, 'Mamadou NDIAYE', 'Développeur', 450000, 1),
(102, 'Aminata BA', 'Admin Systèmes', 600000, 1),
(103, 'Ousmane FALL', 'Chargé RH', 350000, 2);

-- Insérer des projets
INSERT INTO Projet (Num_P, Titre, Date_Debut, Date_Fin, Num_S) VALUES
(1001, 'Application Mobile', '2025-01-10', '2025-06-30', 1),
(1002, 'Recrutement 2025', '2025-02-01', '2025-05-15', 2);

-- Associer les employés aux projets
INSERT INTO Participation (Num_E, Num_P, Role) VALUES
(101, 1001, 'Développement Back-End'),
(102, 1001, 'Chef de Projet'),
(103, 1002, 'Coordinateur RH');
SELECT * FROM Departement;
SELECT * FROM Employe;
SELECT * FROM Projet;
SELECT * FROM Participation;
SELECT e.Num_E, e.Nom, e.Poste, d.Libelle AS Departement
FROM Employe e
JOIN Departement d ON e.Num_S = d.Num_S;
SELECT p.Num_P, p.Titre, p.Date_Debut, p.Date_Fin, d.Libelle AS Departement
FROM Projet p
JOIN Departement d ON p.Num_S = d.Num_S;
SELECT p.Titre, e.Nom, ep.Role
FROM Participation ep
JOIN Employe e ON ep.Num_E = e.Num_E
JOIN Projet p ON ep.Num_P = p.Num_P
WHERE p.Num_P = 1001;  -- Exemple : projet "Application Mobile"
SELECT d.Libelle AS Departement, d.Responsable, p.Titre AS Projet
FROM Departement d
LEFT JOIN Projet p ON d.Num_S = p.Num_S;
SELECT d.Libelle, SUM(e.Salaire) AS Masse_Salariale
FROM Employe e
JOIN Departement d ON e.Num_S = d.Num_S
GROUP BY d.Libelle;
SELECT d.Libelle, SUM(e.Salaire) AS Masse_Salariale
FROM Employe e
JOIN Departement d ON e.Num_S = d.Num_S
GROUP BY d.Libelle;
SHOW TABLES;
DESCRIBE Employe;
INSERT INTO Departement (Num_S, Intitule, Nom_Manager) 
VALUES (1, 'Informatique', 'Alioune DIOP');

INSERT INTO Employe (Num_E, Nom, Position, Salaire, Department_Num_S) 
VALUES (101, 'Mamadou NDIAYE', 'Développeur', 450000, 1);

SELECT * FROM Employe;

-- ===========================
-- Création de la base
-- ===========================
DROP DATABASE IF EXISTS gestion_employes;
CREATE DATABASE gestion_employes;
USE gestion_employes;

-- ===========================
-- Table : Departement
-- ===========================
CREATE TABLE Departement (
    Num_S INT PRIMARY KEY,
    Intitule VARCHAR(255),
    Nom_Manager VARCHAR(255)
);

-- ===========================
-- Table : Employe
-- ===========================
CREATE TABLE Employe (
    Num_E INT PRIMARY KEY,
    Nom VARCHAR(255),
    Position VARCHAR(255),
    Salaire DECIMAL(10,2),
    Department_Num_S INT,
    FOREIGN KEY (Department_Num_S) REFERENCES Departement(Num_S)
);

-- ===========================
-- Table : Projet
-- ===========================
CREATE TABLE Projet (
    Num_P INT PRIMARY KEY,
    Titre VARCHAR(255),
    Date_debut DATE,
    Date_fin DATE,
    Department_Num_S INT,
    FOREIGN KEY (Department_Num_S) REFERENCES Departement(Num_S)
);

-- ===========================
-- Table : Employe_Projet
-- ===========================
CREATE TABLE Employe_Projet (
    Employe_Num_E INT,
    Projet_Num_P INT,
    Role VARCHAR(255),
    PRIMARY KEY (Employe_Num_E, Projet_Num_P),
    FOREIGN KEY (Employe_Num_E) REFERENCES Employe(Num_E),
    FOREIGN KEY (Projet_Num_P) REFERENCES Projet(Num_P)
);

-- ===========================
-- Insertion des données
-- ===========================

-- Départements
INSERT INTO Departement (Num_S, Intitule, Nom_Manager) VALUES
(1, 'IT', 'Alice Johnson'),
(2, 'HR', 'Bob Smith'),
(3, 'Marketing', 'Clara Bennett');

-- Employés
INSERT INTO Employe (Num_E, Nom, Position, Salaire, Department_Num_S) VALUES
(101, 'John Doe', 'Développeur', 60000.00, 1),
(102, 'Jane Smith', 'Analyste', 55000.00, 2),
(103, 'Mike Brown', 'Concepteur', 50000.00, 3),
(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);

-- Projets
INSERT INTO Projet (Num_P, Titre, Date_debut, Date_fin, Department_Num_S) VALUES
(201, 'Refonte du site web', '2024-01-15', '2024-06-30', 1),
(202, 'Onboarding des employés', '2024-03-01', '2024-09-01', 2),
(203, 'Market Research', '2024-02-01', '2024-07-31', 3),
(204, 'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1);

-- Participation des employés aux projets
INSERT INTO Employe_Projet (Employe_Num_E, Projet_Num_P, Role) VALUES
(101, 201, 'Développeur Frontend'),
(104, 201, 'Développeur Backend'),
(102, 202, 'Formateur'),
(105, 202, 'Coordinateur'),
(103, 203, 'Responsable de la recherche'),
(101, 204, 'Spécialiste réseau');

-- ===========================
-- Mise à jour
-- ===========================
UPDATE Employe_Projet
SET Role = 'Full Stack Developer'
WHERE Employe_Num_E = 101;

-- ===========================
-- Suppression
-- ===========================
DELETE FROM Employe_Projet WHERE Employe_Num_E = 103;
DELETE FROM Employe WHERE Num_E = 103;

-- ===========================
-- Requêtes de vérification
-- ===========================

-- Voir tous les départements
SELECT * FROM Departement;

-- Voir tous les employés (vérifier que 103 n’existe plus)
SELECT * FROM Employe;

-- Voir tous les projets
SELECT * FROM Projet;

-- Voir les participations (vérifier que 101 = Full Stack Developer et 103 supprimé)
SELECT * FROM Employe_Projet;

-- Vérifier spécifiquement l’employé 101
SELECT * FROM Employe_Projet WHERE Employe_Num_E = 101;

-- Vérifier si l’employé 103 est bien supprimé
SELECT * FROM Employe WHERE Num_E = 103;
SELECT * FROM Employe_Projet WHERE Employe_Num_E = 103;

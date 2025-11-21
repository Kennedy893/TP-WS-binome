CREATE TABLE Etudiant(
   id SERIAL,
   nom VARCHAR(50) ,
   prenoms VARCHAR(50) ,
   date_naissance DATE,
   lieu_naissance VARCHAR(50) ,
   num_inscription VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE Semestre(
   id SERIAL,
   nom_semestre VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE UniteEnseignement(
    id SERIAL,
    id_semestre INTEGER,
    code_ue VARCHAR(50) ,
    nom_ue VARCHAR(100) ,
    credit INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(id_semestre) REFERENCES Semestre(id)
);

CREATE TABLE Statut_Note(
   id SERIAL,
   label VARCHAR(50) ,
   note_min NUMERIC(6,2)  ,
   note_max NUMERIC(6,2)  ,
   PRIMARY KEY(id)
);

CREATE TABLE Session(
   id SERIAL,
   date_session DATE,
   PRIMARY KEY(id)
);

CREATE TABLE Option(
   id SERIAL,
   label VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE Notes(
   id SERIAL,
   id_semestre INTEGER,
   id_ue INTEGER,
   id_statut_note INTEGER,
   valeur NUMERIC(6,2),
   PRIMARY KEY(id),
   FOREIGN KEY(id_semestre) REFERENCES Semestre(id),
   FOREIGN KEY(id_statut_note) REFERENCES Statut_Note(id),
   FOREIGN KEY(id_ue) REFERENCES UniteEnseignement(id)
);

CREATE TABLE Inscription(
   id SERIAL,
   date_inscription DATE,
   date_debut DATE,
   date_fin DATE,
   id_semestre INTEGER NOT NULL,
   id_ue INTEGER NOT NULL,
   id_note INTEGER NOT NULL,
   id_session INTEGER NOT NULL,
   id_etudiant INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_semestre) REFERENCES Semestre(id),
   FOREIGN KEY(id_ue) REFERENCES UniteEnseignement(id),
   FOREIGN KEY(id_note) REFERENCES Notes(id),
   FOREIGN KEY(id_session) REFERENCES Session(id),
   FOREIGN KEY(id_etudiant) REFERENCES Etudiant(id)
);

CREATE TABLE Matiere_Optionnel(
    id SERIAL,
    id_semestre INTEGER,
    id_ue INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(id_semestre) REFERENCES Semestre(id),
    FOREIGN KEY(id_ue) REFERENCES UniteEnseignement(id)
);

ALTER TABLE Matiere_Optionnel
ADD COLUMN id_option INTEGER,
ADD CONSTRAINT fk_option
    FOREIGN KEY(id_option) REFERENCES Option(id);



-- etudiants
INSERT INTO Etudiant(nom, prenoms, date_naissance, lieu_naissance, num_inscription) VALUES
('ARIVELO', 'Kennedy', '2005-04-08', 'Antananarivo', 'ETU003107'),
('ANDRIANARIZAKA', 'Marie', '2001-11-20', 'Fianarantsoa', 'E002'),
('RABE', 'Hery', '2003-02-10', 'Antsirabe', 'E003');

-- Semestres
INSERT INTO Semestre(nom_semestre) VALUES
('Semestre 1'), 
('Semestre 2'),
('Semestre 3'), 
('Semestre 4'); 

-- UE
INSERT INTO UniteEnseignement(id_semestre, code_ue, nom_ue, credit) VALUES
(1, 'INF101', 'Programmation procedurale', 7),
(1, 'INF104', 'HTML et Introduction au Web', 5),
(1, 'INF107', 'Informatique de Base', 4),
(1, 'MTH101', 'Arithmetique et nombres', 4),
(1, 'MTH102', 'Analyse mathematique', 6),
(1, 'ORG101', 'Techniques de communication', 4);
INSERT INTO UniteEnseignement(id_semestre, code_ue, nom_ue, credit) VALUES
(2, 'INF102', 'Bases de donnees relationnelles', 5),
(2, 'INF103', 'Bases de l administration système', 5),
(2, 'INF105', 'Maintenance materiel et logiciel', 4),
(2, 'INF106', 'Complements de programmation', 6),
(2, 'MTH103', 'Calcul Vectoriel et Matriciel', 6),
(2, 'MTH105', 'Probabilite et Statistique', 4);
INSERT INTO UniteEnseignement(id_semestre, code_ue, nom_ue, credit) VALUES
(3, 'INF201', 'Programmation orientee objet', 6),
(3, 'INF202', 'Bases de donnees objets', 6),
(3, 'INF203', 'Programmation système', 4),
(3, 'INF208', 'Reseaux informatiques', 6),
(3, 'MTH201', 'Methodes numeriques', 4),
(3, 'ORG201', 'Bases de gestion', 4);
-- UE de 6 crédits (optionnelles ou communes)
INSERT INTO UniteEnseignement (id_semestre, code_ue, nom_ue, credit) VALUES
(4, 'INF204', 'Système d information géographique', 6),
(4, 'INF205', 'Système d information', 6),
(4, 'INF206', 'Interface Homme/Machine', 6),
(4, 'INF207', 'Eléments d algorithmique', 6),
(4, 'INF209', 'Web dynamique', 6);

-- Mini-projets (10 crédits)
INSERT INTO UniteEnseignement (id_semestre, code_ue, nom_ue, credit) VALUES
(4, 'INF210', 'Mini-projet de développement', 10),
(4, 'INF211', 'Mini-projet de bases de données et/ou de réseaux', 10),
(4, 'INF212', 'Mini-projet de Web et design', 10);

-- UE de 4 crédits (optionnelles)
INSERT INTO UniteEnseignement (id_semestre, code_ue, nom_ue, credit) VALUES
(4, 'MTH202', 'Analyse des donnees', 4),
(4, 'MTH204', 'Geometrie', 4),
(4, 'MTH205', 'Équations differentielles', 4),
(4, 'MTH206', 'Optimisation', 4),
(4, 'MTH203', 'MAO', 4);

INSERT INTO Matiere_Optionnel (id_semestre, id_ue) VALUES
-- Choix 1 parmi (INF204, INF205, INF206)
(4, 25),  -- INF204
(4, 26),  -- INF205
(4, 27),  -- INF206
-- Choix 2 parmi (MTH204, MTH205, MTH206)
(4, 34),  -- MTH204
(4, 35),  -- MTH205
(4, 36);  -- MTH206

INSERT INTO Matiere_Optionnel (id_semestre, id_ue) VALUES
-- Choix 1 parmi (INF204, INF206, INF207)
(4, 25),  -- INF204
(4, 27),  -- INF206
(4, 28),  -- INF207
-- Choix 2 parmi (MTH202, MTH205, MTH206)
(4, 33),  -- MTH202
(4, 35),  -- MTH205
(4, 36);  -- MTH206

INSERT INTO Matiere_Optionnel (id_semestre, id_ue) VALUES
-- Choix 1 parmi (INF204, INF205, INF206)
(4, 25),  -- INF204
(4, 26),  -- INF205
(4, 27),  -- INF206
-- Choix 2 parmi (MTH202, MTH204, MTH206)
(4, 33),  -- MTH202
(4, 34),  -- MTH204
(4, 36);  -- MTH206


-- Statut_Note
INSERT INTO Statut_Note(label, note_min, note_max) VALUES
('A', 16, 20),
('B', 14, 15.99),
('C', 12, 13.99),
('D', 10, 11.99),
('E', 0, 9.99);

-- Session
INSERT INTO Session(date_session) VALUES
('2025-06-01'),
('2025-12-01');

-- Notes
-- Semestre 1
INSERT INTO Notes(id_semestre, id_ue, id_statut_note, valeur) VALUES
(1, 1, 2, 15.0),
(1, 2, 3, 12.5),
(1, 3, 2, 14.0),
(1, 4, 1, 17.0),
(1, 5, 2, 15.5),
(1, 6, 3, 13.0);

-- Semestre 2
INSERT INTO Notes(id_semestre, id_ue, id_statut_note, valeur) VALUES
(2, 7, 2, 14.5),
(2, 8, 2, 15.0),
(2, 9, 3, 12.0),
(2, 10, 1, 16.5),
(2, 11, 2, 15.0),
(2, 12, 3, 13.5);

-- Semestre 3
INSERT INTO Notes(id_semestre, id_ue, id_statut_note, valeur) VALUES
(3, 13, 2, 14.0),
(3, 14, 1, 17.5),
(3, 15, 3, 12.5),
(3, 16, 2, 15.0),
(3, 17, 3, 12.0),
(3, 18, 2, 14.5);

-- semestre 4
INSERT INTO Notes (id_semestre, id_ue, id_statut_note, valeur) VALUES
(4, 25, 1, 12.50),  -- INF204
(4, 26, 1, 14.00),  -- INF205
(4, 27, 1, 13.75),  -- INF206
(4, 28, 1, 11.00),  -- INF207
(4, 29, 1, 15.25),  -- INF209
(4, 30, 1, 16.00),  -- INF210
(4, 31, 1, 14.50),  -- INF211
(4, 32, 1, 17.00),  -- INF212
(4, 33, 1, 13.00),  -- MTH202
(4, 34, 1, 12.00),  -- MTH204
(4, 35, 1, 10.25),  -- MTH205
(4, 36, 1, 11.75),  -- MTH206
(4, 37, 1, 15.00);  -- MTH203



-- Inscriptions
-- etudiant 1 (Jean) sur Semestres 1 à 3
INSERT INTO Inscription(date_inscription, date_debut, date_fin, id_semestre, id_ue, id_note, id_session, id_etudiant) VALUES
('2025-01-10','2025-01-15','2025-06-10',1,1,1,1,1),
('2025-01-10','2025-01-15','2025-06-10',1,2,2,1,1),
('2025-01-10','2025-01-15','2025-06-10',1,3,3,1,1),
('2025-01-10','2025-01-15','2025-06-10',1,4,4,1,1),
('2025-01-10','2025-01-15','2025-06-10',1,5,5,1,1),
('2025-01-10','2025-01-15','2025-06-10',1,6,6,1,1),

('2025-07-01','2025-07-05','2025-12-10',2,7,7,2,1),
('2025-07-01','2025-07-05','2025-12-10',2,8,8,2,1),
('2025-07-01','2025-07-05','2025-12-10',2,9,9,2,1),
('2025-07-01','2025-07-05','2025-12-10',2,10,10,2,1),
('2025-07-01','2025-07-05','2025-12-10',2,11,11,2,1),
('2025-07-01','2025-07-05','2025-12-10',2,12,12,2,1),

('2026-01-10','2026-01-15','2026-06-10',3,13,13,1,1),
('2026-01-10','2026-01-15','2026-06-10',3,14,14,1,1),
('2026-01-10','2026-01-15','2026-06-10',3,15,15,1,1),
('2026-01-10','2026-01-15','2026-06-10',3,16,16,1,1),
('2026-01-10','2026-01-15','2026-06-10',3,17,17,1,1),
('2026-01-10','2026-01-15','2026-06-10',3,18,18,1,1);
INSERT INTO Inscription (date_inscription, date_debut, date_fin, id_semestre, id_ue, id_note, id_session, id_etudiant) VALUES
('2025-01-10', '2025-01-10', '2025-06-30', 4, 25, 19, 1, 1),
('2025-01-10', '2025-01-10', '2025-06-30', 4, 26, 20, 1, 1),
('2025-01-10', '2025-01-10', '2025-06-30', 4, 27, 21, 1, 1),
('2025-01-10', '2025-01-10', '2025-06-30', 4, 28, 22, 1, 1),
('2025-01-10', '2025-01-10', '2025-06-30', 4, 29, 23, 1, 1),
('2025-01-10', '2025-01-10', '2025-06-30', 4, 30, 24, 1, 1),
('2025-01-10', '2025-01-10', '2025-06-30', 4, 31, 25, 1, 1),
('2025-01-10', '2025-01-10', '2025-06-30', 4, 32, 26, 1, 1),
('2025-01-10', '2025-01-10', '2025-06-30', 4, 33, 27, 1, 1),
('2025-01-10', '2025-01-10', '2025-06-30', 4, 34, 28, 1, 1),
('2025-01-10', '2025-01-10', '2025-06-30', 4, 35, 29, 1, 1),
('2025-01-10', '2025-01-10', '2025-06-30', 4, 36, 30, 1, 1),
('2025-01-10', '2025-01-10', '2025-06-30', 4, 37, 31, 1, 1);


-- Options
INSERT INTO Option(label) VALUES
('Programmation'), 
('Web'),
('BDD');


-- Matiere_Optionnel
INSERT INTO Matiere_Optionnel(id_semestre, id_ue) VALUES
(1, 2), 
(2, 4);

-- Option 1 : Développement
UPDATE Matiere_Optionnel SET id_option = 1
WHERE id_semestre = 4 AND id_ue IN (26,27,33,34,35);

-- Option 2 : Bases de Données et Réseaux
UPDATE Matiere_Optionnel SET id_option = 2
WHERE id_semestre = 4 AND id_ue IN (27,28,33,35,36);

-- Option 3 : Web et Design
UPDATE Matiere_Optionnel SET id_option = 3
WHERE id_semestre = 4 AND id_ue IN (26,27,33,34,36);


-- Développement (id_option = 1)
UPDATE Matiere_Optionnel SET id_option = 1 
WHERE id IN (1,3,4,11,6,18);

-- Bases de Données et Réseaux (id_option = 2)
UPDATE Matiere_Optionnel SET id_option = 2
WHERE id IN (5,8,10,12,14,17);

-- Web et Design (id_option = 3)
UPDATE Matiere_Optionnel SET id_option = 3
WHERE id IN (2,7,9,13,15,16);




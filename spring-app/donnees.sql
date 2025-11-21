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


-- Options
INSERT INTO Option(label) VALUES
('Programmation'), 
('Web'),
('BDD');


-- Matiere_Optionnel
INSERT INTO Matiere_Optionnel(id_semestre, id_ue) VALUES
(1, 2), 
(2, 4);

-- Insertion des étudiants
INSERT INTO Etudiant (nom, prenoms, date_naissance, lieu_naissance, num_inscription) VALUES
('Rajao', 'Jean Claude', '2000-03-15', 'Antananarivo', 'ETU001'),
('Rakotomalala', 'Marie Sophie', '2000-07-22', 'Antsirabe', 'ETU002'),
('Razaka', 'Pierre Thomas', '2000-01-08', 'Fianarantsoa', 'ETU003'),
('Randria', 'Sarah Mialy', '2000-11-30', 'Mahajanga', 'ETU004'),
('Rasoa', 'Marc Heriniaina', '2000-05-14', 'Toamasina', 'ETU005');

-- Insertion des sessions
INSERT INTO Session (date_session) VALUES
('2023-01-15'), -- Session 1
('2023-06-10'), -- Session 2  
('2024-01-20'), -- Session 3
('2024-06-05'); -- Session 4

-- Insertion des options
INSERT INTO Option (label) VALUES
('Option 1'),
('Option 2'),
('Option 3');

-- Mise à jour des matières optionnelles avec leurs options
UPDATE Matiere_Optionnel SET id_option = 1 WHERE id IN (1, 2, 3, 4, 5, 6);
UPDATE Matiere_Optionnel SET id_option = 2 WHERE id IN (7, 8, 9, 10, 11, 12);
UPDATE Matiere_Optionnel SET id_option = 3 WHERE id IN (13, 14, 15, 16, 17, 18);

-- Insertion des notes pour tous les étudiants sur les 4 semestres
-- Note: Cette partie est simplifiée, en réalité il faudrait créer les inscriptions d'abord

-- Étudiant 1: Rajao Jean Claude (notes moyennes)
INSERT INTO Notes (id_semestre, id_ue, id_statut_note, valeur) VALUES
-- Semestre 1
(1, 1, 2, 14.5), (1, 2, 3, 12.5), (1, 3, 2, 15.0), (1, 4, 3, 13.0), (1, 5, 2, 14.0), (1, 6, 2, 15.5),
-- Semestre 2  
(2, 7, 3, 12.0), (2, 8, 2, 14.5), (2, 9, 3, 11.5), (2, 10, 2, 15.0), (2, 11, 2, 14.5), (2, 12, 3, 12.5),
-- Semestre 3
(3, 13, 2, 14.0), (3, 14, 2, 15.5), (3, 15, 3, 12.0), (3, 16, 2, 14.5), (3, 17, 3, 13.0), (3, 18, 2, 15.0),
-- Semestre 4 - Option 1
(4, 25, 2, 14.5), (4, 33, 2, 15.0), (4, 31, 1, 16.5);

-- Étudiant 2: Rakotomalala Marie Sophie (bonnes notes)
INSERT INTO Notes (id_semestre, id_ue, id_statut_note, valeur) VALUES
-- Semestre 1
(1, 1, 1, 17.0), (1, 2, 1, 16.5), (1, 3, 1, 18.0), (1, 4, 2, 15.0), (1, 5, 1, 17.5), (1, 6, 1, 16.0),
-- Semestre 2
(2, 7, 1, 16.5), (2, 8, 1, 17.0), (2, 9, 2, 15.5), (2, 10, 1, 18.0), (2, 11, 1, 17.5), (2, 12, 2, 15.0),
-- Semestre 3
(3, 13, 1, 17.0), (3, 14, 1, 18.5), (3, 15, 2, 15.5), (3, 16, 1, 17.0), (3, 17, 2, 14.5), (3, 18, 1, 16.5),
-- Semestre 4 - Option 2
(4, 27, 1, 17.5), (4, 35, 1, 18.0), (4, 32, 1, 17.0);

-- Étudiant 3: Razaka Pierre Thomas (notes variables)
INSERT INTO Notes (id_semestre, id_ue, id_statut_note, valeur) VALUES
-- Semestre 1
(1, 1, 3, 12.0), (1, 2, 4, 10.5), (1, 3, 3, 11.0), (1, 4, 2, 14.5), (1, 5, 3, 12.5), (1, 6, 4, 9.5),
-- Semestre 2
(2, 7, 4, 10.0), (2, 8, 3, 11.5), (2, 9, 4, 8.5), (2, 10, 3, 12.0), (2, 11, 2, 14.0), (2, 12, 3, 11.0),
-- Semestre 3
(3, 13, 3, 12.5), (3, 14, 2, 14.0), (3, 15, 4, 9.0), (3, 16, 3, 11.5), (3, 17, 2, 15.0), (3, 18, 3, 12.0),
-- Semestre 4 - Option 3
(4, 26, 3, 13.0), (4, 36, 2, 14.5), (4, 30, 3, 12.5);

-- Étudiant 4: Randria Sarah Mialy (excellentes notes)
INSERT INTO Notes (id_semestre, id_ue, id_statut_note, valeur) VALUES
-- Semestre 1
(1, 1, 1, 19.0), (1, 2, 1, 18.5), (1, 3, 1, 19.5), (1, 4, 1, 17.0), (1, 5, 1, 18.0), (1, 6, 1, 19.0),
-- Semestre 2
(2, 7, 1, 18.5), (2, 8, 1, 19.0), (2, 9, 1, 17.5), (2, 10, 1, 19.5), (2, 11, 1, 18.0), (2, 12, 1, 17.0),
-- Semestre 3
(3, 13, 1, 19.0), (3, 14, 1, 18.5), (3, 15, 1, 17.0), (3, 16, 1, 19.0), (3, 17, 1, 18.5), (3, 18, 1, 19.5),
-- Semestre 4 - Option 1
(4, 25, 1, 18.0), (4, 33, 1, 19.0), (4, 31, 1, 17.5);

-- Étudiant 5: Rasoa Marc Heriniaina (notes moyennes+)
INSERT INTO Notes (id_semestre, id_ue, id_statut_note, valeur) VALUES
-- Semestre 1
(1, 1, 2, 15.0), (1, 2, 2, 14.5), (1, 3, 2, 16.0), (1, 4, 3, 13.5), (1, 5, 2, 15.5), (1, 6, 2, 14.0),
-- Semestre 2
(2, 7, 2, 14.0), (2, 8, 2, 15.5), (2, 9, 3, 12.5), (2, 10, 2, 16.0), (2, 11, 2, 15.0), (2, 12, 2, 14.5),
-- Semestre 3
(3, 13, 2, 15.5), (3, 14, 2, 16.0), (3, 15, 2, 14.0), (3, 16, 2, 15.0), (3, 17, 3, 13.0), (3, 18, 2, 14.5),
-- Semestre 4 - Option 2
(4, 27, 2, 15.0), (4, 35, 2, 16.5), (4, 32, 2, 14.5);

-- Insertion des inscriptions pour tous les étudiants
-- Note: Cette partie est simplifiée pour l'exemple
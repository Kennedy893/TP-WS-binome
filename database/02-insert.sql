-- Years
INSERT INTO year ("value", label) VALUES
  (1, 'L1'),
  (2, 'L2');

-- Semesters (S1,S2 in L1; S3,S4 in L2)
INSERT INTO semester (label, yearId) VALUES
  ('S1', (SELECT yearId FROM year WHERE label = 'L1')),
  ('S2', (SELECT yearId FROM year WHERE label = 'L1')),
  ('S3', (SELECT yearId FROM year WHERE label = 'L2')),
  ('S4', (SELECT yearId FROM year WHERE label = 'L2'));

-- Majors
INSERT INTO major (label) VALUES
  ('informatique'),
  ('design');

-- Specializations
INSERT INTO specialization (label) VALUES
  ('Connaissances Scientifiques et Techniques de Base'),
  ('Développement'),
  ('Bases de Données et Réseaux'),
  ('Web et Design');

-- =========================
-- S1 (CSTB - Informatique)
-- =========================
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('INF101', 'Programmation procédurale', 7, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S1')),
  ('INF104', 'HTML et Introduction au Web', 5, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S1')),
  ('INF107', 'Informatique de Base', 4, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S1')),
  ('MTH101', 'Arithmétique et nombres', 4, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S1')),
  ('MTH102', 'Analyse mathématique', 6, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S1')),
  ('ORG101', 'Techniques de communication', 4, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S1'));

-- =========================
-- S2 (CSTB - Informatique)
-- =========================
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('INF102', 'Bases de données relationnelles', 5, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S2')),
  ('INF103', 'Bases de l’administration système', 5, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S2')),
  ('INF105', 'Maintenance matériel et logiciel', 4, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S2')),
  ('INF106', 'Compléments de programmation', 6, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S2')),
  ('MTH103', 'Calcul Vectoriel et Matriciel', 6, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S2')),
  ('MTH105', 'Probabilité et Statistique', 4, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S2'));

-- =========================
-- S3 (CSTB - Informatique)
-- =========================
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('INF201', 'Programmation orientée objet', 6, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S3')),
  ('INF202', 'Bases de données objets', 6, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S3')),
  ('INF203', 'Programmation système', 4, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S3')),
  ('INF208', 'Réseaux informatiques', 6, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S3')),
  ('MTH201', 'Méthodes numériques', 4, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S3')),
  ('ORG201', 'Bases de gestion', 4, NULL,
    (SELECT specializationId FROM specialization WHERE label='Connaissances Scientifiques et Techniques de Base'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S3'));

-- =======================================
-- S4 - Parcours Développement (Informatique)
-- =======================================
-- Groupe d’options 1 (6 crédits)
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('INF204', 'Système d’information géographique', 6, 1,
    (SELECT specializationId FROM specialization WHERE label='Développement'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('INF205', 'Système d’information', 6, 1,
    (SELECT specializationId FROM specialization WHERE label='Développement'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('INF206', 'Interface Homme/Machine', 6, 1,
    (SELECT specializationId FROM specialization WHERE label='Développement'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4'));

-- Obligatoires
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('INF207', 'Eléments d’algorithmique', 6, NULL,
    (SELECT specializationId FROM specialization WHERE label='Développement'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('INF210', 'Mini-projet de développement', 10, NULL,
    (SELECT specializationId FROM specialization WHERE label='Développement'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4'));

-- Groupe d’options 2 (4 crédits)
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('MTH204', 'Géométrie', 4, 2,
    (SELECT specializationId FROM specialization WHERE label='Développement'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('MTH205', 'Equations différentielles', 4, 2,
    (SELECT specializationId FROM specialization WHERE label='Développement'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('MTH206', 'Optimisation', 4, 2,
    (SELECT specializationId FROM specialization WHERE label='Développement'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4'));

-- Obligatoire
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('MTH203', 'MAO', 4, NULL,
    (SELECT specializationId FROM specialization WHERE label='Développement'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4'));

-- =================================================
-- S4 - Parcours Bases de Données et Réseaux (Info)
-- =================================================
-- Obligatoire
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('INF205', 'Système d’information', 6, NULL,
    (SELECT specializationId FROM specialization WHERE label='Bases de Données et Réseaux'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4'));

-- Groupe d’options 1 (6 crédits)
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('INF204', 'Système d’information géographique', 6, 1,
    (SELECT specializationId FROM specialization WHERE label='Bases de Données et Réseaux'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('INF206', 'Interface Homme/Machine', 6, 1,
    (SELECT specializationId FROM specialization WHERE label='Bases de Données et Réseaux'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('INF207', 'Eléments d’algorithmique', 6, 1,
    (SELECT specializationId FROM specialization WHERE label='Bases de Données et Réseaux'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4'));

-- Obligatoire
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('INF211', 'Mini-projet de bases de données et/ou de réseaux', 10, NULL,
    (SELECT specializationId FROM specialization WHERE label='Bases de Données et Réseaux'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4'));

-- Groupe d’options 2 (4 crédits)
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('MTH202', 'Analyse des données', 4, 2,
    (SELECT specializationId FROM specialization WHERE label='Bases de Données et Réseaux'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('MTH205', 'Equations différentielles', 4, 2,
    (SELECT specializationId FROM specialization WHERE label='Bases de Données et Réseaux'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('MTH206', 'Optimisation', 4, 2,
    (SELECT specializationId FROM specialization WHERE label='Bases de Données et Réseaux'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4'));

-- Obligatoire
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('MTH203', 'MAO', 4, NULL,
    (SELECT specializationId FROM specialization WHERE label='Bases de Données et Réseaux'),
    (SELECT majorId FROM major WHERE label='informatique'),
    (SELECT semesterId FROM semester WHERE label='S4'));

-- ===========================================
-- S4 - Parcours Web et Design (Major: design)
-- ===========================================
-- Groupe d’options 1 (6 crédits)
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('INF204', 'Système d’information géographique', 6, 1,
    (SELECT specializationId FROM specialization WHERE label='Web et Design'),
    (SELECT majorId FROM major WHERE label='design'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('INF205', 'Système d’information', 6, 1,
    (SELECT specializationId FROM specialization WHERE label='Web et Design'),
    (SELECT majorId FROM major WHERE label='design'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('INF206', 'Interface Homme/Machine', 6, 1,
    (SELECT specializationId FROM specialization WHERE label='Web et Design'),
    (SELECT majorId FROM major WHERE label='design'),
    (SELECT semesterId FROM semester WHERE label='S4'));

-- Obligatoires
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('INF209', 'Web dynamique', 6, NULL,
    (SELECT specializationId FROM specialization WHERE label='Web et Design'),
    (SELECT majorId FROM major WHERE label='design'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('INF212', 'Mini-projet de Web et design', 10, NULL,
    (SELECT specializationId FROM specialization WHERE label='Web et Design'),
    (SELECT majorId FROM major WHERE label='design'),
    (SELECT semesterId FROM semester WHERE label='S4'));

-- Groupe d’options 2 (4 crédits)
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('MTH202', 'Analyse des données', 4, 2,
    (SELECT specializationId FROM specialization WHERE label='Web et Design'),
    (SELECT majorId FROM major WHERE label='design'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('MTH204', 'Géométrie', 4, 2,
    (SELECT specializationId FROM specialization WHERE label='Web et Design'),
    (SELECT majorId FROM major WHERE label='design'),
    (SELECT semesterId FROM semester WHERE label='S4')),
  ('MTH206', 'Optimisation', 4, 2,
    (SELECT specializationId FROM specialization WHERE label='Web et Design'),
    (SELECT majorId FROM major WHERE label='design'),
    (SELECT semesterId FROM semester WHERE label='S4'));

-- Obligatoire
INSERT INTO teachingUnit (subjectCode, label, credit, isOptional, specializationId, majorId, semesterId) VALUES
  ('MTH203', 'MAO', 4, NULL,
    (SELECT specializationId FROM specialization WHERE label='Web et Design'),
    (SELECT majorId FROM major WHERE label='design'),
    (SELECT semesterId FROM semester WHERE label='S4'));
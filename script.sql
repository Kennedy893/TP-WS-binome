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

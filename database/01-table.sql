CREATE TABLE student (
   studentId SERIAL PRIMARY KEY,
   studentCode VARCHAR(50) NOT NULL,
   lastName VARCHAR(50),
   firstName VARCHAR(50),
   birthDate DATE
);

CREATE TABLE year (
   yearId SERIAL PRIMARY KEY,
   value INTEGER,
   label VARCHAR(50)
);

CREATE TABLE major (
   majorId SERIAL PRIMARY KEY,
   label VARCHAR(50)
);

CREATE TABLE session (
   sessionId SERIAL PRIMARY KEY,
   month INTEGER,
   year INTEGER
);

CREATE TABLE specialization (
   specializationId SERIAL PRIMARY KEY,
   label VARCHAR(100)
);

CREATE TABLE semester (
   semesterId SERIAL PRIMARY KEY,
   label VARCHAR(50),
   yearId INTEGER,
   FOREIGN KEY(yearId) REFERENCES year(yearId)
);

CREATE TABLE teachingUnit (
   teachingUnitId SERIAL PRIMARY KEY,
   subjectCode VARCHAR(50),
   label VARCHAR(50),
   credit INTEGER,
   isOptional INTEGER,
   specializationId INTEGER,
   majorId INTEGER NOT NULL,
   semesterId INTEGER,
   FOREIGN KEY(specializationId) REFERENCES specialization(specializationId),
   FOREIGN KEY(majorId) REFERENCES major(majorId),
   FOREIGN KEY(semesterId) REFERENCES semester(semesterId)
);

CREATE TABLE progress (
   progressId SERIAL PRIMARY KEY,
   registrationDate DATE,
   sessionId INTEGER NOT NULL,
   majorId INTEGER NOT NULL,
   studentId INTEGER NOT NULL,
   semesterId INTEGER NOT NULL,
   FOREIGN KEY(sessionId) REFERENCES session(sessionId),
   FOREIGN KEY(majorId) REFERENCES major(majorId),
   FOREIGN KEY(studentId) REFERENCES student(studentId),
   FOREIGN KEY(semesterId) REFERENCES semester(semesterId)
);

CREATE TABLE grade (
   gradeId SERIAL PRIMARY KEY,
   grade NUMERIC(15,2),
   progressId INTEGER NOT NULL,
   teachingUnitId INTEGER NOT NULL,
   FOREIGN KEY(progressId) REFERENCES progress(progressId),
   FOREIGN KEY(teachingUnitId) REFERENCES teachingUnit(teachingUnitId)
);
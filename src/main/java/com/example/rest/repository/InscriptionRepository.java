package com.example.rest.repository;

import com.example.rest.entity.Inscription;
import com.example.rest.entity.Notes;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface InscriptionRepository extends JpaRepository<Inscription, Long> 
{
    @Query("SELECT i.note FROM Inscription i WHERE i.etudiant.id = :etudiantId AND i.semestre.id = :semestreId")
    List<Notes> findNotesByEtudiantAndSemestre(
        @Param("etudiantId") Long etudiantId,
        @Param("semestreId") Long semestreId
    );
}

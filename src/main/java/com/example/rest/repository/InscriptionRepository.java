package com.example.rest.repository;

import com.example.rest.dto.NoteSemestreDTO;
import com.example.rest.entity.Inscription;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface InscriptionRepository extends JpaRepository<Inscription, Long> {
    
    @Query("SELECT new com.example.rest.dto.NoteSemestreDTO(e.nom, e.prenoms, s.nomSemestre, n.valeur) " +
            "FROM Inscription i " +
            "JOIN i.note n " +
            "JOIN n.semestre s " +
            "JOIN i.etudiant e " +
            "WHERE e.id = :etudiantId AND s.id = :semestreId")
    List<NoteSemestreDTO> findNotesByEtudiantAndSemestre(
            @Param("etudiantId") Long etudiantId,
            @Param("semestreId") Long semestreId);

}

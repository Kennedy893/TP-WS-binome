package com.example.rest.repository;

import com.example.rest.dto.NoteAnneeDTO;
import com.example.rest.dto.NoteSemestreDTO;
import com.example.rest.entity.Inscription;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface InscriptionRepository extends JpaRepository<Inscription, Long> {
    
    @Query("SELECT new com.example.rest.dto.NoteSemestreDTO(e.nom, e.prenoms, s.nomSemestre, n.valeur, ue.codeUE, ue.nomUE) " +
            "FROM Inscription i " +
            "JOIN i.note n " +
            "JOIN n.semestre s " +
            "JOIN UniteEnseignement ue ON n.idUe = ue.id " +
            "JOIN i.etudiant e " +
            "WHERE e.id = :etudiantId AND s.id = :semestreId")
    List<NoteSemestreDTO> findNotesByEtudiantAndSemestre(
            @Param("etudiantId") Long etudiantId,
            @Param("semestreId") Long semestreId);

    @Query("SELECT new com.example.rest.dto.NoteAnneeDTO(e.nom, e.prenoms, s.nomSemestre, ue.codeUE, ue.nomUE, n.valeur) " +
        "FROM Notes n " +
        "JOIN n.semestre s " +
        "JOIN UniteEnseignement ue ON n.idUe = ue.id " +
        "JOIN Inscription i ON i.idNote = n.id " +
        "JOIN i.etudiant e " +
        "WHERE e.id = :etudiantId AND s.id IN :semestreIds")
    List<NoteAnneeDTO> findNotesParEtudiantEtSemestres(
            @Param("etudiantId") Long etudiantId,
            @Param("semestreIds") List<Long> semestreIds);



}

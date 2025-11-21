package com.example.rest.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.rest.dto.NoteAnneeDTO;
import com.example.rest.dto.NoteSemestreDTO;
import com.example.rest.entity.Inscription;
import com.example.rest.dto.MoyenneSemestreDTO;

public interface InscriptionRepository extends JpaRepository<Inscription, Long> {

    @Query("SELECT new com.example.rest.dto.NoteSemestreDTO(e.nom, e.prenoms, s.nomSemestre, n.valeur, ue.codeUe, ue.nomUe) "
            +
            "FROM Inscription i " +
            "JOIN i.note n " +
            "JOIN n.semestre s " +
            "JOIN n.ue ue " +
            "JOIN i.etudiant e " +
            "WHERE e.id = :etudiantId AND s.id = :semestreId")
    List<NoteSemestreDTO> findNotesByEtudiantAndSemestre(
            @Param("etudiantId") Long etudiantId,
            @Param("semestreId") Long semestreId);

    @Query("SELECT new com.example.rest.dto.NoteAnneeDTO(e.nom, e.prenoms, s.nomSemestre, ue.codeUe, ue.nomUe, n.valeur) "
            +
            "FROM Notes n " +
            "JOIN n.semestre s " +
            "JOIN n.ue ue " +
            "JOIN Inscription i ON i.note = n " + // relation si possible, sinon adapte
            "JOIN i.etudiant e " +
            "WHERE e.id = :etudiantId AND s.id IN :semestreIds")
    List<NoteAnneeDTO> findNotesParEtudiantEtSemestres(
            @Param("etudiantId") Long etudiantId,
            @Param("semestreIds") List<Long> semestreIds);
        
    
//     @Query("SELECT new com.example.rest.dto.NoteSemestreDTO(" +
//        "e.nom, e.prenoms, s.nomSemestre, n.valeur, ue.codeUe, ue.nomUe) " +
//        "FROM Inscription i " +
//        "JOIN i.note n " +
//        "JOIN n.semestre s " +
//        "JOIN n.ue ue " +
//        "JOIN i.etudiant e " +
//        "JOIN MatiereOptionnel mo ON mo.ue = ue AND mo.semestre = s " +
//        "JOIN mo.option o " +
//        "WHERE e.id = :etudiantId " +
//        "AND s.id = :semestreId " +
//        "AND o.id = :optionId")
// List<NoteSemestreDTO> findNotesByEtudiantSemestreOption(
//        @Param("etudiantId") Long etudiantId,
//        @Param("semestreId") Long semestreId,
//        @Param("optionId") Long optionId);

        @Query("SELECT new com.example.rest.dto.NoteSemestreDTO(" +
        " e.nom, e.prenoms, s.nomSemestre, MAX(n.valeur), ue.codeUe, ue.nomUe) " +
        "FROM Inscription i " +
        "JOIN i.note n " +
        "JOIN n.semestre s " +
        "JOIN n.ue ue " +
        "JOIN i.etudiant e " +
        "JOIN MatiereOptionnel mo ON mo.ue = ue AND mo.semestre = s " +
        "WHERE e.id = :etudiantId " +
        "AND s.id = :semestreId " +
        "AND mo.option.id = :optionId " +
        "GROUP BY e.nom, e.prenoms, s.nomSemestre, ue.codeUe, ue.nomUe")
        List<NoteSemestreDTO> findNotesByEtudiantSemestreOption(
                @Param("etudiantId") Long etudiantId,
                @Param("semestreId") Long semestreId,
                @Param("optionId") Long optionId);

        // Moyenne par semestre
       @Query("SELECT new com.example.rest.dto.MoyenneSemestreDTO(" +
        " e.nom, e.prenoms, s.nomSemestre, AVG(CASE WHEN mo.id IS NOT NULL THEN maxOpt.valeur ELSE n.valeur END) ) " +
        "FROM Inscription i " +
        "JOIN i.note n " +
        "JOIN n.semestre s " +
        "JOIN i.etudiant e " +
        "LEFT JOIN MatiereOptionnel mo ON mo.ue = n.ue AND mo.semestre = s " +
        "LEFT JOIN Notes maxOpt ON maxOpt.ue = mo.ue AND maxOpt.id = (" +
        "   SELECT MAX(n2.id) FROM Notes n2 WHERE n2.ue = mo.ue AND n2.semestre = s" +
        ") " +
        "WHERE e.id = :etudiantId AND s.id = :semestreId " +
        "GROUP BY e.nom, e.prenoms, s.nomSemestre")
        List<MoyenneSemestreDTO> findMoyenneParSemestre(
        @Param("etudiantId") Long etudiantId,
        @Param("semestreId") Long semestreId);






}

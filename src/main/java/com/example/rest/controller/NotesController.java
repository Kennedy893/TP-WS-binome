package com.example.rest.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.rest.dto.NoteAnneeDTO;
import com.example.rest.dto.NoteSemestreDTO;
import com.example.rest.entity.ApiResponse;
import com.example.rest.service.InscriptionService;

@RestController
public class NotesController 
{
    private final InscriptionService inscriptionService;

    public NotesController(InscriptionService inscriptionService)
    {
        this.inscriptionService = inscriptionService;
    }
    
    // @GetMapping("/etudiant/{etudiantId}/semestre/{semestreId}")
    // public List<Notes> getNotesSemestre(
    //     @PathVariable Long etudiantId,
    //     @PathVariable Long semestreId
    // ) {
    //     return inscriptionService.getNotesBySemestreAndEtudiant(etudiantId, semestreId);
    // }

    @GetMapping("/etudiants/{etudiantId}/semestre/{semestreId}")
    public ApiResponse<List<NoteSemestreDTO>> getNotesSemestre(
            @PathVariable Long etudiantId,
            @PathVariable Long semestreId
    ) {
        List<NoteSemestreDTO> notes = inscriptionService.getNotesBySemestreAndEtudiant(etudiantId, semestreId);

        if (notes.isEmpty()) {
            return ApiResponse.error("Aucune note trouvée pour cet étudiant et ce semestre.");
        }

        return ApiResponse.success("Notes récupérées avec succès.", notes);
    }

    @GetMapping("/etudiants/{etudiantId}/annee/{annee}")
    public ApiResponse<List<NoteAnneeDTO>> getNotesAnnee(
            @PathVariable Long etudiantId,
            @PathVariable int annee) 
    {

        List<NoteAnneeDTO> notes = inscriptionService.getNotesByEtudiantAndAnnee(etudiantId, annee);

        if (notes.isEmpty()) {
            return ApiResponse.error("Aucune note trouvée pour cet étudiant et cette année.");
        }

        return ApiResponse.success("Notes récupérées avec succès.", notes);
    }

    @GetMapping("/etudiants/{etudiantId}/semestre/{semestreId}/options/{optionId}")
    public ApiResponse<List<NoteSemestreDTO>> getNotesSemestreWithOption(
            @PathVariable Long etudiantId,
            @PathVariable Long semestreId,
            @PathVariable Long optionId
    ) {
        List<NoteSemestreDTO> notes = inscriptionService.getNotesBySemestreEtudiantAndOption(etudiantId, semestreId, optionId);

        if (notes.isEmpty()) {
            return ApiResponse.error("Aucune note trouvée pour cet étudiant, ce semestre et cette option.");
        }

        return ApiResponse.success("Notes récupérées avec succès.", notes);
    }


}

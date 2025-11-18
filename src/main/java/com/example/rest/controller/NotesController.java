package com.example.rest.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.rest.entity.ApiResponse;
import com.example.rest.entity.Notes;
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

    @GetMapping("/etudiant/{etudiantId}/semestre/{semestreId}")
    public ApiResponse<List<Notes>> getNotesSemestre(
            @PathVariable Long etudiantId,
            @PathVariable Long semestreId
    ) {
        List<Notes> notes = inscriptionService.getNotesBySemestreAndEtudiant(etudiantId, semestreId);

        if (notes.isEmpty()) {
            return ApiResponse.error("Aucune note trouvée pour cet étudiant et ce semestre.");
        }

        return ApiResponse.success("Notes récupérées avec succès.", notes);
    }

}

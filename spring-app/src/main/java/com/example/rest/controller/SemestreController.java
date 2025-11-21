package com.example.rest.controller;

import com.example.rest.service.*;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import com.example.rest.entity.*;
import java.util.List;
import com.example.rest.dto.EtudiantMoyenneDTO;

@CrossOrigin(origins = "*")
@RestController
public class SemestreController {

    private final SemestreService services;
    private final InscriptionService inscriptionService;

    public SemestreController (SemestreService s,InscriptionService i) {
        this.services = s;
        this.inscriptionService = i;
    }

    @GetMapping("/semestres/")
    public ApiResponse<List<Semestre>> getSemestres() {
        List<Semestre> semestres = services.findAll();
        return ApiResponse.success("Semestres récupérées avec succès.", semestres);
    }

    @GetMapping("/semestres/{semestreId}/etudiants/")
    public ApiResponse<List<EtudiantMoyenneDTO>> getSemestres(@PathVariable Long semestreId) {
        List<EtudiantMoyenneDTO> semestres = inscriptionService.getEtudiantMoyenne(semestreId);
        return ApiResponse.success("Semestres et etudiants avec succès.", semestres);
    }
}

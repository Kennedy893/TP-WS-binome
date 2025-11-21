package com.example.rest.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;
import com.example.rest.dto.*;
import com.example.rest.entity.ApiResponse;
import com.example.rest.service.EtudiantService;

@CrossOrigin(origins = "*")
@RestController
public class EtudiantsController 
{
    private final EtudiantService etudiantService;

    public EtudiantsController(EtudiantService etudiantService)
    {
        this.etudiantService = etudiantService;
    }

    @GetMapping("/etudiants/{etudiantId}")
    public ApiResponse<?> getEtudiantById(@PathVariable Long etudiantId) { 

        DetailsEtudiantDTO d = etudiantService.getDetailsEtudiantAvecBoucle(etudiantId);
        return ApiResponse.success("Details etudiants recuperers" , d);
    
    }

}
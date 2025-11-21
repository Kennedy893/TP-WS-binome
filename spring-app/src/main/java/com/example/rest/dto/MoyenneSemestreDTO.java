package com.example.rest.dto;

public class MoyenneSemestreDTO {
    private String nomEtudiant;
    private String prenomsEtudiant;
    private String nomSemestre;
    private Double moyenne;

    public MoyenneSemestreDTO(String nomEtudiant, String prenomsEtudiant, String nomSemestre, Double moyenne) {
        this.nomEtudiant = nomEtudiant;
        this.prenomsEtudiant = prenomsEtudiant;
        this.nomSemestre = nomSemestre;
        this.moyenne = moyenne;
    }

    // Getters et setters
    public String getNomEtudiant() { return nomEtudiant; }
    public void setNomEtudiant(String nomEtudiant) { this.nomEtudiant = nomEtudiant; }

    public String getPrenomsEtudiant() { return prenomsEtudiant; }
    public void setPrenomsEtudiant(String prenomsEtudiant) { this.prenomsEtudiant = prenomsEtudiant; }

    public String getNomSemestre() { return nomSemestre; }
    public void setNomSemestre(String nomSemestre) { this.nomSemestre = nomSemestre; }

    public Double getMoyenne() { return moyenne; }
    public void setMoyenne(Double moyenne) { this.moyenne = moyenne; }  
    
}

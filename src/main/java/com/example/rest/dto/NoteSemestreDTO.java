package com.example.rest.dto;

public class NoteSemestreDTO 
{
    private String nomEtudiant;
    private String prenomsEtudiant;
    private String nomSemestre;
    private Double valeurNote;

    public NoteSemestreDTO(String nomEtudiant, String prenomsEtudiant, String nomSemestre, Double valeurNote) {
        this.nomEtudiant = nomEtudiant;
        this.prenomsEtudiant = prenomsEtudiant;
        this.nomSemestre = nomSemestre;
        this.valeurNote = valeurNote;
    }

    // getters et setters
    public String getNomEtudiant() { return nomEtudiant; }
    public void setNomEtudiant(String nomEtudiant) { this.nomEtudiant = nomEtudiant; }

    public String getPrenomsEtudiant() { return prenomsEtudiant; }
    public void setPrenomsEtudiant(String prenomsEtudiant) { this.prenomsEtudiant = prenomsEtudiant; }

    public String getNomSemestre() { return nomSemestre; }
    public void setNomSemestre(String nomSemestre) { this.nomSemestre = nomSemestre; }

    public Double getValeurNote() { return valeurNote; }
    public void setValeurNote(Double valeurNote) { this.valeurNote = valeurNote; }
}

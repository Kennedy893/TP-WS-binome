package com.example.rest.dto;

public class NoteSemestreDTO 
{
    private String nomEtudiant;
    private String prenomsEtudiant;
    private String nomSemestre;
    private Double valeurNote;
    private String codeUE;
    private String nomUE;

    

    public NoteSemestreDTO(String nomEtudiant, String prenomsEtudiant, String nomSemestre, Double valeurNote, String codeUE, String nomUE) {
        this.nomEtudiant = nomEtudiant;
        this.prenomsEtudiant = prenomsEtudiant;
        this.nomSemestre = nomSemestre;
        this.valeurNote = valeurNote;
        this.codeUE = codeUE;
        this.nomUE = nomUE;
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

    public String getCodeUE() {
        return codeUE;
    }

    public void setCodeUE(String codeUE) {
        this.codeUE = codeUE;
    }

    public String getNomUE() {
        return nomUE;
    }

    public void setNomUE(String nomUE) {
        this.nomUE = nomUE;
    }


}

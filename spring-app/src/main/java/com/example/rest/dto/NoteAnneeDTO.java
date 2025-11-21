package com.example.rest.dto;

public class NoteAnneeDTO 
{
    private String nomEtudiant;
    private String prenomsEtudiant;
    private String nomSemestre;
    private String codeUE;
    private String nomUE;
    private Double valeurNote;

    public NoteAnneeDTO(String nomEtudiant, String prenomsEtudiant, String nomSemestre,
                        String codeUE, String nomUE, Double valeurNote) {
        this.nomEtudiant = nomEtudiant;
        this.prenomsEtudiant = prenomsEtudiant;
        this.nomSemestre = nomSemestre;
        this.codeUE = codeUE;
        this.nomUE = nomUE;
        this.valeurNote = valeurNote;
    }

    // Getters et setters
    public String getNomEtudiant() { return nomEtudiant; }
    public void setNomEtudiant(String nomEtudiant) { this.nomEtudiant = nomEtudiant; }

    public String getPrenomsEtudiant() { return prenomsEtudiant; }
    public void setPrenomsEtudiant(String prenomsEtudiant) { this.prenomsEtudiant = prenomsEtudiant; }

    public String getNomSemestre() { return nomSemestre; }
    public void setNomSemestre(String nomSemestre) { this.nomSemestre = nomSemestre; }

    public String getCodeUE() { return codeUE; }
    public void setCodeUE(String codeUE) { this.codeUE = codeUE; }

    public String getNomUE() { return nomUE; }
    public void setNomUE(String nomUE) { this.nomUE = nomUE; }

    public Double getValeurNote() { return valeurNote; }
    public void setValeurNote(Double valeurNote) { this.valeurNote = valeurNote; }
}

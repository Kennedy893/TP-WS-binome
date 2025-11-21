package com.example.rest.dto;

import java.io.Serializable;

public class EtudiantMoyenneDTO {
    private Long id;
    private String nom;
    private String prenoms;
    private String semestre;
    private double moyenne;
    
    // Constructeur par défaut
    public EtudiantMoyenneDTO() {
    }
    
    // Constructeur avec paramètres
    public EtudiantMoyenneDTO(Long id, String nom, String prenoms, String semestre, double moyenne) {
        this.id = id;
        this.nom = nom;
        this.prenoms = prenoms;
        this.semestre = semestre;
        this.moyenne = moyenne;
    }
    
    // Getters et Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getNom() {
        return nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public String getPrenoms() {
        return prenoms;
    }
    
    public void setPrenoms(String prenoms) {
        this.prenoms = prenoms;
    }
    
    public String getSemestre() {
        return semestre;
    }
    
    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }
    
    public double getMoyenne() {
        return moyenne;
    }
    
    public void setMoyenne(double moyenne) {
        this.moyenne = moyenne;
    }
    
}
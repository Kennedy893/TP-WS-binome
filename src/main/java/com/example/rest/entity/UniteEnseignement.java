package com.example.rest.entity;

import jakarta.persistence.*;

@Entity
public class UniteEnseignement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String codeUe;
    private String nomUe;
    private Integer credit;

    @ManyToOne
    @JoinColumn(name = "id_semestre")
    private Semestre semestre;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCodeUe() {
        return codeUe;
    }

    public void setCodeUe(String codeUe) {
        this.codeUe = codeUe;
    }

    public String getNomUe() {
        return nomUe;
    }

    public void setNomUe(String nomUe) {
        this.nomUe = nomUe;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public Semestre getSemestre() {
        return semestre;
    }

    public void setSemestre(Semestre semestre) {
        this.semestre = semestre;
    }
}


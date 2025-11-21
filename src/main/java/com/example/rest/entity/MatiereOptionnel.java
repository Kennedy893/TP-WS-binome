package com.example.rest.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "matiere_optionnel")
public class MatiereOptionnel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_semestre")
    private Semestre semestre;

    @ManyToOne
    @JoinColumn(name = "id_ue")
    private UniteEnseignement ue;

    @ManyToOne
    @JoinColumn(name = "id_option")
    private Option option;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Semestre getSemestre() {
        return semestre;
    }

    public void setSemestre(Semestre semestre) {
        this.semestre = semestre;
    }

    public UniteEnseignement getUe() {
        return ue;
    }

    public void setUe(UniteEnseignement ue) {
        this.ue = ue;
    }

    public Option getOption() {
        return option;
    }

    public void setOption(Option option) {
        this.option = option;
    }
}

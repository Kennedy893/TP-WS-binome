package com.example.rest.entity;

import jakarta.persistence.*;

@Entity
public class StatutNote {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String label;
    private Double noteMin;
    private Double noteMax;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Double getNoteMin() {
        return noteMin;
    }

    public void setNoteMin(Double noteMin) {
        this.noteMin = noteMin;
    }

    public Double getNoteMax() {
        return noteMax;
    }

    public void setNoteMax(Double noteMax) {
        this.noteMax = noteMax;
    }
}


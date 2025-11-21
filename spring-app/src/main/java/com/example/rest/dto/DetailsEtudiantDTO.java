package com.example.rest.dto;

import java.io.Serializable;
import java.util.List;
import com.example.rest.entity.*;

public class DetailsEtudiantDTO implements Serializable  {


    private Etudiant etudiant;
    private List <MoyenneSemestreDTO> moyennesSemestres;

    public DetailsEtudiantDTO() {
    }

    public DetailsEtudiantDTO(Etudiant etudiant, List<MoyenneSemestreDTO> moyennesSemestres) {
        this.etudiant = etudiant;
        this.moyennesSemestres = moyennesSemestres;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public List<MoyenneSemestreDTO> getMoyennesSemestres() {
        return moyennesSemestres;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public void setMoyennesSemestres(List<MoyenneSemestreDTO> moyennesSemestres) {
        this.moyennesSemestres = moyennesSemestres;
    }
}

package com.example.rest.service;

import java.util.*;
import java.util.Optional;
import org.springframework.stereotype.Service;
import com.example.rest.entity.Etudiant;
import com.example.rest.repository.EtudiantRepository;
import com.example.rest.dto.*;



@Service
public class EtudiantService {

    private final EtudiantRepository repository;
    private final InscriptionService serv;


    public EtudiantService(EtudiantRepository repository,InscriptionService s) {
        this.repository = repository;
        this.serv = s;
    }

    public List<Etudiant> findAll() {
        return repository.findAll();
    }

    public Optional<Etudiant> findById(Long id) {
        return repository.findById(id);
    }

    public Etudiant save(Etudiant e) {
        return repository.save(e);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }


    public DetailsEtudiantDTO getDetailsEtudiantAvecBoucle(Long etudiantId) {
        Optional<Etudiant> etudiantOpt = repository.findById(etudiantId);
        if (etudiantOpt.isEmpty()) {
            return null; // ou lance une exception
        }
        Etudiant etudiant = etudiantOpt.get();

        List<MoyenneSemestreDTO> moyennesParSemestre = new ArrayList<>();

        for (long semestreId = 1; semestreId <= 4; semestreId++) {
            try {
                // Appel de ta méthode existante qui retourne la moyenne pour un semestre donné
                List<MoyenneSemestreDTO> moyenneListe = serv.getMoyenneParSemestre(etudiantId, semestreId);
                
                // Si ta méthode retourne plusieurs moyennes (ex: plusieurs UE), tu peux faire une moyenne globale ici
                // Mais si elle retourne une seule moyenne par semestre, tu peux faire :
                if (!moyenneListe.isEmpty()) {
                    moyennesParSemestre.add(moyenneListe.get(0)); // prends la première moyenne
                } else {
                    // Si aucune moyenne, tu peux mettre une moyenne à 0 ou null, ou ne rien faire
                }
            } catch (Exception e) {
                // Gère l'exception selon ton besoin (log, ignorer, etc)
            }
        }

        return new DetailsEtudiantDTO(etudiant, moyennesParSemestre);
    }


}


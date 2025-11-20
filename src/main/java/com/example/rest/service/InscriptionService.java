package com.example.rest.service;

import java.util.List;
import java.util.Optional;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.rest.dto.NoteAnneeDTO;
import com.example.rest.dto.NoteSemestreDTO;
import com.example.rest.entity.Inscription;
import com.example.rest.exception.DatabaseConnectionException;
import com.example.rest.exception.EtudiantNotFoundException;
import com.example.rest.repository.EtudiantRepository;
import com.example.rest.repository.InscriptionRepository;

@Service
public class InscriptionService {

    private final EtudiantRepository etudiantRepository;

    private final InscriptionRepository repository;

    public InscriptionService(InscriptionRepository repository, EtudiantRepository etudiantRepository) {
        this.repository = repository;
        this.etudiantRepository = etudiantRepository;
    }

    public List<Inscription> findAll() {
        return repository.findAll();
    }

    public Optional<Inscription> findById(Long id) {
        return repository.findById(id);
    }

    public Inscription save(Inscription i) {
        return repository.save(i);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }

    public List<NoteSemestreDTO> getNotesBySemestreAndEtudiant(Long etudiantId, Long semestreId) {
        if (!etudiantRepository.existsById(etudiantId)) {
            throw new EtudiantNotFoundException("L'étudiant avec l'ID " + etudiantId + " n'existe pas.");
        }
        try {
            return repository.findNotesByEtudiantAndSemestre(etudiantId, semestreId);
        } catch (DataAccessException e) {
            throw new DatabaseConnectionException("Problème de connexion à la base de données.");
        } catch (Exception e) {
            throw new RuntimeException("Erreur imprévue : " + e.getMessage());
        }
    }

    
    public List<NoteAnneeDTO> getNotesByEtudiantAndAnnee(Long etudiantId, int annee) {
        // Supposons : année 1 = semestres 1 et 2, année 2 = semestres 3 et 4, etc.
        int semestre1 = (annee - 1) * 2 + 1;
        int semestre2 = semestre1 + 1;
        List<Long> semestreIds = List.of((long)semestre1, (long)semestre2);

        return repository.findNotesParEtudiantEtSemestres(etudiantId, semestreIds);
    }
}

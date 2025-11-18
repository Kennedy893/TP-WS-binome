package com.example.rest.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.rest.entity.Inscription;
import com.example.rest.entity.Notes;
import com.example.rest.repository.InscriptionRepository;

@Service
public class InscriptionService {

    private final InscriptionRepository repository;

    public InscriptionService(InscriptionRepository repository) {
        this.repository = repository;
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

    public List<Notes> getNotesBySemestreAndEtudiant(Long etudiantId, Long semestreId) {
        return repository.findNotesByEtudiantAndSemestre(etudiantId, semestreId);
    }
}

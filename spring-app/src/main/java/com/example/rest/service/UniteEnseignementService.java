package com.example.rest.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.rest.entity.UniteEnseignement;
import com.example.rest.repository.UniteEnseignementRepository;

@Service
public class UniteEnseignementService {

    private final UniteEnseignementRepository repository;

    public UniteEnseignementService(UniteEnseignementRepository repository) {
        this.repository = repository;
    }

    public List<UniteEnseignement> findAll() {
        return repository.findAll();
    }

    public Optional<UniteEnseignement> findById(Long id) {
        return repository.findById(id);
    }

    public UniteEnseignement save(UniteEnseignement ue) {
        return repository.save(ue);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}

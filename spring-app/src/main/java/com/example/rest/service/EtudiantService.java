package com.example.rest.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.rest.entity.Etudiant;
import com.example.rest.repository.EtudiantRepository;

@Service
public class EtudiantService {

    private final EtudiantRepository repository;

    public EtudiantService(EtudiantRepository repository) {
        this.repository = repository;
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
}


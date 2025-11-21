package com.example.rest.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.rest.entity.Semestre;
import com.example.rest.repository.SemestreRepository;

@Service
public class SemestreService {

    private final SemestreRepository repository;

    public SemestreService(SemestreRepository repository) {
        this.repository = repository;
    }

    public List<Semestre> findAll() {
        return repository.findAll();
    }

    public Optional<Semestre> findById(Long id) {
        return repository.findById(id);
    }

    public Semestre save(Semestre semestre) {
        return repository.save(semestre);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}

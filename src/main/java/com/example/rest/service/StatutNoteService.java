package com.example.rest.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.rest.entity.StatutNote;
import com.example.rest.repository.StatutNoteRepository;

@Service
public class StatutNoteService {

    private final StatutNoteRepository repository;

    public StatutNoteService(StatutNoteRepository repository) {
        this.repository = repository;
    }

    public List<StatutNote> findAll() {
        return repository.findAll();
    }

    public Optional<StatutNote> findById(Long id) {
        return repository.findById(id);
    }

    public StatutNote save(StatutNote statutNote) {
        return repository.save(statutNote);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}

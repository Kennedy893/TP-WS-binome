package com.example.rest.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.rest.entity.Notes;
import com.example.rest.repository.NotesRepository;

@Service
public class NotesService {

    private final NotesRepository repository;

    public NotesService(NotesRepository repository) {
        this.repository = repository;
    }

    public List<Notes> findAll() {
        return repository.findAll();
    }

    public Optional<Notes> findById(Long id) {
        return repository.findById(id);
    }

    public Notes save(Notes note) {
        return repository.save(note);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}

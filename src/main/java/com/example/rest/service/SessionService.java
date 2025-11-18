package com.example.rest.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.rest.entity.Session;
import com.example.rest.repository.SessionRepository;

@Service
public class SessionService {

    private final SessionRepository repository;

    public SessionService(SessionRepository repository) {
        this.repository = repository;
    }

    public List<Session> findAll() {
        return repository.findAll();
    }

    public Optional<Session> findById(Long id) {
        return repository.findById(id);
    }

    public Session save(Session session) {
        return repository.save(session);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}

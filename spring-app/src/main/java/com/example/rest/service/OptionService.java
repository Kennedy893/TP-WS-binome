package com.example.rest.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.rest.entity.Option;
import com.example.rest.repository.OptionRepository;

@Service
public class OptionService {

    private final OptionRepository repository;

    public OptionService(OptionRepository repository) {
        this.repository = repository;
    }

    public List<Option> findAll() {
        return repository.findAll();
    }

    public Optional<Option> findById(Long id) {
        return repository.findById(id);
    }

    public Option save(Option o) {
        return repository.save(o);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}

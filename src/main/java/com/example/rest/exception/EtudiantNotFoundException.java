package com.example.rest.exception;

public class EtudiantNotFoundException extends RuntimeException {
    public EtudiantNotFoundException(String message) {
        super(message);
    }
}

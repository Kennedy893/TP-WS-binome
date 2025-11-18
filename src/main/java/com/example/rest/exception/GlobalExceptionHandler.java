package com.example.rest.exception;

import com.example.rest.entity.ApiResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(EtudiantNotFoundException.class)
    public ResponseEntity<ApiResponse<?>> handleEtudiantNotFound(EtudiantNotFoundException ex) {
        ApiResponse<?> response = ApiResponse.error("ERR_ETUDIANT_NOT_FOUND", ex.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
    }

    @ExceptionHandler(DatabaseConnectionException.class)
    public ResponseEntity<ApiResponse<?>> handleDatabaseError(DatabaseConnectionException ex) {
        ApiResponse<?> response = ApiResponse.error("ERR_DB_CONNECTION", ex.getMessage());
        return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE).body(response);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiResponse<?>> handleOtherExceptions(Exception ex) {
        ApiResponse<?> response = ApiResponse.error("ERR_UNKNOWN", "Une erreur imprévue est survenue.");
        ex.printStackTrace(); // log de l'erreur
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
    }
}

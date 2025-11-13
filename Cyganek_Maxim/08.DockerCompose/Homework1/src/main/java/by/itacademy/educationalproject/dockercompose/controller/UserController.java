package by.itacademy.educationalproject.dockercompose.controller;


import by.itacademy.educationalproject.dockercompose.entity.User;
import by.itacademy.educationalproject.dockercompose.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserRepository userRepository;

    @GetMapping("/api/users")
    public ResponseEntity<Map<String, Object>> getUsers(
            @RequestParam(required = false) String username,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) Integer minAge) {

        log.info("GET /api/users called with params - username: {}, email: {}, minAge: {}",
                username, email, minAge);

        Map<String, Object> response = new HashMap<>();

        try {
            if (username != null && !username.trim().isEmpty()) {
                // Поиск по username
                User user = userRepository.findByUsername(username.trim())
                        .orElse(null);
                if (user != null) {
                    response.put("user", user);
                    response.put("message", "User found by username");
                } else {
                    response.put("message", "User not found with username: " + username);
                }
            } else if (email != null && !email.trim().isEmpty()) {
                // Поиск по email
                User user = userRepository.findByEmail(email.trim())
                        .orElse(null);
                if (user != null) {
                    response.put("user", user);
                    response.put("message", "User found by email");
                } else {
                    response.put("message", "User not found with email: " + email);
                }
            } else if (minAge != null) {
                // Поиск по минимальному возрасту
                List<User> users = userRepository.findByAgeGreaterThan(minAge);
                response.put("users", users);
                response.put("count", users.size());
                response.put("message", "Users found with age greater than " + minAge);
            } else {
                // Все пользователи
                List<User> users = userRepository.findAllByOrderByCreatedAtDesc();
                long totalUsers = userRepository.countTotalUsers();

                response.put("users", users);
                response.put("totalUsers", totalUsers);
                response.put("message", "All users retrieved successfully");
            }

            response.put("status", "success");
            response.put("timestamp", java.time.LocalDateTime.now().toString());

            return ResponseEntity.ok(response);

        } catch (Exception e) {
            log.error("Error retrieving users: {}", e.getMessage());

            response.put("status", "error");
            response.put("message", "Error retrieving users: " + e.getMessage());
            response.put("timestamp", java.time.LocalDateTime.now().toString());

            return ResponseEntity.internalServerError().body(response);
        }
    }

    /**
     * Простой health check endpoint
     */
    @GetMapping("/api/health")
    public ResponseEntity<Map<String, Object>> health() {
        Map<String, Object> health = new HashMap<>();
        health.put("status", "UP");
        health.put("service", "Spring Boot 3.5.7 MySQL Demo");
        health.put("database", "Connected");
        health.put("timestamp", java.time.Instant.now());
        health.put("springBootVersion", "3.5.7");
        health.put("javaVersion", System.getProperty("java.version"));
        return ResponseEntity.ok(health);
    }
}
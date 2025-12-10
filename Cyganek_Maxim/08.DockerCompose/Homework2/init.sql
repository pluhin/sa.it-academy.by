CREATE DATABASE IF NOT EXISTS userdb;
USE userdb;

CREATE TABLE IF NOT EXISTS users (
                                     id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                     username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

INSERT IGNORE INTO users (username, email, first_name, last_name, age) VALUES
('admin', 'admin@example.com', 'Admin', 'User', 30),
('john_doe', 'john.doe@example.com', 'John', 'Doe', 25),
('jane_smith', 'jane.smith@example.com', 'Jane', 'Smith', 28),
('mike_wilson', 'mike.wilson@example.com', 'Mike', 'Wilson', 35),
('sarah_jones', 'sarah.jones@example.com', 'Sarah', 'Jones', 22),
('alex_brown', 'alex.brown@example.com', 'Alex', 'Brown', 40);

CREATE INDEX idx_username ON users(username);
CREATE INDEX idx_email ON users(email);
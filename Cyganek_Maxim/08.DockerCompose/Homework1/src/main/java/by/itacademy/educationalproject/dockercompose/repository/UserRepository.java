package by.itacademy.educationalproject.dockercompose.repository;

import by.itacademy.educationalproject.dockercompose.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    List<User> findAllByOrderByCreatedAtDesc();

    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);

    @Query("SELECT COUNT(u) FROM User u")
    long countTotalUsers();

    List<User> findByAgeGreaterThan(Integer age);
}
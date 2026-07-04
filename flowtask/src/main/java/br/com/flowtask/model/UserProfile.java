package br.com.flowtask.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "tb_user_profile")
@Getter
@Setter
public class UserProfile {

    @Id
    UUID id;

    @Column(nullable = false, length = 100)
    String name;

    @Column(name = "birth_date", nullable = false)
    LocalDate birthDate;

    @Column(nullable = false, unique = true, length = 150)
    String email;

    @Column(name = "job_title", length = 50)
    private String jobTitle;

    @Column(name = "account_status", length = 20)
    private String accountStatus = "ACTIVE";

    @Column(name = "created_at")
    private LocalDateTime createdAt;
}

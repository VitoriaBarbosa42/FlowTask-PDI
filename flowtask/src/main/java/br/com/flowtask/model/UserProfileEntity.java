package br.com.flowtask.model;

import br.com.flowtask.Enum.AccountStatusEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "tb_user_profile")
@Getter
@Setter
public class UserProfileEntity {

    @Id
    @GeneratedValue
    private UUID id;

    @Column(name = "user_id", nullable = false, unique = true)
    private UUID user_id;

    @Column(nullable = false, length = 100)
    private String name;



    @Column(name = "birth_date", nullable = false)
    private LocalDate birthDate;

    @Column(nullable = false, unique = true, length = 150)
    private String email;

    @Column(name = "job_title", length = 50)
    private String jobTitle;

    @Enumerated(EnumType.STRING)
    @Column(name = "account_status", length = 20)
    private AccountStatusEnum accountStatus;

    @Column(name = "created_at")
    private LocalDateTime createdAt;


}

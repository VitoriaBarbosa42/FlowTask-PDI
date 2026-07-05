package br.com.flowtask.repository;

import br.com.flowtask.model.UserProfileEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface UserProfileRepository extends JpaRepository <UserProfileEntity, UUID>{
}

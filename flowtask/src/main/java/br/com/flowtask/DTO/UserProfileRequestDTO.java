package br.com.flowtask.DTO;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;

public record UserProfileRequestDTO(

        @NotBlank(message = "Campo name não pode estar vazio")
        @Size(min = 3, message = "O name deve ter ao menos 3 caracteres")
        String name,

        @NotNull(message = "Campo birthDate não pode estar vazio")
        LocalDate birthDate,

        @NotBlank(message = "Campo email não pode estar vazio")
        @Email(message = "Digite um email valido")
        String email,

        @NotBlank(message = "Campo jobTitle não pode estar vazio")
        String jobTitle
) {
}
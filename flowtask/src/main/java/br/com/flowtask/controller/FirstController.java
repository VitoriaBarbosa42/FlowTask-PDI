package br.com.flowtask.controller;

import br.com.flowtask.DTO.UserProfileRequestDTO;
import br.com.flowtask.service.UserProfileService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("home")
public class FirstController {

    private UserProfileService service;

    public FirstController(UserProfileService service) {
        this.service = service;
    }

    @PostMapping("/cadastrar")
    public ResponseEntity<UserProfileRequestDTO> newRegistration(@RequestBody @Valid UserProfileRequestDTO requestDTO) {

        UserProfileRequestDTO novoUsuario = service.newUser(requestDTO);

        return ResponseEntity.status(HttpStatus.CREATED).body(novoUsuario);

    }
}

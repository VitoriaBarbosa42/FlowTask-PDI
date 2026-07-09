package br.com.flowtask.service;

import br.com.flowtask.DTO.UserProfileRequestDTO;
import br.com.flowtask.Enum.AccountStatusEnum;
import br.com.flowtask.model.UserProfileEntity;
import br.com.flowtask.repository.UserProfileRepository;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;


@Service
public class UserProfileService {

    private final UserProfileRepository userProfileRepository;

    public UserProfileService(UserProfileRepository userProfileRepository) {
        this.userProfileRepository = userProfileRepository;
    }

    public UserProfileRequestDTO newUser(UserProfileRequestDTO requestDTO) {

        UserProfileEntity user = new UserProfileEntity();

        user.setName(requestDTO.name());
        user.setBirthDate(requestDTO.birthDate());
        user.setEmail(requestDTO.email());
        user.setJobTitle(requestDTO.jobTitle());
        user.setCreatedAt(LocalDateTime.now());
        user.setAccountStatus(AccountStatusEnum.ACTIVE);

        userProfileRepository.save(user);

        return requestDTO;
    }

    public
}

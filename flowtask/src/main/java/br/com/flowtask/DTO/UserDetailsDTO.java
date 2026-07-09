package br.com.flowtask.DTO;

import br.com.flowtask.Enum.AccountStatusEnum;

public record UserDetailsDTO(
        String username,
        String password,
        AccountStatusEnum status
){
}

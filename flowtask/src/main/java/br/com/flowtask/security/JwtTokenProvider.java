package br.com.flowtask.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class JwtTokenProvider {

    @Value("${}")
    private String jwtSecret;

}

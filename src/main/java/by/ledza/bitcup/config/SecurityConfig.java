package by.ledza.bitcup.config;

import by.ledza.bitcup.model.AuthUser;
import by.ledza.bitcup.repository.AuthUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import java.util.List;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class SecurityConfig {

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        return http
                .userDetailsService(userDetailsService())
                .csrf().ignoringAntMatchers("/api/**").and()
                .formLogin().loginPage("/login").and()
                .headers().frameOptions().disable().and()
                .build();
    }


    @Bean
    UserDetailsService userDetailsService(){
        return new UserDetailsService() {

            @Autowired
            AuthUserRepository authUserRepository;

            @Autowired
            PasswordEncoder passwordEncoder;

            @Override
            public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
                AuthUser authUser = authUserRepository.findAuthUserByLogin(username);

                if (authUser == null){
                    throw new UsernameNotFoundException("User not founded!");
                }
                GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(authUser.getRole().name());
                return new User(authUser.getLogin(), authUser.getPassword(), List.of(grantedAuthority));
            }
        };
    }

    @Bean
    PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

}

package by.ledza.bitcup.repository;

import by.ledza.bitcup.model.AuthUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthUserRepository extends JpaRepository<AuthUser, Long> {

    AuthUser findAuthUserByLogin(String login);

}

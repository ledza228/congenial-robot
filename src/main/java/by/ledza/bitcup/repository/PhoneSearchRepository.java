package by.ledza.bitcup.repository;

import by.ledza.bitcup.model.Phone;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

public interface PhoneSearchRepository  {

    List<Phone> findAllBySearch(String name, String number, String department, String email, String position, Boolean isAuthorized);

}

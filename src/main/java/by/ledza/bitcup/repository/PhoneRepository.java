package by.ledza.bitcup.repository;

import by.ledza.bitcup.model.Phone;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PhoneRepository extends JpaRepository<Phone, Long>, PhoneSearchRepository {

    @EntityGraph(type = EntityGraph.EntityGraphType.FETCH,
                attributePaths = {"owners"})
    List<Phone> findAll();

    @EntityGraph(type = EntityGraph.EntityGraphType.FETCH,
            attributePaths = {"owners"})
    Optional<Phone> findById(Long id);
}

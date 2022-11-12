package by.ledza.bitcup.repository;

import by.ledza.bitcup.model.Worker;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface WorkerRepository extends JpaRepository<Worker, Long>, WorkerSearchRepository {

    @Query("SELECT DISTINCT department FROM Worker")
    Set<String> getAllDepartments();

    List<Worker> findAllByIdIn(List<Long> ids);
}

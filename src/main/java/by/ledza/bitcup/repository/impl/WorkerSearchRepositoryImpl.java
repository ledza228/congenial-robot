package by.ledza.bitcup.repository.impl;

import by.ledza.bitcup.model.Worker;
import by.ledza.bitcup.repository.WorkerSearchRepository;
import by.ledza.bitcup.utils.SqlUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

public class WorkerSearchRepositoryImpl implements WorkerSearchRepository {

    @Autowired
    EntityManager entityManager;

    @Override
    public List<Worker> findAllByName(String name){

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Worker> criteria = criteriaBuilder.createQuery(Worker.class);

        Root<Worker> worker = criteria.from(Worker.class);

        List<Predicate> predicates = new ArrayList<>();

        if (name != null) {
            String[] strings = name.strip().split(" ");

            for (var str : strings) {
                Predicate predicate = criteriaBuilder.like(criteriaBuilder.upper(worker.get("name")),
                        SqlUtils.likePrepare(str));
                predicates.add(predicate);
            }
        }

        criteria.where(criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()])));

        return entityManager.createQuery(criteria).setMaxResults(10).getResultList();
    }

}

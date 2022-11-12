package by.ledza.bitcup.repository.impl;

import by.ledza.bitcup.model.Phone;
import by.ledza.bitcup.model.Worker;
import by.ledza.bitcup.repository.PhoneSearchRepository;
import by.ledza.bitcup.utils.SqlUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.EntityManager;
import javax.persistence.criteria.*;
import javax.persistence.metamodel.Metamodel;
import java.util.ArrayList;
import java.util.List;

public class PhoneSearchRepositoryImpl implements PhoneSearchRepository {

    @Autowired
    EntityManager entityManager;

    @Override
    public List<Phone> findAllBySearch(String name, String number, String department, String email, String position, Boolean isAuthorized) {

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Phone> criteria = criteriaBuilder.createQuery(Phone.class);

        Root<Phone> phone = criteria.from(Phone.class);
        Fetch<Phone, Worker> workers = phone.fetch("owners");
        Join<Phone, Worker> workersJoin = (Join<Phone, Worker>) workers;

        List<Predicate> predicates = new ArrayList<>();
        Predicate pred;

        if (number != null){
            pred = criteriaBuilder.like(criteriaBuilder.upper(phone.get("number")), SqlUtils.likePrepare(number));
            predicates.add(pred);
        }

        if (department != null){
            pred = criteriaBuilder.like(criteriaBuilder.upper(workersJoin.get("department")), SqlUtils.likePrepare(department));
            predicates.add(pred);
        }

        if (email != null){
            pred = criteriaBuilder.like(criteriaBuilder.upper(workersJoin.get("email")), SqlUtils.likePrepare(email));
            predicates.add(pred);
        }

        if (position != null){
            pred = criteriaBuilder.like(criteriaBuilder.upper(workersJoin.get("position")), SqlUtils.likePrepare(position));
            predicates.add(pred);
        }

        if (!isAuthorized){
            pred = criteriaBuilder.isFalse(phone.get("isHidden"));
            predicates.add(pred);
        }

        if (name != null) {
            String[] names = name.strip().split(" ");

            for (var str : names) {
                pred = criteriaBuilder.like(criteriaBuilder.upper(workersJoin.get("name")), SqlUtils.likePrepare(str));
                predicates.add(pred);
            }
        }

        criteria.where(criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]))).distinct(true);

        return entityManager.createQuery(criteria).getResultList();
    }
}

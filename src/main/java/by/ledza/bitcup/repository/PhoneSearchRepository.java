package by.ledza.bitcup.repository;

import by.ledza.bitcup.model.Phone;

import java.util.List;

public interface PhoneSearchRepository  {

    List<Phone> findAllBySearch(String name, String number, String department, String email, String position, Boolean isAuthorized);

}

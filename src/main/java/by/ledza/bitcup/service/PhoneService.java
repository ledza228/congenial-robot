package by.ledza.bitcup.service;

import by.ledza.bitcup.dto.AddPhoneDTO;
import by.ledza.bitcup.dto.EditPhoneDTO;
import by.ledza.bitcup.dto.PhoneDTO;
import by.ledza.bitcup.dto.SearchDTO;

import java.util.List;


public interface PhoneService {

    List<PhoneDTO> getAllPhones();

    PhoneDTO getPhoneById(Integer id);

    List<PhoneDTO> searchPhones(SearchDTO searchData, Boolean isAuthorized);

    void editPhones(EditPhoneDTO editPhoneDTO);

    void addPhone(AddPhoneDTO addPhoneDTO);

    void deletePhone(Long id);

}

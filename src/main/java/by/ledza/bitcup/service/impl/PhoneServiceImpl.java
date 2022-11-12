package by.ledza.bitcup.service.impl;

import by.ledza.bitcup.dto.AddPhoneDTO;
import by.ledza.bitcup.dto.EditPhoneDTO;
import by.ledza.bitcup.dto.PhoneDTO;
import by.ledza.bitcup.dto.SearchDTO;
import by.ledza.bitcup.exception.PhoneNotFounded;
import by.ledza.bitcup.mapper.PhoneMapper;
import by.ledza.bitcup.model.Phone;
import by.ledza.bitcup.model.Worker;
import by.ledza.bitcup.repository.PhoneRepository;
import by.ledza.bitcup.repository.WorkerRepository;
import by.ledza.bitcup.service.PhoneService;
import org.mapstruct.factory.Mappers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class PhoneServiceImpl implements PhoneService {

    PhoneMapper phoneMapper = Mappers.getMapper(PhoneMapper.class);

    @Autowired
    PhoneRepository phoneRepository;

    @Autowired
    WorkerRepository workerRepository;

    @Override
    public List<PhoneDTO> getAllPhones() {
        return phoneMapper.phoneListToDto(phoneRepository.findAll());
    }

    @Override
    public PhoneDTO getPhoneById(Integer id) {
        Optional<Phone> phone = phoneRepository.findById(id.longValue());
        return phoneMapper.phoneToPhoneDTO(phone.orElseThrow(PhoneNotFounded::new));
    }

    @Override
    public List<PhoneDTO> searchPhones(SearchDTO searchData, Boolean isAuthorized) {
        searchData.replaceLetters();
        List<Phone> phones = phoneRepository.findAllBySearch(searchData.getName(),
                searchData.getPhone(),
                searchData.getDepartment(),
                searchData.getMail(),
                searchData.getPosition(),
                isAuthorized);

        return phoneMapper.phoneListToDto(phones);
    }

    @Override
    @Transactional
    public void editPhones(EditPhoneDTO editPhoneDTO) {
        Phone phone = phoneRepository.findById(editPhoneDTO.getId().longValue())
                                        .orElseThrow(PhoneNotFounded::new);

        List<Worker> workers = workerRepository.findAllByIdIn(editPhoneDTO.getOwners());
        phone.setOwners(workers);
        phone.setNumber(editPhoneDTO.getNumber());
        phone.setIsHidden(editPhoneDTO.getIsHidden());

        phoneRepository.save(phone);
    }

    @Override
    @Transactional
    public void addPhone(AddPhoneDTO addPhoneDTO) {
        Phone phone = phoneMapper.phoneAddDtoToPhone(addPhoneDTO);

        List<Worker> workers = workerRepository.findAllByIdIn(addPhoneDTO.getOwners());
        phone.setOwners(workers);

        phoneRepository.save(phone);
    }

    @Override
    @Transactional
    public void deletePhone(Long id) {
        Phone phone = phoneRepository.findById(id)
                .orElseThrow(PhoneNotFounded::new);

        phoneRepository.delete(phone);
    }
}

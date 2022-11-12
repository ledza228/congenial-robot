package by.ledza.bitcup.mapper;

import by.ledza.bitcup.dto.AddPhoneDTO;
import by.ledza.bitcup.dto.EditPhoneDTO;
import by.ledza.bitcup.dto.PhoneDTO;
import by.ledza.bitcup.model.Phone;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(uses = {WorkerMapper.class})
public interface PhoneMapper {

    PhoneDTO phoneToPhoneDTO(Phone phone);

    List<PhoneDTO> phoneListToDto(List<Phone> phoneList);

    @Mapping(target = "owners", ignore = true)
    Phone phoneEditDtoToPhone(EditPhoneDTO editPhoneDTO);

    @Mapping(target = "owners", ignore = true)
    Phone phoneAddDtoToPhone(AddPhoneDTO addPhoneDTO);

}

package by.ledza.bitcup.dto;

import lombok.Data;

import java.util.List;


@Data
public class AddPhoneDTO {

    private String number;
    private Boolean isHidden;
    private List<Long> owners;
}

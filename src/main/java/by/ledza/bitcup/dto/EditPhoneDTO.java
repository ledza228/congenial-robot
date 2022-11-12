package by.ledza.bitcup.dto;

import lombok.Data;

import java.util.List;

@Data
public class EditPhoneDTO {

    private Integer id;
    private String number;
    private Boolean isHidden;
    private List<Long> owners;
}

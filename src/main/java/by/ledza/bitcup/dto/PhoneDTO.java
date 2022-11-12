package by.ledza.bitcup.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;


@Getter
@Setter
@NoArgsConstructor
@ToString
public class PhoneDTO {

    private Long phoneId;

    private String number;

    private List<WorkerDTO> owners;

    private Boolean isHidden;
}

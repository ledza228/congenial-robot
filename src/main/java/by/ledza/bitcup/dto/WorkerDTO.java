package by.ledza.bitcup.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@ToString
public class WorkerDTO {

    private Long id;

    private String name;

    private String email;

    private String position;

    private String department;
}

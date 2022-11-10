package by.ledza.bitcup.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Setter
@Getter
@NoArgsConstructor
public class Phone {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long phoneId;

    private String number;

    @ManyToMany(mappedBy = "phones")
    private List<Worker> owners;

    private Boolean isHidden;

}

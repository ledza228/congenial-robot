package by.ledza.bitcup.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Entity
@Setter
@Getter
@NoArgsConstructor
@ToString
public class Phone {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long phoneId;

    private String number;

    @ManyToMany()
    @JoinTable(
            name = "Workers_Phone",
            joinColumns = {@JoinColumn(name = "phone_id")},
            inverseJoinColumns = {@JoinColumn(name = "owner_id")}
    )
    private List<Worker> owners;

    private Boolean isHidden;

}

package by.ledza.bitcup.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import static by.ledza.bitcup.utils.SearchUtils.changeLettersForSearch;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class SearchDTO {

    private String name;

    private String phone;

    private String mail;

    private String position;

    private String department;

    public void replaceLetters(){
        name = name != null ? changeLettersForSearch(name) : null;
        phone = phone != null ? changeLettersForSearch(phone) : null;
        mail = mail != null ? changeLettersForSearch(mail) : null;
        position = position != null ? changeLettersForSearch(position) : null;
        department = department != null ? changeLettersForSearch(department) : null;
    }

}

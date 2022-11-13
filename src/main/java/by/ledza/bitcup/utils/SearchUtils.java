package by.ledza.bitcup.utils;

public class SearchUtils {

    public static String changeLettersForSearch(String s){
        s = s.replace('ё', 'е');
        return s.replace('Ё', 'Е').trim();
    }

}

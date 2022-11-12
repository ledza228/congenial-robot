package by.ledza.bitcup.utils;

public class SqlUtils {

    public static String likePrepare(String str){
        return ("%" + str + "%").toUpperCase();
    }
}

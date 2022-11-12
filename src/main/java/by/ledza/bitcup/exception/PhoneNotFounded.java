package by.ledza.bitcup.exception;

public class PhoneNotFounded extends IllegalArgumentException{
    public PhoneNotFounded() {
        super("Phone not founded!");
    }
}

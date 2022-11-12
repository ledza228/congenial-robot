package by.ledza.bitcup.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class ExceptionHandler extends ResponseEntityExceptionHandler {


    @org.springframework.web.bind.annotation.ExceptionHandler(value = {PhoneNotFounded.class})
    public ResponseEntity<Object> handlePhoneNotFounded(PhoneNotFounded p){
        return ResponseEntity.notFound().build();
    }

}

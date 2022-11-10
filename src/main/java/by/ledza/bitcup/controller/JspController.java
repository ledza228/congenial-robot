package by.ledza.bitcup.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JspController {


    @GetMapping("/")
    public String indexPage(){
        return "index";
    }


    @Secured({"ROLE_ADMIN"})
    @GetMapping("/admin")
    public String adminPage(){
        return "login";
    }

}

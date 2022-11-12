package by.ledza.bitcup.controller;

import by.ledza.bitcup.dto.PhoneDTO;
import by.ledza.bitcup.dto.SearchDTO;
import by.ledza.bitcup.service.PhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.security.Principal;

import java.util.List;

@Controller
public class JspController {

    @Autowired
    PhoneService phoneService;

    @GetMapping("/")
    public String indexPage(){
        return "index";
    }


    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

    @Secured({"ROLE_ADMIN"})
    @GetMapping("/admin")
    public String adminPage(Model model){
        List<PhoneDTO> phones = phoneService.getAllPhones();
        model.addAttribute("phones",phones);

        return "admin";
    }

    @Secured({"ROLE_ADMIN"})
    @GetMapping("/admin/phone/{id}")
    public String phoneDescriptionPage(@PathVariable Integer id, Model model){
        PhoneDTO phone = phoneService.getPhoneById(id);
        model.addAttribute("phone", phone);

        return "description";
    }

    @GetMapping("/admin/phone")
    public String addPhonePage(){
        return "add";
    }

    @GetMapping("/search")
    public String searchPhones(SearchDTO searchDTO, Principal principal, Model model){
        boolean isAuthorized = principal != null;

        List<PhoneDTO> phones = phoneService.searchPhones(searchDTO, isAuthorized);
        model.addAttribute("phones", phones);

        return "search";
    }

}

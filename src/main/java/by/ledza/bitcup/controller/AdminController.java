package by.ledza.bitcup.controller;

import by.ledza.bitcup.dto.AddPhoneDTO;
import by.ledza.bitcup.dto.EditPhoneDTO;
import by.ledza.bitcup.dto.WorkerDTO;
import by.ledza.bitcup.service.PhoneService;
import by.ledza.bitcup.service.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/api/admin/")
@Secured({"ROLE_ADMIN"})
public class AdminController {


    @Autowired
    PhoneService phoneService;

    @Autowired
    WorkerService workerService;

    @PostMapping("/phone/")
    public void addPhoneAPI(@RequestBody AddPhoneDTO addPhoneDTO){
        phoneService.addPhone(addPhoneDTO);
    }

    @PutMapping("/phone/{id}")
    public void changePhoneAPI(@PathVariable Integer id, @RequestBody EditPhoneDTO phone){
        phone.setId(id);
        phoneService.editPhones(phone);
    }

    @DeleteMapping("/phone/{id}")
    public void deletePhoneAPI(@PathVariable Long id){
        phoneService.deletePhone(id);
    }


    @GetMapping("/workers")
    public List<WorkerDTO> searchWorker(@RequestParam String name){
        return workerService.searchWorkerByName(name);
    }


}

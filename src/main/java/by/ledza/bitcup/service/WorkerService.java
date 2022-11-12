package by.ledza.bitcup.service;


import by.ledza.bitcup.dto.WorkerDTO;

import java.util.List;

public interface WorkerService {

    List<WorkerDTO> searchWorkerByName(String name);

}

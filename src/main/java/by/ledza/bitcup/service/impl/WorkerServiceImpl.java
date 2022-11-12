package by.ledza.bitcup.service.impl;

import by.ledza.bitcup.dto.WorkerDTO;
import by.ledza.bitcup.mapper.WorkerMapper;
import by.ledza.bitcup.model.Worker;
import by.ledza.bitcup.repository.WorkerRepository;
import by.ledza.bitcup.service.WorkerService;
import by.ledza.bitcup.utils.SearchUtils;
import org.mapstruct.factory.Mappers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkerServiceImpl implements WorkerService {

    @Autowired
    WorkerRepository workerRepository;

    WorkerMapper workerMapper = Mappers.getMapper(WorkerMapper.class);

    @Override
    public List<WorkerDTO> searchWorkerByName(String name) {

        name = SearchUtils.changeLettersForSearch(name.toUpperCase());
        List<Worker> workers = workerRepository.findAllByName(name);

        return workerMapper.workerListToWorkerDTOList(workers);
    }
}

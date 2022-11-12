package by.ledza.bitcup.mapper;

import by.ledza.bitcup.dto.WorkerDTO;
import by.ledza.bitcup.model.Worker;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper
public interface WorkerMapper {
    WorkerDTO workerToWorkerDTO(Worker worker);

    List<WorkerDTO> workerListToWorkerDTOList(List<Worker> list);
}

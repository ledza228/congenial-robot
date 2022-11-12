package by.ledza.bitcup.repository;

import by.ledza.bitcup.model.Worker;

import java.util.List;

public interface WorkerSearchRepository {

    List<Worker> findAllByName(String name);
}

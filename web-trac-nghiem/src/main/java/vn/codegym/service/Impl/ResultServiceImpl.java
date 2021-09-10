package vn.codegym.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.codegym.model.Result;
import vn.codegym.repository.ResultRepository;
import vn.codegym.service.ResultService;

import java.util.List;

@Service
public class ResultServiceImpl implements ResultService {
    @Autowired
    ResultRepository resultRepository;

    @Override
    public List<Result> getTopFive() {
        return resultRepository.findTopFive();
    }
}

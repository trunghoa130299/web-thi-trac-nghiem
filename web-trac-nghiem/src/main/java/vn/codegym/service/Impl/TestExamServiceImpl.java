package vn.codegym.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.codegym.model.Exam;
import vn.codegym.model.TestExam;
import vn.codegym.repository.TestExamRepository;
import vn.codegym.service.TestExamService;
import vn.codegym.service.ExamService;

@Service
public class TestExamServiceImpl implements TestExamService {
    @Autowired
    private ExamService examService;

    @Autowired
    private TestExamRepository testExamRepository;

    @Override
    public void save(TestExam testExam) {

    }

    @Override
    public TestExam findById(int id) {
        return testExamRepository.findById(id).orElse(null);
    }
}

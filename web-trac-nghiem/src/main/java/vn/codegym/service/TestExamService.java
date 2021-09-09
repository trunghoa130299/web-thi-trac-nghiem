package vn.codegym.service;


import vn.codegym.model.TestExam;

public interface TestExamService {
    void save(TestExam testExam);
    TestExam findById(int id);
}

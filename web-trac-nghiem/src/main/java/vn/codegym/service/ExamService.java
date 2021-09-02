package vn.codegym.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.codegym.model.Exam;

public interface ExamService {
    Page<Exam> findAll(Pageable pageable);

    Iterable<Exam> findAll();

    Exam findById(Integer id);

    void save(Exam exam);

    void delete(Exam exam);

    Page<Exam> findAllBySubject(int id, Pageable pageable);
}

package vn.codegym.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.codegym.model.Question;

import java.util.List;
import java.util.Optional;

public interface QuestionService {
    Page<Question> findAll(Pageable pageable);

    Iterable<Question> findAll();

    Question findById(Integer id);

    void save(Question question);

    void delete(Question question);

    Page<Question> findAllByExams(int id, Pageable pageable);
    List<Question> findAllBySubject(Optional<Integer> id);
}

package vn.codegym.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import vn.codegym.model.Exam;
import vn.codegym.model.Question;

import java.util.List;

@Repository
public interface QuestionRepository extends JpaRepository<Question, Integer> {
    @Query(value = "SELECT * FROM question join exam_question where question.ques_id = exam_question.ques_id and exam_question.exam_id = :id ",nativeQuery = true)
    List<Question> findAllId(@Param("id") int i);

    @Query(value = "SELECT * FROM question join exam where question.exams_id = exam.id and exam.id = :id",
            nativeQuery = true)
    Page<Question> findAllByExams(@Param("id") int id, Pageable pageable);

    Page<Question> findAllByTitle(String title, Pageable pageable);

    @Query(value = "select * from question join exam_question on exam_question.ques_id = question.ques_id join exam on exam.id=exam_question.exam_id where exam.subject_id =:id ",nativeQuery = true)
    Page<Question> findAllSub(@Param("id") int i, Pageable pageable);
}

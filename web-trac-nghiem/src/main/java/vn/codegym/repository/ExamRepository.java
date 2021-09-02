package vn.codegym.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import vn.codegym.model.Exam;

public interface ExamRepository extends JpaRepository<Exam, Integer> {
   @Query(value = "SELECT * FROM exam join subject where exam.subject_id = subject.id and subject.id = :id",
           nativeQuery = true)
   Page<Exam> findAllBySubject(@Param("id") int id, Pageable pageable);
}

package vn.codegym.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.codegym.model.TestExam;

public interface TestExamRepository extends JpaRepository<TestExam, Integer> {
}

package vn.codegym.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.codegym.model.Result;

import java.util.List;

@Repository
public interface ResultRepository extends JpaRepository<Result, Integer> {
//    @Query(value = "SELECT * FROM result order by totalCorrect desc limit 5",nativeQuery = true)
    List<Result> findAll();
}

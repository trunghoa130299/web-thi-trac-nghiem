package vn.codegym.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.codegym.model.Result;

import java.util.List;

@Repository
public interface ResultRepository extends JpaRepository<Result, Integer> {
<<<<<<< HEAD
//    @Query(value = "SELECT * FROM result order by totalCorrect desc limit 5",nativeQuery = true)
    List<Result> findAll();
=======
    @Query(value = "SELECT * FROM result order by  total_correct desc ",nativeQuery = true)
    List<Result> findByTotalCorrect();

>>>>>>> 2489b432b1dd9face8ead512831b86c2b44a7b4e
}

package vn.codegym.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.codegym.model.Result;

@Repository
public interface ResultRepository extends JpaRepository<Result, Integer> {
}

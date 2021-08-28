package vn.codegym.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import vn.codegym.model.PhuongAn;


@Repository
public interface PhuongAnRepository extends JpaRepository<PhuongAn, Integer> {
}

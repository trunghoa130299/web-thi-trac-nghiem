package vn.codegym.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.codegym.model.CauHoi;

@Repository
public interface CauHoiRepository extends JpaRepository<CauHoi, Integer> {
}

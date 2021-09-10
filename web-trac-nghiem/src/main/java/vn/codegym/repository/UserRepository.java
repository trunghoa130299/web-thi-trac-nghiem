package vn.codegym.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import vn.codegym.model.Result;
import vn.codegym.model.User;

@Service
public interface  UserRepository  extends JpaRepository<User,String > {
    @Query(value = "select count(id) from user;",nativeQuery = true)
    Integer findByTotalUser();
    @Query(value = "SELECT full_name FROM user order by id desc LIMIT 1;",nativeQuery = true)
    String findByNewUser();

}

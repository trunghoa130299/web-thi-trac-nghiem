package vn.codegym.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import vn.codegym.model.Result;
import vn.codegym.model.User;

import java.util.Optional;

@Service
public interface  UserRepository  extends JpaRepository<User,String > {
    @Query(value = "select count(id) from user;",nativeQuery = true)
    Integer findByTotalUser();
    @Query(value = "SELECT id FROM user  order by id desc LIMIT 1;",nativeQuery = true)
    String findByNewUser();
    @Query(value = "select pass_word\n" +
            "from user\n" +
            "where id =:id",nativeQuery = true)
    String findByPass(@Param("id") String id);
}

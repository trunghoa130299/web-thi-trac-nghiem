package vn.codegym.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.codegym.model.Result;
import vn.codegym.model.User;

public interface UserService {
    Page<User> findAll(Pageable pageable);

    Iterable<User> findAll();

    User findById(String id);

    void save(User user);

    void delete(User user);


    Integer findByTotalUser();

    String findByNewUser();


    boolean userExists(String id);

    boolean userExistss(String email);

    String findByPass(String id);
}

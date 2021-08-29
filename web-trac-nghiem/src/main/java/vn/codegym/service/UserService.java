package vn.codegym.service;

<<<<<<< HEAD
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.codegym.model.User;

public interface UserService {
    Page<User> findAll(Pageable pageable);

    Iterable<User> findAll();

    User findById(String id);

    void save(User user);

    void delete(User user);
=======
import vn.codegym.model.User;

public interface UserService {
    void save(User user);

    User findByUser(String name);
>>>>>>> 3f69a13f21c83079eb8eef8d7b2b641baaf304c9
}

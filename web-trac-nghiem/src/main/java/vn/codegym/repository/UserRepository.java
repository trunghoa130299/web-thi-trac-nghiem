package vn.codegym.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import vn.codegym.model.User;

@Service
<<<<<<< HEAD
public interface UserRepository extends JpaRepository<User,String > {
=======
public interface  UserRepository  extends JpaRepository<User,String > {
>>>>>>> 3f69a13f21c83079eb8eef8d7b2b641baaf304c9
    User findByUser(String username);
}

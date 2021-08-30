package vn.codegym.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import vn.codegym.model.User;

@Service
public interface  UserRepository  extends JpaRepository<User,String > {

}

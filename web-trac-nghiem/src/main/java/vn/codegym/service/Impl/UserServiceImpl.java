package vn.codegym.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
=======
>>>>>>> 3f69a13f21c83079eb8eef8d7b2b641baaf304c9
import org.springframework.stereotype.Service;
import vn.codegym.model.User;
import vn.codegym.repository.UserRepository;
import vn.codegym.service.UserService;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
<<<<<<< HEAD
    private UserRepository userRepository;

    @Override
    public Page<User> findAll(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    @Override
    public Iterable<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public User findById(String id) {
        return userRepository.findById(id).orElse(null);
    }

=======
    UserRepository userRepository;
>>>>>>> 3f69a13f21c83079eb8eef8d7b2b641baaf304c9
    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
<<<<<<< HEAD
    public void delete(User user) {
        userRepository.delete(user);
=======
    public User findByUser(String name) {
        return userRepository.findByUser(name);
>>>>>>> 3f69a13f21c83079eb8eef8d7b2b641baaf304c9
    }
}

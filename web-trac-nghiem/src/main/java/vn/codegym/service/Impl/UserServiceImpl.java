package vn.codegym.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import org.springframework.stereotype.Service;
import vn.codegym.model.Result;
import vn.codegym.model.User;
import vn.codegym.repository.UserRepository;
import vn.codegym.service.UserService;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
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

    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    public void delete(User user) {
        userRepository.delete(user);
    }
    @Override
    public  Integer findByTotalUser(){return userRepository.findByTotalUser();}

    @Override
    public String findByNewUser(){return userRepository.findByNewUser();}

    @Override
    public boolean userExists(String username){
        return userRepository.findById(username).isPresent();
    }

    @Override
    public boolean userExistss(String email) {
        return userRepository.findById(email).isPresent();
    }

    @Override
    public String findByPass(String id) {
        return userRepository.findByPass(id);
    }

}

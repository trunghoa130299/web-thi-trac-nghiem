package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import vn.codegym.model.User;
import vn.codegym.service.UserService;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping("/signup")
    public String showSignUp(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/signup")
    public String signUp(@ModelAttribute User user) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        user.setPassWord(passwordEncoder.encode(user.getPassWord()));
        userService.save(user);
        return "login";
    }
}

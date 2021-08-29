package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import vn.codegym.model.User;
import vn.codegym.service.UserService;

import javax.validation.Valid;

@Controller
public class TrungController {

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
        user.setRePassWord(passwordEncoder.encode(user.getRePassWord()));
        userService.save(user);
        return "login";
    }


    @GetMapping(value = "/view/{userName}")
    public String showMemberView(@PathVariable String userName, Model model){
        User user = userService.findByUser(userName);
        model.addAttribute("users",user);
        return "trung/view";
    }

    @PostMapping("/edit")
    public String editView(@ModelAttribute("users") User user,Model model){
        userService.save(user);
        model.addAttribute("users",user);
        return "trung/view";
    }

    @GetMapping(value = "/editMember/{user}")
    public String showMemberEdit(@PathVariable("user") String userName,Model model){
        User user = userService.findByUser(userName);
        model.addAttribute("users",user);
        model.addAttribute("userName",user.getUser());
        return "trung/editMember";
    }

    @PostMapping("/editMember")
    public String editMember(@Valid @ModelAttribute("users") User user , BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()){
            return "trung/editMember";
        }else {
            userService.save(user);
            model.addAttribute("userName",user.getUser());
            return "trung/editMember";
        }
    }

    @GetMapping(value = "/editPass")
    public String showMemberEditPass(){
        return "trung/editPass";
    }
    @GetMapping(value = "/history")
    public String showHistory(){
        return "trung/history";
    }
}

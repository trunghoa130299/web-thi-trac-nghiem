package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import vn.codegym.model.User;
import vn.codegym.service.UserService;

@Controller
public class MemberController {

    @Autowired
    UserService userService;


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

    @GetMapping(value = "/editMember")
    public String showMemberEdit(){
        return "trung/editMember";
    }
    @GetMapping(value = "/editPass")
    public String showMemberEditPass(){
        return "trung/editPass";
    }
    @GetMapping(value = "/history")
    public String showHistory(){
        return "trung/history";
    }
    @GetMapping(value = "/register")
    public String dashBoard(){
        return "register";
    }
}

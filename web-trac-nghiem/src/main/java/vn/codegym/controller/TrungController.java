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
        user.setRePassWord(user.getPassWord());
        userService.save(user);
        return "login";
    }


    @GetMapping(value = "/view/{userName}")
    public String showMemberView(@PathVariable String userName, Model model){
        User user = userService.findById(userName);
        model.addAttribute("users",user);
        return "trung/view";
    }

    @PostMapping("/edit")
    public String editView(@ModelAttribute("users") User user,Model model){
        userService.save(user);
        model.addAttribute("message","Cập Nhật Thành Công !");
        model.addAttribute("users",user);
        return "trung/view";
    }

    @GetMapping(value = "/editMember/{id}")
    public String showMemberEdit(@PathVariable("id") String userName,Model model){
        User user = userService.findById(userName);
        model.addAttribute("users",user);
        model.addAttribute("userName",user.getId());
        return "trung/editMember";
    }

    @PostMapping("/editMember")
    public String editMember(@Valid @ModelAttribute("users") User users , BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()){
            model.addAttribute("userName",users.getId());
            return "trung/editMember";
        }else {
            userService.save(users);
            model.addAttribute("message","Cập Nhật Thành Công !");
            model.addAttribute("userName",users.getId());
            return "trung/editMember";
        }
    }

    @GetMapping(value = "/editPass/{id}")
    public String showMemberEditPass(@PathVariable("id") String user,Model model){
        User users = userService.findById(user);
        model.addAttribute("users",users);
        return "trung/editPass";
    }
    @PostMapping("/editPass")
    public String editPass(@Valid @ModelAttribute("users") User users , BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()){
            model.addAttribute("userName",users.getId());
            return "trung/editPass";
        }else {
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            users.setPassWord(passwordEncoder.encode(users.getPassWord()));
            users.setRePassWord(passwordEncoder.encode(users.getRePassWord()));
            userService.save(users);
            model.addAttribute("message","Cập Nhật Thành Công !");
            model.addAttribute("userName",users.getId());
            return "trung/editPass";
        }
    }
    @GetMapping(value = "/history")
    public String showHistory(){
        return "trung/history";
    }
}

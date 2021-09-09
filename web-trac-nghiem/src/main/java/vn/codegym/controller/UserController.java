package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.servlet.ModelAndView;
import vn.codegym.model.User;
import vn.codegym.service.UserService;

import java.text.ParseException;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/user/list")
    public String showList(Model model, @PageableDefault(value = 5) Pageable pageable){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails){
            String userName = ((UserDetails) principal).getUsername();
            model.addAttribute("userName",userName);
        }
        Page<User> users = userService.findAll(pageable);
        model.addAttribute("users", users);
        return "user/list";
    }

    @GetMapping("/user/create")
    public String showCreateForm(Model model){
        model.addAttribute("user", new User());
        return "user/create";
    }

    @PostMapping("/user/create")
    public String saveUser(@Validated @ModelAttribute("user") User user, BindingResult bindingResult) throws ParseException {
        if (bindingResult.hasFieldErrors()){
            return "user/create";
        }
        else {
            userService.save(user);
            return "redirect:/user/list";
        }
    }

    @GetMapping("/user/editMember/{id}")
    public String editMember(@PathVariable("id") String id, Model model)  {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "user/editMember";
    }

    @PostMapping("/user/update")
    public String update(@Validated User user, BindingResult bindingResult){
        if (bindingResult.hasFieldErrors()){
            return "user/editMember";
        }
        else {
            userService.save(user);
            return "redirect:/user/list";
        }
    }

    @GetMapping("/user/delete/{id}")
    public String delete(@PathVariable("id") String id){
        User user = userService.findById(id);
        userService.delete(user);
        return "redirect:/user/list";
    }

    @GetMapping("/user/editPass/{id}")
    public String editPass(@PathVariable("id") String id, Model model)  {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "user/editPass";
    }

    @PostMapping("/user/updatePass")
    public String updatePass(@Validated User user, BindingResult bindingResult){
        if (bindingResult.hasFieldErrors()){
            return "user/editPass";
        }
        else {
            String newPass = user.getPassWord();
            user.setPassWord(newPass);
            userService.save(user);
            return "redirect:/user/list";
        }
    }
}

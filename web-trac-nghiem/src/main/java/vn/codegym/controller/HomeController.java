package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import vn.codegym.model.MyUserDetail;
import vn.codegym.model.Result;
import vn.codegym.model.Role;
import vn.codegym.service.QuizService;
import vn.codegym.service.UserService;
import org.springframework.security.core.userdetails.User;
import java.security.Principal;
import java.util.Collection;
import java.util.List;


@Controller
public class HomeController {
    @Autowired
    QuizService qService;
    @Autowired
    UserService userService;

    @GetMapping("/role")
    public String redirectRole(){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof MyUserDetail){
            MyUserDetail userDetail = (MyUserDetail)principal;
            for (GrantedAuthority role : userDetail.getAuthorities()){
                if (role.getAuthority().equals("ROLE_ADMIN")){
                    return "redirect:/user/list";
                }
            }
        }
        return "redirect:/default";
    }
    @GetMapping("/login")
    public String showLogin(){
        return "login";
    }

    @GetMapping("/default")
    public String show(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails){
            String userName = ((UserDetails) principal).getUsername();
            model.addAttribute("userName",userName);
        }
        List<Result> sList = qService.getTopScore();
        model.addAttribute("sList", sList);
        int total = userService.findByTotalUser();
        model.addAttribute("total", total);
        return "default-page";
    }

    @GetMapping("/error")
    public String error(){
        return "error-page";
    }
}

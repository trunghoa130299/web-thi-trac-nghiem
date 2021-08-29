package vn.codegym.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {

    @GetMapping("/login")
    public String showLogin(){
        return "login";
    }

    @GetMapping("/index")
    public String showIndex(){
        return "index";
    }
    @GetMapping("/default")
    public String show(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails){
            String userName = ((UserDetails) principal).getUsername();
            model.addAttribute("userName",userName);
        }
        return "default-page";
    }
    @GetMapping("/them")
    public String showThem(){
        return "them";
    }

    @GetMapping("/list")
    public String showList(){
        return "list/List_Information";
    }

    @GetMapping("/addQuestion")
    public String addQuestion(){
        return "question/addQS";
    }
    @GetMapping("/listExam")
    public String listExam(){
        return "question/listExamQuestions";
    }
    @GetMapping("/questionList")
    public String questionList(){
        return "question/questionList";
    }
}

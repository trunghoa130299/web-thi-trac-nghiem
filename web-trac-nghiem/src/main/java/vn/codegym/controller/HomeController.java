package vn.codegym.controller;

import org.springframework.stereotype.Controller;
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
    public String show(){
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
        return "question/createNewExam";
    }
    @GetMapping("/listExam")
    public String listExam(){
        return "question/listExam";
    }
    @GetMapping("/questionList")
    public String questionList(){
        return "question/listQuestion";
    }
}

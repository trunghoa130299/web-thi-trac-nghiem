package vn.codegym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/index")
    public String showIndex(){
        return "index";
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

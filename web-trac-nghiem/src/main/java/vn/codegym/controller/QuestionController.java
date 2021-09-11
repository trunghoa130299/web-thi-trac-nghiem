package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import vn.codegym.model.Exam;
import vn.codegym.model.Question;
import vn.codegym.service.ExamService;
import vn.codegym.service.QuestionService;


@Controller
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private ExamService examService;

    @ModelAttribute("exams")
    public Iterable<Exam> exams(){
        return examService.findAll();
    }

    @GetMapping("/question/list")
    public String showList(Model model, @PageableDefault(value = 5) Pageable pageable){
        Page<Question> questions = questionService.findAll(pageable);
        model.addAttribute("questions", questions);
        return "question/listQuestion";
    }

    @GetMapping("/question/editQuest/{id}")
    public String editMember(@PathVariable("id") Integer id, Model model)  {
        Question question = questionService.findById(id);
        model.addAttribute("question", question);
        return "question/editQuestion";
    }

    @PostMapping("/question/update")
    public String update(Question question){
        questionService.save(question);
        return "redirect:/question/list";
    }

}

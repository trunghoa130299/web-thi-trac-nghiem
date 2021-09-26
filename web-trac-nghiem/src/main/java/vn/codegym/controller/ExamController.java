package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import vn.codegym.model.*;

import vn.codegym.service.*;

import java.util.List;
import java.util.Optional;

@Controller
public class ExamController {
    @Autowired
    UserService userService;

    @Autowired
    ResultService rService;

    @Autowired
    private ExamService examService;

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private ClassesService classesService;

    @Autowired
    private QuestionService questionService;

    @ModelAttribute("subjects")
    public Iterable<Subject> subjects(){
        return subjectService.findAll();
    }

    @ModelAttribute("classes")
    public Iterable<Classes> classes(){
        return classesService.findAll();
    }

    @ModelAttribute("questions")
    public Iterable<Question> questions(){
        return questionService.findAll();
    }

//    @ModelAttribute("questions")
//    public Page<Question> questions(@PageableDefault(value = 10) Pageable pageable){
//        return questionService.findAll(pageable);
//    }

    @GetMapping("/exam/list")
    public String showList(@RequestParam("subjectId") Optional<Integer> subjectId,
                           @RequestParam("keyword") Optional<String> name,
                           Model model, @PageableDefault(value = 5) Pageable pageable){
        Page<Exam> exams;
        model.addAttribute("subjects", subjectService.findAll());
        if (!name.isPresent()){
            if (subjectId.isPresent()){
                exams = examService.findAllBySubject(subjectId.get(), pageable);
                model.addAttribute("exams", exams);
                model.addAttribute("subjectId", subjectId.get());
                return "exam/listExam";
            }
            exams = examService.findAll(pageable);
        }
        else {
            exams = examService.findAllByNameExamContaining(name.get(), pageable);
        }
        model.addAttribute("exams", exams);
        return "exam/listExam";
    }

    @GetMapping("/exam/create")
    public String showCreateForm(@RequestParam(value = "subjectId",required = false) Optional<Integer> subjectId,
                                 @RequestParam("keyword") Optional<String> title, Model model,
                                 @PageableDefault(value = 100) Pageable pageable){
        model.addAttribute("subjects", subjectService.findAll());
        if (subjectId.isPresent()){
            Page<Question> questions1 = questionService.findAllBySubject(subjectId, pageable);
            model.addAttribute("question1", questions1);
            model.addAttribute("exam", new Exam());
            model.addAttribute("subjectId", subjectId.get());
            return "exam/createExam";
        }
        model.addAttribute("subjects", subjectService.findAll());
        model.addAttribute("exam", new Exam());
        return "exam/createExam";

    }

    @PostMapping("/exam/create")
    public String saveExam(@Validated @ModelAttribute("exam") Exam exam, BindingResult bindingResult){
        if (bindingResult.hasFieldErrors()){
            return "exam/createExam";
        }
        else {
            examService.save(exam);
            return "redirect:/exam/list";
        }
    }

    @GetMapping("/exam/editExam/{id}")
    public String editMember(@PathVariable("id") Integer id, Model model)  {
        Exam exam = examService.findById(id);
        model.addAttribute("exam", exam);
        return "exam/editExam";
    }

    @PostMapping("/exam/update")
    public String update(@Validated Exam exam, BindingResult bindingResult){
        if (bindingResult.hasFieldErrors()){
            return "exam/editExam";
        }
        else {
            examService.save(exam);
            return "redirect:/exam/list";
        }
    }

    @GetMapping("/exam/delete/{id}")
    public String delete(@PathVariable("id") Integer id){
        Exam exam = examService.findById(id);
        examService.delete(exam);
        return "redirect:/exam/list";
    }

    @GetMapping("/listExamSubject/{id}")
    public String listExamSubject(@PathVariable int id, Model model, @PageableDefault(value = 5) Pageable pageable){
        Page<Exam> exams;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails){
            String userName = ((UserDetails) principal).getUsername();
            model.addAttribute("userName",userName);
        }
        List<Result> sList = rService.getTopFive();
        model.addAttribute("sList", sList);
        int total = userService.findByTotalUser();
        String newUser = userService.findByNewUser();
        model.addAttribute("total", total);
        model.addAttribute("newUser",newUser);
        exams = examService.findAllBySubject(id,pageable);
        model.addAttribute("exams", exams);
        return "listExamSubject";
    }
}

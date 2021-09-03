package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import vn.codegym.model.Classes;
import vn.codegym.model.Exam;

import vn.codegym.model.Subject;
import vn.codegym.service.ClassesService;
import vn.codegym.service.ExamService;
import vn.codegym.service.SubjectService;

import java.text.ParseException;
import java.util.Optional;

@Controller
public class ExamController {
    @Autowired
    private ExamService examService;

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private ClassesService classesService;

    @ModelAttribute("subjects")
    public Iterable<Subject> subjects(){
        return subjectService.findAll();
    }

    @ModelAttribute("classes")
    public Iterable<Classes> classes(){
        return classesService.findAll();
    }

    @GetMapping("/exam/list")
    public String showList(@RequestParam("subjectId") Optional<Integer> subjectId,
                           Model model, @PageableDefault(value = 5) Pageable pageable){
        Page<Exam> exams;
        model.addAttribute("subjects", subjectService.findAll());
        if (subjectId.isPresent()){
            exams = examService.findAllBySubject(subjectId.get(), pageable);
            model.addAttribute("exams", exams);
            model.addAttribute("subjectId", subjectId.get());
            return "exam/listExam";
        }
        exams = examService.findAll(pageable);
        model.addAttribute("exams", exams);
        return "exam/listExam";
    }

    @GetMapping("/exam/create")
    public String showCreateForm(Model model){
        model.addAttribute("exam", new Exam());
        return "exam/createExam";
    }

    @PostMapping("/exam/create")
    public String saveUser(@Validated @ModelAttribute("exam") Exam exam, BindingResult bindingResult) throws ParseException {
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
}
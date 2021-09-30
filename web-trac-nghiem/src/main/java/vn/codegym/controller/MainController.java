package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.codegym.model.Exam;
import vn.codegym.model.QuestionForm;
import vn.codegym.model.Result;
import vn.codegym.model.User;
import vn.codegym.service.ExamService;
import vn.codegym.service.QuizService;
import vn.codegym.service.ResultService;
import vn.codegym.service.UserService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
public class MainController {
    private boolean status = true;
    private Date timer = null;
    @Autowired
    Result result;
    @Autowired
    QuizService qService;

    Boolean submitted = false;

    @Autowired
    UserService userService;

    @Autowired
    ResultService rService;

    @Autowired
    ExamService examService;

    @ModelAttribute("result")
    public Result getResult() {
        return result;
    }

    @GetMapping("/total")
    public String home1(Model model) {
        List<Result> sList = qService.getTopScore();
        model.addAttribute("sList", sList);
        int total = userService.findByTotalUser();
        model.addAttribute("total", total);
        return "";
    }

    @GetMapping("/")
    public String home(Model m){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String userName = ((UserDetails) principal).getUsername();
            m.addAttribute("userName", userName);
        }
        List<Result> sList = rService.getTopFive();
        m.addAttribute("sList", sList);
        int total = userService.findByTotalUser();
        String newUser = userService.findByNewUser();
        m.addAttribute("total", total);
        m.addAttribute("newUser",newUser);
        return "exam/index";
    }

    @GetMapping("/quiz1/{userName}")
    public String quiz (@PathVariable("userName") String username, Model m, RedirectAttributes ra) throws ParseException {
        status=true;
        if (username.equals("null") ) {
            ra.addFlashAttribute("warning", "Vui Lòng Đăng nhập ");
            return "redirect:/";
        }
        submitted = false;
        User user1 = userService.findById(username);
        result.setUsername(username);
        result.setUsers(user1);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (this.status){
            timer = new Date(System.currentTimeMillis());
            timer.setMinutes(timer.getMinutes()+5);
            System.out.println(formatter.format(timer));
            this.status = false;
        }
        QuestionForm qForm = qService.getQuestions();
        m.addAttribute("qForm", qForm);
        List<Result> sList = qService.getTopScore();
        m.addAttribute("sList", sList);
        int total = userService.findByTotalUser();
        m.addAttribute("total", total);
        m.addAttribute("futureDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(formatter.format(timer)));
        return "exam/quiz";
    }


    @GetMapping("/quiz1/{userName}/{id}")
    public String quiz13(@PathVariable("userName") String username,@PathVariable("id") int id, Model m, RedirectAttributes ra) throws ParseException {
        if (username.equals("null")) {
            ra.addFlashAttribute("warning", "Bạn Phải Nhập Tên ");
            return "redirect:/";
        }
        submitted = false;
        Exam exam = examService.findById(id);
        User user1 = userService.findById(username);
        result.setUsername(username);
        result.setUsers(user1);
        result.setQuestions(exam);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (this.status){
            timer = new Date(System.currentTimeMillis());
            timer.setMinutes(timer.getMinutes()+2);
            this.status = false;
        }
        QuestionForm qForm = qService.getQuestionss(id);
        m.addAttribute("qForm", qForm);
        List<Result> sList = qService.getTopScore();
        m.addAttribute("sList", sList);
        int total = userService.findByTotalUser();
        m.addAttribute("total", total);
            m.addAttribute("idExam",id);
        m.addAttribute("futureDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(formatter.format(timer)));
        return "exam/quizTest";

    }


    @GetMapping("/quiz11/{userName}/{id}")
    public String beforeQuiz(@PathVariable("userName") String username,@PathVariable("id") int id, RedirectAttributes ra){
        if (username.equals("null")) {
            ra.addFlashAttribute("warning", "Vui Lòng Đăng nhập ");
            return "redirect:/default";
        }
        this.status = true;
        return "redirect:/quiz1/" + username + "/" + id;
    }

    @PostMapping("/submit")
    public String submit (@ModelAttribute QuestionForm qForm, Model m){
        this.status = true;
        if (!submitted) {
            result.setTotalCorrect(qService.getResult(qForm));
            qService.saveScore(result);
            m.addAttribute("qForm", qForm);
            submitted = true;
        }
        return "exam/result";
    }

    @PostMapping("/submit1")
    public String submit1quiz (@ModelAttribute QuestionForm qForm, Model m){
        this.status = true;
        if (!submitted) {
            result.setTotalCorrect(qService.getResult(qForm));
            qService.saveScore(result);
            m.addAttribute("qForm", qForm);
            submitted = true;
        }

        return "exam/result";
    }
@PostMapping("/submit1/{id}")
public String submit1 (@PathVariable(name = "id") int idExam,@ModelAttribute QuestionForm qForm, Model m){
    this.status = true;
    if (!submitted) {
        result.setTotalCorrect(qService.getResult(qForm));
        qService.saveScore(result);
        result = new Result();
        m.addAttribute("qForm", qForm);
        m.addAttribute("idExam", idExam); m.addAttribute("no",1);
        submitted = true;
    }
//    @PostMapping("/submit1")
//    public String submit1 (@ModelAttribute QuestionForm qForm, Model m){
//        this.status = true;
//        if (!submitted) {
//            result.setTotalCorrect(qService.getResult(qForm));
//            qService.saveScore(result);
//            result = new Result();
//            m.addAttribute("qForm", qForm);
//            submitted = true;
//        }
//
//        return "exam/result";
//
//    }

    return "exam/resultTest";
}

//    @GetMapping("/score")
//    public String score (Model m){
//        List<Result> sList = qService.getTopScore();
//        m.addAttribute("sList", sList);
//        return "exam/scoreboard";
//    }

    @GetMapping("/score/{id}")
    public String score (@PathVariable(name = "id") int idExam,Model m){
        List<Result> sList = qService.getTopScoreByExam(idExam);
        m.addAttribute("sList", sList);
        return "exam/scoreboard";
    }
    @GetMapping("/listInformation")
    public String listInformation (Model m){
        List<Result> sList = rService.getTopFive();
        m.addAttribute("sList", sList);

        return "Hau/ListInformation";
    }
    @GetMapping("/honorthegoldboard")
    public String honorthegoldboard (Model m){
        int total = userService.findByTotalUser();
        String newUser = userService.findByNewUser();
        m.addAttribute("total", total);
        m.addAttribute("newUser",newUser);
        return "Hau/HonorTheGoldBoard";
    }
    @GetMapping("/aboutus")
    public String aboutUS(){
        return "aboutAs";
    }
}

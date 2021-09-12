package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.codegym.model.QuestionForm;
import vn.codegym.model.Result;
import vn.codegym.model.User;
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
    @PostMapping("/quiz")
    public String quiz (@RequestParam String username, Model m, RedirectAttributes ra) throws ParseException {
        if (username.equals("")) {
            ra.addFlashAttribute("warning", "Bạn Phải Nhập Tên ");
            return "redirect:/";
        }
        submitted = false;
        User user1 = userService.findById(username);
        result.setUsername(username);
        result.setUsers(user1);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (this.status){
            timer = new Date(System.currentTimeMillis());
            timer.setMinutes(timer.getMinutes()+2);
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
    public String quiz1 (@PathVariable("userName") String username,@PathVariable("id") int id, Model m, RedirectAttributes ra) throws ParseException {
        if (username.equals("")) {
            ra.addFlashAttribute("warning", "Bạn Phải Nhập Tên ");
            return "redirect:/";
        }
        submitted = false;
        User user1 = userService.findById(username);
        result.setUsername(username);
        result.setUsers(user1);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (this.status){
            timer = new Date(System.currentTimeMillis());
            timer.setMinutes(timer.getMinutes()+2);
            System.out.println(formatter.format(timer));
            this.status = false;
        }
        QuestionForm qForm = qService.getQuestionss(id);
        m.addAttribute("qForm", qForm);
        List<Result> sList = qService.getTopScore();
        m.addAttribute("sList", sList);
        int total = userService.findByTotalUser();
        m.addAttribute("total", total);
        m.addAttribute("futureDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(formatter.format(timer)));
        return "exam/quiz1";
    }

    @PostMapping("/submit")
    public String submit (@ModelAttribute QuestionForm qForm, Model m){
        this.status = true;
        if (!submitted) {
            result.setTotalCorrect(qService.getResult(qForm));
            qService.saveScore(result);
            submitted = true;
        }

        return "exam/result";
    }
    @PostMapping("/submit1")
    public String submit1 (@ModelAttribute QuestionForm qForm, Model m){
        this.status = true;
        if (!submitted) {
            result.setTotalCorrect(qService.getResult(qForm));
            qService.saveScore(result);
            submitted = true;
        }

        return "exam/result";
    }

    @GetMapping("/score")
    public String score (Model m){
        List<Result> sList = qService.getTopScore();
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
}

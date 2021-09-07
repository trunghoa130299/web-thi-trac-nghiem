package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.codegym.model.QuestionForm;
import vn.codegym.model.Result;
import vn.codegym.service.QuizService;
import vn.codegym.service.ResultService;
import vn.codegym.service.UserService;

import java.util.List;

@Controller
public class MainController {
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
            List<Result> sList = qService.getTopScore();
            m.addAttribute("sList", sList);
            int total = userService.findByTotalUser();
            m.addAttribute("total", total);
            return "exam/index";
        }
        @PostMapping("/quiz")
        public String quiz (@RequestParam String username, Model m, RedirectAttributes ra){
            if (username.equals("")) {
                ra.addFlashAttribute("warning", "Bạn Phải Nhập Tên ");
                return "redirect:/";
            }

            submitted = false;
            result.setUsername(username);

            QuestionForm qForm = qService.getQuestions();
            m.addAttribute("qForm", qForm);
            List<Result> sList = qService.getTopScore();
            m.addAttribute("sList", sList);
            int total = userService.findByTotalUser();
            m.addAttribute("total", total);
            return "exam/quiz";
        }

        @PostMapping("/submit")
        public String submit (@ModelAttribute QuestionForm qForm, Model m){
            if (!submitted) {
                result.setTotalCorrect(qService.getResult(qForm));
                qService.saveScore(result);
                submitted = true;
            }

            return "exam/result";
        }

        @GetMapping("/score")
        public String score (Model m){
            List<Result> sList = rService.getTopScore();
            m.addAttribute("sList", sList);

            return "exam/scoreboard";
        }
        @GetMapping("/listInformation")
        public String listInformation (Model m){
            List<Result> sList = qService.getTopScore();
            m.addAttribute("sList", sList);

            return "Hau/ListInformation";
        }
        @GetMapping("/honorthegoldboard")
        public String honorthegoldboard (Model m){
            int total = userService.findByTotalUser();
            m.addAttribute("total", total);
            return "Hau/HonorTheGoldBoard";
        }
    }

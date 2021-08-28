package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.codegym.model.PhuongAn;
import vn.codegym.model.QuestionForm;
import vn.codegym.service.QuizService;

import java.util.List;

@Controller
public class MainController {
    @Autowired
    PhuongAn phuongAn;
    @Autowired
    QuizService qService;

    Boolean submitted = false;

    @ModelAttribute("result")
    public PhuongAn getResult() {
        return phuongAn;
    }

    @GetMapping("/")
    public String home() {
        return "exam/index";
    }

    @PostMapping("/quiz")
    public String quiz(@RequestParam String username, Model m, RedirectAttributes ra) {
        if(username.equals("")) {
            ra.addFlashAttribute("warning", "You must enter your name");
            return "redirect:/";
        }

        submitted = false;
        phuongAn.setUsername(username);

        QuestionForm qForm = qService.getQuestions();
        m.addAttribute("qForm", qForm);

        return "exam/quiz";
    }

    @PostMapping("/submit")
    public String submit(@ModelAttribute QuestionForm qForm, Model m) {
        if(!submitted) {
            phuongAn.setTotalCorrect(qService.getResult(qForm));
            qService.saveScore(phuongAn);
            submitted = true;
        }

        return "exam/result";
    }

    @GetMapping("/score")
    public String score(Model m) {
        List<PhuongAn> sList = qService.getTopScore();
        m.addAttribute("sList", sList);

        return "exam/scoreboard";
    }
}

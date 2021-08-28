package vn.codegym.model;

import org.aspectj.weaver.patterns.TypePatternQuestions;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class QuestionForm {

    private List<CauHoi> cauHois;

    public List<CauHoi> getCauHois() {
        return cauHois;
    }

    public void setCauHois(List<CauHoi> cauHois) {
        this.cauHois = cauHois;
    }
}
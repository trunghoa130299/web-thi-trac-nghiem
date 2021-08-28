package vn.codegym.model;

import org.aspectj.weaver.patterns.TypePatternQuestions;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class QuestionForm {

    private List<TypePatternQuestions.Question> questions;


    public List<TypePatternQuestions.Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<TypePatternQuestions.Question> questions) {
        this.questions = questions;
    }
}
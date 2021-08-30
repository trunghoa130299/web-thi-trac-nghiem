package vn.codegym.model;

import org.springframework.stereotype.Component;

import javax.persistence.*;

@Component
@Entity
public class Result {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int totalCorrect = 0;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "users_user",referencedColumnName = "id" )
    private User users;


    @ManyToOne(targetEntity = Question.class)
    private Question questions;

    public Result() {
        super();
    }

    public Result(int id, int totalCorrect, User users, Question questions) {
        this.id = id;
        this.totalCorrect = totalCorrect;
        this.users = users;
        this.questions = questions;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTotalCorrect() {
        return totalCorrect;
    }

    public void setTotalCorrect(int totalCorrect) {
        this.totalCorrect = totalCorrect;
    }

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }

    public Question getQuestions() {
        return questions;
    }

    public void setQuestions(Question questions) {
        this.questions = questions;
    }
}
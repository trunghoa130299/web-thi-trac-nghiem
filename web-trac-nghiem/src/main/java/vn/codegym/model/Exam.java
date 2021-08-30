package vn.codegym.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Exam {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String idName;

    private String nameExam;

    @ManyToOne(targetEntity = Classes.class)
    private Classes classes;

    @ManyToOne(targetEntity = Subject.class)
    private Subject subject;

    @ManyToOne(targetEntity = User.class)
    private User users;

    @OneToMany(mappedBy = "exams")
    private List<TestExam> testExams;

    @OneToMany(mappedBy="exams")
    private List<Question> questions;

    public Exam() {
    }

    public Exam(int id, String idName, String nameExam, Classes classes, Subject subject, User users, List<TestExam> testExams, List<Question> questions) {
        this.id = id;
        this.idName = idName;
        this.nameExam = nameExam;
        this.classes = classes;
        this.subject = subject;
        this.users = users;
        this.testExams = testExams;
        this.questions = questions;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdName() {
        return idName;
    }

    public void setIdName(String idName) {
        this.idName = idName;
    }

    public String getNameExam() {
        return nameExam;
    }

    public void setNameExam(String nameExam) {
        this.nameExam = nameExam;
    }

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }

    public List<TestExam> getTestExams() {
        return testExams;
    }

    public void setTestExams(List<TestExam> testExams) {
        this.testExams = testExams;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }
}

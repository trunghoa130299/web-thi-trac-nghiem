package vn.codegym.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import java.sql.Timestamp;

@Entity
public class TestExam {
    @Id
    private int id;

    private Timestamp timeStart;

    private Timestamp timeEnd;

    private double scoreSum;

    private Boolean finished;


    @ManyToOne(targetEntity = Exam.class)
    private Exam exams;

    @ManyToOne
    private User users;

    public TestExam() {
    }

    public TestExam(int id, Timestamp timeStart, Timestamp timeEnd, double scoreSum, Boolean finished, Exam exams, User users) {
        this.id = id;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.scoreSum = scoreSum;
        this.finished = finished;
        this.exams = exams;
        this.users = users;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(Timestamp timeStart) {
        this.timeStart = timeStart;
    }

    public Timestamp getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Timestamp timeEnd) {
        this.timeEnd = timeEnd;
    }

    public double getScoreSum() {
        return scoreSum;
    }

    public void setScoreSum(double scoreSum) {
        this.scoreSum = scoreSum;
    }

    public Boolean getFinished() {
        return finished;
    }

    public void setFinished(Boolean finished) {
        this.finished = finished;
    }

    public Exam getExams() {
        return exams;
    }

    public void setExams(Exam exams) {
        this.exams = exams;
    }

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }
}

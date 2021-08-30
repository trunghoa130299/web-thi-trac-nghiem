package vn.codegym.model;

import javax.persistence.*;
import java.util.Set;


@Entity
public class Classes {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private  String nameClass;

    @OneToMany(mappedBy = "classes")
    private Set<Exam> exams;

    public Classes() {
    }

    public Classes(int id, String nameClass, Set<Exam> exams) {
        this.id = id;
        this.nameClass = nameClass;
        this.exams = exams;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameClass() {
        return nameClass;
    }

    public void setNameClass(String nameClass) {
        this.nameClass = nameClass;
    }

    public Set<Exam> getExams() {
        return exams;
    }

    public void setExams(Set<Exam> exams) {
        this.exams = exams;
    }
}

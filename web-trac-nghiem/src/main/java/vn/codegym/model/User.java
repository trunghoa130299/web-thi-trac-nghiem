package vn.codegym.model;

import javax.persistence.*;
import java.util.Set;

@Entity
public class User {
    @Id
    private String user;
    private String passWord;
    private String rePassWord;
    private String fullName;
    private String email;
    private String address;
    private String phoneNumber;

    @ManyToMany(cascade = CascadeType.PERSIST,fetch = FetchType.EAGER)
    @JoinTable(name = "user_role",joinColumns = @JoinColumn(name = "userName", referencedColumnName = "userName"),
            inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"))
    private Set<Role> roles;
}

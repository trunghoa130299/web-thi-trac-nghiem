package vn.codegym.model;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Role {
    @Id
<<<<<<< HEAD
    private Integer id;
=======
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

>>>>>>> 3f69a13f21c83079eb8eef8d7b2b641baaf304c9
    private String roleName;

    @ManyToMany(mappedBy = "roles")
    private Set<User> users;

    public Role() {
    }

    public Role(Integer id, String roleName, Set<User> users) {
        this.id = id;
        this.roleName = roleName;
        this.users = users;
    }

    public Role(String roleName, Set<User> users) {
        this.roleName = roleName;
        this.users = users;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
}

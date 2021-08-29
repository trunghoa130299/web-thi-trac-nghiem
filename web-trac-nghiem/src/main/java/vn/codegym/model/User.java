package vn.codegym.model;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Set;

@Entity
public class User {
    @Id
    @NotBlank(message = "User is not be blank")
    private String user;

    @NotBlank(message = "Password is not be blank")
    private String passWord;

    @NotBlank(message = "Password is not be blank")
    private String rePassWord;

    @NotBlank(message = "Full name is not be blank")
    private String fullName;

    @Email
    @NotBlank(message = "Email is not be blank")
    private String email;

    @NotBlank(message = "Address is not be blank")
    private String address;

    @NotBlank(message = "Phone number is not be blank")
    private String phoneNumber;

    @ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "username"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    @OneToMany(mappedBy="taiKhoan")
    private List<DeThi> deThis;

    @OneToMany(mappedBy="taiKhoan")
    private List<ThamGiaThi> thamGiaThis;

    public User() {
    }

    public User(String user, String passWord, String rePassWord, String fullName, String email, String address,
                String phoneNumber, Set<Role> roles, List<DeThi> deThis, List<ThamGiaThi> thamGiaThis) {
        this.user = user;
        this.passWord = passWord;
        this.rePassWord = rePassWord;
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.roles = roles;
        this.deThis = deThis;
        this.thamGiaThis = thamGiaThis;
    }


    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getRePassWord() {
        return rePassWord;
    }

    public void setRePassWord(String rePassWord) {
        this.rePassWord = rePassWord;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public List<DeThi> getDeThis() {
        return deThis;
    }

    public void setDeThis(List<DeThi> deThis) {
        this.deThis = deThis;
    }


    public List<ThamGiaThi> getThamGiaThis() {
        return thamGiaThis;
    }

    public void setThamGiaThis(List<ThamGiaThi> thamGiaThis) {
        this.thamGiaThis = thamGiaThis;
    }
}

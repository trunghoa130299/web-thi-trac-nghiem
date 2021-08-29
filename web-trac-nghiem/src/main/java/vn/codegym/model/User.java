package vn.codegym.model;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.util.List;
import java.util.Set;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotBlank(message = "Tài Khoản Không Được Để Trống")
    private String user;

    @NotBlank(message = "Mật Khẩu Không Được Để Trống")
    private String passWord;

    @NotBlank(message = " Không Được Để Trống")
    private String rePassWord;

    @NotBlank(message = "Tên Không Được Để Trống")
    private String fullName;

    @Pattern(regexp = "^[a-z][a-z0-9_\\.]{5,32}@[a-z0-9]{2,}(\\.[a-z0-9]{2,4}){1,2}$", message = "Sai định dạng")
    @NotBlank(message = " Email Không được để trống")
    private String email;

    @NotBlank(message = "Địa Chỉ Được Để Trống")
    private String address;

    @Pattern(regexp = "^((\\(84\\)\\+)|(0))((91)|(90))[\\d]{7}$", message = "Sai định dạng")
    private String phoneNumber;

    private String anh;

    @ManyToMany(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "userName", referencedColumnName = "user"),
            inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"))
    private Set<Role> roles;

    @OneToMany(mappedBy = "taiKhoan")
    private List<DeThi> deThis;


    @OneToMany(mappedBy = "taiKhoan")
    private List<ThamGiaThi> thamGiaThis;

    public User() {
    }

    public User(String user, String passWord, String rePassWord, String fullName, String email, String address, String phoneNumber, String anh, Set<Role> roles, List<DeThi> deThis, List<ThamGiaThi> thamGiaThis) {
        this.user = user;
        this.passWord = passWord;
        this.rePassWord = rePassWord;
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.anh = anh;
        this.roles = roles;
        this.deThis = deThis;
        this.thamGiaThis = thamGiaThis;
    }

    public User(String anh) {
        this.anh = anh;
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

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
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

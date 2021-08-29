package vn.codegym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
    @GetMapping(value = "/view")
    public String showMemberView(){
        return "trung/view";
    }
    @GetMapping(value = "/editMember")
    public String showMemberEdit(){
        return "trung/editMember";
    }
//    @GetMapping(value = "/editPass")
//    public String showMemberEditPass(){
//        return "trung/editPass";
//    }
    @GetMapping(value = "/history")
    public String showHistory(){
        return "trung/history";
    }
    @GetMapping(value = "/register")
    public String dashBoard(){
        return "register";
    }
}

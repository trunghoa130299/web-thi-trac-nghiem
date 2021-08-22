package vn.codegym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
    @GetMapping(value = "/view")
    public String showMemberView(){
        return "member/view";
    }
    @GetMapping(value = "/editMember")
    public String showMemberEdit(){
        return "member/editMember";
    }
    @GetMapping(value = "/editPass")
    public String showMemberEditPass(){
        return "member/editPass";
    }
    @GetMapping(value = "/history")
    public String showHistory(){
        return "member/history";
    }
    @GetMapping(value = "/register")
    public String dashBoard(){
        return "register";
    }
}

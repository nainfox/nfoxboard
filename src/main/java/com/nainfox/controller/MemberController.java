package com.nainfox.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

//	@Autowired
//	private MemberService memberService;

	@GetMapping("/member/signup")
	public String signupForm() {
		return "/member/signup.jsp";
	}
	
	@GetMapping("/member/login")
	public String loginForm() {
		return "/member/login.jsp";
	}
	
	
}

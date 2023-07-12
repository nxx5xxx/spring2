package com.tjoeun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SecurityTestController {

	

	@GetMapping("/test1")
	public String requestMethod(Model model) {
		return "test/st1";
	}
	
	@GetMapping("/admin/main")
	public String requestMethod2(Model model) {
		model.addAttribute("info", "test/admin.jsp" );
		return "test/admin";
	}
	
	@GetMapping("/manager/main")
	public String requestMethod3(Model model) {
		model.addAttribute("info", "test/manager.jsp" );
		return "test/manager";
	}
	
	@GetMapping("/member/main")
	public String requestMethod4(Model model) {
		model.addAttribute("info", "test/member.jsp" );
		return "test/member";
	}
	
	@GetMapping("/home/main")
	public String requestMethod5(Model model) {
		model.addAttribute("info", "test/home.jsp" );
		return "test/home";
	}
	
	@GetMapping("/login")
	public String login() {
		return "loginForm";
	}
	@GetMapping("/admin")
	public String admin() {
		return "security01";
	}
	@GetMapping("/logout")
	public String logout(Model model) {
		return "loginForm";
	}
}

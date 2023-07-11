package com.tjoeun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {
	
	@GetMapping("/home")
	public String welcome(Model model) {
		model.addAttribute("greeting", "안녕하세요 헬로");
		model.addAttribute("strapline","안녕하세요, 온라인 쇼핑몰입니다");
		return "welcome";
	}
}

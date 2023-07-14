package com.tjoeun.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CustomController {

	@GetMapping("/cumtomLogin")
	public void login(String error,String logout, Model model) {
		
		log.info("error : " + error);
		log.info("logout : " + logout);
		if(error!=null) {
			model.addAttribute("error", "로그인 에러 발생, 계정을 확인해 보세요");
		}
		if(logout!=null) {
			model.addAttribute("logout", "로그아웃!!");
		}
	}
	
	@GetMapping("/customLogout")
	public void logout() {
		log.info("custom logout");
	}
	
	
}

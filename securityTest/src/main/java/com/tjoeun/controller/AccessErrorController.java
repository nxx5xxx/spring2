package com.tjoeun.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class AccessErrorController {
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("접속이 거절되었습니다 : "+auth);
		model.addAttribute("message" , "접속이 거절 되었습니다");
	}
}

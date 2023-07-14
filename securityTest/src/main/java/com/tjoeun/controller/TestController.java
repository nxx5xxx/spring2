package com.tjoeun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/test/")
@Controller
public class TestController {

	@GetMapping("/all")
	public void all() {
		log.info("모두 접속 가능함");
	}
	
	@GetMapping("/member")
	public void member() {
		log.info("멤버만 접속 가능함");
	}
	
	@GetMapping("/admin")
	public void admin() {
		log.info("어드민만 접속 가능함");
	}
	

}

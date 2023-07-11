package com.tjoeun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@GetMapping("/t1/{bookId}")
	public String t1(@PathVariable String bookId, Model model) {
		System.out.println("도서 ID : " + bookId);
		model.addAttribute("bookId", "도서 ID : " + bookId);
		return "test/t1";
	}
	
	@GetMapping("/t2/{category}/publisher/{publisher}")
	public String t2(@PathVariable String category,
					@PathVariable String publisher, 
					Model model) {
		model.addAttribute("bookInfo", "도서분야 : " + category +"<br>"+"출판사 : "+ publisher);
		return "test/t2";
	}
}

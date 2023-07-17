package kr.gobong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.gobong.domain.UserDTO;
import kr.gobong.service.TestService;

//이곳이 DAO
@Controller
public class TestController {
	
	@Autowired
	private TestService testService;
	
	@GetMapping("/test")
	public String test1(@RequestParam String id , Model model) {
		System.out.println(id);
		String pw = testService.getUserTest("test1");
		model.addAttribute("pw", pw);
		return "test";
	}
}

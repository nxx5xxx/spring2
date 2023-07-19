package kr.gobong.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.gobong.domain.UserDTO;
import kr.gobong.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	  @GetMapping("/join")
	  public String join(@ModelAttribute("joinUserDto") UserDTO joinUserDto) {
		return "join";
	  }
	  
	  @PostMapping("/join_procedure")
	  public String joinProcedure(@Valid @ModelAttribute("joinUserDto") UserDTO joinUserDto, BindingResult result){
	  	if(result.hasErrors()) {
	  		return "join";
		}	
	  userService.addUserInfo(joinUserDto);	
		
			return "join_success";
	  }
}

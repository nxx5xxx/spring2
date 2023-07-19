package kr.gobong.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.gobong.domain.LikeDTO;
import kr.gobong.domain.UserDTO;
import kr.gobong.service.LikeService;

@Controller
@RequestMapping("/like")
public class LikeController {
	
	@Autowired
	LikeService likeService;
	
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
	
	@GetMapping("/upLike.do")
	public void upLike(@RequestParam("no") int no) {
		System.out.println(no);
		System.out.println("upLike동작");
		likeService.upLike(no);
		LikeDTO likeDto = new LikeDTO(); 
		
		likeDto.setNo(no);
		likeDto.setId(loginUser.getId());
		likeDto.setUpcheck(1);
		likeService.registLike(likeDto);
		
	}
}

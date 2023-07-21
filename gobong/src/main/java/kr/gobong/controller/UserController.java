package kr.gobong.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.gobong.domain.UserDTO;
import kr.gobong.domain.UserVO;
import kr.gobong.service.UserService;

/* 0719김우주 */
@Controller
@RequestMapping("/user")
public class UserController {
/*//0719김우주 */	
	@Autowired
	private UserService userService;
	
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
	
	  @GetMapping("/join")
	  public String join(@ModelAttribute("joinUserDto") UserDTO joinUserDto) {
		return "user/join";
	  }
	  
	  @PostMapping("/join_procedure")
	  public String joinProcedure(@Valid @ModelAttribute("joinUserDto") UserDTO joinUserDto, BindingResult result){
	  	if(result.hasErrors()) {
	  		return "user/join";
		}	
	  userService.addUserInfo(joinUserDto);	
		
			return "user/join_success";
	  }
	  
		//로그인
		@PostMapping("/loginPro")
		public String loginPro(@ModelAttribute("tmpUserLogin") UserDTO tmpUserLogin, BindingResult result) {
			
			if(result.hasErrors()) {
				return "index";
			}
			
			System.out.println("tmpUserLogin : " + tmpUserLogin);
			userService.getUserLogin(tmpUserLogin);
			
			if(loginUser.isUserLogin() == true) {
				System.out.println("loginUser : " + loginUser);
				return "redirect:/";
			} else {
				return "user/login_fail";
			}
		}
		/* 0719 손승기 */
		//마이페이지 이동
		@GetMapping("/mypage")
		public String myPage(@ModelAttribute("userInfo") UserDTO userInfo) {
			userService.getUserInfo(userInfo);
			return "user/mypage";
		}
		
		//정보수정하기
		@PostMapping("/userInfoModifyPro")
		public String userInfoModifyPro(@Valid @ModelAttribute("userInfo") UserDTO userInfo, BindingResult result) {
			userService.userModifyPro(userInfo);
			if(result.hasErrors()) {			
				return "user/modify_fail";
			}
			return "redirect:/user/mypage";
		}
		
		//나의 프로필 보기
		@GetMapping("/profile")
		public String getUserProfile(@RequestParam("id") String id, Model model) {
			model.addAttribute("id", id);
			
			List<UserVO> userProfile = userService.getUserProfile(id);
			
			model.addAttribute("userProfile", userProfile);
			
			return "user/profile"; 
		}
		/* 0719 손승기 */
		/* 김우주0720 */
		//로그아웃
		@GetMapping("/logout")
		public String logout(HttpServletRequest request, HttpServletResponse response) {
			HttpSession session = request.getSession();
			session.invalidate();
			
//			Cookie[] cookies = request.getCookies();
//			if(cookies!=null) {
//				for(Cookie data : cookies) {
//					data.setMaxAge(0);
//					response.addCookie(data);
//				}
//			}
			return "redirect:/";
		}
		
		/*//김우주0720 */
		//탈퇴
		@GetMapping("/userDel")
		public String userDel(@RequestParam("id") String id, Model model){
			userService.userDel(id);
			model.addAttribute("id", id);
			return "user/user_del";
		}
}

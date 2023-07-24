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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.UserDTO;
import kr.gobong.domain.UserVO;
import kr.gobong.service.BoardService;
import kr.gobong.service.UserService;
import kr.gobong.validator.UserCustomValidator;

/* 0719김우주 */
@Controller
@RequestMapping("/user")
public class UserController {
/*//0719김우주 */	
	@Autowired
	private UserService userService;
	
	/* 0723김우주 */
	@Autowired
	private BoardService boardService;
	/*//0723김우주 */
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
			/* 0724김우주 */
			if(result.hasErrors()) {			
				return "user/mypage";
			}
			userService.userModifyPro(userInfo);
			/* 0724김우주 */
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
		
		/*조태정 0721*/
		//탈퇴
		@GetMapping("/userDel")
		public String userDel(@RequestParam("id") String id, Model model){
			userService.userDel(id);
			model.addAttribute("id", id);
			return "user/user_del";
		}
		
		/* 김우주0723 해쉬태그인지 아닌지 수정했습니다	*/
		@GetMapping("/searchUser")
		public String searchUser(@RequestParam("id") String id, Model model) {
			if(id.indexOf("#")==-1) {
				List<UserVO> search = userService.searchUser(id);
				List<UserVO> userProfile = userService.getUserProfile(id);
				
				model.addAttribute("userProfile", userProfile);
				model.addAttribute("search", search);
				model.addAttribute("id", id);
				
				return "user/searchPage";
			}else {
				String hashtag = "#%"+id.substring(1)+"%";
				List<BoardDTO> boardSearchHashList = boardService.getBoardListByHashtag(hashtag);
				model.addAttribute("boardList", boardSearchHashList);
				return "board/board_list";
			}
		}
		/*//김우주0723	*/
		/*조태정 0721*/
		
		/* 김우주0723	*/
		//아이디 중복체크
		@GetMapping("/duplicationCheckId.do")
		@ResponseBody
		public int duplicationCheckId(@RequestParam String id) {
			return userService.duplicationCheckId(id);
		}
		/* 김우주0723	*/
		
		/* 김우주0724	*/
		//커스텀발리데이션
		@InitBinder({"joinUserDto","userInfo"})
		public void initBinder(WebDataBinder binder) {
			UserCustomValidator ucv = new UserCustomValidator();
			binder.addValidators(ucv);
		}
		/* 김우주0724	*/
}

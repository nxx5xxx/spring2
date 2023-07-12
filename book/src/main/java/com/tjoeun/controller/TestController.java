package com.tjoeun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tjoeun.dto.Member;

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
	// @MatrixVariable ; 표시하고 지정한 변수=값 을 받음
	@GetMapping("/t3/{bookId}")
	public String t3(@PathVariable String bookId,
					@MatrixVariable("category") String category, Model model) {
					//멤버변수랑 이름똑같으면 생략해도된다 @MatrixVariable 이라고 써도된단말
		System.out.println("도서 ID"+bookId); //PathVariable로 받음
		System.out.println("도서 분야"+category); //MatrixVariable로 받음
		model.addAttribute("bookInfo","<br>도서 ID"+bookId+"<br>도서 분야"+category);
		return "test/t3";
	}
	
	@GetMapping("/t5/{bookId}/category/{category}")
	public String t5(@MatrixVariable(value="publisher" , pathVar="bookId") String d1,
			@MatrixVariable(value="publisher" , pathVar="category") String d2,
			Model model) {
		//여기서 value는 받는것을 지정하기위해 , pathVar는 어느변수뒤에;가 붙냐를 보기위한것
		System.out.println("출판사"+d1); //PathVariable로 받음
		System.out.println("도서 분야"+d2); //MatrixVariable로 받음
		model.addAttribute("data","<br>출판사 : "+d1+"<br>도서 분야 : "+d2);
		return "test/t5";
	}
	
	@GetMapping("/t6/{bookId}")
	public String t6(@PathVariable String bookId,
			@MatrixVariable(required=false, defaultValue="아무개출판사") String d1,Model model) {
			//required는 true가 default로 되어있다 , defaultValue는 값이 없을경우 들어올 값
		System.out.println("도서 아이디 : " + bookId);
		System.out.println("출판사 : " +d1);
		model.addAttribute("data","<br>도서 아이디 : "+bookId+"<br>출판사 : "+d1);
		
		return "test/t6";
	}
	
	@GetMapping("/t7/{bookId}/category/{category}")
	public String t7(@PathVariable String bookId,@PathVariable String category,
					@MatrixVariable MultiValueMap<String,String> mvm1,
					@MatrixVariable(pathVar="category") MultiValueMap<String,String> mvm2,
					Model model) {
		System.out.println("도서 아이디 : " + bookId);
		System.out.println("도서분류 : " +category);
		System.out.println("mvm1 : " +mvm1);
		System.out.println("mvm2 : " +mvm2);
		model.addAttribute("bookData","<br>mvm1 : "+mvm1+"<br>mvm2 : "+mvm2);
		return "test/t7";
	}
	// @@RequestParam ? 표시하고 지정한 변수=값 을 받음
	@GetMapping("/t8")
	public String requestParamMethod(@RequestParam String id, Model model) {
		System.out.println("도서 ID : " + id);
		model.addAttribute("bookInfo", "<br>도서 ID : " + id);
		return "test/t8";
	}
	//회원가입폼
	@GetMapping("/regForm")
	public String regForm(Model model) {
		Member m1 =new Member();
		System.out.println("----------------@GetMapping(\"/regForm\")-----------------");
		System.out.println("id"+m1.getId());
		System.out.println("pw"+m1.getPasswd());
		System.out.println("addr"+m1.getCity());
		System.out.println("sex"+m1.getSex());
		System.out.println("hobby"+m1.getHobby());
		System.out.println("birth"+m1.getBirthDate());
		model.addAttribute("member", m1);
		return "test/form_test01";
	}
	
	@PostMapping("/regProcedure")
	public String regProcedure(Member m1 , Model model) {
		System.out.println("----------------@PostMapping(member)-----------------");
		System.out.println("id"+m1.getId());
		System.out.println("pw"+m1.getPasswd());
		System.out.println("addr"+m1.getCity());
		System.out.println("sex"+m1.getSex());
		for(int i=0;i<m1.getHobby().length;i++) {
			System.out.println("hobby : "+m1.getHobby()[i]);
		}
		model.addAttribute("member", m1);
		return "test/form_test02";
	}
	
	@GetMapping("/t9")
	public String showForm() {
		return "test/t9";
	}
	
	@ModelAttribute("title")
	public String setTitle() {
		return "@ModelAttribute 유형";
	}
	
	/*
	@ModelAttribute("subTitle")
	public void setSubTitle(Model model) {
		return "메소드 차원에서 @ModelAttribute 적용하기";
	}
	*/
	//위 아래 둘다 같다
	@ModelAttribute
	public void setSubTitle(Model model) {
		model.addAttribute("subTitle", "메소드 차원에서 @ModelAttribute 적용하기");
	}
	
	@GetMapping("/t10")
	public String showForm2() {
		return "test/t10";
	}
	
	// <sec:authorize> : 권한태그 적용하기
	@GetMapping("/st2")
	public String requestMethod1() {
		
		return "test/st2";
	}

	@GetMapping("/manager/tag")
	public String requestMethod2(Model model) {
		
		return "test/st2";
	}
	
	// <sec:authorize> : 권한태그 적용하기
	@GetMapping("/st3")
	public String requestMethod3() {
		
		return "test/st3";
	}
	
	@GetMapping("/admin/tag")
	public String requestMethod4(Model model) {
		
		return "test/st3";
	}
	
	
}

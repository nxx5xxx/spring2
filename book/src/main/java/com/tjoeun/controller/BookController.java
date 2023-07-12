package com.tjoeun.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tjoeun.domain.Book;
import com.tjoeun.service.BookService;

@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@GetMapping
	public String books(Model model) {
		List<Book> bookList = bookService.getAllBookList();
		model.addAttribute("bookList", bookList);
		return "books";
	}
	
	@GetMapping("/all")
	public ModelAndView requestAllBooks() {
		//모델엔뷰는 requestScope에 올림과 동시에 지정
		ModelAndView mv = new ModelAndView();
		List<Book> bookList = bookService.getAllBookList();
		mv.addObject("bookList", bookList);
		//ViewName은 jsp의이름
		mv.setViewName("books");
		
		return mv;
	}
	
	@GetMapping("/{category}")
	public String requestBooksByCategory(@PathVariable("category") String category,Model model) {
		List<Book> booksByCategory = bookService.getBookListByCategory(category);
		model.addAttribute("bookList", booksByCategory);
		return "books";
	}
	
	@GetMapping("/filter/{bookFilter}")
	public String requestBooksByFilter(@MatrixVariable(pathVar="bookFilter") Map<String,List<String>> bookFilter,
										Model model) {
	// Map<String,List<String>> : 출판사별 책이름을 저장한 HashMap
	// @MatrixVariable 을 
		Set<Book> booksByFilter = bookService.getBookListByFilter(bookFilter);
		model.addAttribute("bookList",booksByFilter);
		return "books";
	}
	
	// @RequestParam을 사용해서 도서 ID로 도서 검색하기
	// bookService의 getBookById(String bookId) 호출하기
	@GetMapping("/book")
	public String requestBookById(@RequestParam String bookId,Model model) {
		Book bookById = bookService.getBookById(bookId);
		model.addAttribute("bookById", bookById);
		return "book";
	}
	
	//도서 등록
	@GetMapping("/regBook")
	public String regBook(@ModelAttribute("newBook") Book book) {
		// @ModelAttribute("newBook") Book book 이것은
		// @ModelAttribute Book newBook 이것과같다
		return "regBook";
	}
	
	@PostMapping("/regBookProcedure")
	public String regBookProcedure(@ModelAttribute("newBook") Book book) {
		bookService.regNewBook(book);
		return "redirect:/books";
	}
	
	@ModelAttribute
	public void addAttribute(Model model) {
		model.addAttribute("addTitle", "신규도서등록");
	}
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// formPage에서 biding 할려고 하는
		// command 객체(여기서는 Book객체)
		// 멤버변수(필드)들을 설정함
		binder.setAllowedFields("bookId","name","unitPrice","author", "description" , "publisher",
				"category","unitsInStock","totalPages","releaseDate","condition");
		//즉 binder에 등록한 멤버변수만사용한다는것
	}
}

package com.tjoeun.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
}

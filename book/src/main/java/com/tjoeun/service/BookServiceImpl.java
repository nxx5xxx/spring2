package com.tjoeun.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeun.domain.Book;
import com.tjoeun.repository.BookRepository;

@Service
public class BookServiceImpl implements BookService {
	
	//주입은 인터페이스를 받는다
	@Autowired
	private BookRepository bookRepository;
	
	@Override
	public List<Book> getAllBookList() {
		return bookRepository.getAllBookList();
	}
	@Override
	public List<Book> getBookListByCategory(String category) {
		List<Book> booksByCategory = bookRepository.getBookListByCategory(category);
		return booksByCategory;
	}
	@Override
	public Set<Book> getBookListByFilter(Map<String, List<String>> filter) {
//		Set<Book> booksByFilter = bookRepository.getBookListByFilter(filter);
//		
//		return booksByFilter;
		return bookRepository.getBookListByFilter(filter);
	}
	
	@Override
	public Book getBookById(String bookId) {
		//Book bookById = 
		return bookRepository.getBookById(bookId);
	}
	//새 도서 등록하기
	@Override
	public void regNewBook(Book newBook) {
		bookRepository.regNewBook(newBook);
	}
}

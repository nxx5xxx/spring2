package com.tjoeun.repository;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.tjoeun.domain.Book;


public interface BookRepository {

	List<Book> getAllBookList();
	List<Book> getBookListByCategory(String category);
	// 출판사와 도서분야로 도서 검색하기 @MatrixVariable
	Set<Book> getBookListByFilter(Map<String,List<String>> filter );
	// 도서 ID로 도서 검색하기 : @RequestParam
	Book getBookById(String bookId);
	// @ModelAttribute 를 사용해서 도서 등록하기
	void regNewBook(Book book);
	
}

package com.tjoeun.service;

import java.util.List;

import com.tjoeun.domain.Book;


public interface BookService {
	List<Book> getAllBookList();
	List<Book> getBookListByCategory(String category);
}

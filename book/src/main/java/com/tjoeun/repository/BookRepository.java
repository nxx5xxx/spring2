package com.tjoeun.repository;

import java.util.List;

import com.tjoeun.domain.Book;


public interface BookRepository {

	List<Book> getAllBookList();
	List<Book> getBookListByCategory(String category);
}

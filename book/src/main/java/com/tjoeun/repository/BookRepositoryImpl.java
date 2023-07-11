package com.tjoeun.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.tjoeun.domain.Book;

@Repository
public class BookRepositoryImpl implements BookRepository {
	
	private List<Book> listOfBooks = new ArrayList<>();
	
	public BookRepositoryImpl() {
		Book book1 = new Book("ISBN-13","난생처음 자바",29000);
		Book book2 = new Book("ISBN-14","로마인 이야기",10000);
		Book book3 = new Book("ISBN-15","실무 엑셀",21000);
		
		book1.setAuthor("우재남");
		book1.setDescription("이 책은 초보자에게 어려운 자바 개념을 이해시켜드립니다");
		book1.setPublisher("한빛아카데미");
		book1.setCategory("IT서적");
		book1.setUnitsInStock(200);
		book1.setReleaseDate("2023/06/30");
		
		book2.setAuthor("시오노나나미");
		book2.setDescription("이 책은 방대한 자료를 취재.정리해가면서 엮은 거대한 로마 통사이면서현대를 어떻게 살아가야 하는지를 가르쳐 주는 지침서이다.");
		book2.setPublisher("한길사");
		book2.setCategory("인문교양");
		book2.setUnitsInStock(100);
		book2.setReleaseDate("1997/08/25");
		
		book3.setAuthor("전미진");
		book3.setDescription("실무에서 막힘없이 써먹는 엑셀 최강 업무 활용법! 무적의 실무 문서 작성 프로젝트 예제로 익혀라!엑셀 모든 버전에서 완벽하게 학습한다");
		book3.setPublisher("한빛미디어");
		book3.setCategory("IT서적");
		book3.setUnitsInStock(150);
		book3.setReleaseDate("2019/11/30");
		
		listOfBooks.add(book1);
		listOfBooks.add(book2);
		listOfBooks.add(book3);
	}
	
	@Override
	public List<Book> getAllBookList() {
		return listOfBooks;
	}
	
	@Override
	public List<Book> getBookListByCategory(String category) {
		List<Book> booksByCategory = new ArrayList<>();
		for(int i = 0; i< listOfBooks.size();i++) {
			Book book = listOfBooks.get(i);
			if(category.equalsIgnoreCase(book.getCategory())) {
				booksByCategory.add(book);
			}
		}
		
		return booksByCategory;
	}

}

package com.tjoeun.repository;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Repository;

import com.tjoeun.domain.Book;

@Repository
public class BookRepositoryImpl implements BookRepository {
	
	private List<Book> listOfBooks = new ArrayList<>();
	
	public BookRepositoryImpl() {
		Book book1 = new Book("ISBN-13","난생처음 자바",29000);
		Book book2 = new Book("ISBN-14","로마인 이야기",10000);
		Book book3 = new Book("ISBN-15","실무 엑셀",21000);
		Book book4 = new Book("ISBN-16","한국이야기",50000);
		
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
		
		book4.setAuthor("단군");
		book4.setDescription("단군신화와 한국에 대한이야기");
		book4.setPublisher("한빛미디어");
		book4.setCategory("인문교양");
		book4.setUnitsInStock(50);
		book4.setReleaseDate("2023/07/12");
		    
		listOfBooks.add(book1);
		listOfBooks.add(book2);
		listOfBooks.add(book3);
		listOfBooks.add(book4);
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
	
	@Override
	public Set<Book> getBookListByFilter(Map<String, List<String>> filter) {
		//출판사에 의해 검색되는 책
		//1)
		Set<Book> booksByPublisher = new HashSet<>();
		//출판사를 분야별로
		//2)
		Set<Book> booksByCategory = new HashSet<>();
		
		//1)
		//맵에서 key셋을 사용하면 키를 set값으로 받아온다
		Set<String> booksByFilter = filter.keySet();
		if(booksByFilter.contains("publisher")){
			for(int j=0; j<filter.get("publisher").size();j++) {
				String publisherName = filter.get("publisher").get(j);
				for(int i=0; i< listOfBooks.size();i++) {
					Book book = listOfBooks.get(i);
					//equalsIgnoreCase 대소문자일치안해도됨
					if(publisherName.equalsIgnoreCase(book.getPublisher())) {
						booksByPublisher.add(book);
					}
				}
			}
		}
		//2)
		if(booksByFilter.contains("category")){
			for(int i=0; i<filter.get("category").size();i++) {
				String category = filter.get("category").get(i);
				List<Book> list = getBookListByCategory(category);
				//리스트를 리스트에 추가하는건 addAll
				booksByCategory.addAll(list);
			}
		}
		
		//해당하는 출판사에 지정되는 책만 남음
		booksByCategory.retainAll(booksByPublisher);
		
		return booksByCategory;
	}
	
	@Override
	public Book getBookById(String bookId) {
		Book book = null;
		
		for(int i=0;i<listOfBooks.size();i++) {
			Book tmpBook = listOfBooks.get(i);
			if(tmpBook != null && tmpBook.getBookId()!=null && tmpBook.getBookId().equals(bookId)) {
				book = tmpBook;
				break;
			}
		}
		//전달한 id에 해당하는 도서가 없는 경우
		if(book==null) {
			//예외 객체생성
			throw new IllegalArgumentException("도서 ID " +bookId+"와 일치하는 도서를 찾을 수 없습니다" );
			
		}
		
		return book;
	}
	
	//책목록 추가
	@Override
	public void regNewBook(Book newbook) {
		listOfBooks.add(newbook);
		
	}
}

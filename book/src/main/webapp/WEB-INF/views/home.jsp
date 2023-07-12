<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="/home">welcome</a><br>
<a href="/books">도서목록보기1</a><br>
<a href="/books/all">도서목록보기2</a><br>
<a href="/test/t1/ISBN-13">도서선택해서 보기</a><br>
<a href="/test/t2/에세이/publisher/대학문화사">도서정보 보기2</a><br>
<a href="/books/IT서적">IT서적 카테고리 책목록</a><br>
<a href="/books/인문교양">인문교양 카테고리 책목록</a><br>
<br>
<a href="/test/t3/ISBN-13;category=IT서적">BookId가 ISBN 매트릭스Variable로 받기</a><br>
<a href="/test/t5/ISBN-13;publisher=좋은책/category/IT서적;publisher=아이티">매트릭스Variable로 받기2</a><br>
<a href="/test/t6/ISBN-13">매트릭스Variable로 받기3</a><br>
<a href="/test/t7/ISBN-13;publisher=민음사;name=spring/category/IT서적;publisher=아이티출판사;author=아카데미">매트릭스Variable로 받기4 MultiValueMap 사용</a><br>
<br>
<a href="/books/filter/bookFilter;publisher=한길사;category=인문교양"> 출판사 및 도서 분야로 검사하기1</a><br>
<a href="/books/filter/bookFilter;publisher=한빛아카데미;category=IT서적"> 출판사 및 도서 분야로 검사하기2</a><br>
<a href="/books/filter/bookFilter;publisher=한빛미디어;category=IT서적"> 출판사 및 도서 분야로 검사하기3</a><br>
<!-- 한빛미디어 출판사에 카테고리 서적이 두개가 있다면 아래와같이 작성 -->
<!-- 즉 두개의 카테고리에 포함되는것을 불러온다 -->
<a href="/books/filter/bookFilter;publisher=한빛미디어;category=IT서적,인문교양"> 출판사 및 도서 분야로 검사하기4</a><br>
<br>
<a href="/test/t8?id=ISBN-13"> 도서정보 보기</a><br>
<br>
<a href="/test/regForm">회원가입 테스트</a><br>
<a href="/books/regBook">도서 등록하기</a>
<br>
<a href="/test/t9">@ModelAttribute 메소드 수준에서 적용하기</a>
<a href="/test/t10">@ModelAttribute 메소드 수준에서 적용하기</a>
<br>
<br>
<h2>Spring Security Test</h2>
<a href="/test1">st1</a><br>
<a href="/test/st2">st2</a><br>
<a href="/test/st3">st3</a><br>

<a href="/books/regBook">관리자권한으로 접근</a><br>
<a href="/login">로 그 인</a><br>

</body>
</html>

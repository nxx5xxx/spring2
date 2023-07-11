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
</body>
</html>

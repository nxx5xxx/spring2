<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book List</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand  navbar-dark bg-dark"> 
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="./home">Home</a>
            </div>
        </div>
    </nav>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">도서 목록</h1>
        </div>
    </div>
    <div class="container">
        <div class="row" align="center">
            <c:forEach items="${bookList}" var="book"> 
                <div class="col-md-4">
                 	 
                    
                    <h3>${book.name}</h3>
                    <p>${book.author}
                        <br> ${book.publisher} | ${book.releaseDate}
                    <p align=left>${fn:substring(book.description, 0, 100)}...
                    <p>${book.unitPrice}원
                    <p><a href="<c:url  value="/books/book?id=${book.bookId}"/>" class="btn btn-Secondary" role="button">상세정보 &raquo;</a>
                </div>
                
            </c:forEach> 
        </div>
        <hr>
        <footer>
            <p>&copy; BookMarket</p>
        </footer>
    </div>
</body>
</html>
<!-- 
<c:choose>
    <c:when test="${book.getBookImage()==null}">
        <img src="<c:url value="C:\\upload\\${book.getBookId()}.png"/>" style="width: 60%" />
    </c:when>
    <c:otherwise>
        <img src="<c:url value="C:\\upload\\${book.getBookImage().getOriginalFilename()}"/>" style="width: 60%" />
    </c:otherwise>
</c:choose>
 -->
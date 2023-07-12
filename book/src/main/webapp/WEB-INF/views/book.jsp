<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>Document</title>
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
  
</head>

<title>도서 상세 정보</title>
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
            <h1 class="display-3">도서 정보</h1>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>${name}</h3>  
                <p>${bookById.description}</p>
                <br>
                <p><b>도서코드 : </b><span class="badge badge-info">${bookById.bookId}</span>
                <p><b>저자</b> : ${bookById.author}
                <p><b>출판사</b> : ${bookById.publisher}
                <p><b>출판일</b> : ${bookById.releaseDate}
                <p><b>분류</b> : ${bookById.category}
                <p><b>재고수</b> : ${bookById.unitsInStock}
                <h4>${bookById.unitPrice}원</h4>  
                <br>
                <p><a href="#" class="btn btn-primary">도서주문 &raquo;</a> 
                <a href="<c:url value="/books/all"/>" class="btn btn-secondary">도서 목록 &raquo;</a>  
            </div>
        </div>
        <hr>
        <footer>
            <p>&copy; BookMarket </p>
        </footer>
    </div>
</body>
</html>
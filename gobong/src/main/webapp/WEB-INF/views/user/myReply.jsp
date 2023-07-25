<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	<c:forEach	items="${myReply }" var="mr">
		<h2>번호:${mr.no }</h2>
		<h2>아이디:${mr.id }</h2>
		<h2>댓글내용:${mr.content }</h2>
		<h2>해시태그:${mr.hashtag }</h2>
		<h2>좋아요 수:${mr.up }</h2>
		<h2>등록일:${mr.regdate }</h2>
		<h2>이미지1:${mr.img1 }</h2>
		<h2>이미지2:${mr.img2 }</h2>
		<h2>이미지3:${mr.img3 }</h2>
		<h2>공개여부:${mr.prv }</h2><br><br>
	
	</c:forEach>

</body>
</html>
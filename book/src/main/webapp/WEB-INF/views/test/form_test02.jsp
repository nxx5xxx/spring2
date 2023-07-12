<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>Document</title>
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
  
</head>
<body>
    <h3>회원정보</h3>
    <p> 아이디 : ${member.id}
    <p> 비밀번호 : ${member.passwd}
    <p> 거주지 : ${member.city}
    <p> 성 별 : ${member.sex}
    <p> 취 미 : <c:forEach items="${member.hobby}" var="hobby">
		[<c:out value="${hobby}" />]
	</c:forEach>		

</body>
</html>
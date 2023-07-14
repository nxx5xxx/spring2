<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
	<h1>접속 거부된 경우 표시되는 페이지</h1>
	<h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage() }" /></h2>
	<h3><c:out value="${message }"/></h3>
</body>
</html>
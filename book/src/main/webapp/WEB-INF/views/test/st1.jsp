<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Security</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
	<h1>Spring Security Example</h1>
	
	<h3>info : ${info }</h3>
	
	<ul>
		<li> requestURL: <a href="<c:url value='/home/main' />"> /home/main</a> </li>
		<li> requestURL: <a href="<c:url value='/member/main' />"> /member/main</a> </li>
		<li> requestURL: <a href="<c:url value='/manager/main' />"> /manager/main</a> </li>
		<li> requestURL: <a href="<c:url value='/admin/main' />"> /admin/main</a> </li>
	</ul>
	
</body>
</html>
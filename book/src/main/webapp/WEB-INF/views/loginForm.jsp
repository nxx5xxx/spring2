<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>로그인</title>
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
  
</head>
<body>
<h1>로그인</h1>
<form action="./login"	method="post">
	<p>사용자명 <input type="text" name="username" placeholder="username" >
	<p>비밀번호 <input type="password" name="password" 	placeholder="password" >
	<p><button type="submit">로그인</button>				
	<input type="hidden" name="${_csrf.parameterName}" 	value="${_csrf.token}" />
</form>	
</body>
</html>
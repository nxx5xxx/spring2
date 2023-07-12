<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>Spring Security</title>
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
  
</head>
<body>  
<h2>Spring Security Example</h2>   

<sec:authorize access="isAuthenticated()">
    <h5><sec:authentication property="principal.username"/>님, 반갑습니다.</h5>
    <form action="./logout" method="POST">
    <button type="submit">LOGOUT</button>
        <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
    </form>
</sec:authorize>

</body>
</html>


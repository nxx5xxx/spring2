<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <h2>Access Denied Page</h2>
  <h3><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage() }"/></h3>
  <h3><c:out value="${message }" /></h3>
</body>
</html>
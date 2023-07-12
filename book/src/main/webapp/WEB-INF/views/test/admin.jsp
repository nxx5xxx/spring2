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
  <h3>접근 권한과 사용자 권한 설정 예</h3>  
  <p>뷰 페이지는 ${info} 입니다.  
  <p><a href="<c:url value='/test1' />">[웹 요청 URL /st1으로 이동하기]</a>  
</body>
</html>


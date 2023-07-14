<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<h1>
		Hello world!  
	</h1>
	
	<P>  The time on the server is ${serverTime}. </P>
	    
    <button onclick="location.href='/test/admin'">/test/admin</button><br><br>
    <button onclick="location.href='/test/member'">/test/member</button><br><br>
    <button onclick="location.href='/test/all'">/test/all</button><br><br>

</body>
</html>

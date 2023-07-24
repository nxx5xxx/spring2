<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path1" value="${pageContext.request.contextPath }" />
<c:set var="data_path1" value="${pageContext.request.contextPath }/resources"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&family=Orbit&display=swap" rel="stylesheet">
  <title>회원가입</title>
	<link rel="stylesheet" href="${data_path }/css/main.css">
</head>
<body>
<%-- <c:import url="/WEB-INF/views/header.jsp" /> --%>

<div class="container" >
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form:form action="${path1 }/user/userInfoModifyPro" method="post" modelAttribute="userInfo" enctype="multipart/form-data" class="box">
					<%-- <form:hidden path="userIdExist" /> --%>
						<div class="field">
							<form:label path="img" class="label">프로필 사진</form:label>
							<div class="input-group">
								<img src="${data_path1 }/upload/${userInfo.img }" alt="프로필사진">
								<input type="file" name="upload_img" id="upload_img" class="input" value="${userInfo.img }" />
							</div>
						</div>
						<div class="field">
							<form:label path="id" class="label">아이디</form:label>
							<div class="input-group">
								<form:input path="id" class="input" readonly="true" />
							</div>
						</div>
						<div class="field">
							<form:label path="name" class="label">이름</form:label>
							<form:input path="name" class="input" readonly="true" />
						</div>
						<div class="field">
							<form:label path="pw" class="label">비밀번호</form:label>
							<form:password path="pw" class="input"/>
							<form:errors path="pw" style="color:red;"/>
						</div>
						<div class="field">
							<form:label path="pw2" class="label">비밀번호 확인</form:label>
							<form:password path="pw2" class="input"/>
							<form:errors path="pw2" style="color:red;"/>
						</div>
						<div class="field">
							<form:label path="email" class="label">이메일</form:label>
							<form:input path="email" class="input"/>
							<form:errors path="email" style="color:red;"/>
						</div>
						<div class="field">
							<form:label path="tel" class="label">전화번호</form:label>
							<form:input path="tel" class="input"/>
							<form:errors path="tel" style="color:red;"/>
						</div>
						<div class="field">
							<div class="text-right">
								<form:button class="button is-success is-light">수정하기</form:button>
								<a href="javascript:history.go(-1)" class="button is-primary is-light">뒤로가기</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${path1 }/user/userDel?id=${userInfo.id}" class="button is-danger is-light">탈퇴</a>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
</body>
</html>
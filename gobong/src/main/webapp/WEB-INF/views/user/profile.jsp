<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 최상위경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="data_path" value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&family=Orbit&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${data_path }/css/main.css">
	<!-- 0720손승기 -->
	<link rel="stylesheet" href="${data_path }/css/profile.css">
	<!-- 0720손승기 -->
    <title>Document</title>
    <style>
    
    </style>
</head>
<body>
<c:import url="../header.jsp" />
<div class="container">
<div class="card-wrap">
  <article class="media">
    <div class="media-left">
      <figure class="image is-128x128">
        <img id="profile_img" src="${data_path }/upload/${userProfile[0].img }" alt="profileImage" style="">
      </figure>
    </div>
    <div class="media-content">
      <div class="content">
        <p>
          <strong>${userProfile[0].name }</strong> <small>@${userProfile[0].id }</small> <!-- <small>31m</small> -->
          <br>
          여기에 자기소개 넣으면 좋을것같아요(user1 테이블에 자기소개컬럼추가하기?(나중에))<br>
          밑에는 자신이 작성한 게시글들 이미지 나오게하고(약간 인스타처럼 한 행에 3개or4개) 이미지 클릭하면 게시글 상세보기로 들어가게 하면 좋을듯.
        </p>
      </div>
      <div>
      	<a href="${path }/user/mypage">정보 수정</a>
      </div>
    </div>
  </article>
      <!-- 0720 손승기 게시글이미지 영역 -->
	<div class="card-wrap" id="board_wrap">
		<c:forEach var="board" items="${userProfile}">
			<img id="board_img" src="${data_path }/upload/${board.img1 }" alt="boardPreview">
		</c:forEach>
		
	</div>
      <nav class="level is-mobile">
        <div class="level-left">
          <a class="level-item" aria-label="reply">
            <span class="icon is-small">
              <i class="fas fa-reply" aria-hidden="true"></i>
            </span>
          </a>
          <a class="level-item" aria-label="retweet">
            <span class="icon is-small">
              <i class="fas fa-retweet" aria-hidden="true"></i>
            </span>
          </a>
          <a class="level-item" aria-label="like">
            <span class="icon is-small">
              <i class="fas fa-heart" aria-hidden="true"></i>
            </span>
          </a>
        </div>
      </nav>
	<!-- 0720 손승기 게시글이미지 영역 -->
</div>
</div>
<c:import url="../footer.jsp" />
	
</body>
</html>
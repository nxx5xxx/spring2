<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 최상위경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="data_path"
	value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&family=Orbit&display=swap"
	rel="stylesheet">
<title>글 목록 보기</title>
<link rel="stylesheet" href="${data_path }/css/main.css">
<style>
.content .content1 {
	width: 750px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.card {
	margin-bottom: 40px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	<div class="container">
		<c:forEach items="${boardList}" var="boardDTO" varStatus="cnt">
			<div class="card-wrap">
				<div class="card">
					<div class="card-image">
						<figure class="image is-4by3">
							<a href="${path }/board/boarddetail?no=${boardDTO.no}"><img
								src="${data_path }/upload/${boardDTO.img1 }" alt="글사진"></a>
						</figure>
					</div>
					<div class="card-content">
						<div class="media">
							<div class="media-left">
								<figure class="image is-48x48">
									<img src="${data_path }/img/${boardDTO.img }" alt="작성자사진">
								</figure>
							</div>
							<div class="media-content">
								<p class="title is-4">${boardDTO.name}</p>
								<p class="subtitle is-6">${boardDTO.id}</p>
							</div>
						</div>
						<div class="field">
							<strong>좋아요</strong>
							<c:if test="${boardDTO.up > 0 }">${boardDTO.up }
	          		<span id="like_result${cnt.count }">여기 </span>
								<script>
	          			$.ajax({
	          				type:"get",
	          				url:"${path}/like/likeList.do",
							encType:"UTF-8",
	          				data: {no:${boardDTO.no}},
	          				success : function(list){
	          					$(list).each(function(index,el){
	          						let likes = this.querySelectorAll('id');
	          						let tmplikes;
		          						for(let i=0; i<likes.length;i++){
		          							console.log(i);
		          							console.log(likes[i]);
		          							$("id").before("<a href=''>");
		          							tmplikes = likes[i];
		          							$("#like_result${cnt.count }").append(tmplikes);
		          						 	//$("#like_result${cnt.count }").append(likes[i]);
			          						$("id").after("</a>");
		          						}
	          					});
	          				},
	          				error : function(){
	          					alert(${boardDTO.no}+"에러");
	          				}
	          			});

	          		</script>
							</c:if>
						</div>
						<div class="content">
							<p class="content1">${boardDTO.content }</p>
							<p style="color: blue;">#${boardDTO.hashtag }</p>
							<time datetime="2016-1-1">${boardDTO.regdate }</time>
						</div>
						<!-- 김우주0719 -->
						<div class="field">
							<c:choose>
								<c:when test="${loginUser.userLogin == true }">
									<input type="button" value="좋아요"
										onclick="like_check(${boardDTO.up },${boardDTO.no })" />
								</c:when>
								<c:otherwise>
									<input type="button" value="좋아요" onclick="goClick()" />
								</c:otherwise>
							</c:choose>
							<!-- 0720김우주 -->
							<c:if test="${boardDTO.id==loginUser.id}">
								<a href="${path }/board/boardMod?no=${boardDTO.no}"
									class="button is-success is-light">수정</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${path }/board/boardDel?no=${boardDTO.no}"
									class="button is-danger is-light">삭제</a>
							</c:if>
							<!-- //0720김우주 -->
						</div>

						<!-- //김우주0719 -->
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<script>
	          	function like_check(like,no){
	          		
	          		alert('글번호' + no);
	          		alert('현재좋아요수' + like);
 	          		$.ajax({
 						type:"get",
						url:"${path}/like/upLike.do",
						dataType:"json",
						encType:"UTF-8",
						data: {no:no},
						//async: false
	          		});
	          	}
	          </script>
	<footer class="footer">
		<div class="content has-text-centered">
			<p>
				<strong>Bulma</strong> by <a href="https://jgthms.com">Jeremy
					Thomas</a>. The source code is licensed <a
					href="http://opensource.org/licenses/mit-license.php">MIT</a>. The
				website content is licensed <a
					href="http://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY
					NC SA 4.0</a>.
			</p>
		</div>
	</footer>
</body>
</html>
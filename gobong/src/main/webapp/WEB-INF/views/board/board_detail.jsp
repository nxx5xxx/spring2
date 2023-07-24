<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <title>글 상세 보기</title>
	<link rel="stylesheet" href="${data_path }/css/main.css">
<style>
    .pj_wrap { width: 800px; height: 600px; margin: 1px auto; padding: 0; position: relative; overflow: hidden; }
    .img_wrap{ width: 800px; height: 100%; position: absolute; top: 0; left: 0; display: flex; }
    .img { width: 800px; height: 100%; font-size: 30px; display: flex; justify-content: center; align-items: center; box-sizing: border-box; }
    .arrow { font-size: 60px; font-weight: 900; position: absolute; top: 50%; transform: translateY(-50%); cursor: pointer; }
    .left_arrow{ left: 0; }
    .right_arrow { right: 0; }
</style>

</head>
<body>
<c:import url="/WEB-INF/views/header.jsp" />
  <div class="container">
	    <div class="card-wrap">
	      <div class="card">
	        <div class="card-image">
	        <!-- 이미지 슬라이드 -->
		        <div class="pj_wrap">
			        <div class="img_wrap" >
			          <figure class="image is-4by3">
			           <input type="hidden" name="no" value="${boardDTO.no }" />
			           <div class="img">
			            	<img src="${data_path }/upload/${boardDTO.img1 }" width="800px;" height="600px;" alt="글사진1" style="left:0px">  
			           </div>
			           <div class="img">   
			            	<img src="${data_path }/upload/${boardDTO.img2 }"  width="800px;" height="600px;" alt="글사진2" style="left:800px">
			            </div>
			            <div class="img">
			            	<img src="${data_path }/upload/${boardDTO.img3 }"  width="800px;" height="600px;" alt="글사진3 " style="left:1600px">
			            </div>	                    
			          </figure>
			        </div>
			        <div class="arrow left_arrow"> &lt; </div>
        			<div class="arrow right_arrow"> &gt; </div>	        
		        </div>
		     <!-- // 이미지 슬라이드 -->   
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
	          <div class="content">
	            <p class="content1">${boardDTO.content }</p>
	            <p>${boardDTO.hashtag }</p>
	            <time datetime="2016-1-1">${boardDTO.regdate }</time>
	          </div>
             <div style="align:center;">
                <c:if test="${boardDTO.id==loginUser.id}">
                   <a href="${path }/board/boardEdit?no=${boardDTO.no}" class="button is-success is-light">수정</a>
                   <a href="${path }/board/boardDel?no=${boardDTO.no}" class="button is-danger is-light">삭제</a>
                </c:if>   
                   <a href="${path }/board/replyInsert?no=${boardDTO.no}" class="button is-warning is-light">댓글</a> 
                   <a href="${path }/board/boardlist" class="button is-link is-light">목록</a>  
             </div>
	        </div>
	      </div>
	     </div>	     
	</div>
	
	

	
<div class="card">
       <form>
           <input type="hidden" id="boardId" value="${board.id}" />
           <div class="card-body">
               <textarea id="reply-content" class="form-control" row = "1"></textarea>
           </div>
           <div class="card-footer">
               <button type="button" id="btn-reply-save" class="btn btn-primary">등록</button>
           </div>
       </form>
</div>

	
	
	
	
  
   <!-- 전재영0723 -->
   <div class="container1" style="padding-top:40px;">   
	     <c:forEach items="${replyList}" var="replyDTO" varStatus="cnt">
	     	<div class="card-wrap">
	     		<div class="card">
			     	 <div class="card-content">
			     	 	<div class="media">
			     			<div class="media-left">
			     	 			<figure class="image is-48x48">
			     	 			 	<img src="${data_path }/img/${boardDTO.img }" alt="작성자사진">
			     	 			 </figure>
			     	 		</div>	 
			     			<div class="media-content">
		              			<p class="title is-4" style="font-size:20px;">${replyDTO.id}</p>
		              		</div>
		             	</div>
		            	<div class="content">
			            	<p class="content1" >${replyDTO.comment1 }</p>
		          	 	</div>
		          	 	<div>
			          	 	<c:if test="${boardDTO.id==loginUser.id}">
			          	 	<!-- 0724김우주 -->
			          	 		<a href="${path }/board/replyDel?rno=${replyDTO.rno}&no=${boardDTO.no}" class="button is-danger is-light">댓글삭제</a>
			          	 	<!-- 0724김우주 -->
			          	 	</c:if>
		          	 	</div>
	          		</div>	
	        	 </div>
	        </div>	 
	     </c:forEach> 		
	   </div> 
   <!-- 전재영0723 -->
   
  <!-- 이미지 슬라이드 --> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  <script>
      $(document).ready(function(){
          // 오른쪽 화살표를 클릭하면 img_wrap이 left기준으로
          // -800px 만큼 이동
          var num = 0;
          function img_move(){
              $(".img_wrap").stop().animate({
                  left: -num * 800
              });
          }
          $(".right_arrow").click(function(){
              num++;
              if(num > 2){
                  num = 0;
              }   
              img_move();
          }); 
          $(".left_arrow").click(function(){
              num--;
              if(num < 0){
                  num = 2;
              }   
              img_move();
            });
          });//end
  </script>
  <!-- // 이미지 슬라이드 -->
  
  
  
  
  
  <script>
  	replySave: function(){
  		let data = {
  				content: $("#reply-content").val();
  		};
  		let boardId = $("#boardId").val();
  		
  		$.ajax({
  			type: "POST",
            url: `/board/replyInsertPro?id=`+id,
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (resp) {
            // 결과가 정상이면 done 실행
            alert("댓글작성이 완료되었습니다.");
            location.href = `/board/${boardId}`;
        }).fail(function (error) {
            // 실패하면 fail 실행
            alert("댓글작성이 실패하였습니다.");
            alert(JSON.stringify(error));
        });
    },
  </script>
  
  
  
  
  
  
  
  
   <footer class="footer">
    <div class="content has-text-centered">
      <p>
        <strong>Bulma</strong> by <a href="https://jgthms.com">Jeremy Thomas</a>. The source code is licensed
        <a href="http://opensource.org/licenses/mit-license.php">MIT</a>. The website content
        is licensed <a href="http://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY NC SA 4.0</a>.
      </p>
    </div>
   </footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path2" value="${pageContext.request.contextPath }" />
<c:set var="data_path2" value="${pageContext.request.contextPath }/resources" />
<style>
a { color: #363636; }
#level1 a { color: #363636; font-weight: 600; }
#level2 { text-align: center;}
.fix_area { position:fixed; z-index:9999; bottom:20px; right:30px; }
.fix_area .cir_box { display:block; width: 47px; height: 48px; text-align:center; color:#fff;
border-radius:35px; box-sizing: border-box; padding: 2px; font-size:35px; 
overflow:hidden; box-shadow:1px 1px 6px #333; }
.fix_area .totop { background-color:#48c78e; }
</style>
<footer class="footer" style="height: 180px; width:1000px; margin:0 auto; background-color: #fff;">
	<div class="fix_area">
     <a href="#" class="cir_box totop" style="text-align: center; margin-top: -10px; ">↑</a>
	</div>
  <nav class="level" id="level1" style="background-color: #ffdc7d; height: 50px;">
  <p class="level-item has-text-centered">
    <a class="link is-info" href="${path2 }/test/home">테스트 이동</a>
  </p>
  <p class="level-item has-text-centered">
    <a class="link is-info" href="#">개인정보 처리방침</a>
  </p>
  <p class="level-item has-text-centered">
    <a class="link is-info" href="#">저작권 정책</a>
  </p>
 </nav>
  <nav class="level" id="level2">
	  <p class="level-item has-text-centered">
	    Copyright (C) 2023 김우주, 박지현, 손승기, 이재호, 전재영, 조태정.All rights reserved.
	  </p>
  </nav>
</footer>
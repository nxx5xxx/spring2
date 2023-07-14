package com.tjoeun.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		log.warn("로그인 성공");
		List<String> roleNames = new ArrayList<>();
		
		//권한들을 갖고옴
		//권한들 중 하나를 파라미터로 빼와서
		auth.getAuthorities().forEach(authority -> {
			//이곳에서 추가
			//권한목록을 빼와서 여기 추가한것
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES : " + roleNames);
		
		//admin 권한으로 로그인한 경우 보낼 페이지
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/test/admin");
			return ;
		}
		//member 권한으로 로그인한 경우 보낼 페이지
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/test/member");
			return ;
		}
		response.sendRedirect("/");
		return ;
		
	}

}

package com.tjoeun.security;

import lombok.extern.log4j.Log4j;

//패스워드 인코더 클래스
@Log4j
public class CustomNoOpPasswordEncoder  {
	public String encode(CharSequence rawPassword) {
		log.warn("encoding 하기 전 : " +rawPassword);
		return rawPassword.toString();
	}
	
	public boolean matches(CharSequence rawPassword , String encodedPassword) {
		log.warn("matches : " + rawPassword + " : " + encodedPassword);
		return rawPassword.toString().equals(encodedPassword);
	}
}

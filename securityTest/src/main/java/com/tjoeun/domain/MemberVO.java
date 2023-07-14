package com.tjoeun.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String username;
	private boolean enabled;
	
	private Date regdate;
	private Date updatedate;
	private List<AuthVO> authList;
}

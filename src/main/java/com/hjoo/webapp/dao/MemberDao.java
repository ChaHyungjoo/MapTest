package com.hjoo.webapp.dao;


import java.util.Date;

import com.hjoo.webapp.entity.Member;

public interface MemberDao {

	public int insert(
			String pwd,
			String nickName,
			String email,
			Date regDate,
			String image,
			String role,
			String point,
			String mentor);

	public int insert(Member member);
	
	public Member login(String email, String pwd);
	
	int pointUp(String id);
	public Member get(String loginEmail);

	public int checkId(Member member);
}

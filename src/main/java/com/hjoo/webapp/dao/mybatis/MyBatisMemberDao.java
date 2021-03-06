package com.hjoo.webapp.dao.mybatis;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hjoo.webapp.dao.MemberDao;
import com.hjoo.webapp.entity.Member;


public class MyBatisMemberDao implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public int insert(String pwd, String nickName, String email, Date regDate, String image, String role, String point, String mentor) {
		
		return insert(new Member(pwd,nickName,email,regDate, role, role, mentor, mentor));
	}

	@Override
	public int insert(Member member) {
		
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		return memberDao.insert(member);
	}

	@Override
	public Member login(String email, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}
	/*@Override
	public Member Login(String email, String passwd) {
        return ""memberDao.Login(email, passwd);
    }*/

	@Override
	public int pointUp(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	public Member get(String loginEmail) {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		
		return memberDao.get(loginEmail);
	}

	@Override
	public int checkId(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}
}



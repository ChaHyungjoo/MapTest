package com.hjoo.webapp.dao;

import com.hjoo.webapp.entity.Comment;

public interface CommentDao {
	
	public int insert(Comment comment);
	public int edit(Comment comment);
	public int delete(int id);
	
}

package com.hjoo.webapp.dao;

import java.util.List;

import com.hjoo.webapp.entity.NoticeFile;

public interface NoticeFileDao {
	
	List<NoticeFile> getListByNoticeId(String noticeId);
	
	int insert(NoticeFile noticeFile);
	int update(NoticeFile noticeFile);
	int delete(String id);
}

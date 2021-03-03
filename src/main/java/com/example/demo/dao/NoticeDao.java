package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Notice;

@Mapper
public interface NoticeDao {

	List<Notice> getAllNotice();
	Notice getNoticeByNo(int noticeNo);
	
	int getTotalCountByCondition(Map<String, Object> condition);
	List<Notice> getNoticesByCondition(Map<String, Object> condition);
	
	void updateNotice(Notice notice);
	
	List<Notice> getNoticeHome();
}

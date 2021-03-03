package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.NoticeDao;
import com.example.demo.dto.Pagination;
import com.example.demo.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao noticeDao;
	
	@Override
	public List<Notice> getAllNotice() {
		return noticeDao.getAllNotice();
	}
	
	@Override
	public Notice getNoticeByNo(int noticeNo) {
		Notice notice = noticeDao.getNoticeByNo(noticeNo);
		// 조회수 1 증가
		notice.setViews(notice.getViews() + 1);
		noticeDao.updateNotice(notice);
		
		return noticeDao.getNoticeByNo(noticeNo);
	}

	@Override
	public Map<String, Object> getNotices(Map<String, Object> condition) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int totalRows = noticeDao.getTotalCountByCondition(condition);
		
		Pagination pagination = new Pagination((Integer)condition.get("pageNo"), totalRows);
		
		List<Notice> notices = noticeDao.getNoticesByCondition(condition);
		
		result.put("notices", notices);
		result.put("pagination", pagination);
		
		return result;
	}
	
	@Override
	public void updateNotice(Notice notice) {
		noticeDao.updateNotice(notice);
	}

	@Override
	public List<Notice> getNoticeHome() {
		return noticeDao.getNoticeHome();
	}

}

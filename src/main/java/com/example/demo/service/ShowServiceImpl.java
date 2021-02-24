package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ShowDao;
import com.example.demo.dto.TotalShow;
import com.example.demo.vo.PutShows;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowSeat;

@Service
public class ShowServiceImpl implements ShowService {

	@Autowired
	ShowDao showDao;
	@Override
	public List<Show> getAllCategoryShows(int catno) {
		return showDao.getAllCategoryShows(catno);
	}
	@Override
	public TotalShow getOneCategoryShow(int no) {
		return showDao.getOneCategoryShow(no);
	}
	@Override
	public List<PutShows> getShowPutShows(int showNo) {
		return showDao.getShowPutShows(showNo);
	}
	@Override
	public List<Show> getShowsHome() {
		return showDao.getShowsHome();
	}
	@Override
	public List<Show> getCategorySwiper(int catno) {
		return showDao.getCategorySwiper(catno);
	}
	@Override
	public List<ShowSeat> getputSeat(int putShowNo) {
		return showDao.getputSeat(putShowNo);
	}
	
	@Override
	public List<Show> getAllShowsList() {
		return showDao.getAllShows();
	}
	
	@Override
	public List<Show> getShowByLocalName(String localName) {	
		return showDao.getShowByLocalName(localName);
	}


}

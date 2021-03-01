package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ShowDao;
import com.example.demo.dto.PutSeat;
import com.example.demo.dto.TotalShow;
import com.example.demo.vo.PutShows;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowAndPutShow;
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
	public List<Show> getShowsListByLocalAndSort(String localName, String sort) {
		return showDao.getShowsListByLocalAndSort(localName, sort);
	}
	@Override
	public PutSeat getputPlaceSeat(Map<String, Object> putPlace) {
		return showDao.getputPlaceSeat(putPlace);
	}
	@Override
	public ShowAndPutShow getShowAndPutShow(int putShowNo) {
		return showDao.getShowAndPutShow(putShowNo);
	}


}

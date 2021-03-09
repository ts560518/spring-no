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
	//한결
	@Override
	public List<Show> getShowsListByLocalAndSort(String localName, String sort) {
	   return showDao.getShowsListByLocalAndSort(localName, sort);
	}
	//한결
	@Override
	public List<Map<String, Object>> getShowsListByRankAndSort(int genre, String sort) {
		   return showDao.getShowsListByRankAndSort(genre, sort);
	}
	   
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
	public PutSeat getputPlaceSeat(Map<String, Object> putPlace) {
		return showDao.getputPlaceSeat(putPlace);
	}
	
	@Override
	public ShowAndPutShow getShowAndPutShow(int putShowNo) {
		return showDao.getShowAndPutShow(putShowNo);
	}
	
	@Override
	public ShowSeat getShowSeat(Map<String, Object> showSeat) {
		return showDao.getShowSeat(showSeat);
	}
	@Override
	public List<Show> getShowRankHome() {
		return showDao.getShowRankHome();
	}
	@Override
	public List<Show> getShowListByCategory(int catno,String sort) {
		return showDao.getShowListByCategory(catno, sort);
	}
	@Override
	public Show getShowByPutShowNo(int putShowNo) {
		return showDao.getShowByPutShowNo(putShowNo);
	}
	@Override
	public PutShows getPutShowByPutShowNo(int putShowNo) {
		return showDao.getPutShowByPutShowNo(putShowNo);
	}


}

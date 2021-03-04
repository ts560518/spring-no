package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.GenreDao;
import com.example.demo.vo.Category;
import com.example.demo.vo.Place;
import com.example.demo.vo.Seat;
import com.example.demo.vo.SeatPrice;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowActor;

@Service
public class GenreServiceImpl implements GenreService {

	@Autowired
	GenreDao genreDao;
	
	@Override
	public Category getCategory(int catno) {
		return genreDao.getCategory(catno);
	}

	@Override
	public Place getPlace(int placeno) {
		return genreDao.getPlace(placeno);
		
	}

	@Override
	public List<Category> getTopCategory(int catno) {
		return genreDao.getTopCategory(catno);
	}

	@Override
	public List<Seat> getplaceSeat() {
		return genreDao.getplaceSeat();
	}

	@Override
	public List<ShowActor> getShowActor(int showNo) {
		return genreDao.getShowActor(showNo);
	}

	@Override
	public SeatPrice getPlaceSeatPrice(String seatNo) {
		return genreDao.getPlaceSeatPrice(seatNo);
	}

	@Override
	public List<Show> getCategoryHomeRankList(int catno) {
		return genreDao.getCategoryHomeRankList(catno);
	}

	@Override
	public List<Show> getCategoryHomeLocalList(int catno) {
		return genreDao.getCategoryHomeLocalList(catno);
	}

	
}

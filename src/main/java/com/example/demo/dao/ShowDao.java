package com.example.demo.dao;

import java.util.List;

import com.example.demo.dto.TotalShow;
import com.example.demo.vo.PutShows;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowSeat;

public interface ShowDao {
	
	List<ShowSeat> getputSeat(int putShowNo);

	List<Show> getAllCategoryShows(int catno);
	
	TotalShow getOneCategoryShow(int no);
	
	List<PutShows> getShowPutShows(int showNo);
	
	List<Show> getShowsHome();
	
	List<Show> getCategorySwiper(int catno);
	
	 List<Show> getAllShows();
	 List<Show> getShowByLocalName(String localName);
}

package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dto.PutSeat;
import com.example.demo.dto.TotalShow;
import com.example.demo.vo.PutShows;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowSeat;

@Transactional
public interface ShowService {

	List<ShowSeat> getputSeat(int putShowNo);
	
	List<Show> getAllCategoryShows(int catno);
	
	TotalShow getOneCategoryShow(int no);
	
	List<PutShows> getShowPutShows(int showNo);
	
	List<Show> getShowsHome();
	
	List<Show> getCategorySwiper(int catno);
	//전체리스트- 한결
	List<Show> getAllShowsList();
	//지역 + 범위별 리스트 -한결
	List<Show> getShowsListByLocalAndSort(String localName, String sort);
	
	PutSeat getputPlaceSeat(Map<String, Object> putPlace);
	
}

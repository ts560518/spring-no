package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dto.PutSeat;
import com.example.demo.dto.TotalShow;
import com.example.demo.vo.PutShows;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowAndPutShow;
import com.example.demo.vo.ShowSeat;

@Transactional
public interface ShowService {
	//지역 + 범위별 리스트 -한결
	List<Show> getShowsListByLocalAndSort(String localName, String sort);
	
	//랭킹 + 범위별 리스트 -한결
	List<Map<String, Object>> getShowsListByRankAndSort(int genre, String sort);

	List<ShowSeat> getputSeat(int putShowNo);
	
	List<Show> getAllCategoryShows(int catno);
	
	TotalShow getOneCategoryShow(int no);
	
	List<PutShows> getShowPutShows(int showNo);
	
	List<Show> getShowsHome();
	
	List<Show> getCategorySwiper(int catno);
	
	PutSeat getputPlaceSeat(Map<String, Object> putPlace);
	
	ShowAndPutShow getShowAndPutShow(int putShowNo);
	
	ShowSeat getShowSeat(Map<String, Object> showSeat);
	
	List<Show> getShowRankHome();
	
	List<Show> getShowListByCategory(int catno,String sort);
}

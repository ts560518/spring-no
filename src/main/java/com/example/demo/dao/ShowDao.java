package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import com.example.demo.dto.PutSeat;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.TotalShow;
import com.example.demo.vo.PutShows;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowAndPutShow;
import com.example.demo.vo.ShowSeat;

public interface ShowDao {
	
	List<ShowSeat> getputSeat(int putShowNo);

	List<Show> getAllCategoryShows(int catno);
	
	TotalShow getOneCategoryShow(int no);
	
	List<PutShows> getShowPutShows(int showNo);
	
	List<Show> getShowsHome();
	
	List<Show> getCategorySwiper(int catno);
	
	 List<Show> getShowByLocalName(String localName);
	 
	 ShowAndPutShow getShowAndPutShow(int putShowNo);
	 
	 PutSeat getputPlaceSeat(Map<String, Object> putPlace);
	//전체리스트-한결
	List<Show> getAllShows();
	//지역 + 범위별 리스트 -한결
	//@Param은 xml에 값을 주기 위함임. 멤버변수가 2개이상일때는 @Param으로 값을 정의해줌.. 값이 int 하나일떄는 xml에서 #<value>를 씀
	List<Show> getShowsListByLocalAndSort(@Param("localName") String localName, @Param("sort") String sort);
}

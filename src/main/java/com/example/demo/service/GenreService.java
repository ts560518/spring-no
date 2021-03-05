package com.example.demo.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.example.demo.vo.Category;
import com.example.demo.vo.LikeUser;
import com.example.demo.vo.Place;
import com.example.demo.vo.Seat;
import com.example.demo.vo.SeatPrice;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowActor;

@Transactional
public interface GenreService {

	Category getCategory(int catno);
	
	List<Category> getTopCategory(int catno);
	
	Place getPlace(int placeno);
	
	List<Seat> getplaceSeat();
	
	List<ShowActor> getShowActor(int showNo);
	
	SeatPrice getPlaceSeatPrice(String seatNo);
	
	List<Show> getCategoryHomeRankList(int catno);
	
	List<Show> getCategoryHomeLocalList(int catno);
	// 사용자가 좋아요를 눌렀는지 확인
	LikeUser getUserLikeByNo(int userNo, int showNo);
	// 각 공연마다의 좋아요 확인
	int getShowLikeByShowNo(int showNo);
	
	void setShowLike(int showNo, int userNo);
}

package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.Category;
import com.example.demo.vo.LikeUser;
import com.example.demo.vo.Place;
import com.example.demo.vo.Seat;
import com.example.demo.vo.SeatPrice;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowActor;

public interface GenreDao {

	Category getCategory(int catno);
	
	List<Category> getTopCategory(int catno);
	
	Place getPlace(int placeno);
	
	List<Seat> getplaceSeat();
	
	List<ShowActor> getShowActor(int showNo);
	
	SeatPrice getPlaceSeatPrice(String seatNo);
	
	List<Show> getCategoryHomeRankList(int catno);
	
	List<Show> getCategoryHomeLocalList(int catno);
	
	LikeUser getUserLikeByNo(@Param("userNo")int userNo,@Param("showNo") int showNo);
	
	int getShowLikeByShowNo(int showNo);
	
	void setShowLike(@Param("showNo") int showNo,@Param("userNo") int userNo);
}

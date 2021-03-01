package com.example.demo.dao;

import java.util.List;

import com.example.demo.vo.Category;
import com.example.demo.vo.Place;
import com.example.demo.vo.Seat;
import com.example.demo.vo.SeatPrice;
import com.example.demo.vo.ShowActor;

public interface GenreDao {

	Category getCategory(int catno);
	
	List<Category> getTopCategory(int catno);
	
	Place getPlace(int placeno);
	
	List<Seat> getplaceSeat();
	
	List<ShowActor> getShowActor(int showNo);
	
	SeatPrice getPlaceSeatPrice(String seatNo);
}

package com.example.demo.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.example.demo.vo.Category;
import com.example.demo.vo.Place;
import com.example.demo.vo.Seat;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowActor;

@Transactional
public interface GenreService {

	Category getCategory(int catno);
	
	List<Category> getTopCategory(int catno);
	
	Place getPlace(int placeno);
	
	List<Seat> getplaceSeat();
	
	List<ShowActor> getShowActor(int showNo);
}

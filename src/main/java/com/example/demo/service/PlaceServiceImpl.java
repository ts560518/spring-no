package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.PlaceDao;

@Service
public class PlaceServiceImpl implements PlaceService{
	
	@Autowired
		PlaceDao placeDao;
	
	@Override
	public List<String> getPlaceNames() {
		
		return placeDao.getPlaceNames();
	}
	
}

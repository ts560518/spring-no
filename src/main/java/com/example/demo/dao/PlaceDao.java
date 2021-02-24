package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PlaceDao {
	List<String> getPlaceNames();
}

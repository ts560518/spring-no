package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Category;

@Mapper
public interface RankDao {

	 List<Category> getTopCategory();
}

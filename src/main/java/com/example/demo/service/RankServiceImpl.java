package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.RankDao;
import com.example.demo.vo.Category;

@Service
public class RankServiceImpl implements RankService{
	
	@Autowired
	 RankDao rankDao;
	
	@Override
	public List<Category> getTopCategoryList() {
		
		return rankDao.getTopCategory();
	}
	
	
}

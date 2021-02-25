package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import com.example.demo.vo.Category;

@Transactional
public interface RankService {
 
	List<Category> getTopCategoryList();
}

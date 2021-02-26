package com.example.demo.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.example.demo.service.RankService;
import com.example.demo.vo.Category;

@Controller
public class RankController {
	
	@Autowired
	RankService rankService;
	
	@RequestMapping("/rank.do")
	public String rank(Model model) {
		List<Category> categories= rankService.getTopCategoryList();
		model.addAttribute("categories", categories);
		return "about/rank";
	} 
	
}
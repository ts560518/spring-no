package com.example.demo.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.PlaceService;
import com.example.demo.service.ShowService;

@Controller
public class PlaceController {

	@Autowired
	 PlaceService placeService;
	
	@Autowired
	 ShowService showService;
	
	//지역 카테고리 ex)서울, 경기/인천 등
	@RequestMapping("/place.do")
	public String place(Model model) {
		List<String> names= placeService.getPlaceNames();
		model.addAttribute("names", names);
		 return "/about/place";
		
	}
}

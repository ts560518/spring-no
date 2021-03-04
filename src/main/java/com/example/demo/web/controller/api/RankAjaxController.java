package com.example.demo.web.controller.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.RankService;
import com.example.demo.service.ShowService;

@RestController
@RequestMapping("/api/rank")
public class RankAjaxController {

	@Autowired
	 RankService rankService;
	@Autowired
	 ShowService showService;
	
	@RequestMapping("/ranking.do")
	public List<Map<String, Object>> ranking(@RequestParam(value="genre")int genre,
			@RequestParam(value="sort")String sort){
		return showService.getShowsListByRankAndSort(genre, sort);
	}
}

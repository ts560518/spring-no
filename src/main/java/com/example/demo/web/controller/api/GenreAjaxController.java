package com.example.demo.web.controller.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.stringtemplate.v4.compiler.STParser.mapExpr_return;

import com.example.demo.dto.PutSeat;
import com.example.demo.service.GenreService;
import com.example.demo.service.ShowService;
import com.example.demo.vo.Category;
import com.example.demo.vo.Show;

@RestController("apiGenreController")
@RequestMapping("/api/genre")
public class GenreAjaxController {

	@Autowired
	GenreService genreService;
	
	@Autowired
	ShowService showService;
	
	@RequestMapping("/orderMinusPrice")
	public Map<String, Object> orderMinusPrice(@RequestParam("seatNo") String seatNo,
			@RequestParam("putShowNo") int putShowNo
			) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("seatNo", seatNo);
		result.put("putShowNo", putShowNo);
		
		PutSeat putSeat = showService.getputPlaceSeat(result);
		result.put("putSeat", putSeat);
		return result;
	}
	
	@RequestMapping("/orderPrice.do")
	public Map<String, Object> orderPrice(@RequestParam("seatNo") String seatNo,
			@RequestParam("putShowNo") int putShowNo
			) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("seatNo", seatNo);
		result.put("putShowNo", putShowNo);
		
		PutSeat putSeat = showService.getputPlaceSeat(result);
		result.put("putSeat", putSeat);
		return result;
	}
	
	@RequestMapping("/categoryList.do")
	public Map<String, Object> categoryList(@RequestParam(name="sort")String sort,
									@RequestParam(name="catno") int catno) {
		Category category = genreService.getCategory(catno);
		Map<String, Object> show = new HashMap<String, Object>();
		List<Show> shows = new ArrayList<Show>();
		if(category.getTopCategoryNo() !=0) {
			shows = showService.getShowListByCategory(catno, sort);
		} else {
			List<Category> topCategoryList = genreService.getTopCategory(catno);
			for(Category categoryList : topCategoryList) {
				List<Show> showListTotal = showService.getShowListByCategory(categoryList.getNo(),sort);
				for(Show showList : showListTotal) {
					shows.add(showList);
				}
			}
		}
		show.put("shows", shows);
		return show;
	}
}

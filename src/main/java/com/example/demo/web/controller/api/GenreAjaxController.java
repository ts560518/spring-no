package com.example.demo.web.controller.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.stringtemplate.v4.compiler.STParser.mapExpr_return;

import com.example.demo.dto.PutSeat;
import com.example.demo.service.GenreService;
import com.example.demo.service.ShowService;

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
}

package com.example.demo.web.controller.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.GenreService;
import com.example.demo.service.ShowService;

@RestController("apiGenreController")
@RequestMapping("/api/genre")
public class GenreAjaxController {

	@Autowired
	GenreService genreService;
	
	@Autowired
	ShowService showService;
	
	@RequestMapping("/orderPrice.do")
	public Map<String, Object> orderPrice(@RequestParam("seatNo") String seatNo,
			@RequestParam("putShowNo") String putShowNo
			) {
		System.out.println(seatNo);
		System.out.println(putShowNo);
		
		Map<String, Object> priceList = new HashMap<String, Object>();
		priceList.put("seatNo", seatNo);
		priceList.put("putShowNo", putShowNo);
		return priceList;
	}
}

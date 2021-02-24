package com.example.demo.web.controller.api;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.PlaceService;
import com.example.demo.service.ShowService;
import com.example.demo.vo.Show;
	
@RestController
@RequestMapping("/api/place")
public class PlaceAjaxController {
	
	@Autowired
	 PlaceService placeService;
	
	@Autowired
	 ShowService showService;
	
	
	
	/*
	 * Ajax 요청을 처리하는 요청 핸들러 메소드는 데이터를 반환한다.
	 * 객체 혹은 List를 반환한다.
	 * 반환된 값은 JSON 형식의 텍스트로 변환되어서 클라이언트에게 전달된다.
	 */
	@RequestMapping("/showList.do")
	public Map<String, Object>showList(@RequestParam(name="name", required = false)String localName){
		System.out.println("name");
		Map<String,Object> result = new HashMap<>();
		if(localName != null) {
			List<Show> shows = showService.getShowByLocalName(localName);
			result.put("shows", shows);
			result.put("size", shows.size());
		} else {
			List<Show> shows = showService.getAllShowsList();
			result.put("shows", shows);
			result.put("size", shows.size());
		}
		System.out.println(result);
		return result;
	}
}

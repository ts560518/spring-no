package com.example.demo.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.TotalShow;
import com.example.demo.service.GenreService;
import com.example.demo.service.ShowService;
import com.example.demo.vo.Category;
import com.example.demo.vo.PutShows;
import com.example.demo.vo.Seat;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowActor;
import com.example.demo.vo.ShowSeat;
import com.example.demo.vo.User;
import com.example.demo.web.annotation.LoginUser;
@Controller
@RequestMapping("/genre")
public class GenreController {

	@Autowired
	GenreService genreService;
	
	@Autowired
	ShowService showService;
	
	
	@RequestMapping("/orderForm.do")
	public String orderForm(@RequestParam("seatNo") List<String> seatNo, @RequestParam("orderPrice") int orderPrice,
							@RequestParam("putShowNo") int putShowNo, Model model,
							@LoginUser User user) {
		for(String a : seatNo) {
			System.out.println(a);
		}
		System.out.println(orderPrice);
		System.out.println(putShowNo);
		
		model.addAttribute("orderPrice", orderPrice);
		return "genre/orderForm";
	}
	
	
	// 예매페이지
	@RequestMapping("/order.do")
	public String order(@RequestParam("putShows") int putShowNo, Model model) {
		
		List<ShowSeat> showSeatList = showService.getputSeat(putShowNo);
		
		// 좌석별 가격조회
		List<Seat> seats = genreService.getplaceSeat();
		
		model.addAttribute("putShowNo", putShowNo);
		model.addAttribute("seats", seats);
		model.addAttribute("showSeatList", showSeatList);
		return "genre/order";
	}
	
	// 카테고리 메인 페이지
	@RequestMapping("/mainlist.do")
	public String mainlist(@RequestParam("catno") int catno, Model model) {
		List<Show> showSwiperList = showService.getCategorySwiper(catno);
		
		model.addAttribute("showSwiperList", showSwiperList);
		return "genre/mainlist";
	}
	
	// 카테고리 상세페이지
	@RequestMapping("/list.do")
	public String list(@RequestParam("catno") int catno, Model model) {
		// 카테고리번호로 테이블 조회
		Category category = genreService.getCategory(catno);
		
		Map<String, Object> categoryMap = new HashMap<String, Object>();
		Category topcategory = new Category();
		List<Show> showList = new ArrayList<Show>();
		// 카테고리 번호를 조회했을때 상위카테고리가 존재하는 경우
		if(category.getTopCategoryNo() != 0) {
			topcategory = genreService.getCategory(category.getTopCategoryNo());
			categoryMap.put("categoryName", topcategory.getName());
			categoryMap.put("categoryDetailName", category.getName());
			
			// catno에 대한 데이터 조회
			showList = showService.getAllCategoryShows(catno);
	
		} else {
			// 상위카테고리로 카테고리조회
			List<Category> topCategoryList = genreService.getTopCategory(catno);
			for(Category categoryList : topCategoryList) {
				List<Show> showListTotal = showService.getAllCategoryShows(categoryList.getNo());
				for(Show show : showListTotal) {
					showList.add(show);
				}
			}
			categoryMap.put("categoryName",category.getName());
			categoryMap.put("categoryDetailName", "전체보기");
		}
		model.addAttribute("show", showList);
		model.addAttribute("category", categoryMap);
		return "genre/list";
	}
	
	// 공연 상세페이지(이건 상위 카테고리가 0이 존지 하지않음)
	// no는 show의 no다.
	@RequestMapping("detail.do")
	public String detail(@RequestParam("no") int no, Model model) {
		// 공연 정보를 담는 객체
		TotalShow totalShow = showService.getOneCategoryShow(no);
		
		// 좌석별 가격조회
		List<Seat> seats = genreService.getplaceSeat();
			
		// 공연 정보에 대한 상연 정보를 담는다.
		List<PutShows> putShowsList = showService.getShowPutShows(no);
		
		List<ShowActor> showActorList = new ArrayList<ShowActor>();
		for(PutShows putShows : putShowsList) {
			showActorList = genreService.getShowActor(putShows.getPutShowNo());
			break;
		}
		
		// 카테고리 번호를 통해 테이블 조회
		Category category = genreService.getCategory(totalShow.getCategoryNo());
		// 상위 카테고리를 조회해서 상위 카테고리 정보 조회
		Category categoryTop = genreService.getCategory(category.getTopCategoryNo());
		Map<String, Object> categoryMap = new HashMap<String, Object>();
		categoryMap.put("topCategory", categoryTop.getName());
		categoryMap.put("category", category.getName());
		
		model.addAttribute("actor", showActorList);
		model.addAttribute("seat", seats);
		model.addAttribute("category", categoryMap);
		model.addAttribute("putShows", putShowsList);
		model.addAttribute("show", totalShow);
		return "genre/detail";
	}
	
	
}









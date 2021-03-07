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
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.TotalShow;
import com.example.demo.service.GenreService;
import com.example.demo.service.ReviewService;
import com.example.demo.service.ShowService;
import com.example.demo.vo.Category;
import com.example.demo.vo.LikeUser;
import com.example.demo.vo.PutShows;
import com.example.demo.vo.Review;
import com.example.demo.vo.Seat;
import com.example.demo.vo.SeatPrice;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowActor;
import com.example.demo.vo.ShowAndPutShow;
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
	
	@Autowired
	ReviewService reviewService;
	
	// 카테고리 메인 페이지
	@RequestMapping("/mainlist.do")
	public String mainlist(@RequestParam("catno") int catno, Model model) {
		List<Show> showSwiperList = showService.getCategorySwiper(catno);
		
		// 카테고리 메인페이지에 카테고리번호별 랭킹
		List<Show> getCategoryHomeRankList = genreService.getCategoryHomeRankList(catno);
		
		// 카테고리 메인페이지에 지역별 데이터
		List<Show> getCategoryHomeLocalList = genreService.getCategoryHomeLocalList(catno);
		
		model.addAttribute("getCategoryHomeLocalList", getCategoryHomeLocalList);
		model.addAttribute("getCategoryHomeRankList", getCategoryHomeRankList);
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
		model.addAttribute("catno", catno);
		model.addAttribute("show", showList);
		model.addAttribute("category", categoryMap);
		return "genre/list";
	}
	
	// 공연 상세페이지(이건 상위 카테고리가 0이 존재 하지 않음)
	// no는 show의 no다.
	@RequestMapping("detail.do")
	public String detail(@RequestParam("no") int no, Model model, @LoginUser User user) {
		// 공연 정보를 담는 객체
		TotalShow totalShow = showService.getOneCategoryShow(no);
		
		// 좌석별 가격조회
		List<Seat> seats = genreService.getplaceSeat();
			
		// 공연 정보에 대한 상연 정보를 담는다.
		List<PutShows> putShowsList = showService.getShowPutShows(no);
		System.out.println(totalShow.getShowNo());
		LikeUser likeUser = null;
		if(user != null) {
		// 사용자가 공연에 대한 좋아요 조회
			likeUser = genreService.getUserLikeByNo(user.getNo(), totalShow.getShowNo());
		}
		
		// 공연의 좋아요 숫자 조회
		int likeCnt = genreService.getShowLikeByShowNo(totalShow.getShowNo());
		
		List<ShowActor> showActorList = new ArrayList<ShowActor>();
		for(PutShows putShows : putShowsList) {
			showActorList = genreService.getShowActor(putShows.getPutShowNo());
			System.out.println("배우잘나오는지 테스트" + showActorList);
			break;
		}
		
		// 카테고리 번호를 통해 테이블 조회
		Category category = genreService.getCategory(totalShow.getCategoryNo());
		// 상위 카테고리를 조회해서 상위 카테고리 정보 조회
		Category categoryTop = genreService.getCategory(category.getTopCategoryNo());
		Map<String, Object> categoryMap = new HashMap<String, Object>();
		categoryMap.put("topCategory", categoryTop.getName());
		categoryMap.put("category", category.getName());
		
		model.addAttribute("likeCnt", likeCnt);
		model.addAttribute("likeUser", likeUser);
		model.addAttribute("actor", showActorList);
		model.addAttribute("seat", seats);
		model.addAttribute("category", categoryMap);
		model.addAttribute("putShows", putShowsList);
		model.addAttribute("show", totalShow);
		return "genre/detail";
	}
	
	/*
	 * 여기서부터 리뷰입니다.
	 */
	@RequestMapping("/reviews.do")
	@ResponseBody
	public Map<String, Object> reviews(@RequestParam("no") int showNo,
			@RequestParam(name = "page", required = false, defaultValue = "1") int pageNo) {
		
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("pageNo", pageNo);
		condition.put("rows", 10);
		condition.put("begin", (pageNo - 1) * 10 + 1);
		condition.put("end", pageNo * 10);
		return reviewService.getReviewDtos(condition);
		
	}
	
	@RequestMapping("/insert.do")
	@ResponseBody
	public Map<String, Object> insert(Review review, 
			@RequestParam(name = "page", required = false, defaultValue = "1") int pageNo) {
		
		reviewService.insertReview(review);
		
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("pageNo", pageNo);
		condition.put("rows", 10);
		condition.put("begin", (pageNo - 1) * 10 + 1);
		condition.put("end", pageNo * 10);
		return reviewService.getReviewDtos(condition);
	}
	
}









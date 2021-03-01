package com.example.demo.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.GenreService;
import com.example.demo.service.OrderService;
import com.example.demo.service.ShowService;
import com.example.demo.vo.Seat;
import com.example.demo.vo.SeatPrice;
import com.example.demo.vo.ShowAndPutShow;
import com.example.demo.vo.ShowSeat;
import com.example.demo.vo.User;
import com.example.demo.web.annotation.LoginUser;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	GenreService genreService;
	
	@Autowired
	ShowService showService;
	
	@Autowired
	OrderService orderService;
	
	// 결제페이지
	@RequestMapping("/orderForm.do")
	public String orderForm(@RequestParam("seatNo") List<String> seatNo, @RequestParam("orderPrice") int orderPrice,
							@RequestParam("putShowNo") int putShowNo, Model model,
							@LoginUser User user) {
		
		List<SeatPrice> seatPrice = new ArrayList<>();
		for(String seatNoOne : seatNo) {
			// 선택한 좌석별로 등급 및 가격 조회
			SeatPrice seat = genreService.getPlaceSeatPrice(seatNoOne);
			seatPrice.add(seat);
		}
		
		// 상연정보에 대한 공연조횐
		ShowAndPutShow showAndPutShow = showService.getShowAndPutShow(putShowNo);
		
		model.addAttribute("showAndPutShow", showAndPutShow);
		model.addAttribute("seatPrice", seatPrice);
		model.addAttribute("orderPrice", orderPrice);
		return "order/orderForm";
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
		return "order/order";
	}
}

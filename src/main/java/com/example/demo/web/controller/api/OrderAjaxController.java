package com.example.demo.web.controller.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.GenreService;
import com.example.demo.service.OrderService;
import com.example.demo.service.ShowService;
import com.example.demo.service.UserService;
import com.example.demo.vo.Coupon;

@RestController("apiOrderController")
@RequestMapping("/api/order")
public class OrderAjaxController {

	@Autowired
	GenreService genreService;
	
	@Autowired
	ShowService showService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/couponPrice")
	public int couponPrice(@RequestParam("couponNo") int couponNo) {
		if(couponNo == 0) {
			return 0;
		}
		Coupon coupon = orderService.getCouponPrice(couponNo);
		return coupon.getPrice();
	}
}

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

import com.example.demo.service.GenreService;
import com.example.demo.service.OrderService;
import com.example.demo.service.ShowService;
import com.example.demo.service.UserService;
import com.example.demo.util.SessionUtils;
import com.example.demo.vo.Bank;
import com.example.demo.vo.Coupon;
import com.example.demo.vo.Order;
import com.example.demo.vo.Seat;
import com.example.demo.vo.SeatPrice;
import com.example.demo.vo.ShowAndPutShow;
import com.example.demo.vo.ShowSeat;
import com.example.demo.vo.ShowUserPointHistories;
import com.example.demo.vo.User;
import com.example.demo.vo.UserCoupon;
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
	
	@Autowired
	UserService userService;
	
	// 결제INSERT
	@RequestMapping("/orderInsert.do")
	public String orderInsert(@RequestParam("seatNo") List<String> seatNo, @RequestParam("orderPrice") int orderPrice,
								@LoginUser User user, @RequestParam("putShowNo") int putShowNo, Model model,
								@RequestParam(name="couponNo", required=false, defaultValue="0") int couponNo,
								@RequestParam("usablePoint") int usabledPoint,
								@RequestParam("usedPoint") int usedPoint, @RequestParam("totalPayPrice") int totalPayPrice,
								@RequestParam("totalSavedPoint") int savedPoint,
								@RequestParam("bank") String bankName, @RequestParam("account") String account) {
		// 쿠폰번호로 쿠폰 가격 조회, 쿠폰번호가 0일 경우 조회하지 않음 그리고 쿠폰사용여부 업데이트
		Coupon coupon = new Coupon();
		if(couponNo!=0) {
			coupon = orderService.getCouponPrice(couponNo);
			usedPoint = usedPoint - coupon.getPrice();
			orderService.updateCoupon(couponNo);
		}
		// 유저 포인트 내역 추가하기
		String content="포인트 사용";
		ShowUserPointHistories pointHistories = new ShowUserPointHistories();
		pointHistories.setUserNo(user.getNo());
		if(usedPoint !=0) {
			pointHistories.setPointAmount(-usedPoint);
			pointHistories.setContent(content);
			orderService.insertPointHistories(pointHistories);
		}
		// 유저 포인트 적립 내역 추가
		content="포인트 적립";
		pointHistories.setPointAmount(totalPayPrice/20);
		pointHistories.setContent(content);
		orderService.insertPointHistories(pointHistories);
		
		// 유저포인트 업데이트, 그리고 savePoint 업데이트
		user.setAvailablePoint(user.getAvailablePoint() - usedPoint);
		userService.updateUser(user);
		
		// 예매 좌석 숫자
		int orderAmount = 0;
		// 예매내역 테이블을 위한 좌석테이블 조회할 리스트
		List<ShowSeat> showSeatList = new ArrayList<ShowSeat>();
		// 예매좌석 테이블 업데이트
		for(String putseatNo : seatNo) {
			orderAmount++;
			Map<String, Object> showSeat = new HashMap<String, Object>();
			showSeat.put("seatNo", putseatNo);
			showSeat.put("putShowNo", putShowNo);
			orderService.updateShowSeat(showSeat);
			ShowSeat showOrderSeat = showService.getShowSeat(showSeat);
			showSeatList.add(showOrderSeat);
		}
		// 은행 테이블 조회
		Bank bank = orderService.getBank(bankName);
		System.out.println(bank.getNo());
		// 예매테이블 insert
		int orderNo = orderService.getOrderNo();
		String status = "결제완료";
		String orderPaymentMethod="무통장입금";
		Order order = new Order();
		order.setNo(orderNo);
		order.setUserNo(user.getNo());
		order.setPutShowNo(putShowNo);
		order.setOrderAmount(orderAmount);
		order.setStatus(status);
		order.setTotalOrderPrice(orderPrice);
		order.setUsedPoint(usedPoint);
		order.setTotalPaymentPrice(totalPayPrice);
		order.setOrderPaymentMethod(orderPaymentMethod);
		order.setBankNo(bank.getNo());
		order.setBankCardAccount(account);
		if (couponNo == 0) {
			order.setCouponHistoryNo(0);
		}
		order.setCouponHistoryNo(coupon.getNo());
		orderService.insertOrder(order);
		// 예매 내역 테이블
		Map<String, Object> ticketOrderItems = new HashMap<String, Object>();
		for(ShowSeat showSeat : showSeatList) {
			ticketOrderItems.put("seatNo", showSeat.getNo());
			ticketOrderItems.put("orderNo", orderNo);
			orderService.insertTicketOrderItems(ticketOrderItems);
		}
		
		// user세션저장(user포인트 저장)
		SessionUtils.removeAttribute("LOGINED_USER");
		SessionUtils.setAttribute("LOGINED_USER", user);
		
		return "redirect:../home.do";
	}
	
	// 결제페이지
	@RequestMapping("/orderForm.do")
	public String orderForm(@RequestParam("seatNo") List<String> seatNo, @RequestParam("orderPrice") int orderPrice,
							@RequestParam("putShowNo") int putShowNo, Model model,
							@LoginUser User user) {
		
		// 유저가 가지고 있는 쿠폰 조회
		List<UserCoupon> userCouponList = orderService.getUserCoupon(user.getNo());
		
		List<SeatPrice> seatPrice = new ArrayList<>();
		for(String seatNoOne : seatNo) {
			// 선택한 좌석별로 등급 및 가격 조회
			SeatPrice seat = genreService.getPlaceSeatPrice(seatNoOne);
			seatPrice.add(seat);
		}
		
		// 상연정보에 대한 공연조횐
		ShowAndPutShow showAndPutShow = showService.getShowAndPutShow(putShowNo);
		
		model.addAttribute("userCouponList", userCouponList);
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

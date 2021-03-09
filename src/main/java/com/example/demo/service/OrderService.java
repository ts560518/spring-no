package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dto.OrderDto;
import com.example.demo.vo.Bank;
import com.example.demo.vo.Coupon;
import com.example.demo.vo.Order;
import com.example.demo.vo.ShowUserPointHistories;
import com.example.demo.vo.UserCoupon;

@Transactional
public interface OrderService {

	List<UserCoupon> getUserCoupon(int userNo);
	Coupon getCouponPrice(int couponNo);
	void updateCoupon(int couponNo);
	
	void updateShowSeat(Map<String, Object> showSeat);
	
	void insertPointHistories(ShowUserPointHistories pointHistories);

	Bank getBank(String bankName);
	
	void insertOrder(Order order);
	
	int getOrderNo();
	
	void insertTicketOrderItems(Map<String, Object> ticketOrderItems);
	
	List<OrderDto> getOrderByUserNo(int userNo);
	
	List<OrderDto> getCouponByUserNo(int userNo);
	
	List<ShowUserPointHistories> getPointByUserNo(int userNo);
	
	int getCountOrderByUserNo(int userNo);
	
	Order getOrderByOrderNo(int orderNo);
}

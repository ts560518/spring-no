package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.OrderDto;
import com.example.demo.vo.Bank;
import com.example.demo.vo.Coupon;
import com.example.demo.vo.Order;
import com.example.demo.vo.ShowUserPointHistories;
import com.example.demo.vo.UserCoupon;
@Mapper
public interface OrderDao {

	List<UserCoupon> getUserCoupon(int userNo);
	
	Coupon getCouponPrice(int couponNo);
	
	void updateCoupon(int couponNo);
	
	void updateShowSeat(Map<String, Object> showSeat);
	
	void insertPointHistories(ShowUserPointHistories pointHistories);

	Bank getBank(String bankName);
	
	void insertOrder(Order order);
	
	int getOrderNo();
	
	void insertTicketOrderItems(Map<String, Object> ticketOrderItems);
	
	OrderDto getAllAboutOrder(int userNo);
}

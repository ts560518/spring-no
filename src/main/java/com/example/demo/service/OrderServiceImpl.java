package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.GenreDao;
import com.example.demo.dao.OrderDao;
import com.example.demo.dao.UserDao;
import com.example.demo.dto.OrderDto;
import com.example.demo.vo.Bank;
import com.example.demo.vo.Coupon;
import com.example.demo.vo.Order;
import com.example.demo.vo.Seat;
import com.example.demo.vo.ShowUserPointHistories;
import com.example.demo.vo.UserCoupon;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderDao orderDao;
	
	@Autowired
	UserDao userDao;

	@Override
	public List<UserCoupon> getUserCoupon(int userNo) {
		return orderDao.getUserCoupon(userNo);
	}

	@Override
	public Coupon getCouponPrice(int couponNo) {
		return orderDao.getCouponPrice(couponNo);
	}

	@Override
	public void updateCoupon(int couponNo) {
		orderDao.updateCoupon(couponNo);
	}

	@Override
	public void updateShowSeat(Map<String, Object> showSeat) {
		orderDao.updateShowSeat(showSeat);
	}

	@Override
	public void insertPointHistories(ShowUserPointHistories pointHistories) {
		orderDao.insertPointHistories(pointHistories);
	}

	@Override
	public Bank getBank(String bankName) {
		return orderDao.getBank(bankName);
	}

	@Override
	public void insertOrder(Order order) {
		orderDao.insertOrder(order);
	}

	@Override
	public int getOrderNo() {
		return orderDao.getOrderNo();
	}

	@Override
	public void insertTicketOrderItems(Map<String, Object> ticketOrderItems) {
		orderDao.insertTicketOrderItems(ticketOrderItems);
	}

	@Override
	public OrderDto getAllAboutOrder(int userNo) {
		return orderDao.getAllAboutOrder(userNo);
	}
	
	
	
}

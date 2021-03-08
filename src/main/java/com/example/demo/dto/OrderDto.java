package com.example.demo.dto;

import com.example.demo.vo.Coupon;
import com.example.demo.vo.Order;
import com.example.demo.vo.PutShows;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowSeat;
import com.example.demo.vo.ShowUserPointHistories;
import com.example.demo.vo.User;
import com.example.demo.vo.UserCoupon;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDto {

	private Order order;
	private int itemNo;
	private User user;
	private PutShows putShows;
	private Show show;
	private ShowUserPointHistories point;
	private Coupon coupon;
	private UserCoupon userCoupon;
	private ShowSeat showSeat;
}

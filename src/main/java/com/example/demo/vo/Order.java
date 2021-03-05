package com.example.demo.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Order {

	private int no;
	private int userNo;
	private int putShowNo;
	private int orderAmount;
	private String status;
	private int totalOrderPrice;
	private int usedPoint;
	private int totalPaymentPrice;
	private String orderPaymentMethod;
	private int bankNo;
	private int bankCardAccount;
	private Date createdDate;
	private int couponHistoryNo;
}

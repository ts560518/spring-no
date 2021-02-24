package com.example.demo.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class User {
	   
	private int no;
	private String name;
	private String id;
	private String password;
	private String birth;
	private String tel;
	private String email;
	private String address;
	private String emailReceivingConsent;
	private String smsReceivingConsent;
	private String availablePoint;
	private Date createdDate;
	private String role;
	private String ableStatus;
	private Date withdrawalDate;
}

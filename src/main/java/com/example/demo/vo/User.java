package com.example.demo.vo;

import java.util.Date;

import com.example.demo.util.DateUtils;

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
	private Date birth;
	private String tel;
	private String email;
	private String address;
	private String emailReceivingConsent;
	private String smsReceivingConsent;
	private int availablePoint;
	private Date createdDate;
	private String role;
	private String ableStatus;
	private Date withdrawalDate;

	public int getAge() {
		if (birth == null) {
			return 0;
		}
		int age = DateUtils.getCurrentMyAge(birth);
		return age;
	}
}

package com.example.demo.web.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserForm {

	private String name;
	private String id;
	private String password;
	private String password2;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String tel;
	private String email;
	private int postAddress;
	private String address1;
	private String address2;
	private String address3;
	private String emailReceivingConsent;
	private String smsReceivingConsent;
	
	public UserForm() {}
}

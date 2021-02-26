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
	private String address;
	private String emailReceivingConsent;
	private String smsReceivingConsent;
}

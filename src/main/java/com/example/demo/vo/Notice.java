package com.example.demo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Notice {

	private int no;
	private String type;
	private String title;
	private String content;
	private	Date createdDate;
	private int views;
}

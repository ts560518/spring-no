package com.example.demo.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Review {

	private int no;
	private int showNo;
	private int userNo;
	private int rating;
	private String content;
	private String ableStatus;
	private Date createdDate;
}

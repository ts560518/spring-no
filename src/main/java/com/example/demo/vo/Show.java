package com.example.demo.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Show {

	 private int no;
	 private int categoryNo;
	 private String name;
	 private int viewingNo;
	 private String runningTime;
	 private String posterImg;
	 @JsonFormat(pattern = "yyyy-MM-dd")
	 private Date beginDate;
	 @JsonFormat(pattern = "yyyy-MM-dd")
	 private Date endDate;
	 private int placeNo;
	 private String placeName;
	 private String localName;
	 private String attentionImg;
	 private String saleImg;
	 private String showDetailImg;
	 private Date createdDate;
	}
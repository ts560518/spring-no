package com.example.demo.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TotalShow {

	private int showNo;
	private int categoryNo;
	private String showName;
	private int viewingNo;
	private String runningTime;
	private String posterImg;
	private Date beginDate;
	private Date endDate;
	private int placeNo;
	private String attentionImg;
	private String saleImg;
	private String showDetailImg;
	private Date createdDate;
	
	// 장소
	private String localName;
	private String placeName;
	private String placeAddress;
	private int seatCapacity;
	
	// 관람등급
	private int viewingGradeSd;
	private String viewingGradeName;
	
	
}

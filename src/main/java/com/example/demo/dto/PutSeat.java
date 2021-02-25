package com.example.demo.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PutSeat {

	private int seatNo;
	private String showSeatNo;
	private int putShowNo;
	private String ticket;
	private int showNo;
	private String showDay;
	private String showStartTime;
	private int categoryNo;
	private String showName;
	private int viewingNo;
	private String runningTime;
	private String posterImg;
	@JsonFormat(pattern = "yyyy-MM-dd")
    private Date beginDate;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endDate;
    private int placeNo;
    private String attentionImg;
    private String saleImg;
    private String showDetailImg;
    private Date createdDate;
    
    private String seatGrade;
    private int seatPrice;
}

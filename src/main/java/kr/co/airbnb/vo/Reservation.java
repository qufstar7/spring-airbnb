package kr.co.airbnb.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("Reservation")
public class Reservation {

	private int no;
	private Date checkInDate;
	private Date checkOutDate;
	private int adultNum;
	private int childrenNum;
	private int infantNum;
	private int petNum;
	private String messageToHost;
	private Date createdDate;
	private Date updatedDate;
	private int serviceFee;
	private int price;
	private int entirePay;
	private int leftPay;
	private Accommodation accommodation;
	private User user;
	
	
	
}

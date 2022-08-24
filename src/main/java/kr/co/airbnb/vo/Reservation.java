package kr.co.airbnb.vo;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("Reservation")
public class Reservation {

	private int no;
	private int accNo;
	private String status;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date checkInDate;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date checkOutDate;
	private int adultNum;
	private int childrenNum;
	private int infantNum;
	private int petNum;
	private int totalGuest;
	private String messageToHost;
	private Date createdDate;
	private Date updatedDate;
	private double serviceFee;
	private int price;
	private double totalPrice;
	private int entirePay;
	private double leftPay;
	private Accommodation accommodation;
	private User user;
	private String reservationStatus;
	private int userNo;
	private String entirePayment;
	
	
}

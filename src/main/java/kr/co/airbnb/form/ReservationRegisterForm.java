package kr.co.airbnb.form;

import java.util.Date;


import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationRegisterForm {

	private String id;
	private String expiryDate;
	private String cvv;
	private String zipCode;
	private String region;
	
	private int accNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date checkInDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date checkOutDate;
	private int adultNum;
	private int childrenNum;
	private int infantNum;
	private int petNum;
	private int totalGuest;
	private String payment;
	private String messageToHost;
	private int price;
	private int serviceFee;
	private int cleaningPrice;
	private int totalPrice = price + serviceFee + cleaningPrice;
	private int entirePay;
	private int leftPay;
	
}

package kr.co.airbnb.form;

import java.util.Date;

import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.User;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationForm {

	private Date checkInDate;
	private Date checkOutDate;
	private int adultNum;
	private int childrenNum;
	private int infantNum;
	private int petNum;
	private String payment;
	private String messageToHost;
	private int serviceFee;
	private int price;
	private int entirePay;
	private int leftPay;
	
}

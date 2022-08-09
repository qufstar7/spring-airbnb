package kr.co.airbnb.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("Card")
public class Card {

	private int no;
	private String id;
	private String expiryDate;
	private String cvv;
	private String zipCode;
	private String region;
	private int balance;
	private String availability;
	private User user;
	
}

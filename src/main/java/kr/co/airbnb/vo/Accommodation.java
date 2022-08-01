package kr.co.airbnb.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Accommodation {

	int no;
	int typeNo;
	User user;
	int reviewCount;
	int reviewScore;
	String name;
	String description;
	String address;
	String latitude;
	int price;
	int guest;
	int pet;
	Date checkIn;
	Date checkOut;
	String checkInType;
	String status;
	Date createdDate;
	Date updatedDate;
	int viewCount;
	int minDay;
	int maxDay;
	String rent;
	String trafficDescription;
	String refoundDescription;
	int cleaningPrice;
	String imageCover;
	
}

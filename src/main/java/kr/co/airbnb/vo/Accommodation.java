package kr.co.airbnb.vo;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("Accommodation")
public class Accommodation {

	private int accNo;
	private int typeNo;
	private User user;
	private int reviewCount;
	// private int reviewScore;
	private String name;
	private String description;
	private String address;
	private String latitude;
	private String longitude;
	private int price;
	private int guest;
	private int pet;
	private Date checkIn;
	private Date checkOut;
	private String checkInType;
	private String status;
	private Date createdDate;
	private Date updatedDate;
	private int viewCount;
	private int minDay;
	private int maxDay;
	private String rent;
	private String trafficDescription;
	private String refoundDescription;
	private int cleaningPrice;
	private String imageCover;
	
	private List<AccConvenience> conveniences;
	private List<AccPhoto> photos;
	
	private double reviewScore;
	private double totalScore;
	private double cleanScore;
	private double accuracyScore;
	private double communicationScore;
	private double locationScore;
	private double checkinScore;
	private double valueScore;
	private double convenienceScore;

}

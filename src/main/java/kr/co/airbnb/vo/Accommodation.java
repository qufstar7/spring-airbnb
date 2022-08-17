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
	private AccRoom room;
	
	// 메인타입, 서브타입, 프라이버시타입 (ex.아파트-공동주택-공간전체)
	private List<Type> types;
	// typeNo를 메인타입의 번호로 쓴다.
	// private int typeNo = accTypes.get(0).getNo();
	
	private List<AccConvenience> conveniences;
	private List<Wishlist> wishlists;
	private List<AccPhoto> photos;
	private AccRoom rooms;
	private List<String> disabledDate;
	private List<Tag> tags;
	
	private double reviewScore;
	private double totalScore;
	private double cleanScore;
	private double accuracyScore;
	private double communicationScore;
	private double locationScore;
	private double checkinScore;
	private double valueScore;
	private double convenienceScore;
	
	private AccConvenience convenience;
	private AccPhoto photo;
	private AccViewCount view;
	private Reservation reservation;
	private Review review;
	private Wishlist wishlist;
	private AccDiscount discount;
	private Tag tag;

}

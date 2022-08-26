package kr.co.airbnb.vo;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "M월 d일", timezone = "Asia/Seoul")
	private Date checkIn;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "M월 d일", timezone = "Asia/Seoul")
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

	private String imageCover; // 대표이미지
	private AccRoom room; // 인원, 침대, 침실, 욕실 개수 저장

	
	private List<Type> types; // 유형 3가지(메인,서브,프라이버시 ex)주택-통나무집-공간전체)
	private List<AccConvenience> conveniences; // 편의시설 목록
	private List<Wishlist> wishlists;

	private List<AccPhoto> photos; // 이미지 목록
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
	private List<Reservation> reservations;
	private Review review;
	private Wishlist wishlist;
	private AccDiscount discount;
	private Tag tag;
	private String savedWishlist;
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + accNo;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Accommodation other = (Accommodation) obj;
		if (accNo != other.accNo)
			return false;
		return true;
	}
	
	

}

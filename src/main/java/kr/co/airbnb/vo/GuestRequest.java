package kr.co.airbnb.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("GuestRequest")
public class GuestRequest {
	
	private int reservationNo;
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date checkIn;
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date checkOut;
	private int reviewCount;
	private String accName;
	private String address;
	private String imageCover;
	private String guestName;

}

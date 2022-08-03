package kr.co.airbnb.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("GuestRequest")
public class GuestRequest {
	
	private int reservationNo;
	private Date checkIn;
	private Date checkOut;
	private int reviewCount;
	private String accName;
	private String address;
	private String imageCover;
	private String guestName;

}

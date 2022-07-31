package kr.co.airbnb.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Wishlist {

	private int no;
	private String name;
	private Date createdDate;
	private Date updatedDate;
	private User user;
	private Accommodation acc;
	
	
}

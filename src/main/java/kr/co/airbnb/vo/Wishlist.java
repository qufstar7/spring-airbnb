package kr.co.airbnb.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Wishlist {

	private int no;
	private String name;
	private Date createdDate;
	private Date updatedDate;
	private User user;
	private Accommodation acc;
	private List<Accommodation> accs;
	private WishlistImage wishlistImage;
	
	public Wishlist(String name, User user) {
		super();
		this.name = name;
		this.user = user;
	}
	
	public Wishlist(int no) {
		this.no = no;
	}
	
	
}

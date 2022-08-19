package kr.co.airbnb.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
@Alias("AccWishlist")
public class AccWishlist {

	private int accNo;
	private Wishlist wishlist;
	private AccPhoto accPhoto;
	
	public AccWishlist(int accNo, int no) {
		this.accNo = accNo;
		this.wishlist = new Wishlist(no);
	}
}


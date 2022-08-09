package kr.co.airbnb.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.mapper.WishlistMapper;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Wishlist;

@Service
public class WishlistService {

	@Autowired
	private WishlistMapper wishlistMapper;
	
	public Wishlist getWishlistByNo(int wishlistNo) {
		Wishlist wishlist = wishlistMapper.getWishlistByNo(wishlistNo);
		wishlist.setAccs(wishlistMapper.getWishlistAccsByNo(wishlistNo));
		
		return wishlist;
	}
	
	public List<Wishlist> getMyWishlists(int userNo) {
		List<Wishlist> wishlists = wishlistMapper.getWishlistsByUserNo(userNo);
		for (Wishlist wishlist : wishlists) {
			wishlist.setAccs(wishlistMapper.getWishlistAccsByNo(wishlist.getNo()));
		}
		return wishlists;
	}
	
	public void deleteWishlistAcc(int wishlistNo, int accNo) {
		wishlistMapper.deleteWishlistAcc(wishlistNo, accNo);
	}
}

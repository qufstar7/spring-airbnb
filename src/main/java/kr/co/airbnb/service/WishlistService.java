package kr.co.airbnb.service;


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
	
	public List<Wishlist> getMyWishlists(int userNo) {
		return wishlistMapper.getWishlistsByUserNo(userNo);
	}
	
	public List<Accommodation> getWishlistAccsByNo(int wishlistNo) {
		
		return null;
	}
}

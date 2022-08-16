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
	
	// 숙소는 저장하지 않고 새로운 위시리스트 폴더만 생성하는 경우
	public void createWishlist(Wishlist wishlist) {
		wishlistMapper.createWishlist(wishlist);
	}
	
	// 새로운 위시리스트 폴더 생성하고 숙소를 저장하는 경우
	public void createWishlistAndSaveAcc(Wishlist wishlist, int accNo) {
		wishlistMapper.createWishlist(wishlist);
		wishlistMapper.saveWishlistAcc(wishlist.getNo(), accNo);
	}
	
	// 기존의 위시리스트 폴더에 숙소를 저장하는 경우
	// 다른 위시리스트 폴더로 변경할 때도 사용됨
	public void saveAcc(int wishlistNo, int accNo) {
		wishlistMapper.saveWishlistAcc(wishlistNo, accNo);
	}
	
	// 다른 위시리스트 폴더로 변경
	//public void changeWishlist(int wishlistNo, int accNo) {
	//	wishlistMapper.changeWishlist(wishlistNo, accNo);
	//}
	
	public void updateWishlist(int wishlistNo, String changedName) {
		Wishlist wishlist = getWishlistByNo(wishlistNo);
		wishlist.setName(changedName);
		
		wishlistMapper.updateWishlist(wishlist);
	}
	
	public void deleteWishlistAcc(int wishlistNo, int accNo) {
		wishlistMapper.deleteWishlistAcc(wishlistNo, accNo);
	}
}

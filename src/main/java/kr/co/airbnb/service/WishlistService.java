package kr.co.airbnb.service;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.airbnb.mapper.WishlistMapper;
import kr.co.airbnb.vo.AccWishlist;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Wishlist;

@Service
@Transactional
public class WishlistService {

	@Autowired
	private WishlistMapper wishlistMapper;
	
	public Wishlist getWishlistByNo(int wishlistNo) {
		Wishlist wishlist = wishlistMapper.getWishlistByNo(wishlistNo);
		wishlist.setAccs(wishlistMapper.getWishlistAccsByNo(wishlistNo));
		return wishlist;
	}
	
	public Wishlist getNewWishlistByUserNo(int userNo) {
		Wishlist newWishlist = wishlistMapper.getNewWishlistByUserNo(userNo);
		newWishlist.setAccs(wishlistMapper.getWishlistAccsByNo(newWishlist.getNo()));
		
		return newWishlist;
	}
	
	/**
	 * 해당 위시리스트에서 날짜, 인원 조건별 예약가능, 불가능 숙소 출력
	 * @param wishlistNo
	 * @param checkInDate 사용자가 설정한 체크인 날짜
	 * @param checkOutDate 사용자가 설정한 체크아웃 날짜
	 * @param guestCount 숙박인원
	 * @return
	 */
	public Map<String, Wishlist> getWishlistWithCondition(int wishlistNo, Date checkInDate, Date checkOutDate, int guestCount) {
		
		Map<String, Wishlist> wishlist = new HashMap<>();
		
		Wishlist availableWishlist = wishlistMapper.getWishlistByNo(wishlistNo);
		availableWishlist.setAccs(wishlistMapper.getAvailableWishlistAccsWithConditions(wishlistNo, checkInDate, checkOutDate, guestCount));
		System.out.println("예약가능한 숙소 개수: " +availableWishlist.getAccs().size() );
		
		Wishlist unavailableWishlist = wishlistMapper.getWishlistByNo(wishlistNo);
		unavailableWishlist.setAccs(wishlistMapper.getUnavailableWishlistAccsWithConditions(wishlistNo, checkInDate, checkOutDate, guestCount));
		System.out.println("예약불가능한 숙소 개수: " +unavailableWishlist.getAccs().size() );
		
		wishlist.put("availableWishlist", availableWishlist);
		wishlist.put("unavailableWishlist", unavailableWishlist);
		
		
		//Wishlist wishlist = wishlistMapper.getWishlistByNo(wishlistNo);
		//wishlist.setAccs(wishlistMapper.getWishlistAccsWithConditions(wishlistNo, checkInDate, checkOutDate, guestCount));
		
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

	// 질문
	/**
	 * 해당 위시리스트 폴더 및 모든 숙소 정보를 삭제한다.
	 * @param wishlistNo
	 */
	public void deleteWishlist(int wishlistNo) {
		deleteWishlistAcc(wishlistNo, 0);
		wishlistMapper.deleteWishlist(wishlistNo);
	}
	
	public void deleteWishlistAcc(int wishlistNo, int accNo) {
		wishlistMapper.deleteWishlistAcc(wishlistNo, accNo);
	}
	
	public List<AccWishlist> getAccNoByUserNo(int userNo) {
		return wishlistMapper.getAccNoByUserNo(userNo);
	}
}
	


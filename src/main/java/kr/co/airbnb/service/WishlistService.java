package kr.co.airbnb.service;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.airbnb.mapper.AccommodationMapper;
import kr.co.airbnb.mapper.WishlistMapper;
import kr.co.airbnb.vo.AccWishlist;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Wishlist;

@Service
@Transactional
public class WishlistService {

	@Autowired
	private WishlistMapper wishlistMapper;
	@Autowired
	AccommodationMapper accommodationMapper;
	
	public Wishlist getWishlistByNo(int wishlistNo) {
		Wishlist wishlist = wishlistMapper.getWishlistByNo(wishlistNo);
		wishlist.setAccs(wishlistMapper.getWishlistAccsByNo(wishlistNo));
		
		return wishlist;
	}
	
	/**
	 * 해당 위시리스트에서 날짜, 인원 조건별 예약가능, 불가능 숙소 출력
	 * @param wishlistNo
	 * @param checkInDate 사용자가 설정한 체크인 날짜
	 * @param checkOutDate 사용자가 설정한 체크아웃 날짜
	 * @param guestCount 숙박인원
	 * @return
	 */
	public Wishlist getAvailableWishlistWithCondition(int wishlistNo, Date checkInDate, Date checkOutDate, int guestCount) {
		
		Wishlist wishlist = wishlistMapper.getWishlistByNo(wishlistNo);
		wishlist.setAccs(wishlistMapper.getAvailableWishlistAccsWithConditions(wishlistNo, checkInDate, checkOutDate, guestCount));
		
		//Wishlist wishlist = wishlistMapper.getWishlistByNo(wishlistNo);
		//wishlist.setAccs(wishlistMapper.getWishlistAccsWithConditions(wishlistNo, checkInDate, checkOutDate, guestCount));
		
		return wishlist;
	}
	
	public Wishlist getAnavailableWishlistWithCondition(int wishlistNo, Date checkInDate, Date checkOutDate, int guestCount) {
		
		Wishlist wishlist = wishlistMapper.getWishlistByNo(wishlistNo);
		wishlist.setAccs(wishlistMapper.getUnavailableWishlistAccsWithConditions(wishlistNo, checkInDate, checkOutDate, guestCount));
		
		return wishlist;
	}
	
	public List<Wishlist> getMyWishlists(int userNo) {
		List<Wishlist> wishlists = wishlistMapper.getWishlistsByUserNo(userNo);
		for (Wishlist wishlist : wishlists) {
			wishlist.setAccs(wishlistMapper.getWishlistAccsByNo(wishlist.getNo()));
		}
		return wishlists;
	}
	
	/**
	 * 마이위시리스트에 등록된 (중복없는) 모든 숙소들 출력하기
	 * @param userNo
	 * @return
	 
	public Set<Accommodation> getAccsInAllMyWishlists(int userNo) {
		List<Wishlist> wishlists = getMyWishlists(userNo);
		
		Set<Accommodation> wishlistAccs = new HashSet<Accommodation>();
		
		for(Wishlist wishlist : wishlists) {
			wishlistAccs.addAll(wishlist.getAccs());
		}
		
		return wishlistAccs;
	} */
	
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
		wishlistMapper.deleteAllAccsInWishlist(wishlistNo);
		wishlistMapper.deleteWishlist(wishlistNo);
	}
	
	/**
	 * 위시리스트에서 특정 숙소를 삭제한다.
	 * @param wishlistNo
	 * @param accNo
	 */
	public void deleteWishlistAcc(int wishlistNo, int accNo) {
		wishlistMapper.deleteWishlistAcc(wishlistNo, accNo);
	}
	
	// 홈화면에서 사용자번호, 숙소 번호만으로 위시리스트 숙소 삭제할 경우
	public void deleteWishlistAccByUserNoAndAccNo(int userNo, int accNo) {
		wishlistMapper.deleteWishlistAccByUserNoAndAccNo(userNo, accNo);
	}
	
	
	
	public AccWishlist getAccNoByUserNo(Map<String, Object> map) {
		return wishlistMapper.getAccNoByUserNo(map);
	}

	/**
	 * wishlists.jsp에서 비동기방식으로 숙소 더보기 버튼 구현하기
	 * @param userNo
	 * @param startNum 다음번에 받아와야 하는 숙소의 인덱스 번호
	 */
	public List<Wishlist> getMoreWishlists(int userNo, int startNum) {
		int lastNum = startNum + 8;			// 더보기를 누르면 9개씩 더 출력된다.
		
		List<Wishlist> nextWishlists = wishlistMapper.getNextWishlists(userNo, startNum, lastNum);
		
		for(Wishlist wishlist : nextWishlists) {
			wishlist.setAccs(wishlistMapper.getWishlistAccsByNo(wishlist.getNo()));
		}
		return nextWishlists;
	}
}
	


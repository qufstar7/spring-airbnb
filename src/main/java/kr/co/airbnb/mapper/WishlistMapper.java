package kr.co.airbnb.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.airbnb.vo.AccWishlist;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Wishlist;
import kr.co.airbnb.vo.WishlistImage;

@Mapper
public interface WishlistMapper {

	Wishlist getWishlistByNo(int wishlistNo);
	List<Wishlist> getWishlistsByUserNo(int userNo);
	List<Wishlist> getNextWishlists(@Param("userNo") int userNo, @Param("startNum") int startNum, @Param("lastNum") int lastNum);
	List<Accommodation> getWishlistAccsByNo(int wishlistNo);
	
	void createWishlist(Wishlist wishlist);
	void saveWishlistAcc(@Param("wishlistNo")int wishlistNo, @Param("accNo") int accNo);
	void updateWishlist(Wishlist wishlist);
	void deleteWishlist(int wishlistNo);
	
	// 위시리스트 안의 특정 숙소를 삭제할 경우
	void deleteWishlistAcc(@Param("wishlistNo") int wishlistNo, @Param("accNo") int accNo);
	// 홈화면에서 사용자번호, 숙소 번호만으로 위시리스트 숙소 삭제할 경우
	void deleteWishlistAccByUserNoAndAccNo(@Param("userNo") int userNo, @Param("accNo") int accNo);
	
	// 위시리스트 폴더 자체를 삭제할 경우
	void deleteAllAccsInWishlist(@Param("wishlistNo") int wishlistNo);
	
	
	
	AccWishlist getAccNoByUserNo(Map<String,Object> map);
	WishlistImage getImageByUserNo(Map<String,Object> map);
	
	// 다른 위시리스트 폴더로 변경
	void changeWishlist(@Param("wishlistNo")int wishlistNo, @Param("accNo") int accNo);
	
	//위시리스트에서 날짜, 인원 조건에 맞고 예약가능한 숙소들
    List<Accommodation> getAvailableWishlistAccsWithConditions(@Param("wishlistNo")int wishlistNo, @Param("checkInDate") Date checkIndate, @Param("checkOutDate") Date checkOutDate, @Param("guestCount") int guestCount);
    //위시리스트에서 날짜, 인원 조건에 예약불가한 숙소들
	List<Accommodation> getUnavailableWishlistAccsWithConditions(@Param("wishlistNo")int wishlistNo, @Param("checkInDate") Date checkIndate, @Param("checkOutDate") Date checkOutDate, @Param("guestCount") int guestCount);
}

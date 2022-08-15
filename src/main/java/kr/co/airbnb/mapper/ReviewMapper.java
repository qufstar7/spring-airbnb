package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.GuestRequest;
import kr.co.airbnb.vo.HostRequest;
import kr.co.airbnb.vo.Review;

@Mapper
public interface ReviewMapper {
	void insertReviewGuest(Review review);
	void insertReviewHost(Review review);
	
	GuestRequest getGuestInfoByReservationNo(int reservationNo);
	HostRequest getHostInfoByReservationNo(int reservationNo);
	Integer getDuplicateReviewByNo(@Param("reservationNo") int reservationNo, @Param("userNo") int userNo);	// integer 
	Integer getOverdueReviewByNo(@Param("reservationNo") int reservationNo, @Param("userNo") int userNo);
	
	List<Review> getReviews(@Param("accNo") int accNo, int beginIndex, int endIndex);
	List<Review> getReviewsUnder(int accNo);
	// List<Review> getReviewsbyKeyword(int accNo, String keyword);
}

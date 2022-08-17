package kr.co.airbnb.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	
	List<Review> getReviews(@Param("accNo") int accNo, int beginIndex, int endIndex, @Param("keyword") String keyword);
	List<Review> getReceivedReviewByGuest(int no);	// 유저 정보 하단 리뷰 모음
	List<Review> getReceivedReviewByHost(int no);	// 유저 정보 하단 리뷰 모음
	
}

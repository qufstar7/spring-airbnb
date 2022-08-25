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
	List<Review> getGuestReceivedReviews(int no);	// 유저 정보 하단 리뷰 모음 	: 게스트가 받은 리뷰
	List<Review> getGuestWritedReviews(int no);	// 유저 정보 하단 리뷰 모음 : 호스트가 게스트에게 받은 리뷰
	List<Review> getHostWriteReviews(int no);	// 유저 정보 하단 리뷰 모음 : 호스트가 호스트에게 받은 리뷰
	List<Review> getSentHostReviews(int no);
	List<Review> getSentGuestReviews(int no);
	List<Review> getReviewsToWrite(int no);
	Review getReviewByReviewNo(int no);
	void updateReview(Review review);
	void deleteReview(Review review);

	
	
}

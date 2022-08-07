package kr.co.airbnb.mapper;

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
}

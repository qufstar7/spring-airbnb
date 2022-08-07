package kr.co.airbnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.airbnb.mapper.AccommodationMapper;
import kr.co.airbnb.mapper.ReviewMapper;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.GuestRequest;
import kr.co.airbnb.vo.HostRequest;
import kr.co.airbnb.vo.Review;

@Service
@Transactional
public class ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Autowired
	private AccommodationMapper accommodationMapper;
	
	public String getDuplicateReview(int reservationNo, int userNo) {
		Integer result = reviewMapper.getDuplicateReviewByNo(reservationNo, userNo);
		
		if (result != null) {
			return "Y";
		} else {
			return "N";
		}
	};

	public GuestRequest getGuestInfo(int reservationNo) {
		
		GuestRequest guestRequest = reviewMapper.getGuestInfoByReservationNo(reservationNo);
		return guestRequest;
	}
	
	public HostRequest getHostInfo(int reservationNo) {
		HostRequest hostRequest = reviewMapper.getHostInfoByReservationNo(reservationNo);
		return hostRequest;
	}
	
	public void saveGuestReview(Review review) {
		// 리뷰를 업데이트하면 리뷰 등록, 리뷰 갯수 1 추가, 별점 평균 변경이 동시에 이루어져야 한다.
		reviewMapper.insertReviewGuest(review);
		
		Accommodation accommodation = accommodationMapper.getAcc(review.getAccNo());
		accommodation.setReviewCount(accommodation.getReviewCount() + 1);
		accommodationMapper.updateReviewCount(accommodation);
	}
	
	public void saveHostReview(Review review) {
		reviewMapper.insertReviewHost(review);
	}
	
}

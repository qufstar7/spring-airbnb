package kr.co.airbnb.service;

import java.text.DecimalFormat;
import java.util.List;

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
	
	

	public String getCheckoutDate(int reservationNo, int userNo) {
		Integer result = reviewMapper.getOverdueReviewByNo(reservationNo, userNo);
		
		if (result == null) {
			return "Y";
		} else {
			return "N";
		}
	}
	
	public String getDuplicateReview(int reservationNo, int userNo) {
		Integer result = reviewMapper.getDuplicateReviewByNo(reservationNo, userNo);
		// Integer는 null도 담을 수 있어서 사용했다.
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
		return reviewMapper.getHostInfoByReservationNo(reservationNo);
	}
	/*
	public void saveGuestReview(Review review) {
		// 리뷰를 업데이트하면 리뷰 등록, 리뷰 갯수 1 추가, 별점 평균 변경이 동시에 이루어져야 한다.
		// 게스트 리뷰 등록
		reviewMapper.insertReviewGuest(review);
		
		 DecimalFormat form = new DecimalFormat("#.#");
		// string으로 출력됨
		// double a = Double.parseDouble(form.format(totalScore/(accommodation.getReviewCount() + 1)));
		
		// 숙소 별점 평균 변경 (총점, 청결, 정확, 소통, 위치, 체크인, 가치, 편의시설 총 8가지)
		Accommodation accommodation = accommodationMapper.getAcc(review.getAccNo());
		double totalScore = accommodation.getReviewScore() * accommodation.getReviewCount() + review.getTotalScore();
		double avgTotal = Double.parseDouble(form.format(totalScore/(accommodation.getReviewCount() + 1)));
		accommodation.setReviewScore(avgTotal);
		
		double cleanScore = accommodation.getCleanScore() * accommodation.getReviewCount() + review.getCleanScore();
		double avgClean = Double.parseDouble(form.format(cleanScore/(accommodation.getReviewCount() + 1)));
		accommodation.setCleanScore(avgClean);
		
		double accuracyScore = accommodation.getAccuracyScore() * accommodation.getReviewCount() + review.getAccuracyScore();
		double avgAccuracy = Double.parseDouble(form.format(accuracyScore/(accommodation.getReviewCount() + 1)));
		accommodation.setAccuracyScore(avgAccuracy);
		
		double communicationScore = accommodation.getCommunicationScore() * accommodation.getReviewCount() + review.getCommunicationScore();
		double avgCommunication = Double.parseDouble(form.format(communicationScore/(accommodation.getReviewCount() + 1)));
		accommodation.setCommunicationScore(avgCommunication);
		
		double locationScore = accommodation.getLocationScore() * accommodation.getReviewCount() + review.getLocationScore();
		double avgLocation = Double.parseDouble(form.format(locationScore/(accommodation.getReviewCount() + 1)));
		accommodation.setLocationScore(avgLocation);
		
		double checkinScore = accommodation.getCleanScore() * accommodation.getReviewCount() + review.getCleanScore();
		double avgCheckin = Double.parseDouble(form.format(checkinScore/(accommodation.getReviewCount() + 1)));
		accommodation.setCheckinScore(avgCheckin);
		
		double valueScore = accommodation.getCheckinScore() * accommodation.getReviewCount() + review.getCheckinScore();
		double avgValue = Double.parseDouble(form.format(valueScore/(accommodation.getReviewCount() + 1)));
		accommodation.setValueScore(avgValue);
		
		double convenienceScore = accommodation.getConvenienceScore() * accommodation.getReviewCount() + review.getConvenienceScore();
		double avgConvenience = Double.parseDouble(form.format(convenienceScore/(accommodation.getReviewCount() + 1)));
		accommodation.setConvenienceScore(avgConvenience);
		System.out.println("avgConvenience");
		
	//	double convenienceScore = accommodation.getConvenienceScore() * accommodation.getReviewCount() + review.getConvenienceScore();
	//	accommodation.setConvenienceScore(convenienceScore/(accommodation.getReviewCount() + 1));
		
		// 숙소 리뷰 갯수 추가
		accommodation.setReviewCount(accommodation.getReviewCount() + 1);
		accommodationMapper.updateReview(accommodation);
		
	}
	*/
	public void saveHostReview(Review review) {
		reviewMapper.insertReviewHost(review);
	}

	public List<Review> getReviews(int accNo) {
		return reviewMapper.getReviews(accNo);
	}

	
}

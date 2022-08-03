package kr.co.airbnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.airbnb.mapper.ReviewMapper;
import kr.co.airbnb.vo.GuestRequest;
import kr.co.airbnb.vo.HostRequest;
import kr.co.airbnb.vo.Review;

@Service
@Transactional
public class ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	public GuestRequest getGuestInfo(int reservationNo) {
		return null;
	}
	
	public HostRequest getHostInfo(int reservationNo) {
		return null;
	}
	
	public void saveGuestReview(Review review) {
		reviewMapper.insertReviewGuest(review);
	}
	
	public void saveHostReview(Review review) {
		reviewMapper.insertReviewHost(review);
	}
	
	/*
	public void saveGuestReview(User loginUser, GuestReviewForm guestReviewForm) throws IOException {
		
		// 게스트 리뷰 저장하기
		Review review = new Review();
		review.setTotalScore(guestReviewForm.getTotalScore());
		review.setCleanScore(guestReviewForm.getCleanScore());
		review.setAccuracyScore(guestReviewForm.getAccuracyScore());
		review.setCommunicationScore(guestReviewForm.getCommunicationScore());
		review.setLocationScore(guestReviewForm.getLocationScore());
		review.setCheckinScore(guestReviewForm.getCheckinScore());
		review.setValueScore(guestReviewForm.getValueScore());
		review.setConvenienceScore(guestReviewForm.getConvenienceScore());
		review.setContent(guestReviewForm.getContent());
		review.setPositiveFeedback(guestReviewForm.getPositiveFeedback());
		review.setNagativeFeedback(guestReviewForm.getNagativeFeedback());
		review.setWantMeetAgain(guestReviewForm.getWantMeetAgain());
		review.setUser(loginUser);
		reviewMapper.insertReviewGuest(review);
	}
	
	public void saveHostReview(User loginUser, HostReviewForm hostReviewForm) throws IOException {
		
		// 호스트 리뷰 저장하기
		Review review = new Review();
		review.setTotalScore(hostReviewForm.getTotalScore());
		review.setCleanScore(hostReviewForm.getCleanScore());
		review.setCommunicationScore(hostReviewForm.getCommunicationScore());
		review.setWantMeetAgain(hostReviewForm.getWantMeetAgain());
		review.setObservanceScore(hostReviewForm.getObservanceScore());
		review.setContent(hostReviewForm.getContent());
		review.setUser(loginUser);
		reviewMapper.insertReviewHost(review);
	}
	 */


}

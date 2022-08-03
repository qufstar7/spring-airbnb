package kr.co.airbnb.controller.rest;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.airbnb.form.GuestReviewForm;
import kr.co.airbnb.form.HostReviewForm;
import kr.co.airbnb.reponse.ResponseData;
import kr.co.airbnb.reponse.SingleResponseData;
import kr.co.airbnb.service.ReviewService;
import kr.co.airbnb.vo.GuestRequest;
import kr.co.airbnb.vo.HostRequest;
import kr.co.airbnb.vo.Review;

@RestController
@CrossOrigin("*")
public class ReviewRestController {
	
	@Autowired
	ReviewService reviewService;
	/*
	@GetMapping(path = "/review/{reservationNo}")
	public SingleResponseData<GuestRequest> guestRequest(@PathVariable("reservationNo") int reservationNo) {
		GuestRequest guestRequest = reviewService.getGuestInfo(reservationNo);
		
		return SingleResponseData.create(guestRequest);
	}
	
	@GetMapping(path = "/review/{reservationNo}")
	public SingleResponseData<HostRequest> hestRequest(@PathVariable("reservationNo") int reservationNo) {
		HostRequest hostRequest = reviewService.getHostInfo(reservationNo);
		
		return SingleResponseData.create(hostRequest);
	}
	*/
	@PostMapping(path = "/review/saveGuest")
	public ResponseData saveReview(@RequestBody GuestReviewForm guestReviewForm) {
		Review review = Review.createGuestReview(guestReviewForm);
		reviewService.saveGuestReview(review);
		
		return ResponseData.create(true, "리뷰가 등록되었습니다.");
	}
		
		@PostMapping(path = "/review/saveHost")
		public ResponseData saveReview(@RequestBody HostReviewForm hostReviewForm) {
			Review review = Review.createHostReview(hostReviewForm);
			reviewService.saveHostReview(review);
			
		return ResponseData.create(true, "리뷰가 등록되었습니다.");
	}

}

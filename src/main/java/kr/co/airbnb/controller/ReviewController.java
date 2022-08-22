package kr.co.airbnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.form.GuestReviewForm;
import kr.co.airbnb.service.ReviewService;
import kr.co.airbnb.vo.User;

@Controller
// @RequestMapping("/reviews")
// @SessionAttributes("guestReviewForm")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
 
	@GetMapping(path = "/guestreview")
	public String review() {
		return "review/guestreview";
	}
	
	@GetMapping(path = "/alist")
	public String accReviewList() {
		return "review/accreviewlist";
	}
	
	@GetMapping(path = "/hostreview")
	public String hostReview() {
		return "review/hostreview";
	}
	
	@GetMapping(path = "/comp")
	public String complete() {
		return "review/complete";
	}
	
	@GetMapping(path = "/test/reviewm")
	public String modifyreview() {
		return "review/reviewpage1";
	}

}

package kr.co.airbnb.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
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
@CrossOrigin("*")
//@RequestMapping("/reviews")
//@SessionAttributes("guestReviewForm")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;

	@GetMapping(path = "/review")
	public String review() {
		return "review/userreview";
	}
	
	@GetMapping(path = "hostreview")
	public String review2() {
		return "review/hostreview";
	}
	
	@GetMapping(path = "/comp")
	public String comp() {
		return "review/reviewcomplete";
	}
	
	@PostMapping(path = "/insert")
	public String insertguestreview(@LoginUser User loginUser, @ModelAttribute("guestReviewForm") GuestReviewForm guestReviewForm, SessionStatus sessionStatus) throws IOException {
		reviewService.addGuestReview(loginUser, guestReviewForm);
		sessionStatus.setComplete();
		
		return "redirect:/review/complete";
	}
	
	//@PostMapping(path = "/reviews")
	//public 
	
	

}

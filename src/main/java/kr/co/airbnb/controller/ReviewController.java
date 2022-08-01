package kr.co.airbnb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@CrossOrigin("*")
public class ReviewController {

	@GetMapping(path = "/review")
	public String review() {
		return "review/userreview";
	}
	
	@GetMapping(path = "/form3")
	public String review2() {
		return "review/form3";
	}
	@GetMapping(path = "/comp")
	public String comp() {
		return "review/reviewcomplete";
	}

}

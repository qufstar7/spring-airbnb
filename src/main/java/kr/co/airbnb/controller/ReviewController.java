package kr.co.airbnb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@CrossOrigin("*")
public class ReviewController {

	@GetMapping(path = "/review")
	public String review() {
		return "review/form1";
	}
	
	@PostMapping(path = "/form2")
	public String review2() {
		return "review/form2";
	}
	
	@PostMapping(path = "/form3")
	public String review3() {
		return "review/form3";
	}
	
	@GetMapping(path = "/comp")
	public String comp() {
		return "review/reviewcomplete";
	}


}

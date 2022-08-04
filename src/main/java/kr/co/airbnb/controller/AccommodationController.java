package kr.co.airbnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.airbnb.service.AccommodationService;

@Controller
public class AccommodationController {

	@Autowired
	AccommodationService accommodationService;
	
	@GetMapping(path = "/detail")
	public String detail(@RequestParam("no") int no,Model model) {
		model.addAttribute("acc",accommodationService.getAccommodation(no));
		
		
		return "acc/detail";
	}
	
	@GetMapping(path = "/test")
	public String test() {
		
		return "acc/test";
	}
}
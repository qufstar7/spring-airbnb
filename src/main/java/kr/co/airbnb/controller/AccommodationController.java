package kr.co.airbnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.ConvenienceService;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Boast;
import kr.co.airbnb.vo.User;

@Controller
public class AccommodationController {

	@Autowired
	AccommodationService accommodationService;
	
	@Autowired
	ConvenienceService ConvenienceService;
	
	@GetMapping(path = "/detail")
	public String detail(@LoginUser User loginUser ,@RequestParam("no") int no,Model model) {
		
		model.addAttribute("acc", accommodationService.getAccommodation(no));
		model.addAttribute("cons", ConvenienceService.getMainConveniences());
		model.addAttribute("Boast", accommodationService.getBoast(no));
		
		return "acc/detail";
	}
	
	@GetMapping(path = "/test")
	public String test() {
		
		return "acc/test";
	}
}

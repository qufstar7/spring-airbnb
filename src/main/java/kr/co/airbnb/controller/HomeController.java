package kr.co.airbnb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping(path = "/")
	public String home() {
		return "home";
	}
	// 정수민 // 김유나 유나
	
	@GetMapping(path = "/detail")
	public String detail() {
		
		return "acc/detail";
	}
}

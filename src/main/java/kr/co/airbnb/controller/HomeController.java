package kr.co.airbnb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class HomeController {

	
	
	@GetMapping(path = "/")
	public String home() {
		return "home";
	}
	// 정수민 // 김유나 유나
	
	@GetMapping(path = "/detail")
	public String detail(@RequestParam("no") int no,Model model) {
		
		return "acc/detail";
	}
	@GetMapping(path = "/test")
	public String test() {
		
		return "acc/test";
	}
	
	@GetMapping(path = "/list")
	public String list() {
		
		return "acc/list";
	}
}

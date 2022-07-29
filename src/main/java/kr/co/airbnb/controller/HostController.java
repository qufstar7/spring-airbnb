package kr.co.airbnb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/host")
public class HostController {

	// 호스팅 시작페이지(호스트 되기)
	@GetMapping
	public String home() {
		return "host/home";
	}
	
	@GetMapping(path = "/become-a-host")
	public String becomeHost() {
		return "host/become-a-host";
	}
}

package kr.co.airbnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.airbnb.service.HostService;

@Controller
@RequestMapping("/host")
public class HostController {

	@Autowired
	private HostService hostService;

	// 호스팅 시작페이지(호스트 되기)
	@GetMapping
	public String home() {
		return "host/home";
	}

	// 호스트숙소 메인타입 등록
	@GetMapping(path = "/become-a-host")
	public String becomeHost(Model model) {
		model.addAttribute("accMainTypes", hostService.getAllAccMainTypes());

		return "host/become-a-host";
	}

	// 호스트숙소 서브타입 등록
	@GetMapping(path = "/become-a-host2")
	public String becomeHost2(Model model) {
		model.addAttribute("accSubTypes", hostService.getAllAccSubTypes());

		return "host/become-a-host2";
	}

}

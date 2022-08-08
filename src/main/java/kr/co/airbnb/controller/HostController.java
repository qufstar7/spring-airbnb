package kr.co.airbnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.airbnb.service.HostService;
import kr.co.airbnb.vo.AccType;

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

	// 호스트숙소 등록 페이지
	// 타입1등록
	@GetMapping("/become-a-host")
	public String type1(Model model) {
		List<AccType> accMainTypes = hostService.getAllMainTypes();
		model.addAttribute("accMainTypes", accMainTypes);

		return "host/become-a-host";
	}

	// 타입검색
	@GetMapping("/search")
	@ResponseBody
	public List<AccType> type2(int mainType) {
		return hostService.getAllSubTypes(mainType);
	}
		
	// 타입2 등록
//	@GetMapping(path = "/become-a-host2")
//	public String type2(@RequestParam("type") int mainType, Model model) {
//		model.addAttribute("accSubTypes", hostService.getAllAccSubTypes(mainType));
//		
//		return "host/become-a-host2";
//	}

}

package kr.co.airbnb.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.HostService;
import kr.co.airbnb.vo.Type;
import kr.co.airbnb.vo.User;
import kr.co.airbnb.vo.Accommodation;

@Controller
@RequestMapping("/host")
public class HostController {

	@Autowired
	private HostService hostService;

	@Autowired
	private AccommodationService accService;
	
	// 호스팅 시작페이지(호스트 되기)
	@GetMapping
	public String home() {
		return "host/home";
	}

	// 호스트숙소 등록 페이지
	// 호스팅 등록 페이지, 타입1 검색
	@GetMapping("/become-a-host")
	public String becomeAHost(@LoginUser User loginUser, Model model) {
		
		// 로그인유저가 없으면 홈으로
		if (loginUser == null) {
			return "host/home";
		} 
		// 숙소 생성 (번호만 가지고 있음)
		accService.insertAcc(loginUser);
		
		// 타입1(메인타입) 검색
		List<Type> accMainTypes = hostService.getAllMainTypes();
		model.addAttribute("accMainTypes", accMainTypes);

		return "host/become-a-host";
	}

	// 타입2(서브타입) 검색
	@GetMapping("/searchType1")
	@ResponseBody
	public List<Type> type2(int mainType) {
		return hostService.getAllSubTypes(mainType);
	}
	
	// 타입3(프라이버시타입) 검색
	@GetMapping("/searchType2")
	@ResponseBody
	public List<Type> type3() {
		return hostService.getAllPrivacyTypes();
	}
	
	// 주소 등록
	@GetMapping(path = "/location")
	public String location(Model model) {
		//model.addAttribute("address", hostService.);
		
		return "host/location";
	}
	
//	@GetMapping(path = "/become-a-host2")
//	public String type2(@RequestParam("type") int mainType, Model model) {
//		model.addAttribute("accSubTypes", hostService.getAllAccSubTypes(mainType));
//		
//		return "host/become-a-host2";
//	}

}

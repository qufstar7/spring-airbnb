package kr.co.airbnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.HostService;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Type;
import kr.co.airbnb.vo.User;

@Controller
@RequestMapping("/host")
public class HostController {

	@Autowired
	private HostService hostService;

	@Autowired
	private AccommodationService accService;

	// 호스팅 홈페이지
	@GetMapping
	public String home() {
		return "host/home";
	}

	// 호스트 숙소 시작 페이지 (기존등록, 신규등록)
	@GetMapping("/become-a-host")
	public String becomeAHost(@LoginUser User loginUser, Model model) {
		// 로그인유저가 없으면 홈으로
		if (loginUser == null) {
			return "/host/home";
		}
		// 사용자의 숙소 전체 검색
		List<Accommodation> allAcc = hostService.getAllAccByUser(loginUser);
		model.addAttribute("userAllAcc", allAcc);

		return "host/become-a-host";
	}
	
	// 숙소 등록하기 (숙소 생성 및 저장)
	@GetMapping("/become-a-host/register")
	public String register(@LoginUser User loginUser, Model model) {
		// 사용자 계정 정보를 호스트로 바꿈.
		
		// 숙소 생성 (번호만 가지고 있음)
		// 숙소 상태 '등록미완'으로
		accService.insertAcc(loginUser);
		
		return "redirect:/become-a-host/types";
	}
	
	// 기존 숙소 복사하기

	// 타입1(메인타입) 선택 페이지
	@GetMapping("become-a-host/types")
	public String type1(@LoginUser User loginUser, Model model) {
		// 로그인유저가 없으면 홈으로
		if (loginUser == null) {
			return "host/home";
		}

		// 타입1(메인타입) 검색
		List<Type> accMainTypes = hostService.getAllMainTypes();
		model.addAttribute("accMainTypes", accMainTypes);

		return "/become-a-host";
	}

	// 타입2(서브타입) 선택 페이지
	@GetMapping("/searchType1")
	@ResponseBody
	public List<Type> type2(int mainType) {
		hostService.saveType1(mainType);
		return hostService.getAllSubTypes(mainType);
	}

	// 타입3(프라이버시타입) 선택 페이지
	@GetMapping("/searchType2")
	@ResponseBody
	public List<Type> type3() {
		return hostService.getAllPrivacyTypes();
	}

	// 주소 등록 페이지
	@GetMapping(path = "/location")
	public String location(Model model) {
		// model.addAttribute("address", hostService.);

		return "/location";
	}

//	@GetMapping(path = "/become-a-host2")
//	public String type2(@RequestParam("type") int mainType, Model model) {
//		model.addAttribute("accSubTypes", hostService.getAllAccSubTypes(mainType));
//		
//		return "host/become-a-host2";
//	}

}

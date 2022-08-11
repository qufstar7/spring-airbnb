package kr.co.airbnb.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.form.AccRegisterForm;
import kr.co.airbnb.service.HostService;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.User;

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
	// 호스팅 등록 페이지, 타입1 검색
	@GetMapping("/become-a-host")
	public String type1(Model model) {
		List<AccType> accMainTypes = hostService.getAllMainTypes();
		model.addAttribute("accMainTypes", accMainTypes);

		return "host/become-a-host";
	}

	// 타입2 검색
	@GetMapping("/search")
	@ResponseBody
	public List<AccType> type2(int mainType) {
		Accommodation acc = new Accommodation();
		return hostService.getAllSubTypes(mainType);
	}
	
	// 타입3 검색
	@GetMapping("/search2")
	@ResponseBody
	public List<AccType> type3() {
		return hostService.getAllPrivacyTypes();
	}
	
	// 타입1,2,3 전달받아 저장
	@PostMapping("/insert")
		public String typeForm(@LoginUser User loginUser, @ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm, SessionStatus sessionStatus) throws IOException {
		hostService.addNewAcc(loginUser, accRegisterForm);		
		// 세션에서 accRegisterForm 객체 clear
		sessionStatus.setComplete();
		
		return "/location";
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

package kr.co.airbnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.utils.SessionUtils;
import kr.co.airbnb.vo.AccRoom;
import kr.co.airbnb.vo.Accommodation;


@Controller
public class HomeController {

	@Autowired
	AccommodationService accommodationService;
	
	@GetMapping(path = "/")
	public String home(Accommodation acc, Model model) {
		model.addAttribute("acc", accommodationService.getAllAcc());
		
		/* room_bed 개수 구하기 위해
		 * List<AccRoom> rooms = accommodationService.getRoomByAccNo(acc.getAccNo());
		 * model.addAttribute("room", rooms);
		 */
		
		return "home";
	}
	
	@GetMapping(path="filter")
	public String filterTest() {
		return "filter-test";
	}
	// 정수민 // 김유나 유나
	
	
	@GetMapping(path="/logout")
	public String logout() { 
		SessionUtils.sessionInvlidate();
		return "redirect:/";
	}
}

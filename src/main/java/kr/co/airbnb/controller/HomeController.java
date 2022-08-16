package kr.co.airbnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.airbnb.criteria.AccCriteria;
import kr.co.airbnb.criteria.SearchCriteria;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.utils.SessionUtils;

import kr.co.airbnb.vo.AccRoom;

import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Type;



@Controller
public class HomeController {

	@Autowired
	AccommodationService accommodationService;
	
	/* merge 전 
  	public String home(Accommodation acc, Model model) {
		model.addAttribute("acc", accommodationService.getAllAcc()); */


	@GetMapping(path = "/")
	public String home(Model model, AccCriteria accCriteria) {
		// 크리테리아로 모든 숙소 조회
		List<Accommodation> allAcc = accommodationService.searchAllAcc(accCriteria);
		
		// 각 숙소의 타입1,2,3 조회
		for (Accommodation acc : allAcc) {
			int accNo = acc.getAccNo();
			List<Type> types = accommodationService.searchTypesByAccNo(accNo);
			acc.setTypes(types);
			if (!types.isEmpty()) {
				model.addAttribute("mainType", acc.getTypes().get(0));
			}
		}
		// 모델 객체에 숙소 데이터 저장
		model.addAttribute("acc", allAcc);
		
//		model.addAttribute("acc", accommodationService.getAllAcc());

		
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

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

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.criteria.AccCriteria;
import kr.co.airbnb.criteria.SearchCriteria;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.WishlistService;
import kr.co.airbnb.utils.SessionUtils;

import kr.co.airbnb.vo.AccRoom;

import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Tag;
import kr.co.airbnb.vo.Type;
import kr.co.airbnb.vo.User;
import kr.co.airbnb.vo.Wishlist;



@Controller
public class HomeController {

	@Autowired
	AccommodationService accommodationService;
	@Autowired
	private WishlistService wishlistService;
	
	
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
		
		// 모든 태그 조회
		List<Tag> tags = accommodationService.getAllTags();
		
		// 위시리스트 버튼
		// List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
		
		// 모델 객체에 숙소 데이터 저장
		model.addAttribute("acc", allAcc);
		// 모델 객체에 모든 태그 데이터 저장
		model.addAttribute("tag", tags);
		
		// 모델 객체에 위시리스트 데이터 저장
		// model.addAttribute("wishlistBtn", wishlists);
		
		return "home";
	}
	
	@GetMapping(path="filter")
	public String filterTest() {
		return "filter-test";
	}
	
	@GetMapping(path="/logout")
	public String logout() { 
		SessionUtils.sessionInvlidate();
		return "redirect:/";
	}
}

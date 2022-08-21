package kr.co.airbnb.controller;

import java.util.ArrayList;
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
import kr.co.airbnb.vo.AccTag;
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
	
	// localhost
	// localhost/?id=101
	@GetMapping(path = "/")
	public String home(@RequestParam(name = "id", required = false) String id, Model model) {
		
		List<Accommodation> accommodations = new ArrayList<Accommodation>();
		if (id == null) {
			// 메인 페이지에 출력할 인기 숙소
			accommodations = accommodationService.getPopularAccommodations();
		} else {
			// 태그로 검색한 숙소
			accommodations = accommodationService.searchAccByTag(id); 
		}
		model.addAttribute("accommodations", accommodations);
		
		// 각 숙소의 타입1,2,3 조회
		for (Accommodation acc : accommodations) {
			int accNo = acc.getAccNo();
			
			List<Type> types = accommodationService.searchTypesByAccNo(accNo);
			acc.setTypes(types);
			//if (!types.isEmpty()) {
			//	model.addAttribute("mainType", acc.getTypes().get(0));
			//}
			
			//List<AccRoom> rooms = accommodationService.searchRoomByAccNo(accNo);
			//acc.setAccRooms(rooms);
		}

		// home에만 나오는 nav의 모든 태그 조회
		List<Tag> tags = accommodationService.getAllTags();
		model.addAttribute("tags", tags);
	
		// 위시리스트 버튼
		// List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
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

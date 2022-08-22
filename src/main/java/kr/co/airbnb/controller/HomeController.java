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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.criteria.AccCriteria;
import kr.co.airbnb.criteria.FilterCriteria;
import kr.co.airbnb.criteria.SearchCriteria;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.WishlistService;
import kr.co.airbnb.utils.SessionUtils;
import kr.co.airbnb.vo.AccPrice;
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
		
		// 각 숙소의 타입1,2,3 조회 + 침대 개수 조회
		for (Accommodation acc : accommodations) {
			int accNo = acc.getAccNo();
			
			List<Type> types = accommodationService.searchTypesByAccNo(accNo);
			acc.setTypes(types);
			//if (!types.isEmpty()) {
			//	model.addAttribute("mainType", acc.getTypes().get(0));
			//}
			
			AccRoom rooms = accommodationService.getRoomByAccNo(accNo);
			acc.setRoom(rooms);
		}

		// home에만 나오는 nav의 모든 태그 조회
		List<Tag> tags = accommodationService.getAllTags();
		model.addAttribute("tags", tags);
	
		// 위시리스트 버튼
		// List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
		// model.addAttribute("wishlistBtn", wishlists);
		
		
		/* 필터부분 */
		// 1박 평균 요금, 최저 요금, 최고요금
		AccPrice price = accommodationService.getPrice();
		model.addAttribute("price", price);
		// List<Integer> priceList = accommodationService.priceCount();
		// priceList -> [5, 6, 2, 10, 11, 3, 6]
		/* 샘플 sql문 + 캡처 참고
			select count(*) cnt
			from (select trunc(acc_price/30000) acc_price
      		  	  from airbnb_accommodations)
			group by acc_price
			order by acc_price; 
		 */
		model.addAttribute("priceList", List.of(1, 1, 3, 6, 9, 15, 14, 12, 4, 3, 1, 0, 1));
		
		return "home";
	}
	
	@GetMapping(path="/search")
	@ResponseBody
	public List<Accommodation> search(@RequestParam(name = "id", required = false) String id, FilterCriteria filterCriteria) {
		List<Accommodation> accommodations = new ArrayList<Accommodation>();
		
		if (id == null) {
			// 필터 검색한 숙소
			accommodations = accommodationService.searchAccByFilter(filterCriteria);
		} else {
			// 태그로 검색한 숙소
			accommodations = accommodationService.searchAccByTag(id); 
		}
		
		// 각 숙소의 타입1,2,3 조회 + 침대 개수 조회
		for (Accommodation acc : accommodations) {
			int accNo = acc.getAccNo();
			
			List<Type> types = accommodationService.searchTypesByAccNo(accNo);
			acc.setTypes(types);
			//if (!types.isEmpty()) {
			//	model.addAttribute("mainType", acc.getTypes().get(0));
			//}
			
			AccRoom rooms = accommodationService.getRoomByAccNo(accNo);
			acc.setRoom(rooms);
		}

		
		return accommodations;
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
	
	//  에러나면 홈화면으로, 나중에 수정필요 -유나-
	@GetMapping(path="/login")
	public String needLogin() {
		
		return "redirect:/";
	}
	
}

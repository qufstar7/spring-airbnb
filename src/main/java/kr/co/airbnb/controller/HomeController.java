package kr.co.airbnb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import kr.co.airbnb.vo.AccPhoto;
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
	public String home(@LoginUser(required = false) User loginUser,  @RequestParam(name = "id", required = false) String id, Model model) {
		
		if(loginUser != null) {
			List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
			model.addAttribute("wishlists", wishlists);
		}
		
		
		List<Accommodation> accommodations = new ArrayList<Accommodation>();
		if (id == null) {
			// 메인 페이지에 출력할 인기 숙소
			accommodations = accommodationService.getPopularAccommodations();
			
			// 위시리스트 등록 숙소 여부를 포함한 모든 숙소들
			if(loginUser != null) {
				accommodations = wishlistService.getAllAccs(loginUser.getNo());
			}
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
			
			List<AccPhoto> photos = accommodationService.getAccPhotosByAccNo(accNo);
			acc.setPhotos(photos);
		}

		// home에만 나오는 nav의 모든 태그 조회
		List<Tag> tags = accommodationService.getAllTags();
		model.addAttribute("tags", tags);
	
		/* 필터부분 */
		// 1박 평균 요금, 최저 요금, 최고요금
		AccPrice price = accommodationService.getPrice();
		model.addAttribute("price", price);
		
		// 차트 막대기 표현할 숫자 전체 조회
		model.addAttribute("counts", accommodationService.priceCount());
		
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
	
	@GetMapping(path="/logout")
	public String logout() { 
		SessionUtils.sessionInvlidate();
		return "redirect:/";
	}
	
	// 홈화면에서 사용자번호, 숙소 번호만으로 위시리스트 숙소 삭제할 경우
	@GetMapping(path="/delete/wishlistAcc")
	@ResponseBody
	public Map<String, Object> deleteWishlistAcc(@LoginUser User loginUser, @RequestParam("accNo") int accNo) {
		Map<String, Object> result = new HashMap<>();

		wishlistService.deleteWishlistAccByUserNoAndAccNo(loginUser.getNo(), accNo);
		result.put("success", true);
		return result;
	}
	
	// 홈화면에서 기존 위시리스트 폴더에 저장하거나 폴더를 변경하는 경우
	@GetMapping("/change/wishlistAcc") 
	@ResponseBody
	public Map<String, Object> changeWishlist(@RequestParam("wishlistNo") int wishlistNo, @RequestParam("accNo") int accNo) {
		Map<String, Object> result = new HashMap<>();
		//System.out.println("변경할 wishlistNo: " + wishlistNo);
		//System.out.println("accNo: " + accNo);
		wishlistService.saveAcc(wishlistNo, accNo);
		
		result.put("success", true);
		return result;
	}
	
	
}

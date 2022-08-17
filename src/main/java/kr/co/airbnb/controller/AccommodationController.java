package kr.co.airbnb.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.criteria.AccCriteria;
import kr.co.airbnb.criteria.SearchCriteria;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.ConvenienceService;
import kr.co.airbnb.service.WishlistService;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Type;
import kr.co.airbnb.vo.User;
import kr.co.airbnb.vo.Wishlist;

@Controller
@RequestMapping("/acc")
public class AccommodationController {

	@Autowired
	AccommodationService accommodationService;
	
	@Autowired
	ConvenienceService ConvenienceService;
	
	@Autowired
	WishlistService wishlistService;
	
	@GetMapping(path = "/detail")
	public String detail(@LoginUser User loginUser ,@RequestParam("no") int no,Model model) {
		Accommodation acc = accommodationService.getAccommodation(no);
		if (loginUser != null) {
			
			List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
			/*
			 * Wishlist wishlist = wishlists.get(0);
			 * System.out.println(wishlist.getAcc().getAccNo());
			 */
			model.addAttribute("wishlists", wishlists);
			model.addAttribute("wishlistAccNo",wishlistService.getAccNoByUserNo(loginUser.getNo()));
		}
		model.addAttribute("acc", accommodationService.getAccommodation(no));
		model.addAttribute("cons", ConvenienceService.getMainConveniences());
		model.addAttribute("Boast", accommodationService.getBoast(no));
		
		return "acc/detail";
	}
	
	@PostMapping(path="/insert") // 새로운 위시리스트 폴더 생성 후 해당 숙소 저장하기
	@ResponseBody
	public Map<String, Object> insertNewWishlist(@RequestParam("wishlistName") String wishlistName, @RequestParam("accNo") int accNo, @LoginUser User loginUser) {
		
		
		wishlistService.createWishlistAndSaveAcc(new Wishlist(wishlistName, loginUser), accNo);
		
		// refresh wishlists
		List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
		Map<String, Object> result = new HashMap<>();
		result.put("wishlists", wishlists);
		
		return result;
	}
	
	@GetMapping(path = "/save")
	public String insert(@LoginUser User loginUser, @RequestParam("accNo") int accNo,@RequestParam("wishlistNo") int wishlistNo) {
		wishlistService.saveAcc(wishlistNo, accNo);
		
		return "redirect:/acc/detail?no="+accNo;
	}
	
	@GetMapping(path="/delete")
	public String deleteWishlistAcc(@RequestParam("accNo") int accNo, @RequestParam("wishlistNo") int wishlistNo) {		// 나중에 @LoginUser 추가하기
		wishlistService.deleteWishlistAcc(wishlistNo, accNo);
		
		return "redirect:/acc/detail?no="+accNo;
	}
	
	/*
	 * @PostMapping(path="/wishlist")
	 * 
	 * @ResponseBody public Map<String, Object> wishlist(@RequestParam("accNo") int
	 * accNo, @LoginUser User loginUser) { List<Wishlist> wishlists =
	 * wishlistService.getMyWishlists(loginUser.getNo());
	 * 
	 * Map<String, Object> result = new HashMap<>(); result.put("wishlists",
	 * wishlists); return result; }
	 */
	
	@GetMapping(path = "/test")
	public String test() {
		
		return "acc/test";
	}

	@GetMapping(path = "/list")
	@ResponseBody
	public List<Accommodation> list(SearchCriteria searchCriteria, Model model) {
		// nav검색으로 숙소 조회
		return accommodationService.searchAccByKeyword(searchCriteria);
		
	}
	
}

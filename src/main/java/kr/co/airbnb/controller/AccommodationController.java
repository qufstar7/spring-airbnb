package kr.co.airbnb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.ConvenienceService;
import kr.co.airbnb.service.WishlistService;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.User;
import kr.co.airbnb.vo.Wishlist;

@Controller
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
		List<String> disabled = acc.getDisabledDate();
		System.out.println(disabled);
		
		model.addAttribute("acc", accommodationService.getAccommodation(no));
		model.addAttribute("cons", ConvenienceService.getMainConveniences());
		model.addAttribute("Boast", accommodationService.getBoast(no));
		
		return "acc/detail";
	}
	
	@PostMapping(path="/insert") // 새로운 위시리스트 폴더 생성 후 해당 숙소 저장하기
	@ResponseBody
	public String insertNewWishlist(@RequestParam("wishlistName") String wishlistName, @RequestParam("accNo") int accNo, @LoginUser User loginUser) {
		
		System.out.println("새로운 wishlistName: " + wishlistName);
		System.out.println("accNo: " + accNo);
		
		wishlistService.createWishlistAndSaveAcc(new Wishlist(wishlistName, loginUser), accNo);
		
		// refresh wishlists
		/*
		 * List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
		 * Map<String, Object> result = new HashMap<>(); result.put("wishlists",
		 * wishlists);
		 */
		
		return "redirect:/detail";
	}
	
	@GetMapping(path = "/test")
	public String test() {
		
		return "acc/test";
	}

	@GetMapping(path = "/list")
	public String list(Model model) {
		model.addAttribute("acc", accommodationService.getAllAcc());
		
		return "acc/list";
	}
}

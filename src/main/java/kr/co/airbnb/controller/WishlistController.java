package kr.co.airbnb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.WishlistService;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.User;
import kr.co.airbnb.vo.Wishlist;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/wishlists")
public class WishlistController {

	@Autowired
	private WishlistService wishlistService;
	@Autowired
	private AccommodationService accommodationService;
	
	@GetMapping
	public String wishlist(@LoginUser User loginUser, Model model) { 
		List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
		model.addAttribute("wishlists", wishlists);
		return "wishlist/wishlist";
	}
	
	@GetMapping(path="/detail")
	public String detail(@LoginUser User loginUser, @RequestParam(name="no") int wishlistNo, Model model) {	// @LoginUser추가
		
		Wishlist wishlist = wishlistService.getWishlistByNo(wishlistNo);
		model.addAttribute("wishlist", wishlist);
		
		// 다시 추가하는 모달창에 출력할 모든 위시리스트 폴더
		List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
		model.addAttribute("wishlists", wishlists);
		
		return "wishlist/detail";
	}
	
	@GetMapping(path="/delete/acc")
	@ResponseBody
	public Map<String, Object> deleteWishlistAcc(@RequestParam("accNo") int accNo, @RequestParam("wishlistNo") int wishlistNo) {		// 나중에 @LoginUser 추가하기
		wishlistService.deleteWishlistAcc(wishlistNo, accNo);
		return null;
	}
	
	@PostMapping(path="/insert") // 새로운 위시리스트 폴더 생성 후 해당 숙소 저장하기
	@ResponseBody
	public Map<String, Object> insertNewWishlist(@RequestParam("wishlistName") String wishlistName, @RequestParam("accNo") int accNo, @LoginUser User loginUser) {
		
		System.out.println("새로운 wishlistName: " + wishlistName);
		System.out.println("accNo: " + accNo);
		
		wishlistService.createWishlistAndSaveAcc(new Wishlist(wishlistName, loginUser), accNo);
		
		// refresh wishlists
		List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
		Map<String, Object> result = new HashMap<>();
		result.put("wishlists", wishlists);
		
		return result;
	}
	
	/**
	 * 해당 숙소가 저장된 위시리스트 폴더변경하기
	 * @param wishlistNo 변경할 위시리스트 폴더 번호 
	 * @param accNo 
	 * @return
	 */
	@GetMapping("/change") // ajax는 redirect 안됨! 데이터만 내려보내주는 것
	@ResponseBody
	public Map<String, Object> changeWishlist(@RequestParam("wishlistNo") int wishlistNo, @RequestParam("accNo") int accNo) {
		System.out.println("변경할 wishlistNo: " + wishlistNo);
		System.out.println("accNo: " + accNo);
		wishlistService.saveAcc(wishlistNo, accNo);
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

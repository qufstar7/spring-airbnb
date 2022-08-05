package kr.co.airbnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.service.WishlistService;
import kr.co.airbnb.vo.User;
import kr.co.airbnb.vo.Wishlist;

@Controller
@RequestMapping("/wishlists")
public class WishlistController {

	@Autowired
	private WishlistService wishlistService;
	
	@GetMapping
	public String wishlist(@LoginUser User loginUser, Model model) { 
		List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
		model.addAttribute("wishlists", wishlists);
		return "wishlist/wishlist";
	}
}

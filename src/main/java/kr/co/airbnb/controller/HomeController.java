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
import kr.co.airbnb.criteria.AccListCriteria;
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
	public String home(@LoginUser(required = false) User loginUser,  AccListCriteria accListCriterias, Model model) {
		
		if(loginUser != null) {
			List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
			model.addAttribute("wishlists", wishlists);
		}
		
		List<Accommodation> accommodations = new ArrayList<Accommodation>();
		accListCriterias.setUser(loginUser);
		accommodations = accommodationService.searchAccByCriteria(accListCriterias);
//		if (accListCriterias.getId() == null) {
//			// ?????? ???????????? ????????? ?????? ??????
//			accommodations = accommodationService.getPopularAccommodations();
//			
//			// ??????????????? ?????? ?????? ????????? ????????? ?????? ?????????
//			if(loginUser != null) {
//				accommodations = accommodationService.getAllAccs(loginUser.getNo());
//			}
//		} else {
//			// ????????? ????????? ??????
//			accommodations = accommodationService.searchAccByCriteria(accListCriterias);
//		}
		model.addAttribute("accommodations", accommodations);
		
		// ??? ????????? ??????1,2,3 ?????? + ?????? ?????? ??????
		for (Accommodation acc : accommodations) {
			int accNo = acc.getAccNo();
			
			List<Type> types = accommodationService.searchTypesByAccNo(accNo);
			acc.setTypes(types);
			//if (!types.isEmpty()) {
			//	model.addAttribute("mainType", acc.getTypes().get(0));
			//}
			
			//AccRoom rooms = accommodationService.getRoomByAccNo(accNo);
			//acc.setRoom(rooms);
			
			List<AccPhoto> photos = accommodationService.getAccPhotosByAccNo(accNo);
			acc.setPhotos(photos);
		}

		// home?????? ????????? nav??? ?????? ?????? ??????
		List<Tag> tags = accommodationService.getAllTags();
		model.addAttribute("tags", tags);
	
		/* ???????????? */
		// 1??? ?????? ??????, ?????? ??????, ????????????
		AccPrice price = accommodationService.getPrice();
		model.addAttribute("price", price);
		
		// ?????? ????????? ????????? ?????? ?????? ??????
		model.addAttribute("counts", accommodationService.priceCount());
		
		return "home";
	}
	
	@GetMapping(path="/search")
	@ResponseBody
	public List<Accommodation> search(@LoginUser(required = false) User user, AccListCriteria accListCriterias) {
		List<Accommodation> accommodations = new ArrayList<Accommodation>();
		
		
		accListCriterias.setUser(user);
		accommodations = accommodationService.searchAccByCriteria(accListCriterias);
		
		// ??? ????????? ??????1,2,3 ?????? + ?????? ?????? ??????
		for (Accommodation acc : accommodations) {
			int accNo = acc.getAccNo();
			
			List<Type> types = accommodationService.searchTypesByAccNo(accNo);
			acc.setTypes(types);

			List<AccPhoto> photos = accommodationService.getAccPhotosByAccNo(accNo);
			acc.setPhotos(photos);
		}

		
		return accommodations;
	} 
	
	@GetMapping(path="/logout")
	public String logout() { 
		SessionUtils.sessionInvlidate();
		return "redirect:/";
	}
	
	// ??????????????? ???????????????, ?????? ??????????????? ??????????????? ?????? ????????? ??????
	@GetMapping(path="/delete/wishlistAcc")
	@ResponseBody
	public Map<String, Object> deleteWishlistAcc(@LoginUser User loginUser, @RequestParam("accNo") int accNo) {
		Map<String, Object> result = new HashMap<>();

		wishlistService.deleteWishlistAccByUserNoAndAccNo(loginUser.getNo(), accNo);
		result.put("success", true);
		return result;
	}
	
	// ??????????????? ?????? ??????????????? ????????? ??????????????? ????????? ???????????? ??????
	@GetMapping("/change/wishlistAcc") 
	@ResponseBody
	public Map<String, Object> changeWishlist(@RequestParam("wishlistNo") int wishlistNo, @RequestParam("accNo") int accNo) {
		Map<String, Object> result = new HashMap<>();
		//System.out.println("????????? wishlistNo: " + wishlistNo);
		//System.out.println("accNo: " + accNo);
		wishlistService.saveAcc(wishlistNo, accNo);
		
		result.put("success", true);
		return result;
	}
	
	
}

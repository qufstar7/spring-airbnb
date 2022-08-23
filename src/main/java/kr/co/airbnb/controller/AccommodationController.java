package kr.co.airbnb.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.criteria.FilterCriteria;
import kr.co.airbnb.criteria.SearchCriteria;
import kr.co.airbnb.form.ReservationRegisterForm;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.ConvenienceService;
import kr.co.airbnb.service.NoteService;
import kr.co.airbnb.service.WishlistService;
import kr.co.airbnb.vo.AccPrice;
import kr.co.airbnb.vo.AccRoom;
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
	
	@Autowired
	NoteService noteService;
	
	@GetMapping(path = "/detail")
	public String detail(@LoginUser User loginUser ,@RequestParam("no") int no,Model model) {
		if (loginUser != null) {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("accNo", no);
			map.put("userNo", loginUser.getNo());
			
			model.addAttribute("wishlists", accommodationService.getMyWishlists(loginUser.getNo()));
			model.addAttribute("wishlistAccNo",wishlistService.getAccNoByUserNo(map));
		}
		model.addAttribute("acc", accommodationService.getAccommodation(no));
		model.addAttribute("cons", ConvenienceService.getMainConveniences());
		model.addAttribute("Boast", accommodationService.getBoast(no));
		model.addAttribute("reservationRegisterForm", new ReservationRegisterForm());
		return "acc/detail";
	}
	
	
	@GetMapping(path="/insert") // 새로운 위시리스트 폴더 생성 후 해당 숙소 저장하기
	public String insertNewWishlist(@RequestParam("wishlistName") String wishlistName, @RequestParam("accNo") int accNo, @LoginUser User loginUser) {
		
		
		wishlistService.createWishlistAndSaveAcc(new Wishlist(wishlistName, loginUser), accNo);
		
		// refresh wishlists
//		List<Wishlist> wishlists = accommodationService.getMyWishlists(loginUser.getNo());
//		Map<String, Object> result = new HashMap<>();
//		Map<String, Object> result2 = new HashMap<>();
//		result2.put("accNo", accNo);
//		result2.put("userNo", loginUser.getNo());
//		result.put("wishlists", wishlists);
//		result.put("wishlistNo", wishlistService.getAccNoByUserNo(result2));
		
		return "redirect:/acc/detail?no="+accNo;
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
	
	@GetMapping(path = "/contact")
	public String conteactHost(@LoginUser User loginUser ,@RequestParam("no") int no,Model model) {
		
		model.addAttribute("acc", accommodationService.getAccommodation(no));
		model.addAttribute("cons", ConvenienceService.getMainConveniences());
		model.addAttribute("Boast", accommodationService.getBoast(no));
		model.addAttribute("reservationRegisterForm", new ReservationRegisterForm());
		return "acc/contact";
	}
	
	@PostMapping(path = "/note/add")
	public String noteAdd(@RequestParam("content") String content,@LoginUser User loginUser ,@RequestParam("no") int no) {
		
		noteService.addNote(loginUser, content, no);
		return "redirect:/acc/detail?no="+no;
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
	public String test(Model model,@LoginUser User loginUser) {
		model.addAttribute("notes",noteService.getRecvNotes(loginUser.getNo()));
		
		return "acc/test";
	}
	
	@GetMapping(path = "/test2")
	public String test2(Model model,@LoginUser User loginUser) {
		
		
		model.addAttribute("notes",noteService.getSendNotes(loginUser.getNo()));
		
		return "acc/test2";
	}

	@GetMapping(path = "/list")
	public String list(SearchCriteria searchCriteria, Model model) {	
		// nav의 키워드로 숙소 검색
		List<Accommodation> accList = accommodationService.searchAccByKeyword(searchCriteria);
		
		// 각 숙소의 타입1,2,3 조회 + 침대 개수 조회
		for (Accommodation acc : accList) {
			int accNo = acc.getAccNo();
			
			List<Type> types = accommodationService.searchTypesByAccNo(accNo);
			acc.setTypes(types);
			//if (!types.isEmpty()) {
			//	model.addAttribute("mainType", acc.getTypes().get(0));
			//}
			
			AccRoom rooms = accommodationService.getRoomByAccNo(accNo);
			acc.setRoom(rooms);
		}
		
		model.addAttribute("list", accList);
		
		/* 필터부분 */
		// 1박 평균 요금, 최저 요금, 최고요금
		AccPrice price = accommodationService.getPrice();
		model.addAttribute("price", price);
		// List<Integer> priceList = accommodationService.priceCount();
		// priceList -> [5, 6, 2, 10, 11, 3, 6]
		/* 샘플 sql문
			select count(*) cnt
			from (select trunc(acc_price/30000) acc_price
      		  	  from airbnb_accommodations)
			group by acc_price
			order by acc_price; 
		 */
		model.addAttribute("priceList", List.of(1, 1, 3, 6, 9, 15, 14, 12, 4, 3, 1, 0, 1));
				
		return "acc/list";
	}
	
	@GetMapping(path="/list/search2")
	@ResponseBody
	public List<Accommodation> search2(FilterCriteria filterCriteria) {
		List<Accommodation> accommodations = new ArrayList<Accommodation>();
		
		// 필터 검색한 숙소
		accommodations = accommodationService.searchAccByFilter(filterCriteria);
		
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
	
	
	
}

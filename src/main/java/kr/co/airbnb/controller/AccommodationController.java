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
import kr.co.airbnb.criteria.AccListCriteria;
import kr.co.airbnb.criteria.FilterCriteria;
import kr.co.airbnb.criteria.SearchCriteria;
import kr.co.airbnb.form.ReservationRegisterForm;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.ConvenienceService;
import kr.co.airbnb.service.NoteService;
import kr.co.airbnb.service.UserService;
import kr.co.airbnb.service.WishlistService;
import kr.co.airbnb.vo.AccPhoto;
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
	
	@Autowired
	UserService userService;
	
	@GetMapping(path = "/detail")
	public String detail(@LoginUser(required = false) User loginUser ,@RequestParam("no") int no,Model model) {
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
	
	@PostMapping(path = "/note/reAdd")
	@ResponseBody
	public Map<String, Object> reNoteAdd(@RequestParam("content") String content,@LoginUser User loginUser ,@RequestParam("no") int no, @RequestParam("recvNo") int recvNo) {
		 
		noteService.reAddNote(loginUser, content, no, recvNo);
		System.out.println("지나감");
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		 
		
		return result;
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
	
	@GetMapping(path = "/recvnote")
	public String test(Model model,@LoginUser User loginUser) {
		model.addAttribute("notes",noteService.getRecvNotes(loginUser.getNo()));
		
		return "acc/recvnote";
	}
	
	@GetMapping(path = "/sendnote")
	public String test2(Model model,@LoginUser User loginUser) {
		
		
		model.addAttribute("notes",noteService.getSendNotes(loginUser.getNo()));
		
		return "acc/sendnote";
	}
	
	@GetMapping(path = "/renote")
	public String test3(Model model,@LoginUser User loginUser,@RequestParam("recvNo") int recvNo, @RequestParam("no") int accNo ) {
		
		model.addAttribute("acc",accommodationService.getAccommodation(accNo));
		model.addAttribute("recvUser",userService.getUserByNo(recvNo));
		/* model.addAttribute("noteForm", new NoteForm()); */
		return "acc/renote";
	}


	@GetMapping(path = "/list")
	public String list(@LoginUser(required = false) User loginUser, AccListCriteria accListCriteria, Model model) {	
		
		if(loginUser != null) {
			List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
			model.addAttribute("wishlists", wishlists);
		}
		
		List<Accommodation> accommodations = new ArrayList<Accommodation>();
		accListCriteria.setUser(loginUser);
		// nav의 키워드로 숙소 검색
		accommodations = accommodationService.searchAccByCriteria(accListCriteria);
		
		/*
		 * if(accListCriteria == null && loginUser != null) { // 위시리스트 등록 숙소 여부를 포함한 모든
		 * 숙소들 accommodations = accommodationService.getAllAccs(loginUser.getNo()); }
		 */
		
		model.addAttribute("list", accommodations);
		// 각 숙소의 타입1,2,3 조회 + 침대 개수 조회 + 숙소 사진 조회
		for (Accommodation acc : accommodations) {
			int accNo = acc.getAccNo();
			
			List<Type> types = accommodationService.searchTypesByAccNo(accNo);
			acc.setTypes(types);
			
			List<AccPhoto> photos = accommodationService.getAccPhotosByAccNo(accNo);
			acc.setPhotos(photos);
		}

		/* 필터부분 */
		// 1박 평균 요금, 최저 요금, 최고요금
		AccPrice price = accommodationService.getPrice();
		model.addAttribute("price", price);
		
		// 차트 막대기 표현할 숫자 전체 조회
		model.addAttribute("counts", accommodationService.priceCount());
						
		return "acc/list";
	}
	
	
	
	
	
}

package kr.co.airbnb.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
		
		// test
		List<Accommodation> accs = wishlist.getAccs();
		for (Accommodation acc : accs) {
			System.out.println("photos: " + acc.getPhotos());
		}
			
		
		// 다시 추가하는 모달창에 출력할 모든 위시리스트 폴더
		List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
		model.addAttribute("wishlists", wishlists);
		
		return "wishlist/detail";
	}
	
	/**
	 * wishlist.jsp에서 비동기방식으로 더보기 기능 구현하기
	 * @param loginUser
	 * @param startNum 다음에 가져와야하는 숙소리스트의 인덱스 번호
	 * @return
	 */
	@GetMapping("/getMoreLists")
	@ResponseBody
	public Map<String, Object> getMoreWishlists(@LoginUser User loginUser, @RequestParam("startNum") int startNum) {
		List<Wishlist> moreWishlists = wishlistService.getMoreWishlists(loginUser.getNo(), startNum);
		System.out.println("개수: " + moreWishlists.size());
		
		Map<String, Object> result = new HashMap<>();
		result.put("moreWishlists", moreWishlists);
		
		return result;
	}
	
	/** // 질문
	 * 위시리스트 폴더 삭제 작업
	 * @return
	 */
	@GetMapping(path="/delete")
	public String deleteWishlist(@LoginUser User loginUser, @RequestParam("no") int wishlistNo) {
		
		wishlistService.deleteWishlist(wishlistNo);
		
		return "redirect:/wishlists";
	}
	
	
	// 특정 위시리스트 폴더에 저장된 숙소를 삭제한다.
	@GetMapping(path="/delete/acc")
	@ResponseBody
	public Map<String, Object> deleteWishlistAcc(@LoginUser User loginUser, @RequestParam("accNo") int accNo, @RequestParam("wishlistNo") int wishlistNo) {		// 나중에 @LoginUser 추가하기
		wishlistService.deleteWishlistAcc(wishlistNo, accNo);
		
		return null;
	}
	
	@PostMapping(path="/insert") // 새로운 위시리스트 폴더 생성 후 해당 숙소 저장하기
	//@ResponseBody // 08-19 : 에어비앤비 페이지와 다르게 새로운 위시리스트 폴더로 리다이렉트로 변경
	public String insertNewWishlist(@RequestParam("wishlistName") String wishlistName, @RequestParam("accNo") int accNo, @LoginUser User loginUser) {
		
		System.out.println("새로운 wishlistName: " + wishlistName);
		System.out.println("accNo: " + accNo);
		
		Wishlist wishlist = new Wishlist(wishlistName, loginUser);
		wishlistService.createWishlistAndSaveAcc(wishlist, accNo);
		Wishlist newWishlist = wishlistService.getWishlistByNo(wishlist.getNo());
		
		// refresh wishlists
		//List<Wishlist> wishlists = wishlistService.getMyWishlists(loginUser.getNo());
		//Map<String, Object> result = new HashMap<>();
		//result.put("wishlists", wishlists);
		
		return "redirect:/wishlists/detail?no=" + newWishlist.getNo() ;
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
	
	@PostMapping(path="/update/wishlist")
	public String updateWishlist(int wishlistNo, String changedName) {
		System.out.println("wishlistNo: " + wishlistNo);
		System.out.println("변경된 이름: " + changedName);
		wishlistService.updateWishlist(wishlistNo, changedName);
		
		return "redirect:/wishlists/detail?no=" + wishlistNo;
	}
	
	@PostMapping(path="/detail/refresh")
	//@ResponseBody
	public String refreshWithConditions(@RequestParam("wishlistNo") int wishlistNo, @RequestParam(name="startDate", required= false) String startDate, @RequestParam(name="endDate", required= false) String endDate, 
	@RequestParam(name="guestCount", required= false, defaultValue = "1") int guestCount, Model model) throws ParseException {
		
		Date checkInDate = null;
		Date checkOutDate = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  //@DateTimeFormat 사용(pattern="yyyy-MM-dd")?
		if (!startDate.isBlank() && !endDate.isBlank()) {
			 checkInDate = format.parse(startDate);
			 checkOutDate = format.parse(endDate);
		}
		
		//System.out.println("wishlistNo: " + wishlistNo);
		//System.out.println("checkInDate: " + checkInDate);
		//System.out.println("checkOutDate: " + checkOutDate);
		//System.out.println("totalGuestCount: " + guestCount);
		//System.out.println("startDate: " + startDate);
		//System.out.println("endDate: " + endDate);
		
		// 예약이 가능한 숙소들이 들어있는 5번 위시리스트
		Wishlist availableWishlist = wishlistService.getAvailableWishlistWithCondition(wishlistNo, checkInDate, checkOutDate, guestCount);
		
		// 예약이 불가능한 숙소들이 들어있는 5번 위시리스트
		Wishlist unavailableWishlist = wishlistService.getAnavailableWishlistWithCondition(wishlistNo, checkInDate, checkOutDate, guestCount);
		
		
		
		List<Accommodation> availableAccs = availableWishlist.getAccs();
		System.out.println("컨트롤러 예약가능한 숙소 개수: " + availableAccs.size() );
		for(Accommodation availableAcc : availableAccs) {
			System.out.println("컨트롤러 예약가능숙소번호: " + availableAcc.getAccNo());
		}
		
		List<Accommodation> unAvailableAccs = unavailableWishlist.getAccs();
		System.out.println("컨트롤러 예약불가능한 숙소 개수: " + unAvailableAccs.size() );
		for(Accommodation unAvailableAcc : unAvailableAccs) {
			System.out.println("컨트롤러 예약불가능숙소 번호: " + unAvailableAcc.getAccNo());
		}
		
		model.addAttribute("availableWishlist", availableWishlist);
		model.addAttribute("unavailableWishlist", unavailableWishlist);
		
		return "wishlist/wishlistHelper";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

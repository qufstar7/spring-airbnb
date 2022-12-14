package kr.co.airbnb.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.criteria.AccCriteria;
import kr.co.airbnb.criteria.AccListCriteria;
import kr.co.airbnb.criteria.FilterCriteria;
import kr.co.airbnb.criteria.SearchCriteria;
import kr.co.airbnb.mapper.AccommodationMapper;
import kr.co.airbnb.mapper.WishlistMapper;
import kr.co.airbnb.vo.AccPhoto;
import kr.co.airbnb.vo.AccPrice;
import kr.co.airbnb.vo.AccRoom;
import kr.co.airbnb.vo.AccTag;
import kr.co.airbnb.vo.Accommodation;

import kr.co.airbnb.vo.User;
import kr.co.airbnb.vo.Wishlist;
import kr.co.airbnb.vo.WishlistImage;
import kr.co.airbnb.vo.Boast;
import kr.co.airbnb.vo.Tag;
import kr.co.airbnb.vo.Type;


@Service
public class AccommodationService {

	@Autowired
	AccommodationMapper accommodationMapper;
	
	@Autowired
	WishlistMapper wishlistMapper;
	
	
	public void updateAcc(Accommodation acc) {
		accommodationMapper.updateAcc(acc);
	}
	
	public List<Wishlist> getMyWishlists(int userNo) {
		List<Wishlist> wishlists = wishlistMapper.getWishlistsByUserNo(userNo);
		for (Wishlist wishlist : wishlists) {
			wishlist.setAccs(wishlistMapper.getWishlistAccsByNo(wishlist.getNo()));
			Map<String, Object> map = new HashMap<>();
			map.put("wishlistNo", wishlist.getNo());
			map.put("userNo", userNo);
			wishlist.setWishlistImage(wishlistMapper.getImageByUserNo(map));
		}
		return wishlists;
	}
	
	public Accommodation getAccommodation(int no) {
		
		return accommodationMapper.getAcc(no);
	}
	
	public AccRoom getRoomByAccNo(int no) {
		
		return accommodationMapper.getRoomByAccNo(no);
	}

	public List<AccPhoto> getAccPhotosByAccNo(int accNo){
		return accommodationMapper.getAccPhotosByAccNo(accNo);
	}

	public List<Boast> getBoast(int no) {
		return accommodationMapper.getBoast(no);
	}
	
	// ?????????????????? ?????? ?????? ??????
	public List<Accommodation> getPopularAccommodations() {
		return accommodationMapper.getPopularAccommodations();
	}
	
	/*
	 * public void getAddressByAccNo(int accNo) { Accommodation acc = new
	 * Accommodation();
	 * 
	 * // ?????? ?????? ?????? if() }
	 */
	
	// ????????? ??????1,2,3 ??????
	public List<Type> searchTypesByAccNo(int accNo) {
		return accommodationMapper.getAllTypesByAccNo(accNo);
	}
	
	 
	/*
	 * public Image getImage(int no) { Image image = new Image(); List<AccPhoto>
	 * photos = accommodationMapper.getAccPhotosByAccNo(no);
	 * 
	 * for (AccPhoto photo : photos) { if(photo.getCover().equals("Y")) {
	 * image.setCover(photo); } else { image.getThumbnails().add(photo); } }
	 * 
	 * 
	 * 
	 * if (image.getCover() == null) { image.setCover(photos.get(0));
	 * photos.remove(0); image.setThumbnails(photos); }
	 * 
	 * 
	 * 
	 * return image; }
	 */
	
	// ????????????
//	public void insertAcc(@LoginUser User loginUser) {
//		Accommodation acc = new Accommodation();
//		acc.setUser(loginUser);
//		acc.setStatus("????????????");
//		accommodationMapper.insertAcc(acc);
//	}

	public int getAccommodationNoByUser(@LoginUser User loginUser) {
		return accommodationMapper.getAccNoByUser(loginUser);
	}
	
	// ?????? ?????? ??????
	public List<Tag> getAllTags() {
		return  accommodationMapper.getAllTag();
	}

	/* ???????????? */
	// 1??? ?????? ??????, ?????? ??????, ???????????? ??????
	public AccPrice getPrice() {
		return accommodationMapper.getPrice();
	}

	// ????????? + ?????? ???????????? ?????? ??????
	public List<Accommodation> searchAccByCriteria(AccListCriteria accListCriteria) {
		return accommodationMapper.getAccByCriteria(accListCriteria);
	}

	// ?????? - ??????
	public List<Integer> priceCount() {
		return accommodationMapper.getPriceCount();
	}

	// ??? ?????????????????? ??????????????? ????????? ?????? ???????????? ?????? ?????? ??????
	public List<Accommodation> getAllAccs(int userNo) {
		accommodationMapper.getAllAccs(userNo);
		return accommodationMapper.getAllAccs(userNo);
	}
	

}

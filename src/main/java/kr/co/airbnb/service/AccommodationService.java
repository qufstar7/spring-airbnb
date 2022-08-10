package kr.co.airbnb.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.mapper.AccommodationMapper;
import kr.co.airbnb.vo.Accommodation;

@Service
public class AccommodationService {

	@Autowired
	AccommodationMapper accommodationMapper;
	
	public Accommodation getAccommodation(int no) {
		
		return accommodationMapper.getAcc(no);
	}
	
	public List<Accommodation> getAllAcc() {
		return accommodationMapper.getAllAcc();
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
}

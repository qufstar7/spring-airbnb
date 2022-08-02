package kr.co.airbnb.service;

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
}

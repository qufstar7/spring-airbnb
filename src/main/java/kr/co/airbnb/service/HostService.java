package kr.co.airbnb.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.form.AccRegisterForm;
import kr.co.airbnb.mapper.AccommodationMapper;
import kr.co.airbnb.mapper.HostMapper;
import kr.co.airbnb.vo.AccConvenience;
import kr.co.airbnb.vo.AccPhoto;
import kr.co.airbnb.vo.AccRoom;
import kr.co.airbnb.vo.AccTag;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Tag;
import kr.co.airbnb.vo.Type;
import kr.co.airbnb.vo.User;

@Service
public class HostService {

	@Autowired
	private HostMapper hostMapper;
	@Autowired
	private AccommodationMapper accMapper;
	
	// 사용자의 모든 숙소 정보 조회
	public List<Accommodation> getAllAccByUser(@LoginUser User loginUser) {
		List<Accommodation> userAllAcc =  accMapper.getAllAccsByUser(loginUser);
		
		for (Accommodation acc : userAllAcc) {
			int no = acc.getAccNo();
			List<Type> types = accMapper.getAllTypesByAccNo(no);
			acc.setTypes(types);
		}		
		return userAllAcc;
	}
	
	// 타입 1,2,3 전체 조회
	public List<Type> getAllMainTypes() {
		return hostMapper.getAllMainTypes();
	}

	public List<Type> getAllSubTypes(int mainType) {
		return hostMapper.getAllSubTypes(mainType);
	}
	
	public List<Type> getAllPrivacyTypes() {
		return hostMapper.getAllPrivacyTypes();
	}
	
	public void insertAcc(@LoginUser User loginUser) {
		Accommodation acc = new Accommodation();
		acc.setUser(loginUser);
		acc.setStatus("등록미완");
		hostMapper.insertAcc(acc);
	}
	
	public void insertAccType(AccType accType) { 
		hostMapper.insertAccType(accType);
	}

	// 4. 주소
	public void updateAddress(Accommodation registerAcc, User loginUser, AccRegisterForm arf) {
		Accommodation acc = new Accommodation();
		
		// 주소합치기, 저장할 정보 객체에 저장
		if(arf.getStateRegion() != null && arf.getCity() != null && arf.getRoadName() != null && arf.getSpecificAddress() != null) {
			String fullAddress = ( arf.getStateRegion().trim() +" "+ arf.getCity().trim() +" "+ arf.getRoadName().trim() +" "+ arf.getSpecificAddress().trim() );
			acc.setAddress(fullAddress);
		}
		acc.setLatitude(arf.getLatitude());
		acc.setLongitude(arf.getLongitude());
		acc.setAccNo(registerAcc.getAccNo());
		
		hostMapper.updateAddressByAccNo(acc);
	}

	// 5. 인원수
	public void updateGuests(Accommodation registerAcc, User loginUser, AccRegisterForm arf) {
		Accommodation acc = new Accommodation();
		
		System.out.println(Integer.parseInt(arf.getGuest()));
		System.out.println(Integer.parseInt(arf.getBed()));
		System.out.println(Integer.parseInt(arf.getBedroom()));
		System.out.println(Integer.parseInt(arf.getBathroom()));
		
		// 숙소 세부 정보 저장
		AccRoom accRoom = new AccRoom();
		accRoom.setAccNo(registerAcc.getAccNo());
		accRoom.setBed(Integer.parseInt(arf.getBed()));
		accRoom.setBedroom(Integer.parseInt(arf.getBedroom()));
		accRoom.setBathroom(Integer.parseInt(arf.getBathroom()));
		hostMapper.insertAccRoom(accRoom);
		
		// 숙소 인원수 정보 저장
		acc.setAccNo(registerAcc.getAccNo());
		acc.setGuest(Integer.parseInt(arf.getGuest()));
		hostMapper.updateGuestsByAccNo(acc);
	}

	// 6. 편의시설
	public void insertConveniences(Accommodation registerAcc, User loginUser, AccRegisterForm arf) {
		List<String> facilities = arf.getFacilities();
		if (!CollectionUtils.isEmpty(facilities)) {
			for (String fac : facilities) {
				int facInt = Integer.parseInt(fac);
				hostMapper.insertAccConvenience(new AccConvenience(registerAcc.getAccNo(), facInt));
			}
		}
	}

	// 7. 사진
	public void updatePhotos(Accommodation registerAcc, User loginUser, AccRegisterForm arf) {
		int accNo = registerAcc.getAccNo();
		
		Accommodation acc = new Accommodation();
		acc.setImageCover(arf.getPhoto1name()); // 커버이미지이름
		acc.setAccNo(accNo);
		hostMapper.updateImageCover(acc);
		
		List<AccPhoto> accPhotos = new ArrayList<AccPhoto>();
		accPhotos.add(new AccPhoto(accNo, arf.getPhoto1name(), "Y"));
		accPhotos.add(new AccPhoto(accNo, arf.getPhoto2name(), "N"));
		accPhotos.add(new AccPhoto(accNo, arf.getPhoto3name(), "N"));
		accPhotos.add(new AccPhoto(accNo, arf.getPhoto4name(), "N"));
		accPhotos.add(new AccPhoto(accNo, arf.getPhoto5name(), "N"));
		
		System.out.println(accPhotos);
		
		if (!CollectionUtils.isEmpty(accPhotos)) {
			for (AccPhoto accPhoto : accPhotos) {
				if (accPhoto.getName() != null) {
					hostMapper.insertAccPhotos(accPhoto);
				}
			}
		}
	}

	// 8. 이름
	public void updateName(Accommodation registerAcc, User loginUser, AccRegisterForm arf) {
		Accommodation acc = new Accommodation();
		acc.setAccNo(registerAcc.getAccNo());
		
		// 저장할 정보 객체에 저장
		String name = null;
		if (arf.getName() != null) {
			name = arf.getName().trim();
		}
		
		acc.setName(name);
		hostMapper.updateAccName(acc);
	}

	// 9. 태그
	public List<Tag> getAllTags() {
		return hostMapper.getAllTags();
	}

	public void insertTags(Accommodation registerAcc, User loginUser, AccRegisterForm arf) {
		List<String> tags = arf.getTags();
		System.out.println("tags: "+tags);
		if (!CollectionUtils.isEmpty(tags)) {
			for (String tag : tags) {				
				hostMapper.insertAccTags(new AccTag(registerAcc.getAccNo(), tag));
			}
		}
	}

	// 10. 설명
	public void updateDescription(Accommodation registerAcc, User loginUser, AccRegisterForm arf) {
		Accommodation acc = new Accommodation();
		acc.setAccNo(registerAcc.getAccNo());
		
		// 저장할 정보 객체에 저장
		String description = null;
		if (arf.getDescription() != null) {
			description = arf.getDescription().trim();
		}
		
		acc.setDescription(description);
		hostMapper.updateAccDescription(acc);
	}

	// 11. 가격
	public void updatePrice(Accommodation registerAcc, User loginUser, AccRegisterForm arf) {
		Accommodation acc = new Accommodation();
		acc.setAccNo(registerAcc.getAccNo());
		
		// 저장할 정보 객체에 저장
		String priceStr = arf.getPrice();
		int price = 0;
		if (priceStr != null) {
			price = Integer.parseInt(priceStr);
		}
		
		acc.setPrice(price);
		hostMapper.updateAccPrice(acc);
	}
	
	// 12. 법관련
	
	// 완료페이지
	public AccRoom getAllRoomInfoByAccNo(int accNo) {
		return hostMapper.getAllRoomInfoByAccNo(accNo);
	}

	public List<AccConvenience> getAllConveniencesByAccNo(int accNo) {
		return accMapper.getAccConveniencesByAccNo(accNo);
	}

	public List<Type> getAllTypesByAccNo(int accNo) {
		return accMapper.getAllTypesByAccNo(accNo);
	}
	
}

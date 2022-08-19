package kr.co.airbnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.form.AccRegisterForm;
import kr.co.airbnb.mapper.AccommodationMapper;
import kr.co.airbnb.mapper.HostMapper;
import kr.co.airbnb.vo.AccConvenience;
import kr.co.airbnb.vo.AccRoom;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.Accommodation;
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
	public void updateConveniences(Accommodation registerAcc, User loginUser, AccRegisterForm arf) {
		List<String> facilities = arf.getFacilities();
		if (!CollectionUtils.isEmpty(facilities)) {
			for (String fac : facilities) {
				int facInt = Integer.parseInt(fac);
				hostMapper.insertAccConvenience(new AccConvenience(registerAcc.getAccNo(), facInt));
			}
		}
	}
	
	// 7. 사진
	// 8. 이름
	// 9. 태그
	// 10. 설명
	// 11. 가격
	// 12. 법관련
	
}

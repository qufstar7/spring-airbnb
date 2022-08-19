package kr.co.airbnb.service;

import java.io.IOException;
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
	
	public void insertAccType(AccType accType) {
		accMapper.insertAccType(accType);
	}

//	public void insertAddress(AccRegisterForm accRegisterForm) {
//		hostMapper.insertAccAddress(accRegisterForm);
//	}

	public void updateAcc(Accommodation registerAcc, User loginUser, AccRegisterForm arf, int step) throws IOException {
		Accommodation acc = new Accommodation();
		
		// 1,2,3 유형
		// insertAccType으로 insert함.
//		List<Type> types;
//		acc.setTypes(types);
//		types.set(0, hostMapper.getTypeByNo(arf.getMainType()));
//		types.set(1, hostMapper.getTypeByNo(arf.getSubType()));
//		types.set(2, hostMapper.getTypeByNo(arf.getPrivacyType()));
				
		// 4. 주소
		if (step == 4) {
			if(arf.getStateRegion() != null && arf.getCity() != null && arf.getRoadName() != null && arf.getSpecificAddress() != null) {
				String fullAddress = ( arf.getStateRegion().trim() +" "+ arf.getCity().trim() +" "+ arf.getRoadName().trim() +" "+ arf.getSpecificAddress().trim() );
				acc.setAddress(fullAddress);
			}
			acc.setLatitude(arf.getLatitude());
			acc.setLongitude(arf.getLongitude());
			
		}
		
		// 5. 인원수
		if (step == 5) {
			acc.setGuest(arf.getGuest());
			AccRoom accRoom = new AccRoom();
			accRoom.setAccNo(registerAcc.getAccNo());
			accRoom.setBed(arf.getBed());
			accRoom.setBedroom(arf.getBedroom());
			accRoom.setBathroom(arf.getBathroom());
			acc.setRoom(accRoom);
			// 숙소 Guest페이지 정보 저장하기
			hostMapper.insertAccRoom(accRoom);
		}

		// 6. 편의시설
		if (step == 6) {
			List<String> facilities = arf.getFacilities();
			if (!CollectionUtils.isEmpty(facilities)) {
				for (String fac : facilities) {
					int facInt = Integer.parseInt(fac);
					hostMapper.insertAccConvenience(new AccConvenience(registerAcc.getAccNo(), facInt));
				}
			}
		}

		// 7. 사진
		if (step == 7) {
			acc.setPhotos(arf.getImageFiles());
		}

		// 8. 이름
		if (step == 8) {
			acc.setName(arf.getName());
		}
		
		// 9. 태그
		if (step == 9) {
			acc.setTags(arf.getTags());
		}
		
		// 10. 설명
		if (step == 10) {
			acc.setDescription(arf.getDescription());
		}
		
		// 11. 가격
		if (step == 11) {
			acc.setPrice(arf.getPrice());
		}

		// 12. 법관련
		if (step == 12) {
			
		}
		
		///////////// 각 단계별로 따로 hostMapper.updateLocation 같이 만들자.!!!!!!!!!!!!!
		///////////// guests 페이지에서 - + 최대 최소 값 도달했을 때 버튼 디자인!!!!!!!!!!!!
		

		
		
		
		// 방번호
		acc.setAccNo(registerAcc.getAccNo());
		// 유저번호
		acc.setUser(loginUser);
		System.out.println("updateAcc acc : "+acc);
		hostMapper.updateAcc(acc);
		// 숙소상태
		acc.setStatus("등록미완");
		
//		// 강의 카테고리정보 저장하기
//		List<String> categoryIds = courseRegisterForm.getCategoryIds();
//		for (String categoryId : categoryIds) {
//			courseMapper.insertCourseCategory(new CourseCategory(course.getNo(), categoryId));
//		}
		
	}
	
}

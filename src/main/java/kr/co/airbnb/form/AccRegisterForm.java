package kr.co.airbnb.form;

import java.util.List;

import kr.co.airbnb.vo.AccPhoto;
import kr.co.airbnb.vo.Tag;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AccRegisterForm {

	private int accNo;
	
	// 타입
	private int mainType;
	private int subType;
	private int privacyType;
	
	// 주소
	private String stateRegion;
	private String city;
	private String roadName;
	private String specificAddress;
	private String zipcode;
	private String latitude;
	private String longitude;
	
	// 인원수 페이지
	private int guest;
	private int bed;
	private int bedroom;
	private int bathroom;

	// 편의시설 페이지
	private List<String> facilities;
		
	private List<AccPhoto> imageFiles;
	private String name;
	private List<Tag> tags;
	private String description;
	private int price;
	private List<Boolean> legalChecks;
}

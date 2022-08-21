package kr.co.airbnb.form;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AccRegisterForm {

	private int accNo;
	// 타입 페이지
	private int mainType;
	private int subType;
	private int privacyType;
	// 주소 페이지
	private String stateRegion;
	private String city;
	private String roadName;
	private String specificAddress;
	private String zipcode;
	private String latitude;
	private String longitude;
	// 인원수 페이지
	private String guest;
	private String bed;
	private String bedroom;
	private String bathroom;
	// 편의시설 페이지
	private List<String> facilities;
	// 사진 페이지
	private MultipartFile photo1;
	private String photo1name;
	private MultipartFile photo2;
	private String photo2name;
	private MultipartFile photo3;
	private String photo3name;
	private MultipartFile photo4;
	private String photo4name;
	private MultipartFile photo5;
	private String photo5name;
	// 이름 페이지
	private String name;
	// 태그 페이지
	private List<String> tags;
	// 설명 페이지
	private String description;
	// 가격 페이지
	private String price;
	
	private List<Boolean> legalChecks;
}

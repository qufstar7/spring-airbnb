package kr.co.airbnb.form;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.airbnb.vo.AccPrivacyType;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.Tag;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AccRegisterForm {

	private List<AccType> accType;
	private AccPrivacyType accPrivacyType;
	private String location;
	private int numberOfPeople;
	private List<Boolean> ConvenienceFacilityInfo;
	private List<MultipartFile> imageFiles;
	private String name;
	private List<Tag> tags;
	private String description;
	private String price;
	private List<Boolean> legalChecks;
	
}

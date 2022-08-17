package kr.co.airbnb.form;

import java.util.List;

import kr.co.airbnb.vo.AccConvenience;
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
	private int mainType;
	private int subType;
	private int privacyType;
	private String roadName; // address
	private String latitude;
	private String longitude;
	private int guests;
	private List<AccConvenience> facilities;
	private List<AccPhoto> imageFiles;
	private String name;
	private List<Tag> tags;
	private String description;
	private int price;
	private List<Boolean> legalChecks;
}

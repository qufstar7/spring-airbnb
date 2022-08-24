package kr.co.airbnb.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserUpdateForm {

	private String description;
	private String address;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthDate;
	private MultipartFile profileImg;
	
	// 추가
	private String name;
	private String gender;
	private String phone;
	
}

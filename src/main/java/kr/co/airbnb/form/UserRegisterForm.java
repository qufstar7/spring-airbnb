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
public class UserRegisterForm {

	
	
	private String firstName;
	private String lastName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthDate;
	private String registerEmail;
	private String password;
	private MultipartFile profileImg;
}

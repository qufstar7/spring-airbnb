package kr.co.airbnb.form;

import java.util.Date;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import lombok.Getter;
import lombok.ToString;

@Getter
@Service
@ToString
public class UserRegisterForm {

	
	
	private String firstName;
	private String lastName;
	private Date birthDate;
	private String email;
	private String password;
}

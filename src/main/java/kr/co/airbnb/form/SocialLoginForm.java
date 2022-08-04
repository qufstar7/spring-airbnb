package kr.co.airbnb.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SocialLoginForm {

	private String nickname;
	private String email;
	private String gender;
	private String loginType;
	private String profileImage;
	
}

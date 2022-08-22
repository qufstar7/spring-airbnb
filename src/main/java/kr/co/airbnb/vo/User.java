package kr.co.airbnb.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("User")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User {

	private int no;
	// 로그인 구분 - 본 사이트에서 가입한 경우:normal, 카카오 로그인으로 가입한 경우: kakao다.
	private String loginType;
	// 사용자의 이름 - 회원가입할 때 입력한 사용자 이름, 카카오 로그인에서 제공하는 사용자 닉네임
	private String name;
	private String email;
	@JsonIgnore
	private String password;
	private String phone;
	private String profileImage;
	private String description;
	private Date birthDate;
	private String address;
	private String disabled;
	private String isHost;
	@JsonFormat(pattern = "yyyy년")
	private Date createdDate;
	private Date updatedDate;
	private String gender;
	
	private int reviewCount;
	private double reviewScore;
	private double totalScore;
	private double cleanScore;
	private double communicationScore;
	private double observanceScore;
	
	private Wishlist wishlist;
	
}

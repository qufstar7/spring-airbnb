package kr.co.airbnb.form;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CardRegisterForm {

	@Pattern(regexp = "(\\d{4}[-. ]?){4}|\\d{4}[-. ]?\\d{6}[-. ]?\\d{5}"
			, message = "카드 번호를 확인하세요.")
	private String id;
	
	@Pattern(regexp = "^\\d{2}/\\d{2}$", message = "카드 유효기간을 확인하세요." )
	private String expiryDate;
	
	@Pattern(regexp = "^\\d{3}$", message = "CVV 코드를 확인하세요.")
	private String cvv;
	
	private String zipCode;
	
	private String region;
	
}

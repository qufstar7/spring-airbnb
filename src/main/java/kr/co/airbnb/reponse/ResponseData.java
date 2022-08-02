package kr.co.airbnb.reponse;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseData {
	private boolean success;
	private String message;
	
	public ResponseData() {}
	
	public static ResponseData create(boolean success, String message) {
		ResponseData responseData = new ResponseData();
		responseData.setSuccess(success);
		responseData.setMessage(message);
		
		return responseData;
	}
}

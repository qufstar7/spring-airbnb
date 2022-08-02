package kr.co.airbnb.reponse;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SingleResponseData<T> extends ResponseData {

	private T item;
	
	public static <T> SingleResponseData<T> create(T item) {
		SingleResponseData<T> responseData = new SingleResponseData<T>();
		responseData.setSuccess(true);
		responseData.setItem(item);

		return responseData;
	}
}

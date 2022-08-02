package kr.co.airbnb.reponse;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ListResponseData<T> extends ResponseData {

	private List<T> items;
	
	public static <T> ListResponseData<T> create(List<T> items) {
		ListResponseData<T> responseData = new ListResponseData<T>();
		responseData.setSuccess(true);
		responseData.setItems(items);
		
		return responseData;
	}
}

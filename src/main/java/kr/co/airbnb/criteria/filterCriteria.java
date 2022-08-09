package kr.co.airbnb.criteria;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class filterCriteria {

	private int accNo;
	// 숙소유형
	// 침실과 침대
	private List<String> houses;	// 건물유형
	private List<String> conveniences;// 편의시설 + 예약 옵션
	
}

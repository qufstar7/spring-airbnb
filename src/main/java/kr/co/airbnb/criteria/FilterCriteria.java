package kr.co.airbnb.criteria;

import java.util.List;

import kr.co.airbnb.vo.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class FilterCriteria {
	
	private int id;	// tagId
	private User user;
	
	private int accNo;
	
	// 필터의 슬라이더 부분		
	private int rangeMin;
	private int rangeMax;
	private int minPrice;
	private int maxPrice;
	// 숙소 유형			
	private List<String> rent;	
	// 침실과 침대				
	private String bedrooms;
	private String beds;
	private String bathrooms;
	// 건물 유형				
	private List<String> house;
	
	// 편의시설 + 예약옵션		
	private List<String> convenience;
	// 예약옵션
	private List<String> bookOption;
	
	// 접근성 편의
	// private String accessibility;
	// 최고수준의 숙소
	// private String highest;
	
	// 숙소 type검색 + 숙소유형 + 건물유형
	private List<String> accTypes;
}

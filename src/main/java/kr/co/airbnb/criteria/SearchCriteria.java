package kr.co.airbnb.criteria;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchCriteria {
	// 숙소 type검색
	private List<String> accTypes;
	
	// nav검색 - 어디든지 : 주소검색, 대한민국 내 인기 여행지 - 버튼 클릭
	private String keyword;
	
	// nav검색 - 언제든지 : 날짜 검색
	private String startDate;
	private String endDate;
	
	// nav검색 - 누구든지 : 인원수 검색
	private String adult;	// 검색 조건에 포함되지 않을 수도 있기 때문에 String으로
	private String child;
	private String infant;
	private String pet;
	
}

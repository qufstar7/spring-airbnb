package kr.co.airbnb.criteria;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.co.airbnb.vo.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class AccListCriteria {
	private User user;
	private String id;
	private int accNo;

// FilterCriteria.java
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
	
// SearchCriteria.java	
	// nav검색 - 어디든지 : 주소검색, 대한민국 내 인기 여행지 - 버튼 클릭
	private String keyword;
	
	// nav검색 - 언제든지 : 날짜 검색
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date endDate;
	
	// nav검색 - 누구든지 : 인원수 검색
	private String adult;	// 검색 조건에 포함되지 않을 수도 있기 때문에 String으로
	private String child;
	private String infant;
	private String pet;
}

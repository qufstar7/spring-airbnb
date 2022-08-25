package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.criteria.AccCriteria;
import kr.co.airbnb.criteria.AccListCriteria;
import kr.co.airbnb.criteria.FilterCriteria;
import kr.co.airbnb.criteria.SearchCriteria;
import kr.co.airbnb.vo.AccConvenience;

import kr.co.airbnb.vo.AccDiscount;
import kr.co.airbnb.vo.AccViewCount;

import kr.co.airbnb.vo.Boast;
import kr.co.airbnb.vo.AccPhoto;
import kr.co.airbnb.vo.AccPrice;
import kr.co.airbnb.vo.AccRoom;
import kr.co.airbnb.vo.AccTag;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Convenience;

import kr.co.airbnb.vo.User;

import kr.co.airbnb.vo.Reservation;
import kr.co.airbnb.vo.Review;
import kr.co.airbnb.vo.Tag;
import kr.co.airbnb.vo.Type;
import kr.co.airbnb.vo.Wishlist;


@Mapper
public interface AccommodationMapper {


	// 숙소 상세 정보
	Accommodation getAcc(int accNo);
	// 크리테리아로 모든 숙소 조회
	List<Accommodation> getPopularAccommodations();
	// 유저(호스트)의 모든 숙소 조회
	List<Accommodation> getAllAccsByUser(User loginUser);
	// 숙소의 타입1,2,3 조회
	List<Type> getAllTypesByAccNo(int accNo);
	
	// 숙소에 있는 편의시설들
	List<AccConvenience> getAccConveniencesByAccNo(int accNo);
	// 편의시설 메인타입
	List<Convenience> getMainConveniencesByAccNo(int accNo);
	// 숙소 사진 리스트
	List<AccPhoto> getAccPhotosByAccNo(int accNo);
	// 예약된 날짜 리스트
	Accommodation getDisabledByAccNo(int accNo);
			
      
	// 숙소 종류 리스트
	List<Type> getTypesByTypeNo(int typeNo);
	

	// 숙소 자랑거리?
	List<Boast> getBoast(int accNo);
	// 룸
	AccRoom getRoomByAccNo(int accNo);
	
	// 내 위시리스트에 담겨있는지 여부를 함께 반환하는 모든 숙소 정보
	List<Accommodation> getAllAccs(@Param("userNo") int userNo);

	// 숙소 업데이트
	void updateAcc(Accommodation acc);
	
	// 숙소 리뷰 갯수, 별점 평균 업데이트
	void updateAvgScore(Accommodation accommodation);
	// 리뷰 삭제시 리뷰갯수 - 1 업데이트
	void deleteReview(Review review);
	
	// 삭제예정
//	void insertAcc(Accommodation acc);
//	
//	void insertAccType(AccType accType);
	
	// 사용자의 숙소중 가장 최근(가장 큰 숫자)의 숙소 번호 조회
	int getAccNoByUser(User loginUser);

	// 모든 태그 조회
	List<Tag> getAllTag();
	
	/* 필터부분 */
	// 1박 평균 요금, 최저 요금, 최고요금 조회
	AccPrice getPrice();
	
	// 키워드 + 필터 검색으로 숙소 조회
	List<Accommodation> getAccByCriteria(AccListCriteria accListCriteria);
	 
	// 필터 - 차트
	List<Integer> getPriceCount();
	
	

}

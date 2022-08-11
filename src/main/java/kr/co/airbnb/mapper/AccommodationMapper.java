package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.vo.AccConvenience;
import kr.co.airbnb.vo.AccPhoto;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Convenience;
import kr.co.airbnb.vo.User;

@Mapper
public interface AccommodationMapper {


	// 숙소 상세 정보
	Accommodation getAcc(int accNo);
	
	// 숙소에 있는 편의시설들
	List<AccConvenience> getAccConveniencesByAccNo(int accNo);
	// 편의시설 메인타입
	List<Convenience> getMainConveniencesByAccNo(int accNo);
	// 숙소 사진 리스트
	List<AccPhoto> getAccPhotosByAccNo(int accNo);

	// 숙소 리뷰 갯수, 별점 평균 업데이트
	void updateAvgScore(Accommodation accommodation);
	
	// 번호만 가지고 있는 숙소 데이터 생성(insert into)
	void insertAcc(Accommodation acc);

}

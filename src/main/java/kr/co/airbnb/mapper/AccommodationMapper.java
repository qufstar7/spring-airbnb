package kr.co.airbnb.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.Accommodation;

@Mapper
public interface AccommodationMapper {

	Accommodation getAcc(int no);
}

package kr.co.airbnb.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.Review;

@Mapper
public interface ReviewMapper {
	void insertReviewGuest(Review review);
	void insertReviewHost(Review review);
}

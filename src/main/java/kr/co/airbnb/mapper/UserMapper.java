package kr.co.airbnb.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.User;

@Mapper
public interface UserMapper {

	User getUserByEmail(String email);
	User getUserByNo(int userNo);
	void insertUser(User user);
	void updateUser(User user);
	void disableUser(int userNo);
	
	// 호스트 리뷰 갯수, 별점 평균 업데이트
	void updateAvgScore(User user);
}

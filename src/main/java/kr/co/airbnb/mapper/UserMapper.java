package kr.co.airbnb.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.User;

@Mapper
public interface UserMapper {

	User getUserByEmail(String email);
	User getUserByNo(int no);
	void insertUser(User user);
	void updateUser(User user);
	User getUserById(String id);
	void insertKakaoUser(User user);
}

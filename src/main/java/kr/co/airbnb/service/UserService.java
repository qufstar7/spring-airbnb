package kr.co.airbnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.mapper.UserMapper;
import kr.co.airbnb.vo.User;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	public User getUserByEmail(String email) {
		
		return userMapper.getUserByEmail(email);
	}

	public void addNewUser(User user) {
		userMapper.insertUser(user);
	}
}

package kr.co.airbnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.airbnb.mapper.UserMapper;
import kr.co.airbnb.mapper.WishlistMapper;
import kr.co.airbnb.vo.User;
import kr.co.airbnb.vo.Wishlist;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private WishlistMapper wishlistMapper;
	
	public User getUserByEmail(String email) {
		
		return userMapper.getUserByEmail(email);
	}

	public void addNewUser(User user) {
		userMapper.insertUser(user);
	}
	
	public void updateUserInfo(User user) {
		userMapper.updateUser(user);
	}
	
	public List<Wishlist> getMyWishlists(int userNo) {
		return wishlistMapper.getWishlistsByUserNo(userNo);
	}
}

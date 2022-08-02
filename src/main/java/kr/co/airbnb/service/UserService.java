package kr.co.airbnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.airbnb.mapper.UserMapper;
import kr.co.airbnb.mapper.WishlistMapper;
import kr.co.airbnb.vo.User;
import kr.co.airbnb.vo.Wishlist;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
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
	
	/**
	 * 소셜 로그인으로 획득한 사용자정보로 로그인처리를 수행한다.<p>
	 * 소셜 로그인은 회원가입 절차없이 카카오 로그인 API로 획득한 정보를 데이터베이스에 저장한다.<p>
	 * 소셜 로그인으로 우리 서비스를 한 번이라도 사용한 사용자는 사용자 정보가 데이터베이스에 이미 저장되어 있다.
	 * @param user 소셜 로그인으로 획득한 사용자 정보
	 * @return 사용자 정보
	 */
	public User loginWithSns(User user) {
		User savedUser = userMapper.getUserByEmail(user.getEmail());
		log.info("소셜 로그인 아이디로 조회한 유저 정보: " + savedUser);
		
		if (savedUser == null) {
			userMapper.insertUser(user);
			log.info("소셜 로그인 신규 사용자 정보 등록 완료: " + user.getEmail() + ", " + user.getName());
		}
		return savedUser;
	}
}

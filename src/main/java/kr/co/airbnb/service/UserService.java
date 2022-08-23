package kr.co.airbnb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.airbnb.mapper.UserMapper;
import kr.co.airbnb.mapper.WishlistMapper;
import kr.co.airbnb.utils.SessionUtils;
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
	private WishlistService wishlistService;
	
	public User getUserByEmail(String email) {
		return userMapper.getUserByEmail(email);
	}

	public void addNewUser(User user) {
		userMapper.insertUser(user);
	}
	
	public void updateUserInfo(User user) {
		userMapper.updateUser(user);
	}
	
/*	public Map<String, Object> loginWithNormal(String email, String password) {
		Map<String, Object> result = new HashMap<>();
		User user = getUserByEmail(email);
		
		if(user.getDisabled() == "Y") {
			result.put("fail", "disabled");
			
		} else if(password.equals(user.getPassword())) {
			result.put("pass", true);
			SessionUtils.addAttribute("LOGIN_USER", user);
		} else {
			result.put("fail", "denied");
		}
		return result;
	} */
	
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

	public User getUserByNo(int userNo) {
		User savedUser = userMapper.getUserByNo(userNo);
		return savedUser;
	}

	public void disableUser(int userNo) { // 수정 필요
		userMapper.disableUser(userNo);
	}
}

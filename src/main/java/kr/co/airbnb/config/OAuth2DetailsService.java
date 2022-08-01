package kr.co.airbnb.config;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

/**
 * 페이스북으로부터 인증정보가 응답되었을 때, 이 정보를 처리하는 클래스
 * @author youna
 *
 */
@Service
public class OAuth2DetailsService extends DefaultOAuth2UserService {

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("OAuth2 서비스 탐");
		OAuth2User oauth2User = super.loadUser(userRequest);
		System.out.println(oauth2User.getAttributes());
			return null;

	}
}

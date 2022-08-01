package kr.co.airbnb.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity
@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter{
	
	
	@Autowired
	private OAuth2DetailsService oAuth2DetailsService;
   
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//super 삭제 => 기존 시큐리티가 가지고 있던 기능이 비활성화됨
		http.csrf().disable();
		http.authorizeRequests()
			//.antMatchers("/","/user/**","/image/**","/subscribe/**","/comment/**").authenticated() // user,image 등등 경로로 시작하는 요청은 모두 인증이 필요하다
			.anyRequest().permitAll() //그 외의 경로는 인증이 필요없다.
			.and()
			.formLogin()  //로그인 방식을 폼태그로 정하겠다.
			.loginPage("/auth/signin") //인증할 때의 로그인 페이지 띄움, GET
		    .loginProcessingUrl("/auth/signin") // 로그인을 실제로 할 때, POST -> 스프링 시큐리티가 로그인 프로세스 진행
			.defaultSuccessUrl("/") //로그인을 정상적으로 처리할 때 / 경로로 가게끔 하겠다.
			
            .and()
			.oauth2Login() //form 로그인도 하는데, oauth 로그인도 할 거야 
			.userInfoEndpoint() //oauth2 로그인을 할 때 최종응답으로 회원정보를 바로 받을 수 있다(code, access token 받을 필요 없다) 
			.userService(oAuth2DetailsService);
	}	

}

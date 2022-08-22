package kr.co.airbnb.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.airbnb.argumentResolver.LoginUserArgumentResolver;
import kr.co.airbnb.argumentResolver.RegisterAccArgumentResolver;
import kr.co.airbnb.interceptor.LoginCheckInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
		resolvers.add(new LoginUserArgumentResolver());
		resolvers.add(new RegisterAccArgumentResolver());
	}

	@Bean
	public LoginCheckInterceptor makeLoginCheckInterceptor() {
		return new LoginCheckInterceptor();
	}
	
	public @Override void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(makeLoginCheckInterceptor())
		 	// 모든 요청에 대해서 인터셉터가 실행된다.
			//.addPathPatterns("localhost/**")
			.addPathPatterns("/**")
			
			.excludePathPatterns("/resources/**", "/*.ico"); 
	}
	
	
	
/*	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginCheckInterceptor())
				.addPathPatterns("/**")						
				.excludePathPatterns("/resources/**", "/*.ico");   
	} */
}

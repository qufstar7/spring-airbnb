package kr.co.airbnb.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.MethodParameter;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.airbnb.annotation.LoginUser;

/**
 * <p>요청핸들러 메소드가 실행되기 전에 수행할 작업이 구현된 인터셉터다.
 * <p>요청핸들러 메소드의 매개변수에 @LoginUser 어노테이션이 정의되어 있는 경우, 로그인 여부를 체크한다.
 * <p>요청핸들러 메소드의 매개변수에 @LoginUser 어노테이션이 없으면, preHandle() 메소드가 true를 반환한다.
 * <p>요청핸들러 메소드의 매개변수에 @LoginUser 어노테이션이 있고,
 * 			<p>세션에 로그인된 사용자 정보가 존재하면, preHandle()메소드가 true를 반환한다.
 * 			<p>세션에 로그인된 사용자 정보가 존재하지 않으면, preHandle()메소드가 false를 반환한다.
 * 
 * preHandle()이 false를 반환하면 요청핸들러 메소드를 실행하지 않는다.
 * @author youna
 *
 */
public class LoginCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		
		boolean isLoginRequired = false; 		// 로그인
		MethodParameter[] parameters = handlerMethod.getMethodParameters();
		for (MethodParameter parameter : parameters) {
			LoginUser loginUser = parameter.getParameterAnnotation(LoginUser.class);
			if (loginUser != null && loginUser.required()) {
				isLoginRequired = true;
				break;
			}
		}
		
		if (!isLoginRequired) {
			return true;
		}
		
		if (request.getSession().getAttribute("LOGIN_USER") != null) {
			return true;
		}
		
		response.sendRedirect("/?error=deny");
		return false;
	}
}


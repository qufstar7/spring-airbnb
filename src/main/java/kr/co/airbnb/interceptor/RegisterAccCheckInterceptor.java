package kr.co.airbnb.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.MethodParameter;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.airbnb.annotation.RegisterAcc;

/**
 * <p>요청핸들러 메소드가 실행되기 전에 수행할 작업이 구현된 인터셉터
 * <p>요청핸들러 메소드의 매개변수에 @ResgisterAcc 어노테이션이 정의 되어 있으면 숙소가 등록중인지 체크한다.
 * 
 * <p>매개변수에 @ResgisterAcc 어노테이션이 없으면, PreHandelr() 메소드가 true 반환
 * <p>요청핸들러 메소드의 매개변수에 @ResgisterAcc 어노테이션이 없으면, preHandler() 메소드가 true를 반환한다.
 * <p>요청핸들러 메소드의 매개변수에 @ResgisterAcc 어노테이션이 있으면, 
 * 		<p>세션에 등록중인 숙소 정보가 존재하면, preHandler() 메소드가 true를 반환한다.
 * 		<p>세션에 등록중인 숙소 정보가 존재하지 않으면, preHandler() 메소드가 false를 반환한다.
 * 
 * @author qufstar7
 *
 */
public class RegisterAccCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		
		boolean isRegisterAccRequired = false;
		MethodParameter[] parameters = handlerMethod.getMethodParameters();
		for (MethodParameter parameter : parameters) {
			RegisterAcc registerAcc = parameter.getParameterAnnotation(RegisterAcc.class);
			if (registerAcc != null) {
				isRegisterAccRequired = true;
				break;
			}
		}
		
		if (!isRegisterAccRequired) {
			return true;
		}
		if (request.getSession().getAttribute("REGISTER_ACC") != null) {
			return true;
		}
		response.sendRedirect("/login?fail=deny");
		return false;
	}
	
	
}

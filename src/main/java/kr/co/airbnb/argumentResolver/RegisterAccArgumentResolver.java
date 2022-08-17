package kr.co.airbnb.argumentResolver;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import kr.co.airbnb.annotation.RegisterAcc;
import kr.co.airbnb.vo.Accommodation;

public class RegisterAccArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return parameter.hasParameterAnnotation(RegisterAcc.class);
	}
	
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		Accommodation acc = (Accommodation)webRequest.getAttribute("REGISTER_ACC", WebRequest.SCOPE_SESSION);
		return acc;
	}
}

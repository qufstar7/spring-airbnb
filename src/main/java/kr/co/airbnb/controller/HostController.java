package kr.co.airbnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.form.SocialLoginForm;
import kr.co.airbnb.service.HostService;
import kr.co.airbnb.service.UserService;
import kr.co.airbnb.utils.SessionUtils;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.User;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/host")
@Slf4j
public class HostController {

	private static final String KAKAO_LOGIN_TYPE = "kakao";
	
	@Autowired
	private HostService hostService;
	@Autowired
	private UserService userService;
	
	@GetMapping(path="/kakao")
	public String kakaotest() {
		return "user/kakaotest";
	}
	@GetMapping(path="/facebook")
	public String facebooktest() {
		return "user/facebooktest";
	}
	@GetMapping(path="/google")
	public String googletest() {
		return "user/googletest";
	}

	// 호스팅 시작페이지(호스트 되기)
	@GetMapping
	public String home() {
		return "host/home";
	}

	// 호스트숙소 등록 페이지
	// 타입1등록
	@GetMapping(path = "/become-a-host")
	public String type1(Model model) {
		List<AccType> accMainTypes = hostService.getAllAccMainTypes();
		model.addAttribute("accMainTypes", accMainTypes);

		return "host/become-a-host";
	}
	
	// 타입2 등록
//	@GetMapping(path = "/become-a-host2")
//	public String type2(@RequestParam("type") int mainType, Model model) {
//		model.addAttribute("accSubTypes", hostService.getAllAccSubTypes(mainType));
//		
//		return "host/become-a-host2";
//	}
	
	// 소셜 로그인 요청을 처리한다.
//	@PostMapping("/sns-login")
//	public String loginWithSns(SocialLoginForm form) {
//		log.info("소셜 로그인 인증정보: " + form);
//		
//		User user = User.builder()
//					.name(form.getNickname())
//					.email(form.getEmail())
//					.profileImage(form.getProfileImage() != null ? form.getProfileImage() : "")
//					.gender(form.getGender() != null ? form.getGender() : "")
//					.loginType(form.getLoginType())
//					.build();
//		User savedUser = userService.loginWithSns(user);
//		
//		if (savedUser != null) {
//			SessionUtils.addAttribute("LOGIN_USER", savedUser);
//			savedUser.setLoginType(form.getLoginType());
//		} else {
//			SessionUtils.addAttribute("LOGIN_USER", user);
//		}
//		log.info("소셜 로그인 완료");
//		
//		return "redirect:/become-a-host"; 
//	}

	// 로그아웃
//	@GetMapping(path = "/logout")
//	public String logout(HttpSession session) {
//		session.invalidate();
//		
//		return "redirect:/";
//	}

}

package kr.co.airbnb.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.form.UserRegisterForm;
import kr.co.airbnb.service.UserService;
import kr.co.airbnb.vo.User;
import kr.co.airbnb.vo.Wishlist;

@Controller
@RequestMapping("/user")
@SessionAttributes({"userRegisterForm", "LOGIN_USER"})

public class UserController {

	@Value("${airbnb.profile.image.save-directory}")
	String profileImageSaveDirectory;
	
	@Autowired
	private UserService userService;
	
	@GetMapping(path="/register")
	public String register(Model model) {
		
		// 폼입력값을 담을 객체를 미리 생성해서 Model에 저장
		model.addAttribute("userRegisterForm", new UserRegisterForm());
		return "user/home";
	}
	
	@GetMapping(path="/checkEmail")
	@ResponseBody
	public Map<String, Object> checkEmail(@RequestParam String email) {
		Map<String, Object> result = new HashMap<>();
		User savedUser = userService.getUserByEmail(email);
		
		if(savedUser == null) {
			result.put("exist", false);
		} else {
			result.put("exist", true);
		}
		return result;
	}
	
	@PostMapping(path="/register")
	@ResponseBody
	public Map<String, Object> register(@ModelAttribute("userRegisterForm") UserRegisterForm userRegisterForm, Model model) {
		
		User user = new User();
		user.setName(userRegisterForm.getLastName() + userRegisterForm.getFirstName());
		user.setBirthDate(userRegisterForm.getBirthDate());
		user.setEmail(userRegisterForm.getRegisterEmail());
		user.setPassword(userRegisterForm.getPassword());
		
		userService.addNewUser(user);
		// 회원가입시 자동으로 로그인 처리됨
		model.addAttribute("LOGIN_USER", user);
		//model.addAttribute("userRegisterForm", userRegisterForm);
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		
		return result;
	}
	
	@PostMapping(path="/addProfileImg")
	public Map<String, Object> uploadProfileImg(@ModelAttribute("userRegisterForm") UserRegisterForm userRegisterForm, @LoginUser User loginUser) throws IOException {
		
		// 프로필이미지 사진 처리하기
		if(!userRegisterForm.getProfileImg().isEmpty()) {
			MultipartFile profileImg = userRegisterForm.getProfileImg();
			String filename = profileImg.getOriginalFilename();
			User user = userService.getUserByEmail(loginUser.getEmail());
			user.setProfileImage(filename);
			userService.updateUserInfo(user);
			
			InputStream in = profileImg.getInputStream();	// 업로드된 첨부파일이 임시파일로 저장되는데 그 파일을 읽어오는 스트림이다.
			
			if(!new File(profileImageSaveDirectory).exists()) {
				System.out.println("존재하지않음");
			}
			// 강사님께 질문
			FileOutputStream out = new FileOutputStream(new File(profileImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		
		return result;
	}
	
	@GetMapping(path="/wishlists")
	public String wishlist(Model model) { // 추후 @LoginUser User loginUser 추가하기
		
		// List<Wishlist> wishlists = userService.getMyWishlists(loginUser.getNo());
		// model.addAttribute("wishlists", wishlists);
		return "user/wishlist";
	}
}

package kr.co.airbnb.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

@Controller
@RequestMapping("/user")
@SessionAttributes("userRegisterForm")

public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping(path="/register")
	public String register(Model model) {
		
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
	public Map<String, Object> register(@ModelAttribute UserRegisterForm userRegisterForm, Model model) {
		
		User user = new User();
		user.setName(userRegisterForm.getLastName() + userRegisterForm.getFirstName());
		user.setBirthDate(userRegisterForm.getBirthDate());
		user.setEmail(userRegisterForm.getRegisterEmail());
		user.setPassword(userRegisterForm.getPassword());
		
		userService.addNewUser(user);
		// 질문하기 !! model.addAttribute("LOGIN_USER", user);
		//model.addAttribute("userRegisterForm", userRegisterForm);
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		
		return result;
	}
	
	@PostMapping(path="/addProfileImg")
	public Map<String, Object> uploadProfileImg(@ModelAttribute UserRegisterForm userRegisterForm) {
		
		System.out.println(userRegisterForm);
		System.out.println(userRegisterForm.getProfileImg().getOriginalFilename());
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		
		return result;
	}
}

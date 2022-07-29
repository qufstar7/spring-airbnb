package kr.co.airbnb.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.airbnb.form.UserRegisterForm;
import kr.co.airbnb.service.UserService;
import kr.co.airbnb.vo.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping(path="/register")
	public String register() {
		
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
	public Map<String, Object> register(UserRegisterForm userRegisterForm) {
		
		System.out.println(userRegisterForm);
		
		User user = new User();
		user.setName(userRegisterForm.getLastName() + userRegisterForm.getFirstName());
		user.setBirthDate(userRegisterForm.getBirthDate());
		user.setEmail(userRegisterForm.getRegisterEmail());
		user.setPassword(userRegisterForm.getPassword());
		
		System.out.println(user);
		
		userService.addNewUser(user);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		
		return result;
	}
	
}

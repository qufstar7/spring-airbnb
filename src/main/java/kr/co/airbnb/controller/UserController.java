package kr.co.airbnb.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.airbnb.form.UserRegisterForm;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping(path="/register")
	public String register() {
		
		return "user/home";
	}
	
	/*
	 * @PostMapping(path="/checkPassword")
	 * 
	 * @ResponseBody public Map<String, Object> checkPassword(UserRegisterForm
	 * userRegisterForm) {
	 * 
	 * Map<String, Object> result = new HashMap<>();
	 * 
	 * String password = userRegisterForm.getPassword(); String firstName =
	 * userRegisterForm.getFirstName(); String email = userRegisterForm.getEmail();
	 * 
	 * if(password.contains(firstName) || password.contains(email)) {
	 * result.put("include", false); }
	 * 
	 * if(password.length() < 8) { result.put("length", false); }
	 * 
	 * if(password.)
	 * 
	 * }
	 */
	
}

package kr.co.airbnb.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.airbnb.form.CardRegisterForm;
import kr.co.airbnb.service.ReservationService;

@Controller
@RequestMapping("/book")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping
	public String book() {
		return "reservation/book";
	}
	
	@GetMapping(path = "/register")
	public String registerform(Model model) {
		
		model.addAttribute("cardRegisterForm", new CardRegisterForm());
		
		return "reservation/registerform";
	}
	
	@PostMapping(path ="/register")
	public String register(@Valid CardRegisterForm cardRegisterForm, BindingResult errors) throws Exception {
		
		if (errors.hasErrors()) {
			return "reservation/registerform";
		}
		
		reservationService.addNewCard(cardRegisterForm);
				
		return "redirect:/reservaion/book";
	}

}

package kr.co.airbnb.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.airbnb.form.CardRegisterForm;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.ReservationService;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Reservation;

@Controller
@RequestMapping("/book")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping
	public String book(@RequestParam("no") int no, Model model) {
		
		Accommodation accommodation  = reservationService.getAcc(no);
		model.addAttribute("accommodation", accommodation);
		
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
				
		return "redirect:/reservation/completed";
	}

	@GetMapping(path = "/completed")
	public String completed() {
		return"/completed";
	}
}

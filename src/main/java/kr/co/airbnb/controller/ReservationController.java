package kr.co.airbnb.controller;

import java.io.IOException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.form.ReservationRegisterForm;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.ReservationService;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Reservation;
import kr.co.airbnb.vo.User;

@Controller
@RequestMapping("/book")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping(path = "/test")
	public String test(@RequestParam("no") int accNo, Model model) {
		Accommodation accommodation = reservationService.getAcc(accNo);
		model.addAttribute("accommodation",accommodation);
		
		return "reservation/test";
	}
	
	@GetMapping(path = "/register")
	public String book(@RequestParam("no") int accNo, Model model) {
		Accommodation accommodation  = reservationService.getAcc(accNo);
		model.addAttribute("accommodation", accommodation);
		model.addAttribute("ReservationRegisterForm", new ReservationRegisterForm());
		
		return "reservation/book";
	}
	
	@PostMapping(path ="/register")
	@RequestMapping(value="/completed", method = {RequestMethod.POST})
	public String register(@LoginUser User loginUser, ReservationRegisterForm reservaionRegisterForm) throws IOException {
		
		reservationService.addNewReservation(loginUser, reservaionRegisterForm);
				
		return "/reservation/completed";
	}

	@GetMapping(path = "/completed")
	public String completed(Model model, int no) {
		List<Reservation> reservations = reservationService.getAllReservationByUsers(no);
		model.addAttribute("reservations",reservations);
		
		return"/reservation/completed";
	}
}

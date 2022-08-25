package kr.co.airbnb.controller;

import java.io.IOException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.form.ReservationRegisterForm;
import kr.co.airbnb.service.ReservationService;
import kr.co.airbnb.service.UserService;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Card;
import kr.co.airbnb.vo.Reservation;
import kr.co.airbnb.vo.User;

@Controller
@RequestMapping("/book")
@SessionAttributes({"reservationRegisterForm"})
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private UserService userService;
	
	@GetMapping(path = "/test1")
	public String test() {
		
		return "reservation/test1";
	}
	@GetMapping(path = "/test")
	public String test(@RequestParam("no") int accNo, Model model) {
		Accommodation accommodation = reservationService.getAcc(accNo);
		model.addAttribute("accommodation",accommodation);
		
		return "reservation/test";
	}
	@GetMapping(path = "/register") 
	public String register(@RequestParam("no") int accNo, Model model) {
		Accommodation accommodation = reservationService.getAcc(accNo);
		model.addAttribute("accommodation",accommodation);
		
		
		return "reservation/book";
	}
	
	@PostMapping(path = "/register") 
	public String book(@LoginUser User loginUser, @RequestParam("no") int accNo, Model model, @ModelAttribute("reservationRegisterForm") ReservationRegisterForm reservaionRegisterForm) {
		Accommodation accommodation  = reservationService.getAcc(accNo);
		model.addAttribute("accommodation", accommodation);
		
		User user = userService.getUserByEmail(loginUser.getEmail());
		model.addAttribute("user", user);
		
		List<Card> cards = reservationService.getMyCards(user.getNo());
		model.addAttribute("cards", cards);
		
		model.addAttribute("reservaionRegisterForm",reservaionRegisterForm );
		
		
		return "reservation/book"; 
	}
	
	@PostMapping(path ="/insert")
	@RequestMapping(value="/completed", method = {RequestMethod.POST})
	public String register(@LoginUser User loginUser, @ModelAttribute("reservationRegisterForm") ReservationRegisterForm reservaionRegisterForm, Model model, SessionStatus sessionStatus ) throws IOException {
		Accommodation accommodation = reservationService.getAcc(reservaionRegisterForm.getAccNo());
		model.addAttribute("accommodation",accommodation);
		model.addAttribute("reservaionRegisterForm",reservaionRegisterForm);
		reservationService.addNewReservation(loginUser, reservaionRegisterForm);
		
		sessionStatus.setComplete();
		
		return "/reservation/completed";
	}
	
	@GetMapping(path = "/completed")
	public String completed(@RequestParam("no") int accNo, Model model ) {
		
		Accommodation accommodation  = reservationService.getAcc(accNo);
		model.addAttribute("accommodation", accommodation);
		
		
		return"/reservation/completed?no=" + accNo ;
	}
	
	@GetMapping(path = "/trip")
	public String trip(@LoginUser User loginUser, Model model) {
		User user = userService.getUserByEmail(loginUser.getEmail());
		model.addAttribute("user", user);
		
		List<Reservation> reservations = reservationService.getAllReservationsByUser(user.getNo());
		model.addAttribute("reservations", reservations);
		return"/reservation/trip";
	}
	
}

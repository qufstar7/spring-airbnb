package kr.co.airbnb.controller;

import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.form.CardRegisterForm;
import kr.co.airbnb.form.ReservationForm;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.ReservationService;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Reservation;
import kr.co.airbnb.vo.User;

@Controller
@RequestMapping("/book")
@SessionAttributes({"reservationForm"})
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping(path = "/register")
	public String book(@RequestParam("no") int no, Model model) {
		Accommodation accommodation  = reservationService.getAcc(no);
		model.addAttribute("accommodation", accommodation);
		model.addAttribute("cardRegisterForm", new CardRegisterForm());
		
		return "reservation/book";
	}
	
	@PostMapping(path ="/register")
	public String register(@Valid CardRegisterForm cardRegisterForm, BindingResult errors) throws Exception {
		
		if (errors.hasErrors()) {
			return "reservation/book/register";
		}
		
		reservationService.addNewCard(cardRegisterForm);
				
		return "/reservation/completed";
	}
	
	@PostMapping
	public String insert(@LoginUser User loginUser, @ModelAttribute("reservationForm") ReservationForm reservationForm,
			SessionStatus sessionStatus) throws IOException {
		return "redirect:/reservation/completed";
	}

	@GetMapping(path = "/completed")
	public String completed(Model model, int no) {
		List<Reservation> reservations = reservationService.getAllReservationByUsers(no);
		model.addAttribute("reservations",reservations);
		
		return"/reservation/completed";
	}
}

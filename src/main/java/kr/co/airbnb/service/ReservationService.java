package kr.co.airbnb.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.form.CardRegisterForm;
import kr.co.airbnb.form.ReservationForm;
import kr.co.airbnb.mapper.AccommodationMapper;
import kr.co.airbnb.mapper.ReservationMapper;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Card;
import kr.co.airbnb.vo.Reservation;
import kr.co.airbnb.vo.User;

@Service
public class ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;
	@Autowired
	private AccommodationMapper accommodationMapper;
	
	public void  addNewCard(CardRegisterForm cardRegisterForm) throws IOException {
		
		Card card = new Card();
		BeanUtils.copyProperties(cardRegisterForm, card);

		reservationMapper.insertCard(card);
	}
	
	public Accommodation getAcc(int no) {
		return accommodationMapper.getAcc(no);
	}
	
	public List<Reservation> getAllReservationByUsers(int no) {
		return reservationMapper.getReservationByUserNo(no);
	}
	
	public void addNewReservation(User loginUser, ReservationForm reservationForm) throws IOException {
		Reservation reservation = new Reservation();
		reservation.setCheckInDate(reservationForm.getCheckInDate());
		reservation.setCheckOutDate(reservationForm.getCheckOutDate());
		reservation.setAdultNum(reservationForm.getAdultNum());
		reservation.setChildrenNum(reservationForm.getChildrenNum());
		reservation.setInfantNum(reservationForm.getInfantNum());
		reservation.setPetNum(reservationForm.getPetNum());
		reservation.setTotalGuest(reservationForm.getAdultNum() + reservationForm.getChildrenNum() + reservationForm.getInfantNum());
		reservation.setMessageToHost(reservationForm.getMessageToHost());
		reservation.setServiceFee(reservationForm.getServiceFee());
		reservation.setPrice(reservationForm.getPrice());
		reservation.setTotalPrice(reservationForm.getServiceFee() + reservationForm.getPrice());
		
		
		
		
		reservationMapper.insertReservation(reservation);
	}
	
	
	
}

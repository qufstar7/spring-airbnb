package kr.co.airbnb.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.form.CardRegisterForm;
import kr.co.airbnb.mapper.AccommodationMapper;
import kr.co.airbnb.mapper.ReservationMapper;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Card;
import kr.co.airbnb.vo.Reservation;

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
	
	public void addNewReservation(Reservation reservation) throws IOException {
		reservation.setAccommodation(null);
		reservationMapper.insertReservation(reservation);
	}
	
	
	
}

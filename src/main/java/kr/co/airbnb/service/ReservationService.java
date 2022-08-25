package kr.co.airbnb.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.form.ReservationRegisterForm;
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
	
	public void  addNewReservation(User loginUser, ReservationRegisterForm reservationRegisterForm) throws IOException {
		
		Card card = new Card();
		card.setId(reservationRegisterForm.getId());
		card.setCvv(reservationRegisterForm.getCvv());
		card.setExpiryDate(reservationRegisterForm.getExpiryDate());
		card.setRegion(reservationRegisterForm.getRegion());
		card.setZipCode(reservationRegisterForm.getZipCode());
		card.setUser(loginUser);

		reservationMapper.insertCard(card);
		
		Reservation reservation = new Reservation();
		reservation.setCheckInDate(reservationRegisterForm.getCheckInDate());
		reservation.setCheckOutDate(reservationRegisterForm.getCheckOutDate());
		reservation.setAdultNum(reservationRegisterForm.getAdultNum());
		reservation.setChildrenNum(reservationRegisterForm.getChildrenNum());
		reservation.setInfantNum(reservationRegisterForm.getInfantNum());
		reservation.setPetNum(reservationRegisterForm.getPetNum());
		reservation.setTotalGuest(reservationRegisterForm.getTotalGuest());
		reservation.setMessageToHost(reservationRegisterForm.getMessageToHost());
		reservation.setServiceFee(reservationRegisterForm.getServiceFee());
		reservation.setPrice(reservationRegisterForm.getPrice());
		reservation.setTotalPrice(reservationRegisterForm.getPrice() + reservationRegisterForm.getServiceFee() + reservationRegisterForm.getCleaningPrice());
		reservation.setEntirePay(reservationRegisterForm.getTotalPrice());
		reservation.setLeftPay(reservationRegisterForm.getTotalPrice() * 0.3);
		reservation.setAccNo(reservationRegisterForm.getAccNo());
		reservation.setAccommodation(accommodationMapper.getAcc(reservationRegisterForm.getAccNo()));
		reservation.setUser(loginUser);
		
		
		reservationMapper.insertReservation(reservation);
		
	}
	
	public Accommodation getAcc(int accNo) {
		return accommodationMapper.getAcc(accNo);
	}
	
	public List<Card> getMyCards(int userNo) {
		return reservationMapper.getCardByUserNo(userNo);
	}
	
	public List<Reservation> getAllReservationsByUser(int userNo) {
		return reservationMapper.getReservationByUserNo(userNo);
	}
	
	public Reservation getReservationByReservationNO(int no) {
		return reservationMapper.getReservationByReservaionNo(no);
	}
	
	
	
	
}

package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.Card;
import kr.co.airbnb.vo.Reservation;

@Mapper
public interface ReservationMapper {

	void insertCard (Card card);

	void insertReservation (Reservation reservation);
	Reservation getReservationByReservaionNo(int reservationNo);
	
	List<Card> getCardByUserNo(int userNo);
	List<Reservation> getReservationByUserNo (int userNo);
}

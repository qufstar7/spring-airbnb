package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.Card;
import kr.co.airbnb.vo.Reservation;

@Mapper
public interface ReservationMapper {

	void insertCard (Card card);
	Card getCardByNo(int no);

	void insertReservation (Reservation reservation);
	Reservation getReservationByAccNo(int reservationNo);
	List<Reservation> getReservationByUserNo (int no);
}

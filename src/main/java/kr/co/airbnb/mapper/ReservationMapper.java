package kr.co.airbnb.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.Card;
import kr.co.airbnb.vo.Reservation;

@Mapper
public interface ReservationMapper {

	void insertReservation (Reservation reservation);
	void insertCard (Card card);
}

package kr.co.airbnb.service;

import java.io.IOException;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.form.CardRegisterForm;
import kr.co.airbnb.mapper.ReservationMapper;
import kr.co.airbnb.vo.Card;

@Service
public class ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;
	
	public void  addNewCard(CardRegisterForm cardRegisterForm) throws IOException {
		
		Card card = new Card();
		BeanUtils.copyProperties(cardRegisterForm, card);

		reservationMapper.insertCard(card);
	}
	
}

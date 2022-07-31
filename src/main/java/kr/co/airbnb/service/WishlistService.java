package kr.co.airbnb.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.mapper.WishlistMapper;

@Service
public class WishlistService {

	@Autowired
	private WishlistMapper wishlistMapper;
	
}

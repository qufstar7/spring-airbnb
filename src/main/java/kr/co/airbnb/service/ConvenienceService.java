package kr.co.airbnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.mapper.ConvenienceMapper;
import kr.co.airbnb.vo.Convenience;

@Service
public class ConvenienceService {

	@Autowired
	ConvenienceMapper convenienceMapper;
	
	// 편의시설 메인 타입
	public List<Convenience> getMainConveniences(){
		
		return convenienceMapper.getMainConbeniences();
	}
}

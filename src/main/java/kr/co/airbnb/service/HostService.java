package kr.co.airbnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.mapper.HostMapper;
import kr.co.airbnb.vo.AccType;

@Service
public class HostService {

	@Autowired
	private HostMapper hostMapper;
	
	public List<AccType> getAllAccTypes() {
		return hostMapper.getAllAccTypes();
	}

//	public List<String> getAllAccSubTypes() {
//		return hostMapper.getAllAccSubTypes();
//	}
	
}

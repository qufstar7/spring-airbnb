package kr.co.airbnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.airbnb.mapper.HostMapper;

@Service
@Transactional
public class HostService {

	@Autowired
	private HostMapper hostMapper;
	
	public List<String> getAllAccMainTypes() {
		return hostMapper.getAllAccMainTypes();
	}

	public List<String> getAllAccSubTypes() {
		return hostMapper.getAllAccSubTypes();
	}
	
}

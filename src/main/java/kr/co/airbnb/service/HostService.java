package kr.co.airbnb.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.airbnb.form.AccRegisterForm;
import kr.co.airbnb.mapper.HostMapper;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.User;

@Service
public class HostService {

	@Autowired
	private HostMapper hostMapper;
	
	public List<AccType> getAllMainTypes() {
		return hostMapper.getAllMainTypes();
	}

	public List<AccType> getAllSubTypes(int mainType) {
		return hostMapper.getAllSubTypes(mainType);
	}
	
	public List<AccType> getAllPrivacyTypes() {
		return hostMapper.getAllPrivacyTypes();
	}

	public void addNewAcc(User loginUser, AccRegisterForm accRegisterForm) throws IOException {
		Accommodation acc = new Accommodation();
		acc.set
		acc.setDescription(null);
		acc.setLatitude(null);
		acc.setLongitude(null);
		acc.setName(null);
		acc.setPhotos(null);
		acc.setStatus(null);
		acc.setUser(loginUser);
		return hostMapper.addNewAcc();
	}
}

package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.AccConvenience;
import kr.co.airbnb.vo.AccRoom;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Type;

@Mapper
public interface HostMapper {

	List<Type> getAllMainTypes();
	List<Type> getAllSubTypes(int mainType);
	List<Type> getAllPrivacyTypes();
	Type getTypeByNo(int typeNo);
	
	void insertAcc(Accommodation acc);	
	void insertAccType(AccType accType);
	void updateAddressByAccNo(Accommodation acc);
	void updateGuestsByAccNo(Accommodation acc);
	void insertAccRoom(AccRoom accRoom);
	void insertAccConvenience(AccConvenience accConvenience);
	
}

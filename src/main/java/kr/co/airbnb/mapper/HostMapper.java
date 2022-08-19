package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.AccConvenience;
import kr.co.airbnb.vo.AccRoom;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Type;

@Mapper
public interface HostMapper {

	List<Type> getAllMainTypes();
	List<Type> getAllSubTypes(int mainType);
	List<Type> getAllPrivacyTypes();
//	void insertAccAddress(AccRegisterForm accRegisterForm);
	Type getTypeByNo(int typeNo);
	void updateAcc(Accommodation acc);
	void insertAccRoom(AccRoom accRoom);
	void insertAccConvenience(AccConvenience accConvenience);
	
}

package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.AccConvenience;
import kr.co.airbnb.vo.AccPhoto;
import kr.co.airbnb.vo.AccRoom;
import kr.co.airbnb.vo.AccTag;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Tag;
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
	void updateImageCover(Accommodation acc);
	void insertAccPhotos(AccPhoto accPhoto);
	void updateAccName(Accommodation acc);
	
	List<Tag> getAllTags();
	
	void insertAccTags(AccTag accTag);
	void updateAccDescription(Accommodation acc);
	void updateAccPrice(Accommodation acc);
}

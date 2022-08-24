package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.AccConvenience;
import kr.co.airbnb.vo.AccPhoto;
import kr.co.airbnb.vo.AccRoom;
import kr.co.airbnb.vo.AccTag;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Reservation;
import kr.co.airbnb.vo.Tag;
import kr.co.airbnb.vo.Type;
import kr.co.airbnb.vo.User;

@Mapper
public interface HostMapper {
	
	Accommodation getAccByAccNo(int accNo);
	int getMostRecentRegisteredAccNo();
	List<Type> getAllMainTypes();
	List<Type> getAllSubTypes(int mainType);
	List<Type> getAllPrivacyTypes();
	Type getTypeByNo(int typeNo);
	List<Tag> getAllTags();
	AccRoom getAllRoomInfoByAccNo(int accNo);
	List<Accommodation> getAllAccIncompleteByUser(User loginUser);
	List<Accommodation> getAllAccNotIncompleteByUser(User loginUser);
	List<Accommodation> getAllAccByUser(User loginUser);
	List<Reservation> getAllreservationsByAccNo(int accNo);
	
	void insertAcc(Accommodation acc);	
	void insertAccType(AccType accType);
	void insertAccTags(AccTag accTag);
	void insertAccRoom(AccRoom accRoom);
	void insertAccConvenience(AccConvenience accConvenience);
	void insertAccPhotos(AccPhoto accPhoto);
	
	void updateMainType(AccType accType);
	void updateSubType(AccType accType);
	void updatePrivacyType(AccType accType);
	void updateAddressByAccNo(Accommodation acc);
	void updateGuestsByAccNo(Accommodation acc);
	void updateImageCover(Accommodation acc);
	void updateAccName(Accommodation acc);
	void updateAccDescription(Accommodation acc);
	void updateAccPrice(Accommodation acc);
	void updateAccStatus(Accommodation registerAcc);
	void updateAccType(AccType accType);
	
	
}

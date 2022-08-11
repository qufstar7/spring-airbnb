package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.Type;

@Mapper
public interface HostMapper {

	List<Type> getAllMainTypes();
	List<Type> getAllSubTypes(int mainType);
	List<Type> getAllPrivacyTypes();
	void insertTypes(int mainType);
	

}

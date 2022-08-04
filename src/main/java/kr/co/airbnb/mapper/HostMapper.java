package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.AccType;

@Mapper
public interface HostMapper {

	List<AccType> getAllAccMainTypes();
	List<AccType> getAllAccSubTypes(int mainType);

}

package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HostMapper {

	List<String> getAllAccMainTypes();
	List<String> getAllAccSubTypes();

}

package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.Boast;
import kr.co.airbnb.vo.Convenience;

@Mapper
public interface ConvenienceMapper {

	List<Convenience> getMainConbeniences();
	
}

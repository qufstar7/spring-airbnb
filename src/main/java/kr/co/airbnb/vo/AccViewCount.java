package kr.co.airbnb.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("viewcount")
public class AccViewCount {

	private int viewCount;
	private Date month;
	private Date year;
	
}

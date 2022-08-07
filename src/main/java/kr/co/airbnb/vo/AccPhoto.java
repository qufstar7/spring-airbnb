package kr.co.airbnb.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Alias("AccPhoto")
public class AccPhoto {

	private int imageNo;
	private int accNo;
	private String name;
	private String description;
	private String cover;
}

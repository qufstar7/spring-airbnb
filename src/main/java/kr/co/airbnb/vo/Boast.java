package kr.co.airbnb.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("Boast")
public class Boast {

	private int accNo;
	private int conNo;
	
}

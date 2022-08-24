package kr.co.airbnb.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Alias("Price")
public class AccPrice {

	private int avg;
	private int min;
	private int max;
	
}
